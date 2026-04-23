FIRRTL version 1.2.0
circuit VendingMachine :
  module SevenSegDec :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>} @[\\src\\main\\scala\\SevenSegDec.scala 5:14]

    wire sevSeg : UInt @[\\src\\main\\scala\\SevenSegDec.scala 10:27]
    sevSeg <= UInt<1>("h0") @[\\src\\main\\scala\\SevenSegDec.scala 10:27]
    node _T = eq(UInt<1>("h0"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
    when _T : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
      sevSeg <= UInt<6>("h3f") @[\\src\\main\\scala\\SevenSegDec.scala 15:23]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
      when _T_1 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
        sevSeg <= UInt<3>("h6") @[\\src\\main\\scala\\SevenSegDec.scala 16:23]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
        when _T_2 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
          sevSeg <= UInt<7>("h5b") @[\\src\\main\\scala\\SevenSegDec.scala 17:23]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
          when _T_3 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
            sevSeg <= UInt<7>("h4f") @[\\src\\main\\scala\\SevenSegDec.scala 18:23]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
            when _T_4 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
              sevSeg <= UInt<7>("h66") @[\\src\\main\\scala\\SevenSegDec.scala 19:23]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
              when _T_5 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                sevSeg <= UInt<7>("h6d") @[\\src\\main\\scala\\SevenSegDec.scala 20:23]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                when _T_6 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                  sevSeg <= UInt<7>("h7d") @[\\src\\main\\scala\\SevenSegDec.scala 21:23]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                  when _T_7 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                    sevSeg <= UInt<3>("h7") @[\\src\\main\\scala\\SevenSegDec.scala 22:23]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                    when _T_8 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                      sevSeg <= UInt<7>("h7f") @[\\src\\main\\scala\\SevenSegDec.scala 23:23]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                      when _T_9 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                        sevSeg <= UInt<7>("h6f") @[\\src\\main\\scala\\SevenSegDec.scala 24:23]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                        when _T_10 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                          sevSeg <= UInt<7>("h77") @[\\src\\main\\scala\\SevenSegDec.scala 25:24]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                          when _T_11 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                            sevSeg <= UInt<7>("h7c") @[\\src\\main\\scala\\SevenSegDec.scala 26:24]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                            when _T_12 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                              sevSeg <= UInt<6>("h39") @[\\src\\main\\scala\\SevenSegDec.scala 27:24]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                              when _T_13 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                                sevSeg <= UInt<7>("h5e") @[\\src\\main\\scala\\SevenSegDec.scala 28:24]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                                when _T_14 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                                  sevSeg <= UInt<7>("h79") @[\\src\\main\\scala\\SevenSegDec.scala 29:24]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                                  when _T_15 : @[\\src\\main\\scala\\SevenSegDec.scala 14:17]
                                    sevSeg <= UInt<7>("h71") @[\\src\\main\\scala\\SevenSegDec.scala 30:24]
    io.out <= sevSeg @[\\src\\main\\scala\\SevenSegDec.scala 36:10]

  module VendingMachine :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip price : UInt<5>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip buy : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>, seg : UInt<7>, an : UInt<4>} @[\\src\\main\\scala\\VendingMachine.scala 5:14]

    reg totalMoney : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 18:27]
    node onesDigit = rem(totalMoney, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 19:30]
    node _tensDigit_T = div(totalMoney, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 20:31]
    node tensDigit = rem(_tensDigit_T, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 20:39]
    wire itemPrice : UInt<8> @[\\src\\main\\scala\\VendingMachine.scala 23:23]
    itemPrice <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 24:13]
    node _T = eq(UInt<1>("h1"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 25:20]
    when _T : @[\\src\\main\\scala\\VendingMachine.scala 25:20]
      itemPrice <= UInt<3>("h4") @[\\src\\main\\scala\\VendingMachine.scala 26:25]
    else :
      node _T_1 = eq(UInt<2>("h2"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 25:20]
      when _T_1 : @[\\src\\main\\scala\\VendingMachine.scala 25:20]
        itemPrice <= UInt<3>("h4") @[\\src\\main\\scala\\VendingMachine.scala 27:25]
      else :
        node _T_2 = eq(UInt<2>("h3"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 25:20]
        when _T_2 : @[\\src\\main\\scala\\VendingMachine.scala 25:20]
          itemPrice <= UInt<3>("h7") @[\\src\\main\\scala\\VendingMachine.scala 28:25]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 25:20]
          when _T_3 : @[\\src\\main\\scala\\VendingMachine.scala 25:20]
            itemPrice <= UInt<5>("h11") @[\\src\\main\\scala\\VendingMachine.scala 29:25]
          else :
            node _T_4 = eq(UInt<3>("h5"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 25:20]
            when _T_4 : @[\\src\\main\\scala\\VendingMachine.scala 25:20]
              itemPrice <= UInt<5>("h12") @[\\src\\main\\scala\\VendingMachine.scala 30:25]
    node priceOnes = rem(itemPrice, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 33:29]
    node _priceTens_T = div(itemPrice, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 34:30]
    node priceTens = rem(_priceTens_T, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 34:38]
    reg blinkCounter : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 41:29]
    reg blinkReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 42:25]
    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 45:23]
    reg selReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 46:23]
    reg coin2Edge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin2Edge_REG) @[\\src\\main\\scala\\VendingMachine.scala 49:39]
    coin2Edge_REG <= io.coin2 @[\\src\\main\\scala\\VendingMachine.scala 49:39]
    node _coin2Edge_T = eq(coin2Edge_REG, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 49:31]
    node coin2Edge = and(io.coin2, _coin2Edge_T) @[\\src\\main\\scala\\VendingMachine.scala 49:28]
    reg coin5Edge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin5Edge_REG) @[\\src\\main\\scala\\VendingMachine.scala 50:39]
    coin5Edge_REG <= io.coin5 @[\\src\\main\\scala\\VendingMachine.scala 50:39]
    node _coin5Edge_T = eq(coin5Edge_REG, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 50:31]
    node coin5Edge = and(io.coin5, _coin5Edge_T) @[\\src\\main\\scala\\VendingMachine.scala 50:28]
    reg buyEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), buyEdge_REG) @[\\src\\main\\scala\\VendingMachine.scala 51:39]
    buyEdge_REG <= io.buy @[\\src\\main\\scala\\VendingMachine.scala 51:39]
    node _buyEdge_T = eq(buyEdge_REG, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 51:31]
    node buyEdge = and(io.buy, _buyEdge_T) @[\\src\\main\\scala\\VendingMachine.scala 51:28]
    inst sevSegDecoder of SevenSegDec @[\\src\\main\\scala\\VendingMachine.scala 54:29]
    sevSegDecoder.clock <= clock
    sevSegDecoder.reset <= reset
    wire activeDigit : UInt<4> @[\\src\\main\\scala\\VendingMachine.scala 55:32]
    activeDigit <= UInt<4>("hf") @[\\src\\main\\scala\\VendingMachine.scala 55:32]
    sevSegDecoder.io.in <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 56:23]
    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 63:25]
    wire signalCoin2 : UInt<1> @[\\src\\main\\scala\\VendingMachine.scala 65:32]
    signalCoin2 <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 65:32]
    wire signalCoin5 : UInt<1> @[\\src\\main\\scala\\VendingMachine.scala 66:32]
    signalCoin5 <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 66:32]
    wire signalSub : UInt<1> @[\\src\\main\\scala\\VendingMachine.scala 67:31]
    signalSub <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 67:31]
    node _blinkCounter_T = add(blinkCounter, UInt<1>("h1")) @[\\src\\main\\scala\\VendingMachine.scala 71:32]
    node _blinkCounter_T_1 = tail(_blinkCounter_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 71:32]
    blinkCounter <= _blinkCounter_T_1 @[\\src\\main\\scala\\VendingMachine.scala 71:16]
    node _T_5 = eq(blinkCounter, UInt<25>("h17d7840")) @[\\src\\main\\scala\\VendingMachine.scala 72:21]
    when _T_5 : @[\\src\\main\\scala\\VendingMachine.scala 72:36]
      blinkCounter <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 73:18]
      node _blinkReg_T = eq(blinkReg, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 74:17]
      blinkReg <= _blinkReg_T @[\\src\\main\\scala\\VendingMachine.scala 74:14]
    node _T_6 = eq(UInt<2>("h0"), stateReg) @[\\src\\main\\scala\\VendingMachine.scala 77:20]
    when _T_6 : @[\\src\\main\\scala\\VendingMachine.scala 77:20]
      when coin2Edge : @[\\src\\main\\scala\\VendingMachine.scala 79:23]
        signalCoin2 <= UInt<1>("h1") @[\\src\\main\\scala\\VendingMachine.scala 80:21]
      else :
        when coin5Edge : @[\\src\\main\\scala\\VendingMachine.scala 81:30]
          signalCoin5 <= UInt<1>("h1") @[\\src\\main\\scala\\VendingMachine.scala 82:21]
      when buyEdge : @[\\src\\main\\scala\\VendingMachine.scala 85:21]
        node _T_7 = geq(totalMoney, itemPrice) @[\\src\\main\\scala\\VendingMachine.scala 86:25]
        when _T_7 : @[\\src\\main\\scala\\VendingMachine.scala 86:39]
          signalSub <= UInt<1>("h1") @[\\src\\main\\scala\\VendingMachine.scala 87:21]
          stateReg <= UInt<2>("h1") @[\\src\\main\\scala\\VendingMachine.scala 88:20]
        else :
          stateReg <= UInt<2>("h2") @[\\src\\main\\scala\\VendingMachine.scala 90:20]
    else :
      node _T_8 = eq(UInt<2>("h1"), stateReg) @[\\src\\main\\scala\\VendingMachine.scala 77:20]
      when _T_8 : @[\\src\\main\\scala\\VendingMachine.scala 77:20]
        when io.buy : @[\\src\\main\\scala\\VendingMachine.scala 95:20]
          stateReg <= UInt<2>("h1") @[\\src\\main\\scala\\VendingMachine.scala 96:18]
        else :
          stateReg <= UInt<2>("h0") @[\\src\\main\\scala\\VendingMachine.scala 98:18]
      else :
        node _T_9 = eq(UInt<2>("h2"), stateReg) @[\\src\\main\\scala\\VendingMachine.scala 77:20]
        when _T_9 : @[\\src\\main\\scala\\VendingMachine.scala 77:20]
          node _T_10 = eq(io.buy, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 102:14]
          when _T_10 : @[\\src\\main\\scala\\VendingMachine.scala 102:23]
            stateReg <= UInt<2>("h0") @[\\src\\main\\scala\\VendingMachine.scala 103:20]
    when signalCoin2 : @[\\src\\main\\scala\\VendingMachine.scala 109:21]
      node _totalMoney_T = add(totalMoney, UInt<2>("h2")) @[\\src\\main\\scala\\VendingMachine.scala 110:30]
      node _totalMoney_T_1 = tail(_totalMoney_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 110:30]
      totalMoney <= _totalMoney_T_1 @[\\src\\main\\scala\\VendingMachine.scala 110:16]
    else :
      when signalCoin5 : @[\\src\\main\\scala\\VendingMachine.scala 111:28]
        node _totalMoney_T_2 = add(totalMoney, UInt<3>("h5")) @[\\src\\main\\scala\\VendingMachine.scala 112:30]
        node _totalMoney_T_3 = tail(_totalMoney_T_2, 1) @[\\src\\main\\scala\\VendingMachine.scala 112:30]
        totalMoney <= _totalMoney_T_3 @[\\src\\main\\scala\\VendingMachine.scala 112:16]
      else :
        when signalSub : @[\\src\\main\\scala\\VendingMachine.scala 113:26]
          node _totalMoney_T_4 = sub(totalMoney, itemPrice) @[\\src\\main\\scala\\VendingMachine.scala 114:30]
          node _totalMoney_T_5 = tail(_totalMoney_T_4, 1) @[\\src\\main\\scala\\VendingMachine.scala 114:30]
          totalMoney <= _totalMoney_T_5 @[\\src\\main\\scala\\VendingMachine.scala 114:16]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[\\src\\main\\scala\\VendingMachine.scala 118:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 118:20]
    cntReg <= _cntReg_T_1 @[\\src\\main\\scala\\VendingMachine.scala 118:10]
    node _T_11 = eq(cntReg, UInt<17>("h1869f")) @[\\src\\main\\scala\\VendingMachine.scala 119:15]
    when _T_11 : @[\\src\\main\\scala\\VendingMachine.scala 119:27]
      cntReg <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 120:12]
      node _selReg_T = add(selReg, UInt<1>("h1")) @[\\src\\main\\scala\\VendingMachine.scala 121:22]
      node _selReg_T_1 = tail(_selReg_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 121:22]
      selReg <= _selReg_T_1 @[\\src\\main\\scala\\VendingMachine.scala 121:12]
    node _blinkDuringAlarm_T = eq(stateReg, UInt<2>("h2")) @[\\src\\main\\scala\\VendingMachine.scala 124:36]
    node _blinkDuringAlarm_T_1 = eq(blinkReg, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 124:50]
    node blinkDuringAlarm = and(_blinkDuringAlarm_T, _blinkDuringAlarm_T_1) @[\\src\\main\\scala\\VendingMachine.scala 124:47]
    node _T_12 = eq(UInt<1>("h0"), selReg) @[\\src\\main\\scala\\VendingMachine.scala 126:18]
    when _T_12 : @[\\src\\main\\scala\\VendingMachine.scala 126:18]
      node _activeDigit_T = mux(blinkDuringAlarm, UInt<4>("hf"), UInt<3>("h7")) @[\\src\\main\\scala\\VendingMachine.scala 128:25]
      activeDigit <= _activeDigit_T @[\\src\\main\\scala\\VendingMachine.scala 128:19]
      sevSegDecoder.io.in <= tensDigit @[\\src\\main\\scala\\VendingMachine.scala 129:27]
    else :
      node _T_13 = eq(UInt<1>("h1"), selReg) @[\\src\\main\\scala\\VendingMachine.scala 126:18]
      when _T_13 : @[\\src\\main\\scala\\VendingMachine.scala 126:18]
        node _activeDigit_T_1 = mux(blinkDuringAlarm, UInt<4>("hf"), UInt<4>("hb")) @[\\src\\main\\scala\\VendingMachine.scala 132:25]
        activeDigit <= _activeDigit_T_1 @[\\src\\main\\scala\\VendingMachine.scala 132:19]
        sevSegDecoder.io.in <= onesDigit @[\\src\\main\\scala\\VendingMachine.scala 133:27]
      else :
        node _T_14 = eq(UInt<2>("h2"), selReg) @[\\src\\main\\scala\\VendingMachine.scala 126:18]
        when _T_14 : @[\\src\\main\\scala\\VendingMachine.scala 126:18]
          activeDigit <= UInt<4>("hd") @[\\src\\main\\scala\\VendingMachine.scala 136:19]
          sevSegDecoder.io.in <= priceTens @[\\src\\main\\scala\\VendingMachine.scala 137:27]
        else :
          node _T_15 = eq(UInt<2>("h3"), selReg) @[\\src\\main\\scala\\VendingMachine.scala 126:18]
          when _T_15 : @[\\src\\main\\scala\\VendingMachine.scala 126:18]
            activeDigit <= UInt<4>("he") @[\\src\\main\\scala\\VendingMachine.scala 140:19]
            sevSegDecoder.io.in <= priceOnes @[\\src\\main\\scala\\VendingMachine.scala 141:27]
    node _io_seg_T = not(sevSegDecoder.io.out) @[\\src\\main\\scala\\VendingMachine.scala 148:13]
    io.seg <= _io_seg_T @[\\src\\main\\scala\\VendingMachine.scala 148:10]
    io.an <= activeDigit @[\\src\\main\\scala\\VendingMachine.scala 149:10]
    node _io_releaseCan_T = eq(stateReg, UInt<2>("h1")) @[\\src\\main\\scala\\VendingMachine.scala 150:30]
    io.releaseCan <= _io_releaseCan_T @[\\src\\main\\scala\\VendingMachine.scala 150:17]
    node _io_alarm_T = eq(stateReg, UInt<2>("h2")) @[\\src\\main\\scala\\VendingMachine.scala 151:25]
    node _io_alarm_T_1 = and(_io_alarm_T, blinkReg) @[\\src\\main\\scala\\VendingMachine.scala 151:36]
    io.alarm <= _io_alarm_T_1 @[\\src\\main\\scala\\VendingMachine.scala 151:12]

