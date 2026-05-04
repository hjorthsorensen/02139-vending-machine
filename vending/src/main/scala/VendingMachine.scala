import chisel3._
import chisel3.util._
import uart._

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
    val txd = Output(UInt(1.W))
  })

  /////# DATAPATH LOGIC #/////



    // Messages




  //  REGISTERS & LOGIC //
  val totalMoney = RegInit(0.U(8.W)) // 8 bits, 0 to 99
  val onesDigit = totalMoney % 10.U // right digit
  val tensDigit = (totalMoney / 10.U) % 10.U // left digit


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

  // Coin counter

  val coin2Count = RegInit(0.U(6.W))
  val coin5Count = RegInit(0.U(6.W))
  val coinFull = coin2Count >= 63.U || coin5Count >= 63.U
  val fullDisplayCount = RegInit(0.U(4.W))
  val showFull = fullDisplayCount > 0.U

  when((risingEdge(io.coin2) && coinFull) || (risingEdge(io.coin5) && coinFull)) {
    fullDisplayCount := 10.U
  }
  when(blinkReg && !RegNext(blinkReg) && showFull) {
    fullDisplayCount := fullDisplayCount - 1.U
  }


  // Can counter logic & decrease on falling edge of buy
  val canCount = RegInit(20.U(5.W))
  val canEmpty = canCount === 0.U
  val buyFallingEdge = !io.buy && RegNext(io.buy)


  // EDGE DETECTORS //
  // guds gave )))
  def risingEdge(signal: Bool): Bool = signal && !RegNext(signal)
  val coin2Edge = risingEdge(io.coin2) && !canEmpty && !coinFull
  val coin5Edge = risingEdge(io.coin5) && !canEmpty && !coinFull
  val buyEdge   = risingEdge(io.buy) && !canEmpty

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
  when(fsm.io.signalCoin2 && totalMoney <= 97.U) {
    coin2Count := coin2Count + 1.U
  }
  when(fsm.io.signalCoin5 && totalMoney <= 94.U) {
    coin5Count := coin5Count + 1.U
  }

  when(buyFallingEdge && fsm.io.releaseCan && !canEmpty) {
    canCount := canCount - 1.U
  }


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

  // Dispaly EPty when empty
  val E = "b1111001".U 
  val P = "b1110011".U
  val t = "b1111000".U
  val y = "b1101110".U

  // Display full when coin full
  val F = "b1110001".U
  val U = "b0111110".U
  val L = "b0111000".U
 
  val blinkDuringAlarm  = fsm.io.alarm && !blinkReg

  val segOut = WireDefault(sevSegDecoder.io.out)
  switch(selReg) {
    is(0.U) {
      activeDigit := Mux(blinkDuringAlarm, "b1111".U, "b0111".U)
      sevSegDecoder.io.in := tensDigit
      when(canEmpty) {segOut := E}
      when(showFull) {segOut := F}
    }
    is(1.U) {
      activeDigit := Mux(blinkDuringAlarm, "b1111".U, "b1011".U)
      sevSegDecoder.io.in := onesDigit
      when(canEmpty) {segOut := P}
      when(showFull) {segOut := U}
    }
    is(2.U) {
      activeDigit := "b1101".U
      sevSegDecoder.io.in := priceTens
      when(canEmpty) {segOut := t}
      when(showFull) {segOut := L}
    }
    is (3.U) {
      activeDigit := "b1110".U
      sevSegDecoder.io.in := priceOnes 
      when(canEmpty) {segOut := y}
      when(showFull) {segOut := L}
    }
  }


  // UART LOGIC //

  val uart = Module(new UartDisplay(100000000, 115200))

  // Connect triggers directly to FSM wires to see current status immediately
  uart.io.sold    := buyFallingEdge && fsm.io.releaseCan && !canEmpty
  uart.io.alarm   := buyFallingEdge && fsm.io.alarm
  
  // These use risingEdge to ensure the message only prints once per event
  uart.io.empty   := risingEdge(canEmpty)
  uart.io.full    := risingEdge(showFull)
  uart.io.rtnCoin := risingEdge(fsm.io.coinBeingRejected)

  io.txd := uart.io.txd

  /////# OUTPUT ASSIGNMENTS #/////
  io.seg := ~segOut      
  io.an  := activeDigit     
  io.releaseCan := fsm.io.releaseCan && !canEmpty
  io.alarm := fsm.io.alarm && blinkReg
  io.rejectCoinLED := (fsm.io.coinBeingRejected || showFull) && rejectReg

}




// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
  println("******************************************")
  println("Successfully generated VendingMachine.v!")
  println("******************************************")
}


