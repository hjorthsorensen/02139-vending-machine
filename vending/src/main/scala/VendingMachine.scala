import chisel3._
import chisel3.util._

class VendingMachine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(5.W))
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val buy = Input(Bool())
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
    val rejectCoinLED = Output(Bool())
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  /////# DATAPATH LOGIC #/////

  //  REGISTERS & LOGIC //
  val totalMoney = RegInit(0.U(8.W)) // 8 bits, 0 to 99
  val onesDigit = totalMoney % 10.U // right digit
  val tensDigit = (totalMoney / 10.U) % 10.U // left digit
  val coinRejected = WireDefault(false.B)


   // PRICE DECODER (Rema1000 prices) //
  val itemPrice = Wire(UInt(8.W))
  itemPrice := 0.U
  switch(io.price) {
    is(1.U) { itemPrice := 4.U } // Coca-Cola Can (Sale)
    is(2.U) { itemPrice := 4.U } // Faxe Kondi Can (Sale) 
    is(3.U) { itemPrice := 7.U } // Pepsi Can
    is(4.U) { itemPrice := 17.U } // Coca-Cola Bottle
    is(5.U) { itemPrice := 18.U } // Faxe Kondi Bottle
    is(6.U) { itemPrice := 20.U } // Pepsi Bottle
    is(7.U) { itemPrice := 14.U } // Monster Energi (sale)
    is(8.U) { itemPrice := 10.U } // Red Bull (sale)
    is(9.U) { itemPrice := 17.U } // Booster
  }

  val priceOnes = itemPrice % 10.U
  val priceTens = (itemPrice / 10.U) % 10.U


  // Timing Registers //
  val blinkFreq = 25000000.U
  val blinkCounter = RegInit(0.U(32.W))
  val blinkReg = RegInit(false.B)

  val cntMAX = (100000000 / 1000 - 1).U
  val cntReg = RegInit(0.U(32.W))
  val selReg = RegInit(0.U(2.W))

  // EDGE DETECTORS //
  // guds gave )))
  def risingEdge(signal: Bool): Bool = signal && !RegNext(signal)
  val coin2Edge = risingEdge(io.coin2)
  val coin5Edge = risingEdge(io.coin5)
  val buyEdge   = risingEdge(io.buy)

  // SEVEN SEGMENT DECODER //
  val sevSegDecoder = Module(new SevenSegDec())
  val activeDigit = WireDefault("b1111".U)
  sevSegDecoder.io.in := 0.U

  // Alarm for coin rejection, just faster than blink so you can tell them apart
  val rejectFreq = 6250000.U 
  val rejectCounter = RegInit(0.U(32.W))
  val rejectReg = RegInit(false.B)

  rejectCounter := rejectCounter + 1.U
  when(rejectCounter === rejectFreq) {
    rejectCounter := 0.U
    rejectReg := !rejectReg
  }

   // ALARM TOGGLE LOGIC //

  blinkCounter := blinkCounter + 1.U
  when(blinkCounter === blinkFreq) {
    blinkCounter := 0.U
    blinkReg := !blinkReg
  }


 /////# FSM LOGIC #/////

  val fsm = Module(new VendingFSM())
  fsm.io.coin2Edge := coin2Edge
  fsm.io.coin5Edge := coin5Edge
  fsm.io.buyEdge   := buyEdge
  fsm.io.buy       := io.buy
  fsm.io.coin2     := io.coin2
  fsm.io.coin5     := io.coin5
  fsm.io.totalMoney := totalMoney
  fsm.io.itemPrice := itemPrice

 
  

  // MONEY UPDATE LOGIC //
  val rejectNext = WireDefault(false.B)
  fsm.io.inpCoinBeingRej := RegNext(rejectNext, false.B)

  when(fsm.io.signalCoin2) {
    when(totalMoney <= 97.U) { 
      totalMoney := totalMoney + 2.U
    } .otherwise {
      rejectNext := true.B
    }
  } .elsewhen(fsm.io.signalCoin5) {
    when(totalMoney <= 94.U) { 
      totalMoney := totalMoney + 5.U
    } .otherwise {
      rejectNext := true.B
    }
  } .elsewhen(fsm.io.signalSub) {
    totalMoney := totalMoney - itemPrice
  }

  // SEVEN SEGMENT DISPLAY LOGIC //
  cntReg := cntReg + 1.U
  when(cntReg === cntMAX) {
    cntReg := 0.U
    selReg := selReg + 1.U
  }
 
  val blinkDuringAlarm = fsm.io.alarm && !blinkReg

  switch(selReg) {
    is(0.U) {
      activeDigit := Mux(blinkDuringAlarm, "b1111".U, "b0111".U)
      sevSegDecoder.io.in := tensDigit
    }
    is(1.U) {
      activeDigit := Mux(blinkDuringAlarm, "b1111".U, "b1011".U)
      sevSegDecoder.io.in := onesDigit
    }
    is(2.U) {
      activeDigit := "b1101".U
      sevSegDecoder.io.in := priceTens
    }
    is (3.U) {
      activeDigit := "b1110".U
      sevSegDecoder.io.in := priceOnes
    }
  }



  /////# OUTPUT ASSIGNMENTS #/////
  io.seg := ~sevSegDecoder.io.out      
  io.an  := activeDigit     
  io.releaseCan := fsm.io.releaseCan
  io.alarm := fsm.io.alarm && blinkReg
  io.rejectCoinLED := fsm.io.coinBeingRejected && rejectReg

}




// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
  println("******************************************")
  println("Successfully generated VendingMachine.v!")
  println("******************************************")
}


