package uart
import chisel3._
import chisel3.util._

class UartDisplay(frequency: Int, baudRate: Int) extends Module {
    val io = IO(new Bundle {
        val txd    = Output(UInt(1.W))
        val sold   = Input(Bool())
        val alarm  = Input(Bool())
        val empty  = Input(Bool())
        val full   = Input(Bool())
        val rtnCoin = Input(Bool())
  })

    val tx = Module(new BufferedTx(frequency, baudRate))
    io.txd := tx.io.txd


    // Messages
    


    //                123456789012345678901 2
    val soldMsg    = "Item sold!            \n".getBytes.map(_.U(8.W))
    val alarmMsg   = "Not enough money!     \n".getBytes.map(_.U(8.W))
    val emptyMsg   = "Machine empty!        \n".getBytes.map(_.U(8.W))
    val fullMsg    = "Coin full!            \n".getBytes.map(_.U(8.W))
    val rtnCoinMsg = "Returning coin...     \n".getBytes.map(_.U(8.W))

    val msgLen = 23
    // selector and sender logic

    val messages = VecInit(
        (soldMsg ++ alarmMsg ++ emptyMsg ++ fullMsg ++ rtnCoinMsg).toIndexedSeq
    )


    val msgSel     = RegInit(0.U(3.W))
    val cntReg     = RegInit(0.U(8.W))
    val sendingReg = RegInit(false.B)

    when(io.sold) { msgSel := 0.U ; cntReg := 0.U ; sendingReg := true.B }
    .elsewhen(io.alarm) { msgSel := 1.U ; cntReg := 0.U ; sendingReg := true.B }
    .elsewhen(io.empty) { msgSel := 2.U ; cntReg := 0.U ; sendingReg := true.B }
    .elsewhen(io.full)  { msgSel := 3.U ; cntReg := 0.U ; sendingReg := true.B }
    .elsewhen(io.rtnCoin) { msgSel := 4.U ; cntReg := 0.U ; sendingReg := true.B }

    tx.io.channel.bits  := messages((msgSel * msgLen.U) + cntReg)
    tx.io.channel.valid := sendingReg

    when(tx.io.channel.ready && sendingReg) {
        when(cntReg === (msgLen - 1).U) {
            sendingReg := false.B
            cntReg := 0.U
        }.otherwise {
            cntReg := cntReg + 1.U
        }
    }





}
