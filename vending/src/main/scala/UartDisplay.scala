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
  })

    val tx = Module(new BufferedTx(frequency, baudRate))
    io.txd := tx.io.txd


    // Messages

    val soldMsg  = "Item sold!          \n".getBytes.map(_.U(8.W))
    val alarmMsg = "Not enough money!   \n".getBytes.map(_.U(8.W))
    val emptyMsg = "Machine empty!      \n".getBytes.map(_.U(8.W))
    val fullMsg  = "Coin full!          \n".getBytes.map(_.U(8.W))

    // selector and sender logic

    val messages = VecInit(
        (soldMsg ++ alarmMsg ++ emptyMsg ++ fullMsg).toIndexedSeq
    )

    val msgLen = 22 // beskederne er 22 tegn lange

    val msgSel     = RegInit(0.U(2.W))
    val cntReg     = RegInit(0.U(8.W))
    val sendingReg = RegInit(false.B)

    val soldEdge  = io.sold  && !RegNext(io.sold)
    val alarmEdge = io.alarm && !RegNext(io.alarm)
    val emptyEdge = io.empty && !RegNext(io.empty)
    val fullEdge  = io.full  && !RegNext(io.full)

    when(soldEdge) { msgSel := 0.U ; cntReg := 0.U ; sendingReg := true.B }
    when(alarmEdge) { msgSel := 1.U ; cntReg := 0.U ; sendingReg := true.B }
    when(emptyEdge) { msgSel := 2.U ; cntReg := 0.U ; sendingReg := true.B }
    when(fullEdge)  { msgSel := 3.U ; cntReg := 0.U ; sendingReg := true.B }

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
