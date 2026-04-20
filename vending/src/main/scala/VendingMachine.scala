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
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  /////# DATAPATH LOGIC #/////
  //  REGISTERS & LOGIC //
  val totalMoney = RegInit(0.U(8.W)) // 8 bits, 0 to 99
  val onesDigit = totalMoney % 10.U // right digit
  val tensDigit = (totalMoney / 10.U) % 10.U // left digit
  

  val priceOnes = io.price % 10.U
  val priceTens = (io.price / 10.U) % 10.U
  

  // Timing Registers //
  val blinkFreq = 25000000.U
  val blinkCounter = RegInit(0.U(32.W))
  val blinkReg = RegInit(false.B)

  val cntMAX = (100000000 / 1000 - 1).U
  val cntReg = RegInit(0.U(32.W))
  val selReg = RegInit(0.U(2.W))

  // EDGE DETECTORS //
  val coin2Edge = io.coin2 && !RegNext(io.coin2)
  val coin5Edge = io.coin5 && !RegNext(io.coin5)
  val buyEdge   = io.buy   && !RegNext(io.buy)

  // SEVEN SEGMENT DECODER //
  val sevSegDecoder = Module(new SevenSegDec())
  val activeDigit = WireDefault("b1111".U)
  sevSegDecoder.io.in := 0.U



 /////# FSM LOGIC #/////

  // STATE DEFINITIONS //
  val idle :: busy :: alarm :: Nil = Enum(3)
  val stateReg = RegInit(idle)
  
  val signalCoin2 = WireDefault(false.B)
  val signalCoin5 = WireDefault(false.B)
  val signalSub  = WireDefault(false.B)

  // ALARM TOGGLE LOGIC //

  blinkCounter := blinkCounter + 1.U
  when(blinkCounter === blinkFreq) {
    blinkCounter := 0.U
    blinkReg := !blinkReg
  }

  switch(stateReg) {
    is(idle) {
      when(coin2Edge) {
        signalCoin2 := true.B
      } .elsewhen(coin5Edge) {
        signalCoin5 := true.B
      }

      when(buyEdge) {
        when(totalMoney >= io.price) {
          signalSub := true.B
          stateReg := busy
        } .otherwise {
          stateReg := alarm
        }
      }
    }
    is(busy) {
      when(io.buy) {
        stateReg := busy
      } .otherwise {
        stateReg := idle
      }
    }
    is(alarm) {
        when(!io.buy) {
          stateReg := idle
        }
    }
  }
  
  // MONEY UPDATE LOGIC //
  when(signalCoin2) {
    totalMoney := totalMoney + 2.U
  } .elsewhen(signalCoin5) {
    totalMoney := totalMoney + 5.U
  } .elsewhen(signalSub) {
    totalMoney := totalMoney - io.price
  }

  // SEVEN SEGMENT DISPLAY LOGIC //
  cntReg := cntReg + 1.U
  when(cntReg === cntMAX) {
    cntReg := 0.U
    selReg := selReg + 1.U
  }
 
  switch(selReg) {
    is(0.U) {
      activeDigit := "b0111".U
      sevSegDecoder.io.in := tensDigit
    }
    is(1.U) {
      activeDigit := "b1011".U
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
  io.releaseCan := (stateReg === busy)
  io.alarm := (stateReg === alarm) && blinkReg

}

// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
  println("******************************************")
  println("Successfully generated VendingMachine.v!")
  println("******************************************")
}


