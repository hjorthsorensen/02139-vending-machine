module SevenSegDec(
  input  [3:0] io_in, // @[src/main/scala/SevenSegDec.scala 5:14]
  output [6:0] io_out // @[src/main/scala/SevenSegDec.scala 5:14]
);
  wire [6:0] _GEN_0 = 4'hf == io_in ? 7'h71 : 7'h0; // @[src/main/scala/SevenSegDec.scala 14:17 30:24 10:27]
  wire [6:0] _GEN_1 = 4'he == io_in ? 7'h79 : _GEN_0; // @[src/main/scala/SevenSegDec.scala 14:17 29:24]
  wire [6:0] _GEN_2 = 4'hd == io_in ? 7'h5e : _GEN_1; // @[src/main/scala/SevenSegDec.scala 14:17 28:24]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h39 : _GEN_2; // @[src/main/scala/SevenSegDec.scala 14:17 27:24]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h7c : _GEN_3; // @[src/main/scala/SevenSegDec.scala 14:17 26:24]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h77 : _GEN_4; // @[src/main/scala/SevenSegDec.scala 14:17 25:24]
  wire [6:0] _GEN_6 = 4'h9 == io_in ? 7'h6f : _GEN_5; // @[src/main/scala/SevenSegDec.scala 14:17 24:23]
  wire [6:0] _GEN_7 = 4'h8 == io_in ? 7'h7f : _GEN_6; // @[src/main/scala/SevenSegDec.scala 14:17 23:23]
  wire [6:0] _GEN_8 = 4'h7 == io_in ? 7'h7 : _GEN_7; // @[src/main/scala/SevenSegDec.scala 14:17 22:23]
  wire [6:0] _GEN_9 = 4'h6 == io_in ? 7'h7d : _GEN_8; // @[src/main/scala/SevenSegDec.scala 14:17 21:23]
  wire [6:0] _GEN_10 = 4'h5 == io_in ? 7'h6d : _GEN_9; // @[src/main/scala/SevenSegDec.scala 14:17 20:23]
  wire [6:0] _GEN_11 = 4'h4 == io_in ? 7'h66 : _GEN_10; // @[src/main/scala/SevenSegDec.scala 14:17 19:23]
  wire [6:0] _GEN_12 = 4'h3 == io_in ? 7'h4f : _GEN_11; // @[src/main/scala/SevenSegDec.scala 14:17 18:23]
  wire [6:0] _GEN_13 = 4'h2 == io_in ? 7'h5b : _GEN_12; // @[src/main/scala/SevenSegDec.scala 14:17 17:23]
  wire [6:0] _GEN_14 = 4'h1 == io_in ? 7'h6 : _GEN_13; // @[src/main/scala/SevenSegDec.scala 14:17 16:23]
  assign io_out = 4'h0 == io_in ? 7'h3f : _GEN_14; // @[src/main/scala/SevenSegDec.scala 14:17 15:23]
endmodule
module VendingFSM(
  input        clock,
  input        reset,
  input        io_coin2Edge, // @[src/main/scala/VendingFSM.scala 5:14]
  input        io_coin5Edge, // @[src/main/scala/VendingFSM.scala 5:14]
  input        io_buyEdge, // @[src/main/scala/VendingFSM.scala 5:14]
  input        io_buy, // @[src/main/scala/VendingFSM.scala 5:14]
  input        io_coin2, // @[src/main/scala/VendingFSM.scala 5:14]
  input        io_coin5, // @[src/main/scala/VendingFSM.scala 5:14]
  input  [7:0] io_totalMoney, // @[src/main/scala/VendingFSM.scala 5:14]
  input  [7:0] io_itemPrice, // @[src/main/scala/VendingFSM.scala 5:14]
  input        io_inpCoinBeingRej, // @[src/main/scala/VendingFSM.scala 5:14]
  output       io_signalCoin2, // @[src/main/scala/VendingFSM.scala 5:14]
  output       io_signalCoin5, // @[src/main/scala/VendingFSM.scala 5:14]
  output       io_signalSub, // @[src/main/scala/VendingFSM.scala 5:14]
  output       io_releaseCan, // @[src/main/scala/VendingFSM.scala 5:14]
  output       io_alarm, // @[src/main/scala/VendingFSM.scala 5:14]
  output       io_coinBeingRejected // @[src/main/scala/VendingFSM.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[src/main/scala/VendingFSM.scala 28:25]
  wire  _GEN_2 = io_coin2Edge ? 1'h0 : io_coin5Edge; // @[src/main/scala/VendingFSM.scala 31:18 39:26]
  wire  _T_1 = io_totalMoney >= io_itemPrice; // @[src/main/scala/VendingFSM.scala 46:28]
  wire [1:0] _GEN_4 = io_totalMoney >= io_itemPrice ? 2'h1 : 2'h3; // @[src/main/scala/VendingFSM.scala 46:45 48:20 50:20]
  wire  _GEN_5 = io_buyEdge & _T_1; // @[src/main/scala/VendingFSM.scala 32:18 45:24]
  wire  _T_4 = ~io_coin2; // @[src/main/scala/VendingFSM.scala 64:12]
  wire  _T_5 = ~io_coin5; // @[src/main/scala/VendingFSM.scala 64:25]
  wire [1:0] _GEN_8 = ~io_coin2 & ~io_coin5 ? 2'h0 : stateReg; // @[src/main/scala/VendingFSM.scala 64:36 65:18 28:25]
  wire [1:0] _GEN_9 = ~io_buy & _T_4 & _T_5 ? 2'h0 : stateReg; // @[src/main/scala/VendingFSM.scala 69:47 70:18 28:25]
  wire [1:0] _GEN_10 = 2'h3 == stateReg ? _GEN_9 : stateReg; // @[src/main/scala/VendingFSM.scala 37:20 28:25]
  assign io_signalCoin2 = 2'h0 == stateReg & io_coin2Edge; // @[src/main/scala/VendingFSM.scala 30:18 37:20]
  assign io_signalCoin5 = 2'h0 == stateReg & _GEN_2; // @[src/main/scala/VendingFSM.scala 31:18 37:20]
  assign io_signalSub = 2'h0 == stateReg & _GEN_5; // @[src/main/scala/VendingFSM.scala 32:18 37:20]
  assign io_releaseCan = stateReg == 2'h1; // @[src/main/scala/VendingFSM.scala 76:30]
  assign io_alarm = stateReg == 2'h3; // @[src/main/scala/VendingFSM.scala 77:30]
  assign io_coinBeingRejected = stateReg == 2'h2; // @[src/main/scala/VendingFSM.scala 78:37]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/VendingFSM.scala 28:25]
      stateReg <= 2'h0; // @[src/main/scala/VendingFSM.scala 28:25]
    end else if (2'h0 == stateReg) begin // @[src/main/scala/VendingFSM.scala 37:20]
      if (io_inpCoinBeingRej) begin // @[src/main/scala/VendingFSM.scala 54:32]
        stateReg <= 2'h2; // @[src/main/scala/VendingFSM.scala 55:18]
      end else if (io_buyEdge) begin // @[src/main/scala/VendingFSM.scala 45:24]
        stateReg <= _GEN_4;
      end
    end else if (2'h1 == stateReg) begin // @[src/main/scala/VendingFSM.scala 37:20]
      if (io_buy) begin // @[src/main/scala/VendingFSM.scala 60:22]
        stateReg <= 2'h1;
      end else begin
        stateReg <= 2'h0;
      end
    end else if (2'h2 == stateReg) begin // @[src/main/scala/VendingFSM.scala 37:20]
      stateReg <= _GEN_8;
    end else begin
      stateReg <= _GEN_10;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module VendingMachine(
  input        clock,
  input        reset,
  input  [4:0] io_price, // @[src/main/scala/VendingMachine.scala 5:14]
  input        io_coin2, // @[src/main/scala/VendingMachine.scala 5:14]
  input        io_coin5, // @[src/main/scala/VendingMachine.scala 5:14]
  input        io_buy, // @[src/main/scala/VendingMachine.scala 5:14]
  output       io_releaseCan, // @[src/main/scala/VendingMachine.scala 5:14]
  output       io_alarm, // @[src/main/scala/VendingMachine.scala 5:14]
  output       io_rejectCoinLED, // @[src/main/scala/VendingMachine.scala 5:14]
  output [6:0] io_seg, // @[src/main/scala/VendingMachine.scala 5:14]
  output [3:0] io_an // @[src/main/scala/VendingMachine.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] sevSegDecoder_io_in; // @[src/main/scala/VendingMachine.scala 59:29]
  wire [6:0] sevSegDecoder_io_out; // @[src/main/scala/VendingMachine.scala 59:29]
  wire  fsm_clock; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_reset; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_coin2Edge; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_coin5Edge; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_buyEdge; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_buy; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_coin2; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_coin5; // @[src/main/scala/VendingMachine.scala 66:19]
  wire [7:0] fsm_io_totalMoney; // @[src/main/scala/VendingMachine.scala 66:19]
  wire [7:0] fsm_io_itemPrice; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_inpCoinBeingRej; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_signalCoin2; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_signalCoin5; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_signalSub; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_releaseCan; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_alarm; // @[src/main/scala/VendingMachine.scala 66:19]
  wire  fsm_io_coinBeingRejected; // @[src/main/scala/VendingMachine.scala 66:19]
  reg [7:0] totalMoney; // @[src/main/scala/VendingMachine.scala 19:27]
  wire [7:0] _GEN_19 = totalMoney % 8'ha; // @[src/main/scala/VendingMachine.scala 20:30]
  wire [3:0] onesDigit = _GEN_19[3:0]; // @[src/main/scala/VendingMachine.scala 20:30]
  wire [7:0] _tensDigit_T = totalMoney / 4'ha; // @[src/main/scala/VendingMachine.scala 21:31]
  wire [7:0] _GEN_28 = _tensDigit_T % 8'ha; // @[src/main/scala/VendingMachine.scala 21:39]
  wire [3:0] tensDigit = _GEN_28[3:0]; // @[src/main/scala/VendingMachine.scala 21:39]
  wire [4:0] _GEN_0 = 5'h9 == io_price ? 5'h11 : 5'h0; // @[src/main/scala/VendingMachine.scala 27:13 28:20 37:25]
  wire [4:0] _GEN_1 = 5'h8 == io_price ? 5'ha : _GEN_0; // @[src/main/scala/VendingMachine.scala 28:20 36:25]
  wire [4:0] _GEN_2 = 5'h7 == io_price ? 5'he : _GEN_1; // @[src/main/scala/VendingMachine.scala 28:20 35:25]
  wire [4:0] _GEN_3 = 5'h6 == io_price ? 5'h14 : _GEN_2; // @[src/main/scala/VendingMachine.scala 28:20 34:25]
  wire [4:0] _GEN_4 = 5'h5 == io_price ? 5'h12 : _GEN_3; // @[src/main/scala/VendingMachine.scala 28:20 33:25]
  wire [4:0] _GEN_5 = 5'h4 == io_price ? 5'h11 : _GEN_4; // @[src/main/scala/VendingMachine.scala 28:20 32:25]
  wire [4:0] _GEN_6 = 5'h3 == io_price ? 5'h7 : _GEN_5; // @[src/main/scala/VendingMachine.scala 28:20 31:25]
  wire [4:0] _GEN_7 = 5'h2 == io_price ? 5'h4 : _GEN_6; // @[src/main/scala/VendingMachine.scala 28:20 30:25]
  wire [4:0] _GEN_8 = 5'h1 == io_price ? 5'h4 : _GEN_7; // @[src/main/scala/VendingMachine.scala 28:20 29:25]
  wire [7:0] itemPrice = {{3'd0}, _GEN_8}; // @[src/main/scala/VendingMachine.scala 26:23]
  wire [7:0] _GEN_29 = itemPrice % 8'ha; // @[src/main/scala/VendingMachine.scala 40:29]
  wire [3:0] priceOnes = _GEN_29[3:0]; // @[src/main/scala/VendingMachine.scala 40:29]
  wire [7:0] _priceTens_T = itemPrice / 4'ha; // @[src/main/scala/VendingMachine.scala 41:30]
  wire [7:0] _GEN_30 = _priceTens_T % 8'ha; // @[src/main/scala/VendingMachine.scala 41:38]
  wire [3:0] priceTens = _GEN_30[3:0]; // @[src/main/scala/VendingMachine.scala 41:38]
  reg [31:0] blinkCounter; // @[src/main/scala/VendingMachine.scala 46:29]
  reg  blinkReg; // @[src/main/scala/VendingMachine.scala 47:25]
  reg [31:0] cntReg; // @[src/main/scala/VendingMachine.scala 50:23]
  reg [1:0] selReg; // @[src/main/scala/VendingMachine.scala 51:23]
  reg  coin2Edge_REG; // @[src/main/scala/VendingMachine.scala 54:39]
  reg  coin5Edge_REG; // @[src/main/scala/VendingMachine.scala 55:39]
  reg  buyEdge_REG; // @[src/main/scala/VendingMachine.scala 56:39]
  wire [31:0] _blinkCounter_T_1 = blinkCounter + 32'h1; // @[src/main/scala/VendingMachine.scala 80:32]
  wire  _blinkReg_T = ~blinkReg; // @[src/main/scala/VendingMachine.scala 83:17]
  wire [7:0] _totalMoney_T_1 = totalMoney + 8'h2; // @[src/main/scala/VendingMachine.scala 89:32]
  wire  _GEN_12 = totalMoney <= 8'h61 ? 1'h0 : 1'h1; // @[src/main/scala/VendingMachine.scala 75:26 88:30 91:30]
  wire [7:0] _totalMoney_T_3 = totalMoney + 8'h5; // @[src/main/scala/VendingMachine.scala 95:32]
  wire  _GEN_14 = totalMoney <= 8'h5e ? 1'h0 : 1'h1; // @[src/main/scala/VendingMachine.scala 75:26 94:30 97:30]
  wire [7:0] _totalMoney_T_5 = totalMoney - itemPrice; // @[src/main/scala/VendingMachine.scala 100:30]
  wire  _GEN_17 = fsm_io_signalCoin5 & _GEN_14; // @[src/main/scala/VendingMachine.scala 75:26 93:35]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[src/main/scala/VendingMachine.scala 104:20]
  wire [1:0] _selReg_T_1 = selReg + 2'h1; // @[src/main/scala/VendingMachine.scala 107:22]
  wire  blinkDuringAlarm = fsm_io_alarm & _blinkReg_T; // @[src/main/scala/VendingMachine.scala 110:39]
  wire [3:0] _activeDigit_T = blinkDuringAlarm ? 4'hf : 4'h7; // @[src/main/scala/VendingMachine.scala 114:25]
  wire [3:0] _activeDigit_T_1 = blinkDuringAlarm ? 4'hf : 4'hb; // @[src/main/scala/VendingMachine.scala 118:25]
  wire [3:0] _GEN_22 = 2'h3 == selReg ? 4'he : 4'hf; // @[src/main/scala/VendingMachine.scala 112:18 126:19 60:32]
  wire [3:0] _GEN_23 = 2'h3 == selReg ? priceOnes : 4'h0; // @[src/main/scala/VendingMachine.scala 112:18 127:27 61:23]
  wire [3:0] _GEN_24 = 2'h2 == selReg ? 4'hd : _GEN_22; // @[src/main/scala/VendingMachine.scala 112:18 122:19]
  wire [3:0] _GEN_25 = 2'h2 == selReg ? priceTens : _GEN_23; // @[src/main/scala/VendingMachine.scala 112:18 123:27]
  wire [3:0] _GEN_26 = 2'h1 == selReg ? _activeDigit_T_1 : _GEN_24; // @[src/main/scala/VendingMachine.scala 112:18 118:19]
  wire [3:0] _GEN_27 = 2'h1 == selReg ? onesDigit : _GEN_25; // @[src/main/scala/VendingMachine.scala 112:18 119:27]
  SevenSegDec sevSegDecoder ( // @[src/main/scala/VendingMachine.scala 59:29]
    .io_in(sevSegDecoder_io_in),
    .io_out(sevSegDecoder_io_out)
  );
  VendingFSM fsm ( // @[src/main/scala/VendingMachine.scala 66:19]
    .clock(fsm_clock),
    .reset(fsm_reset),
    .io_coin2Edge(fsm_io_coin2Edge),
    .io_coin5Edge(fsm_io_coin5Edge),
    .io_buyEdge(fsm_io_buyEdge),
    .io_buy(fsm_io_buy),
    .io_coin2(fsm_io_coin2),
    .io_coin5(fsm_io_coin5),
    .io_totalMoney(fsm_io_totalMoney),
    .io_itemPrice(fsm_io_itemPrice),
    .io_inpCoinBeingRej(fsm_io_inpCoinBeingRej),
    .io_signalCoin2(fsm_io_signalCoin2),
    .io_signalCoin5(fsm_io_signalCoin5),
    .io_signalSub(fsm_io_signalSub),
    .io_releaseCan(fsm_io_releaseCan),
    .io_alarm(fsm_io_alarm),
    .io_coinBeingRejected(fsm_io_coinBeingRejected)
  );
  assign io_releaseCan = fsm_io_releaseCan; // @[src/main/scala/VendingMachine.scala 136:17]
  assign io_alarm = fsm_io_alarm & blinkReg; // @[src/main/scala/VendingMachine.scala 137:28]
  assign io_rejectCoinLED = fsm_io_coinBeingRejected & blinkReg; // @[src/main/scala/VendingMachine.scala 138:48]
  assign io_seg = ~sevSegDecoder_io_out; // @[src/main/scala/VendingMachine.scala 134:13]
  assign io_an = 2'h0 == selReg ? _activeDigit_T : _GEN_26; // @[src/main/scala/VendingMachine.scala 112:18 114:19]
  assign sevSegDecoder_io_in = 2'h0 == selReg ? tensDigit : _GEN_27; // @[src/main/scala/VendingMachine.scala 112:18 115:27]
  assign fsm_clock = clock;
  assign fsm_reset = reset;
  assign fsm_io_coin2Edge = io_coin2 & ~coin2Edge_REG; // @[src/main/scala/VendingMachine.scala 54:28]
  assign fsm_io_coin5Edge = io_coin5 & ~coin5Edge_REG; // @[src/main/scala/VendingMachine.scala 55:28]
  assign fsm_io_buyEdge = io_buy & ~buyEdge_REG; // @[src/main/scala/VendingMachine.scala 56:28]
  assign fsm_io_buy = io_buy; // @[src/main/scala/VendingMachine.scala 70:20]
  assign fsm_io_coin2 = io_coin2; // @[src/main/scala/VendingMachine.scala 71:20]
  assign fsm_io_coin5 = io_coin5; // @[src/main/scala/VendingMachine.scala 72:20]
  assign fsm_io_totalMoney = totalMoney; // @[src/main/scala/VendingMachine.scala 73:21]
  assign fsm_io_itemPrice = {{3'd0}, _GEN_8}; // @[src/main/scala/VendingMachine.scala 26:23]
  assign fsm_io_inpCoinBeingRej = fsm_io_signalCoin2 ? _GEN_12 : _GEN_17; // @[src/main/scala/VendingMachine.scala 87:28]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/VendingMachine.scala 19:27]
      totalMoney <= 8'h0; // @[src/main/scala/VendingMachine.scala 19:27]
    end else if (fsm_io_signalCoin2) begin // @[src/main/scala/VendingMachine.scala 87:28]
      if (totalMoney <= 8'h61) begin // @[src/main/scala/VendingMachine.scala 88:30]
        totalMoney <= _totalMoney_T_1; // @[src/main/scala/VendingMachine.scala 89:18]
      end
    end else if (fsm_io_signalCoin5) begin // @[src/main/scala/VendingMachine.scala 93:35]
      if (totalMoney <= 8'h5e) begin // @[src/main/scala/VendingMachine.scala 94:30]
        totalMoney <= _totalMoney_T_3; // @[src/main/scala/VendingMachine.scala 95:18]
      end
    end else if (fsm_io_signalSub) begin // @[src/main/scala/VendingMachine.scala 99:33]
      totalMoney <= _totalMoney_T_5; // @[src/main/scala/VendingMachine.scala 100:16]
    end
    if (reset) begin // @[src/main/scala/VendingMachine.scala 46:29]
      blinkCounter <= 32'h0; // @[src/main/scala/VendingMachine.scala 46:29]
    end else if (blinkCounter == 32'h17d7840) begin // @[src/main/scala/VendingMachine.scala 81:36]
      blinkCounter <= 32'h0; // @[src/main/scala/VendingMachine.scala 82:18]
    end else begin
      blinkCounter <= _blinkCounter_T_1; // @[src/main/scala/VendingMachine.scala 80:16]
    end
    if (reset) begin // @[src/main/scala/VendingMachine.scala 47:25]
      blinkReg <= 1'h0; // @[src/main/scala/VendingMachine.scala 47:25]
    end else if (blinkCounter == 32'h17d7840) begin // @[src/main/scala/VendingMachine.scala 81:36]
      blinkReg <= ~blinkReg; // @[src/main/scala/VendingMachine.scala 83:14]
    end
    if (reset) begin // @[src/main/scala/VendingMachine.scala 50:23]
      cntReg <= 32'h0; // @[src/main/scala/VendingMachine.scala 50:23]
    end else if (cntReg == 32'h1869f) begin // @[src/main/scala/VendingMachine.scala 105:27]
      cntReg <= 32'h0; // @[src/main/scala/VendingMachine.scala 106:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[src/main/scala/VendingMachine.scala 104:10]
    end
    if (reset) begin // @[src/main/scala/VendingMachine.scala 51:23]
      selReg <= 2'h0; // @[src/main/scala/VendingMachine.scala 51:23]
    end else if (cntReg == 32'h1869f) begin // @[src/main/scala/VendingMachine.scala 105:27]
      selReg <= _selReg_T_1; // @[src/main/scala/VendingMachine.scala 107:12]
    end
    coin2Edge_REG <= io_coin2; // @[src/main/scala/VendingMachine.scala 54:39]
    coin5Edge_REG <= io_coin5; // @[src/main/scala/VendingMachine.scala 55:39]
    buyEdge_REG <= io_buy; // @[src/main/scala/VendingMachine.scala 56:39]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  totalMoney = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  blinkCounter = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  blinkReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  selReg = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  coin2Edge_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  coin5Edge_REG = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  buyEdge_REG = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
