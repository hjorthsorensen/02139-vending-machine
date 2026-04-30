FIRRTL version 1.2.0
circuit VendingMachine :
  module SevenSegDec :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>} @[src/main/scala/SevenSegDec.scala 5:14]

    wire sevSeg : UInt @[src/main/scala/SevenSegDec.scala 10:27]
    sevSeg <= UInt<1>("h0") @[src/main/scala/SevenSegDec.scala 10:27]
    node _T = eq(UInt<1>("h0"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
    when _T : @[src/main/scala/SevenSegDec.scala 14:17]
      sevSeg <= UInt<6>("h3f") @[src/main/scala/SevenSegDec.scala 15:23]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
      when _T_1 : @[src/main/scala/SevenSegDec.scala 14:17]
        sevSeg <= UInt<3>("h6") @[src/main/scala/SevenSegDec.scala 16:23]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
        when _T_2 : @[src/main/scala/SevenSegDec.scala 14:17]
          sevSeg <= UInt<7>("h5b") @[src/main/scala/SevenSegDec.scala 17:23]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
          when _T_3 : @[src/main/scala/SevenSegDec.scala 14:17]
            sevSeg <= UInt<7>("h4f") @[src/main/scala/SevenSegDec.scala 18:23]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
            when _T_4 : @[src/main/scala/SevenSegDec.scala 14:17]
              sevSeg <= UInt<7>("h66") @[src/main/scala/SevenSegDec.scala 19:23]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
              when _T_5 : @[src/main/scala/SevenSegDec.scala 14:17]
                sevSeg <= UInt<7>("h6d") @[src/main/scala/SevenSegDec.scala 20:23]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                when _T_6 : @[src/main/scala/SevenSegDec.scala 14:17]
                  sevSeg <= UInt<7>("h7d") @[src/main/scala/SevenSegDec.scala 21:23]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                  when _T_7 : @[src/main/scala/SevenSegDec.scala 14:17]
                    sevSeg <= UInt<3>("h7") @[src/main/scala/SevenSegDec.scala 22:23]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                    when _T_8 : @[src/main/scala/SevenSegDec.scala 14:17]
                      sevSeg <= UInt<7>("h7f") @[src/main/scala/SevenSegDec.scala 23:23]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                      when _T_9 : @[src/main/scala/SevenSegDec.scala 14:17]
                        sevSeg <= UInt<7>("h6f") @[src/main/scala/SevenSegDec.scala 24:23]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                        when _T_10 : @[src/main/scala/SevenSegDec.scala 14:17]
                          sevSeg <= UInt<7>("h77") @[src/main/scala/SevenSegDec.scala 25:24]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                          when _T_11 : @[src/main/scala/SevenSegDec.scala 14:17]
                            sevSeg <= UInt<7>("h7c") @[src/main/scala/SevenSegDec.scala 26:24]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                            when _T_12 : @[src/main/scala/SevenSegDec.scala 14:17]
                              sevSeg <= UInt<6>("h39") @[src/main/scala/SevenSegDec.scala 27:24]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                              when _T_13 : @[src/main/scala/SevenSegDec.scala 14:17]
                                sevSeg <= UInt<7>("h5e") @[src/main/scala/SevenSegDec.scala 28:24]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                                when _T_14 : @[src/main/scala/SevenSegDec.scala 14:17]
                                  sevSeg <= UInt<7>("h79") @[src/main/scala/SevenSegDec.scala 29:24]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[src/main/scala/SevenSegDec.scala 14:17]
                                  when _T_15 : @[src/main/scala/SevenSegDec.scala 14:17]
                                    sevSeg <= UInt<7>("h71") @[src/main/scala/SevenSegDec.scala 30:24]
    io.out <= sevSeg @[src/main/scala/SevenSegDec.scala 36:10]

  module VendingFSM :
    input clock : Clock
    input reset : Reset
    output io : { flip coin2Edge : UInt<1>, flip coin5Edge : UInt<1>, flip buyEdge : UInt<1>, flip buy : UInt<1>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip totalMoney : UInt<8>, flip itemPrice : UInt<8>, flip coinRejected : UInt<1>, signalCoin2 : UInt<1>, signalCoin5 : UInt<1>, signalSub : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>} @[src/main/scala/VendingFSM.scala 5:14]

    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/VendingFSM.scala 26:25]
    io.signalCoin2 <= UInt<1>("h0") @[src/main/scala/VendingFSM.scala 28:18]
    io.signalCoin5 <= UInt<1>("h0") @[src/main/scala/VendingFSM.scala 29:18]
    io.signalSub <= UInt<1>("h0") @[src/main/scala/VendingFSM.scala 30:18]
    node _T = eq(UInt<2>("h0"), stateReg) @[src/main/scala/VendingFSM.scala 32:20]
    when _T : @[src/main/scala/VendingFSM.scala 32:20]
      when io.coin2Edge : @[src/main/scala/VendingFSM.scala 34:26]
        io.signalCoin2 <= UInt<1>("h1") @[src/main/scala/VendingFSM.scala 35:24]
      else :
        when io.coin5Edge : @[src/main/scala/VendingFSM.scala 36:32]
          io.signalCoin5 <= UInt<1>("h1") @[src/main/scala/VendingFSM.scala 37:24]
      when io.buyEdge : @[src/main/scala/VendingFSM.scala 40:24]
        node _T_1 = geq(io.totalMoney, io.itemPrice) @[src/main/scala/VendingFSM.scala 41:28]
        when _T_1 : @[src/main/scala/VendingFSM.scala 41:45]
          io.signalSub <= UInt<1>("h1") @[src/main/scala/VendingFSM.scala 42:24]
          stateReg <= UInt<2>("h1") @[src/main/scala/VendingFSM.scala 43:20]
        else :
          stateReg <= UInt<2>("h2") @[src/main/scala/VendingFSM.scala 45:20]
      when io.coinRejected : @[src/main/scala/VendingFSM.scala 49:29]
        stateReg <= UInt<2>("h2") @[src/main/scala/VendingFSM.scala 50:18]
    else :
      node _T_2 = eq(UInt<2>("h1"), stateReg) @[src/main/scala/VendingFSM.scala 32:20]
      when _T_2 : @[src/main/scala/VendingFSM.scala 32:20]
        node _stateReg_T = mux(io.buy, UInt<2>("h1"), UInt<2>("h0")) @[src/main/scala/VendingFSM.scala 55:22]
        stateReg <= _stateReg_T @[src/main/scala/VendingFSM.scala 55:16]
      else :
        node _T_3 = eq(UInt<2>("h2"), stateReg) @[src/main/scala/VendingFSM.scala 32:20]
        when _T_3 : @[src/main/scala/VendingFSM.scala 32:20]
          node _T_4 = eq(io.buy, UInt<1>("h0")) @[src/main/scala/VendingFSM.scala 59:12]
          node _T_5 = eq(io.coin2, UInt<1>("h0")) @[src/main/scala/VendingFSM.scala 59:23]
          node _T_6 = and(_T_4, _T_5) @[src/main/scala/VendingFSM.scala 59:20]
          node _T_7 = eq(io.coin5, UInt<1>("h0")) @[src/main/scala/VendingFSM.scala 59:36]
          node _T_8 = and(_T_6, _T_7) @[src/main/scala/VendingFSM.scala 59:33]
          when _T_8 : @[src/main/scala/VendingFSM.scala 59:47]
            stateReg <= UInt<2>("h0") @[src/main/scala/VendingFSM.scala 60:18]
    node _io_releaseCan_T = eq(stateReg, UInt<2>("h1")) @[src/main/scala/VendingFSM.scala 66:30]
    io.releaseCan <= _io_releaseCan_T @[src/main/scala/VendingFSM.scala 66:17]
    node _io_alarm_T = eq(stateReg, UInt<2>("h2")) @[src/main/scala/VendingFSM.scala 67:30]
    io.alarm <= _io_alarm_T @[src/main/scala/VendingFSM.scala 67:17]

  module VendingMachine :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip price : UInt<5>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip buy : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>, seg : UInt<7>, an : UInt<4>} @[src/main/scala/VendingMachine.scala 5:14]

    reg totalMoney : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/VendingMachine.scala 18:27]
    node onesDigit = rem(totalMoney, UInt<4>("ha")) @[src/main/scala/VendingMachine.scala 19:30]
    node _tensDigit_T = div(totalMoney, UInt<4>("ha")) @[src/main/scala/VendingMachine.scala 20:31]
    node tensDigit = rem(_tensDigit_T, UInt<4>("ha")) @[src/main/scala/VendingMachine.scala 20:39]
    wire coinRejected : UInt<1> @[src/main/scala/VendingMachine.scala 21:33]
    coinRejected <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 21:33]
    wire itemPrice : UInt<8> @[src/main/scala/VendingMachine.scala 25:23]
    itemPrice <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 26:13]
    node _T = eq(UInt<1>("h1"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
    when _T : @[src/main/scala/VendingMachine.scala 27:20]
      itemPrice <= UInt<3>("h4") @[src/main/scala/VendingMachine.scala 28:25]
    else :
      node _T_1 = eq(UInt<2>("h2"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
      when _T_1 : @[src/main/scala/VendingMachine.scala 27:20]
        itemPrice <= UInt<3>("h4") @[src/main/scala/VendingMachine.scala 29:25]
      else :
        node _T_2 = eq(UInt<2>("h3"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
        when _T_2 : @[src/main/scala/VendingMachine.scala 27:20]
          itemPrice <= UInt<3>("h7") @[src/main/scala/VendingMachine.scala 30:25]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
          when _T_3 : @[src/main/scala/VendingMachine.scala 27:20]
            itemPrice <= UInt<5>("h11") @[src/main/scala/VendingMachine.scala 31:25]
          else :
            node _T_4 = eq(UInt<3>("h5"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
            when _T_4 : @[src/main/scala/VendingMachine.scala 27:20]
              itemPrice <= UInt<5>("h12") @[src/main/scala/VendingMachine.scala 32:25]
            else :
              node _T_5 = eq(UInt<3>("h6"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
              when _T_5 : @[src/main/scala/VendingMachine.scala 27:20]
                itemPrice <= UInt<5>("h14") @[src/main/scala/VendingMachine.scala 33:25]
              else :
                node _T_6 = eq(UInt<3>("h7"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
                when _T_6 : @[src/main/scala/VendingMachine.scala 27:20]
                  itemPrice <= UInt<4>("he") @[src/main/scala/VendingMachine.scala 34:25]
                else :
                  node _T_7 = eq(UInt<4>("h8"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
                  when _T_7 : @[src/main/scala/VendingMachine.scala 27:20]
                    itemPrice <= UInt<4>("ha") @[src/main/scala/VendingMachine.scala 35:25]
                  else :
                    node _T_8 = eq(UInt<4>("h9"), io.price) @[src/main/scala/VendingMachine.scala 27:20]
                    when _T_8 : @[src/main/scala/VendingMachine.scala 27:20]
                      itemPrice <= UInt<5>("h11") @[src/main/scala/VendingMachine.scala 36:25]
    node priceOnes = rem(itemPrice, UInt<4>("ha")) @[src/main/scala/VendingMachine.scala 39:29]
    node _priceTens_T = div(itemPrice, UInt<4>("ha")) @[src/main/scala/VendingMachine.scala 40:30]
    node priceTens = rem(_priceTens_T, UInt<4>("ha")) @[src/main/scala/VendingMachine.scala 40:38]
    reg blinkCounter : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/VendingMachine.scala 45:29]
    reg blinkReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 46:25]
    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/VendingMachine.scala 49:23]
    reg selReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/VendingMachine.scala 50:23]
    reg coin2Edge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin2Edge_REG) @[src/main/scala/VendingMachine.scala 53:39]
    coin2Edge_REG <= io.coin2 @[src/main/scala/VendingMachine.scala 53:39]
    node _coin2Edge_T = eq(coin2Edge_REG, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 53:31]
    node coin2Edge = and(io.coin2, _coin2Edge_T) @[src/main/scala/VendingMachine.scala 53:28]
    reg coin5Edge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin5Edge_REG) @[src/main/scala/VendingMachine.scala 54:39]
    coin5Edge_REG <= io.coin5 @[src/main/scala/VendingMachine.scala 54:39]
    node _coin5Edge_T = eq(coin5Edge_REG, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 54:31]
    node coin5Edge = and(io.coin5, _coin5Edge_T) @[src/main/scala/VendingMachine.scala 54:28]
    reg buyEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), buyEdge_REG) @[src/main/scala/VendingMachine.scala 55:39]
    buyEdge_REG <= io.buy @[src/main/scala/VendingMachine.scala 55:39]
    node _buyEdge_T = eq(buyEdge_REG, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 55:31]
    node buyEdge = and(io.buy, _buyEdge_T) @[src/main/scala/VendingMachine.scala 55:28]
    inst sevSegDecoder of SevenSegDec @[src/main/scala/VendingMachine.scala 58:29]
    sevSegDecoder.clock <= clock
    sevSegDecoder.reset <= reset
    wire activeDigit : UInt<4> @[src/main/scala/VendingMachine.scala 59:32]
    activeDigit <= UInt<4>("hf") @[src/main/scala/VendingMachine.scala 59:32]
    sevSegDecoder.io.in <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 60:23]
    inst fsm of VendingFSM @[src/main/scala/VendingMachine.scala 65:19]
    fsm.clock <= clock
    fsm.reset <= reset
    fsm.io.coin2Edge <= coin2Edge @[src/main/scala/VendingMachine.scala 66:20]
    fsm.io.coin5Edge <= coin5Edge @[src/main/scala/VendingMachine.scala 67:20]
    fsm.io.buyEdge <= buyEdge @[src/main/scala/VendingMachine.scala 68:20]
    fsm.io.buy <= io.buy @[src/main/scala/VendingMachine.scala 69:20]
    fsm.io.coin2 <= io.coin2 @[src/main/scala/VendingMachine.scala 70:20]
    fsm.io.coin5 <= io.coin5 @[src/main/scala/VendingMachine.scala 71:20]
    fsm.io.totalMoney <= totalMoney @[src/main/scala/VendingMachine.scala 72:21]
    fsm.io.itemPrice <= itemPrice @[src/main/scala/VendingMachine.scala 73:20]
    fsm.io.coinRejected <= coinRejected @[src/main/scala/VendingMachine.scala 74:23]
    node _blinkCounter_T = add(blinkCounter, UInt<1>("h1")) @[src/main/scala/VendingMachine.scala 78:32]
    node _blinkCounter_T_1 = tail(_blinkCounter_T, 1) @[src/main/scala/VendingMachine.scala 78:32]
    blinkCounter <= _blinkCounter_T_1 @[src/main/scala/VendingMachine.scala 78:16]
    node _T_9 = eq(blinkCounter, UInt<25>("h17d7840")) @[src/main/scala/VendingMachine.scala 79:21]
    when _T_9 : @[src/main/scala/VendingMachine.scala 79:36]
      blinkCounter <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 80:18]
      node _blinkReg_T = eq(blinkReg, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 81:17]
      blinkReg <= _blinkReg_T @[src/main/scala/VendingMachine.scala 81:14]
    when fsm.io.signalCoin2 : @[src/main/scala/VendingMachine.scala 85:28]
      node _T_10 = leq(totalMoney, UInt<7>("h61")) @[src/main/scala/VendingMachine.scala 86:21]
      when _T_10 : @[src/main/scala/VendingMachine.scala 86:30]
        node _totalMoney_T = add(totalMoney, UInt<2>("h2")) @[src/main/scala/VendingMachine.scala 87:32]
        node _totalMoney_T_1 = tail(_totalMoney_T, 1) @[src/main/scala/VendingMachine.scala 87:32]
        totalMoney <= _totalMoney_T_1 @[src/main/scala/VendingMachine.scala 87:18]
      else :
        coinRejected <= UInt<1>("h1") @[src/main/scala/VendingMachine.scala 89:20]
    else :
      when fsm.io.signalCoin5 : @[src/main/scala/VendingMachine.scala 91:35]
        node _T_11 = leq(totalMoney, UInt<7>("h5e")) @[src/main/scala/VendingMachine.scala 92:21]
        when _T_11 : @[src/main/scala/VendingMachine.scala 92:30]
          node _totalMoney_T_2 = add(totalMoney, UInt<3>("h5")) @[src/main/scala/VendingMachine.scala 93:32]
          node _totalMoney_T_3 = tail(_totalMoney_T_2, 1) @[src/main/scala/VendingMachine.scala 93:32]
          totalMoney <= _totalMoney_T_3 @[src/main/scala/VendingMachine.scala 93:18]
        else :
          coinRejected <= UInt<1>("h1") @[src/main/scala/VendingMachine.scala 95:20]
      else :
        when fsm.io.signalSub : @[src/main/scala/VendingMachine.scala 97:33]
          node _totalMoney_T_4 = sub(totalMoney, itemPrice) @[src/main/scala/VendingMachine.scala 98:30]
          node _totalMoney_T_5 = tail(_totalMoney_T_4, 1) @[src/main/scala/VendingMachine.scala 98:30]
          totalMoney <= _totalMoney_T_5 @[src/main/scala/VendingMachine.scala 98:16]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[src/main/scala/VendingMachine.scala 102:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/VendingMachine.scala 102:20]
    cntReg <= _cntReg_T_1 @[src/main/scala/VendingMachine.scala 102:10]
    node _T_12 = eq(cntReg, UInt<17>("h1869f")) @[src/main/scala/VendingMachine.scala 103:15]
    when _T_12 : @[src/main/scala/VendingMachine.scala 103:27]
      cntReg <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 104:12]
      node _selReg_T = add(selReg, UInt<1>("h1")) @[src/main/scala/VendingMachine.scala 105:22]
      node _selReg_T_1 = tail(_selReg_T, 1) @[src/main/scala/VendingMachine.scala 105:22]
      selReg <= _selReg_T_1 @[src/main/scala/VendingMachine.scala 105:12]
    node _blinkDuringAlarm_T = eq(blinkReg, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 108:42]
    node blinkDuringAlarm = and(fsm.io.alarm, _blinkDuringAlarm_T) @[src/main/scala/VendingMachine.scala 108:39]
    node _T_13 = eq(UInt<1>("h0"), selReg) @[src/main/scala/VendingMachine.scala 110:18]
    when _T_13 : @[src/main/scala/VendingMachine.scala 110:18]
      node _activeDigit_T = mux(blinkDuringAlarm, UInt<4>("hf"), UInt<3>("h7")) @[src/main/scala/VendingMachine.scala 112:25]
      activeDigit <= _activeDigit_T @[src/main/scala/VendingMachine.scala 112:19]
      sevSegDecoder.io.in <= tensDigit @[src/main/scala/VendingMachine.scala 113:27]
    else :
      node _T_14 = eq(UInt<1>("h1"), selReg) @[src/main/scala/VendingMachine.scala 110:18]
      when _T_14 : @[src/main/scala/VendingMachine.scala 110:18]
        node _activeDigit_T_1 = mux(blinkDuringAlarm, UInt<4>("hf"), UInt<4>("hb")) @[src/main/scala/VendingMachine.scala 116:25]
        activeDigit <= _activeDigit_T_1 @[src/main/scala/VendingMachine.scala 116:19]
        sevSegDecoder.io.in <= onesDigit @[src/main/scala/VendingMachine.scala 117:27]
      else :
        node _T_15 = eq(UInt<2>("h2"), selReg) @[src/main/scala/VendingMachine.scala 110:18]
        when _T_15 : @[src/main/scala/VendingMachine.scala 110:18]
          activeDigit <= UInt<4>("hd") @[src/main/scala/VendingMachine.scala 120:19]
          sevSegDecoder.io.in <= priceTens @[src/main/scala/VendingMachine.scala 121:27]
        else :
          node _T_16 = eq(UInt<2>("h3"), selReg) @[src/main/scala/VendingMachine.scala 110:18]
          when _T_16 : @[src/main/scala/VendingMachine.scala 110:18]
            activeDigit <= UInt<4>("he") @[src/main/scala/VendingMachine.scala 124:19]
            sevSegDecoder.io.in <= priceOnes @[src/main/scala/VendingMachine.scala 125:27]
    node _io_seg_T = not(sevSegDecoder.io.out) @[src/main/scala/VendingMachine.scala 132:13]
    io.seg <= _io_seg_T @[src/main/scala/VendingMachine.scala 132:10]
    io.an <= activeDigit @[src/main/scala/VendingMachine.scala 133:10]
    io.releaseCan <= fsm.io.releaseCan @[src/main/scala/VendingMachine.scala 134:17]
    node _io_alarm_T = and(fsm.io.alarm, blinkReg) @[src/main/scala/VendingMachine.scala 135:28]
    io.alarm <= _io_alarm_T @[src/main/scala/VendingMachine.scala 135:12]

