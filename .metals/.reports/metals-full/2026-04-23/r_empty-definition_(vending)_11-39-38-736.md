error id: file:///C:/vendingmachineproject/02139-vending-machine/vending/src/main/scala/VendingMachine.scala:
file:///C:/vendingmachineproject/02139-vending-machine/vending/src/main/scala/VendingMachine.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/releaseCoin.
	 -chisel3/releaseCoin#
	 -chisel3/releaseCoin().
	 -chisel3/util/releaseCoin.
	 -chisel3/util/releaseCoin#
	 -chisel3/util/releaseCoin().
	 -releaseCoin.
	 -releaseCoin#
	 -releaseCoin().
	 -scala/Predef.releaseCoin.
	 -scala/Predef.releaseCoin#
	 -scala/Predef.releaseCoin().
offset: 4345
uri: file:///C:/vendingmachineproject/02139-vending-machine/vending/src/main/scala/VendingMachine.scala
text:
```scala
import chisel3._
import chisel3.util._

class VendingMachine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(5.W))
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val buy = Input(Bool())
    val releaseCan = Output(Bool())
    val releaseCoin = Output(Bool())
    val alarm = Output(Bool())
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  /////# DATAPATH LOGIC #/////
  //  REGISTERS & LOGIC //
  val totalMoney = RegInit(0.U(8.W)) // 8 bits, 0 to 99
  val onesDigit = totalMoney % 10.U // right digit
  val tensDigit = (totalMoney / 10.U) % 10.U // left digit
  io.releaseCoin := false.B

  }

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
        when(totalMoney >= itemPrice) {
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
        } .elsewhen(releaseCoin) {
          stateReg := idle
        }
    }
  }
  
  // MONEY UPDATE LOGIC //
  when(signalCoin2) {
    when(totalMoney <= 97.U) { 
      totalMoney := totalMoney + 2.U
    } .otherwise {
      io.releaseCoin := true.B 
    }
  } .elsewhen(signalCoin5) {
    when(totalMoney <= 94.U) { 
      totalMoney := totalMoney + 5.U
    } .otherwise {
      io.releaseCoin := true.B 
    }
  } .elsewhen(signalSub) {
    totalMoney := totalMoney - itemPrice
  }

  // SEVEN SEGMENT DISPLAY LOGIC //
  cntReg := cntReg + 1.U
  when(cntReg === cntMAX) {
    cntReg := 0.U
    selReg := selReg + 1.U
  }
 
  val blinkDuringAlarm = (stateReg === alarm) && !blinkReg

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
  io.releaseCan := (stateReg === busy)
  io.alarm := (stateReg === ala@@rm) && blinkReg

}

// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
  println("******************************************")
  println("Successfully generated VendingMachine.v!")
  println("******************************************")
}



```


#### Short summary: 

empty definition using pc, found symbol in pc: 