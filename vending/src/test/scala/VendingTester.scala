import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class VendingTester extends AnyFlatSpec with ChiselScalatestTester {
  "Vending machine test" should "pass" in {
    test(new VendingMachine(20)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      println("We are generting a VCD file with the test of the vending machine")
     
     // Function to simulate pressing a button //
      def pressButton(button: Bool): Unit = {
        button.poke(true.B)
        dut.clock.step(1)
        button.poke(false.B)
        dut.clock.step(1)
      }

      // STARTING STATE | PRICE = 12 //
      dut.io.price.poke(12.U)
      dut.io.releaseCan.expect(false.B)
      dut.io.alarm.expect(false.B)

      // TEST 1: Insert 12 coins //
      println("Inserting coins...")
      pressButton(dut.io.coin2) // Total = 2
      pressButton(dut.io.coin5) // Total = 7
      pressButton(dut.io.coin5) // Total = 12

      // TEST 2: Try to buy a can //
      println("Attempting to buy a can...")
      dut.io.buy.poke(true.B)
      dut.clock.step(1)
      dut.io.releaseCan.expect(true.B)
      println("Can released successfully!")

      dut.io.buy.poke(false.B)
      dut.clock.step(1)
      dut.io.releaseCan.expect(false.B)

      // TEST 3: Not enough money/alarm test //
      println("Testing alarm for insufficient funds...")
      dut.io.buy.poke(true.B)
      dut.clock.step(1)

      if (dut.io.alarm.peek().litToBoolean || !dut.io.releaseCan.peek().litToBoolean) {
        println("Alarm triggered as expected for insufficient funds.")
      } else {
        println("Error: Alarm not triggered when it should have been.")
      }

      dut.io.buy.poke(false.B)
      dut.clock.step(1)


     // TEST 4: Holding the buy button //
      println("Testing holding the buy button...")

      dut.io.price.poke(10.U)
      pressButton(dut.io.coin5)
      pressButton(dut.io.coin5) // Total = 10

      println("Pressing and holding BUY...")
      dut.io.buy.poke(true.B)

      dut.clock.step(10) 

      dut.io.releaseCan.expect(true.B)
      dut.io.alarm.expect(false.B)
      println("Verified: releaseCan is active while holding button.")

      dut.io.buy.poke(false.B)
      dut.clock.step(1)
      dut.io.releaseCan.expect(false.B)
      
      
      println("Test completed successfully.")
    }
  }
}