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
    wire coinRejected : UInt<1> @[\\src\\main\\scala\\VendingMachine.scala 21:33]
    coinRejected <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 21:33]
    wire itemPrice : UInt<8> @[\\src\\main\\scala\\VendingMachine.scala 25:23]
    itemPrice <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 26:13]
    node _T = eq(UInt<1>("h1"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
    when _T : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
      itemPrice <= UInt<3>("h4") @[\\src\\main\\scala\\VendingMachine.scala 28:25]
    else :
      node _T_1 = eq(UInt<2>("h2"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
      when _T_1 : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
        itemPrice <= UInt<3>("h4") @[\\src\\main\\scala\\VendingMachine.scala 29:25]
      else :
        node _T_2 = eq(UInt<2>("h3"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
        when _T_2 : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
          itemPrice <= UInt<3>("h7") @[\\src\\main\\scala\\VendingMachine.scala 30:25]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
          when _T_3 : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
            itemPrice <= UInt<5>("h11") @[\\src\\main\\scala\\VendingMachine.scala 31:25]
          else :
            node _T_4 = eq(UInt<3>("h5"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
            when _T_4 : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
              itemPrice <= UInt<5>("h12") @[\\src\\main\\scala\\VendingMachine.scala 32:25]
            else :
              node _T_5 = eq(UInt<3>("h6"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
              when _T_5 : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
                itemPrice <= UInt<5>("h14") @[\\src\\main\\scala\\VendingMachine.scala 33:25]
              else :
                node _T_6 = eq(UInt<3>("h7"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
                when _T_6 : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
                  itemPrice <= UInt<4>("he") @[\\src\\main\\scala\\VendingMachine.scala 34:25]
                else :
                  node _T_7 = eq(UInt<4>("h8"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
                  when _T_7 : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
                    itemPrice <= UInt<4>("ha") @[\\src\\main\\scala\\VendingMachine.scala 35:25]
                  else :
                    node _T_8 = eq(UInt<4>("h9"), io.price) @[\\src\\main\\scala\\VendingMachine.scala 27:20]
                    when _T_8 : @[\\src\\main\\scala\\VendingMachine.scala 27:20]
                      itemPrice <= UInt<5>("h11") @[\\src\\main\\scala\\VendingMachine.scala 36:25]
    node priceOnes = rem(itemPrice, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 39:29]
    node _priceTens_T = div(itemPrice, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 40:30]
    node priceTens = rem(_priceTens_T, UInt<4>("ha")) @[\\src\\main\\scala\\VendingMachine.scala 40:38]
    reg blinkCounter : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 45:29]
    reg blinkReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 46:25]
    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 49:23]
    reg selReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 50:23]
    reg coin2Edge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin2Edge_REG) @[\\src\\main\\scala\\VendingMachine.scala 53:39]
    coin2Edge_REG <= io.coin2 @[\\src\\main\\scala\\VendingMachine.scala 53:39]
    node _coin2Edge_T = eq(coin2Edge_REG, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 53:31]
    node coin2Edge = and(io.coin2, _coin2Edge_T) @[\\src\\main\\scala\\VendingMachine.scala 53:28]
    reg coin5Edge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin5Edge_REG) @[\\src\\main\\scala\\VendingMachine.scala 54:39]
    coin5Edge_REG <= io.coin5 @[\\src\\main\\scala\\VendingMachine.scala 54:39]
    node _coin5Edge_T = eq(coin5Edge_REG, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 54:31]
    node coin5Edge = and(io.coin5, _coin5Edge_T) @[\\src\\main\\scala\\VendingMachine.scala 54:28]
    reg buyEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), buyEdge_REG) @[\\src\\main\\scala\\VendingMachine.scala 55:39]
    buyEdge_REG <= io.buy @[\\src\\main\\scala\\VendingMachine.scala 55:39]
    node _buyEdge_T = eq(buyEdge_REG, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 55:31]
    node buyEdge = and(io.buy, _buyEdge_T) @[\\src\\main\\scala\\VendingMachine.scala 55:28]
    inst sevSegDecoder of SevenSegDec @[\\src\\main\\scala\\VendingMachine.scala 58:29]
    sevSegDecoder.clock <= clock
    sevSegDecoder.reset <= reset
    wire activeDigit : UInt<4> @[\\src\\main\\scala\\VendingMachine.scala 59:32]
    activeDigit <= UInt<4>("hf") @[\\src\\main\\scala\\VendingMachine.scala 59:32]
    sevSegDecoder.io.in <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 60:23]
    reg stateReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 67:25]
    wire signalCoin2 : UInt<1> @[\\src\\main\\scala\\VendingMachine.scala 69:32]
    signalCoin2 <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 69:32]
    wire signalCoin5 : UInt<1> @[\\src\\main\\scala\\VendingMachine.scala 70:32]
    signalCoin5 <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 70:32]
    wire signalSub : UInt<1> @[\\src\\main\\scala\\VendingMachine.scala 71:31]
    signalSub <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 71:31]
    node _blinkCounter_T = add(blinkCounter, UInt<1>("h1")) @[\\src\\main\\scala\\VendingMachine.scala 75:32]
    node _blinkCounter_T_1 = tail(_blinkCounter_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 75:32]
    blinkCounter <= _blinkCounter_T_1 @[\\src\\main\\scala\\VendingMachine.scala 75:16]
    node _T_9 = eq(blinkCounter, UInt<25>("h17d7840")) @[\\src\\main\\scala\\VendingMachine.scala 76:21]
    when _T_9 : @[\\src\\main\\scala\\VendingMachine.scala 76:36]
      blinkCounter <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 77:18]
      node _blinkReg_T = eq(blinkReg, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 78:17]
      blinkReg <= _blinkReg_T @[\\src\\main\\scala\\VendingMachine.scala 78:14]
    node _T_10 = eq(UInt<2>("h0"), stateReg) @[\\src\\main\\scala\\VendingMachine.scala 81:20]
    when _T_10 : @[\\src\\main\\scala\\VendingMachine.scala 81:20]
      when coin2Edge : @[\\src\\main\\scala\\VendingMachine.scala 83:23]
        signalCoin2 <= UInt<1>("h1") @[\\src\\main\\scala\\VendingMachine.scala 84:21]
      else :
        when coin5Edge : @[\\src\\main\\scala\\VendingMachine.scala 85:30]
          signalCoin5 <= UInt<1>("h1") @[\\src\\main\\scala\\VendingMachine.scala 86:21]
      when buyEdge : @[\\src\\main\\scala\\VendingMachine.scala 89:21]
        node _T_11 = geq(totalMoney, itemPrice) @[\\src\\main\\scala\\VendingMachine.scala 90:25]
        when _T_11 : @[\\src\\main\\scala\\VendingMachine.scala 90:39]
          signalSub <= UInt<1>("h1") @[\\src\\main\\scala\\VendingMachine.scala 91:21]
          stateReg <= UInt<2>("h1") @[\\src\\main\\scala\\VendingMachine.scala 92:20]
        else :
          stateReg <= UInt<2>("h2") @[\\src\\main\\scala\\VendingMachine.scala 94:20]
      when coinRejected : @[\\src\\main\\scala\\VendingMachine.scala 97:26]
        stateReg <= UInt<2>("h2") @[\\src\\main\\scala\\VendingMachine.scala 98:18]
    else :
      node _T_12 = eq(UInt<2>("h1"), stateReg) @[\\src\\main\\scala\\VendingMachine.scala 81:20]
      when _T_12 : @[\\src\\main\\scala\\VendingMachine.scala 81:20]
        when io.buy : @[\\src\\main\\scala\\VendingMachine.scala 102:20]
          stateReg <= UInt<2>("h1") @[\\src\\main\\scala\\VendingMachine.scala 103:18]
        else :
          stateReg <= UInt<2>("h0") @[\\src\\main\\scala\\VendingMachine.scala 105:18]
      else :
        node _T_13 = eq(UInt<2>("h2"), stateReg) @[\\src\\main\\scala\\VendingMachine.scala 81:20]
        when _T_13 : @[\\src\\main\\scala\\VendingMachine.scala 81:20]
          node _T_14 = eq(io.buy, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 109:14]
          node _T_15 = eq(io.coin2, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 109:25]
          node _T_16 = and(_T_14, _T_15) @[\\src\\main\\scala\\VendingMachine.scala 109:22]
          node _T_17 = eq(io.coin5, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 109:38]
          node _T_18 = and(_T_16, _T_17) @[\\src\\main\\scala\\VendingMachine.scala 109:35]
          when _T_18 : @[\\src\\main\\scala\\VendingMachine.scala 109:49]
            stateReg <= UInt<2>("h0") @[\\src\\main\\scala\\VendingMachine.scala 110:20]
    when signalCoin2 : @[\\src\\main\\scala\\VendingMachine.scala 116:21]
      node _T_19 = leq(totalMoney, UInt<7>("h61")) @[\\src\\main\\scala\\VendingMachine.scala 117:21]
      when _T_19 : @[\\src\\main\\scala\\VendingMachine.scala 117:30]
        node _totalMoney_T = add(totalMoney, UInt<2>("h2")) @[\\src\\main\\scala\\VendingMachine.scala 118:32]
        node _totalMoney_T_1 = tail(_totalMoney_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 118:32]
        totalMoney <= _totalMoney_T_1 @[\\src\\main\\scala\\VendingMachine.scala 118:18]
      else :
        coinRejected <= UInt<1>("h1") @[\\src\\main\\scala\\VendingMachine.scala 120:20]
    else :
      when signalCoin5 : @[\\src\\main\\scala\\VendingMachine.scala 122:28]
        node _T_20 = leq(totalMoney, UInt<7>("h5e")) @[\\src\\main\\scala\\VendingMachine.scala 123:21]
        when _T_20 : @[\\src\\main\\scala\\VendingMachine.scala 123:30]
          node _totalMoney_T_2 = add(totalMoney, UInt<3>("h5")) @[\\src\\main\\scala\\VendingMachine.scala 124:32]
          node _totalMoney_T_3 = tail(_totalMoney_T_2, 1) @[\\src\\main\\scala\\VendingMachine.scala 124:32]
          totalMoney <= _totalMoney_T_3 @[\\src\\main\\scala\\VendingMachine.scala 124:18]
        else :
          coinRejected <= UInt<1>("h1") @[\\src\\main\\scala\\VendingMachine.scala 126:20]
      else :
        when signalSub : @[\\src\\main\\scala\\VendingMachine.scala 128:26]
          node _totalMoney_T_4 = sub(totalMoney, itemPrice) @[\\src\\main\\scala\\VendingMachine.scala 129:30]
          node _totalMoney_T_5 = tail(_totalMoney_T_4, 1) @[\\src\\main\\scala\\VendingMachine.scala 129:30]
          totalMoney <= _totalMoney_T_5 @[\\src\\main\\scala\\VendingMachine.scala 129:16]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[\\src\\main\\scala\\VendingMachine.scala 133:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 133:20]
    cntReg <= _cntReg_T_1 @[\\src\\main\\scala\\VendingMachine.scala 133:10]
    node _T_21 = eq(cntReg, UInt<17>("h1869f")) @[\\src\\main\\scala\\VendingMachine.scala 134:15]
    when _T_21 : @[\\src\\main\\scala\\VendingMachine.scala 134:27]
      cntReg <= UInt<1>("h0") @[\\src\\main\\scala\\VendingMachine.scala 135:12]
      node _selReg_T = add(selReg, UInt<1>("h1")) @[\\src\\main\\scala\\VendingMachine.scala 136:22]
      node _selReg_T_1 = tail(_selReg_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 136:22]
      selReg <= _selReg_T_1 @[\\src\\main\\scala\\VendingMachine.scala 136:12]
    node _blinkDuringAlarm_T = eq(stateReg, UInt<2>("h2")) @[\\src\\main\\scala\\VendingMachine.scala 139:36]
    node _blinkDuringAlarm_T_1 = eq(blinkReg, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 139:50]
    node blinkDuringAlarm = and(_blinkDuringAlarm_T, _blinkDuringAlarm_T_1) @[\\src\\main\\scala\\VendingMachine.scala 139:47]
    node _T_22 = eq(UInt<1>("h0"), selReg) @[\\src\\main\\scala\\VendingMachine.scala 141:18]
    when _T_22 : @[\\src\\main\\scala\\VendingMachine.scala 141:18]
      node _activeDigit_T = mux(blinkDuringAlarm, UInt<4>("hf"), UInt<3>("h7")) @[\\src\\main\\scala\\VendingMachine.scala 143:25]
      activeDigit <= _activeDigit_T @[\\src\\main\\scala\\VendingMachine.scala 143:19]
      sevSegDecoder.io.in <= tensDigit @[\\src\\main\\scala\\VendingMachine.scala 144:27]
    else :
      node _T_23 = eq(UInt<1>("h1"), selReg) @[\\src\\main\\scala\\VendingMachine.scala 141:18]
      when _T_23 : @[\\src\\main\\scala\\VendingMachine.scala 141:18]
        node _activeDigit_T_1 = mux(blinkDuringAlarm, UInt<4>("hf"), UInt<4>("hb")) @[\\src\\main\\scala\\VendingMachine.scala 147:25]
        activeDigit <= _activeDigit_T_1 @[\\src\\main\\scala\\VendingMachine.scala 147:19]
        sevSegDecoder.io.in <= onesDigit @[\\src\\main\\scala\\VendingMachine.scala 148:27]
      else :
        node _T_24 = eq(UInt<2>("h2"), selReg) @[\\src\\main\\scala\\VendingMachine.scala 141:18]
        when _T_24 : @[\\src\\main\\scala\\VendingMachine.scala 141:18]
          activeDigit <= UInt<4>("hd") @[\\src\\main\\scala\\VendingMachine.scala 151:19]
          sevSegDecoder.io.in <= priceTens @[\\src\\main\\scala\\VendingMachine.scala 152:27]
        else :
          node _T_25 = eq(UInt<2>("h3"), selReg) @[\\src\\main\\scala\\VendingMachine.scala 141:18]
          when _T_25 : @[\\src\\main\\scala\\VendingMachine.scala 141:18]
            activeDigit <= UInt<4>("he") @[\\src\\main\\scala\\VendingMachine.scala 155:19]
            sevSegDecoder.io.in <= priceOnes @[\\src\\main\\scala\\VendingMachine.scala 156:27]
    node _io_seg_T = not(sevSegDecoder.io.out) @[\\src\\main\\scala\\VendingMachine.scala 163:13]
    io.seg <= _io_seg_T @[\\src\\main\\scala\\VendingMachine.scala 163:10]
    io.an <= activeDigit @[\\src\\main\\scala\\VendingMachine.scala 164:10]
    node _io_releaseCan_T = eq(stateReg, UInt<2>("h1")) @[\\src\\main\\scala\\VendingMachine.scala 165:30]
    io.releaseCan <= _io_releaseCan_T @[\\src\\main\\scala\\VendingMachine.scala 165:17]
    node _io_alarm_T = eq(stateReg, UInt<2>("h2")) @[\\src\\main\\scala\\VendingMachine.scala 166:25]
    node _io_alarm_T_1 = and(_io_alarm_T, blinkReg) @[\\src\\main\\scala\\VendingMachine.scala 166:36]
    io.alarm <= _io_alarm_T_1 @[\\src\\main\\scala\\VendingMachine.scala 166:12]

