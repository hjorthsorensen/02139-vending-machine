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
      dut.io.sold.expect(true.B)
      dut.clock.step(1)
      dut.io.releaseCan.expect(false.B)

      // TEST 3: The "Catch the Pulse" Version
      println("Testing alarm for insufficient funds...")

      // Step 1: Press and hold
      dut.io.buy.poke(true.B)
      dut.clock.step(1) 

      // Step 2: Release the button
      dut.io.buy.poke(false.B)

      // Step 3: Check IMMEDIATELY (Do not step the clock yet!)
      // At this exact moment, buyFallingEdge is True in the circuit
      dut.io.alarm.expect(true.B) 
      println("Alarm pulse caught successfully!")

      // Step 4: Step the clock and verify it clears
      dut.clock.step(1)
      dut.io.alarm.expect(false.B)

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
    

    // TEST 5: Empty machine test //
      println("Testing empty machine scenario...")
      dut.io.price.poke(1.U)
      pressButton(dut.io.coin5)
      pressButton(dut.io.coin5)
      pressButton(dut.io.coin5)
      pressButton(dut.io.coin5) // 20
      
      for(i <- 1 to 20) {
        dut.io.buy.poke(true.B)
        dut.clock.step(1)
        dut.io.releaseCan.expect(true.B)

        dut.io.buy.poke(false.B)
        dut.io.sold.expect(true.B)
        dut.clock.step(1)
      }
      
      // check if empty
      dut.io.empty.expect(true.B) 
      println("Verified: Machine is now empty.")

      dut.io.buy.poke(true.B)
      dut.clock.step(1)
      dut.io.releaseCan.expect(false.B) // should fail
      println("Verified: Sale blocked when empty.")
    
    // TEST 6: Coins full
      
        println("Testing coin storage full scenario...")
        for(_ <- 1 to 10) {
          pressButton(dut.io.coin5)
        }
        dut.io.full.expect(true.B)

        dut.io.coin2.poke(true.B)
        dut.clock.step(1)
        dut.io.rtnCoin.expect(true.B)
        dut.io.coin2.poke(false.B)
      
      println("Test completed successfully.")
    }
  }
}