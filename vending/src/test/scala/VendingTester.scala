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
      //Function to simulate buying a specefic item
      def buyItem(item: Int): Unit  = {
        dut.io.price.poke(item.U)
        println("Buying item: " + dut.io.price.peek().litValue)
        dut.io.buy.poke(true.B)
        dut.clock.step(1)
        dut.io.buy.poke(false.B)
        println("Alarm: " +dut.io.alarm.peek().litValue + "\t ReleaseCan: " + dut.io.releaseCan.peek().litValue)
        dut.clock.step(1)
        
      }
    
    dut.clock.setTimeout(0)//No timeout
    
    //TEST 1: Test all possible Inputs for price of items. For waveform
    for(i <- 0 to 15) {
      dut.io.price.poke(i.U)
      dut.clock.step(1)
    }
    //Test alarm and output
    dut.io.releaseCan.expect(false.B)
    dut.io.alarm.expect(false.B)
    dut.io.rejectCoinLED.expect(false.B)
    println("VERIFIED TEST 1: Generated 16 items for waveform and tested default alarm signals")
    

    //TEST 2: Insert 10 coins And buying item twice
    println("Inserting coins...")
    pressButton(dut.io.coin5) // Total = 5
    pressButton(dut.io.coin5) // Total = 10
    buyItem(3) //Buying item no 3: PepsiCan
    println("\nShould have insuffecient funds for next purchase of pepsi")
    buyItem(3) //Buying item no 3: PepsiCan Total = 3
    println("\nBuying a water bottle")
    buyItem(0) //Buying item no 0: Water, Total = 1
    println("VERIFIED TEST 2: Buying item and insufficient coins")

    //TEST 3: Holding the buy button (Edge detection)
    println("Testing holding the buy button...")
    pressButton(dut.io.coin5)
    pressButton(dut.io.coin5) //Total = 11
    //Press and hold
    dut.io.buy.poke(true.B) //Total = 9
    dut.clock.step(20)

    dut.io.releaseCan.expect(true.B)
    dut.io.alarm.expect(false.B)
    
    dut.io.buy.poke(false.B)
    dut.clock.step(1)
    dut.io.releaseCan.expect(false.B)
    dut.io.alarm.expect(false.B)
    println("VERIFIED TEST 3: Holding button doesnt fail the program")

    //TEST 4: max limit amount:
    for(i <- 1 to 45) { //Total = 99coins
      pressButton(dut.io.coin2)
    }
    //Next coin should be rejected:
    dut.io.coin2.poke(true.B)
    dut.clock.step(1)
    dut.io.rejectCoinLED.expect(true.B)
    dut.io.coin2.poke(false.B)
    dut.clock.step(1)
    //Coin5 should also be rejected
    dut.io.coin5.poke(true.B)
    dut.clock.step(1)
    dut.io.rejectCoinLED.expect(true.B)
    dut.io.coin5.poke(false.B)
    dut.clock.step(1)
    println("VERIFIED TEST 4: Coins succesfully rejected!\n\n")

    //TEST 5: Coin register full, no more than 63 coins can be in the vending machine, before it is rejected:
    //Total coins so far 2+ 2 + 45 = 49
    
    buyItem(6) //Expensive //Total = 79
    buyItem(6)//Total = 59
    buyItem(6)//Total = 39

    for(i <- 1 to 14) { //add 14 coins, totalcoins = 63, totalMoney = 67
      pressButton(dut.io.coin2)
    }
    //Next coin should be rejected:
    dut.io.coin2.poke(true.B)
    dut.clock.step(1)
    dut.io.rejectCoinLED.expect(true.B)
    dut.io.coin2.poke(false.B)
    dut.clock.step(1)
    println("VERIFIED TEST 5: Coin register filled, coin succesfully rejected!\n\n")

    //TEST 6: Emptying the vending machine
    //Total cans in the vending = 20. We have so far bought 6 item, 14 left
    dut.io.price.poke(0.U)//Buying water, cheapest
    for(i <- 1 to 13) { //Buy 13 items, 1 item left
      dut.io.buy.poke(true.B)
      dut.clock.step(1)
      dut.io.buy.poke(false.B)
      dut.clock.step(1)
    }
    //Next should be succesfull
    dut.io.buy.poke(true.B)
    dut.clock.step(1)
    dut.io.releaseCan.expect(true.B)
    dut.io.buy.poke(false.B)
    dut.clock.step(1)
    //Now the Vending is empty
    dut.io.buy.poke(true.B)
    dut.clock.step(1)
    dut.io.releaseCan.expect(false.B)
    dut.io.buy.poke(false.B)
    dut.clock.step(1)
    println("VERIFIED TEST 6: empty Vending machine!")

    }
  }
}