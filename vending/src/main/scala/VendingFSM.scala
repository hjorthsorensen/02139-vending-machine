import chisel3._
import chisel3.util._

class VendingFSM extends Module {
  val io = IO(new Bundle {
    // Inputs
    val coin2Edge    = Input(Bool())
    val coin5Edge    = Input(Bool())
    val buyEdge      = Input(Bool())
    val buy          = Input(Bool())
    val coin2        = Input(Bool())
    val coin5        = Input(Bool())
    val totalMoney   = Input(UInt(8.W))
    val itemPrice    = Input(UInt(8.W))
    val coinRejected = Input(Bool())

    // Outputs
    val signalCoin2  = Output(Bool())
    val signalCoin5  = Output(Bool())
    val signalSub    = Output(Bool())
    val releaseCan   = Output(Bool())
    val alarm        = Output(Bool())
  })

  val idle :: busy :: alarm :: Nil = Enum(3)
  val stateReg = RegInit(idle)

  io.signalCoin2 := false.B
  io.signalCoin5 := false.B
  io.signalSub   := false.B

  switch(stateReg) {
    is(idle) {
      when(io.coin2Edge) {
        io.signalCoin2 := true.B
      }.elsewhen(io.coin5Edge) {
        io.signalCoin5 := true.B
      }

      when(io.buyEdge) {
        when(io.totalMoney >= io.itemPrice) {
          io.signalSub := true.B
          stateReg := busy
        }.otherwise {
          stateReg := alarm
        }
      }
      
      when(io.coinRejected) {
        stateReg := alarm
      }
    }
    
    is(busy) {
      stateReg := Mux(io.buy, busy, idle)
    }
    
    is(alarm) {
      when(!io.buy && !io.coin2 && !io.coin5) {
        stateReg := idle
      }
    }
  }

  // State-based Outputs
  io.releaseCan := (stateReg === busy)
  io.alarm      := (stateReg === alarm)
}