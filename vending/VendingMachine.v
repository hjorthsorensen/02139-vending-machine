module SevenSegDec(
  input  [3:0] io_in, // @[\\src\\main\\scala\\SevenSegDec.scala 5:14]
  output [6:0] io_out // @[\\src\\main\\scala\\SevenSegDec.scala 5:14]
);
  wire [6:0] _GEN_0 = 4'hf == io_in ? 7'h71 : 7'h0; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 30:24 10:27]
  wire [6:0] _GEN_1 = 4'he == io_in ? 7'h79 : _GEN_0; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 29:24]
  wire [6:0] _GEN_2 = 4'hd == io_in ? 7'h5e : _GEN_1; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 28:24]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h39 : _GEN_2; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 27:24]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h7c : _GEN_3; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 26:24]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h77 : _GEN_4; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 25:24]
  wire [6:0] _GEN_6 = 4'h9 == io_in ? 7'h6f : _GEN_5; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 24:23]
  wire [6:0] _GEN_7 = 4'h8 == io_in ? 7'h7f : _GEN_6; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 23:23]
  wire [6:0] _GEN_8 = 4'h7 == io_in ? 7'h7 : _GEN_7; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 22:23]
  wire [6:0] _GEN_9 = 4'h6 == io_in ? 7'h7d : _GEN_8; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 21:23]
  wire [6:0] _GEN_10 = 4'h5 == io_in ? 7'h6d : _GEN_9; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 20:23]
  wire [6:0] _GEN_11 = 4'h4 == io_in ? 7'h66 : _GEN_10; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 19:23]
  wire [6:0] _GEN_12 = 4'h3 == io_in ? 7'h4f : _GEN_11; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 18:23]
  wire [6:0] _GEN_13 = 4'h2 == io_in ? 7'h5b : _GEN_12; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 17:23]
  wire [6:0] _GEN_14 = 4'h1 == io_in ? 7'h6 : _GEN_13; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 16:23]
  assign io_out = 4'h0 == io_in ? 7'h3f : _GEN_14; // @[\\src\\main\\scala\\SevenSegDec.scala 14:17 15:23]
endmodule
module VendingFSM(
  input        clock,
  input        reset,
  input        io_coin2Edge, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  input        io_coin5Edge, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  input        io_buyEdge, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  input        io_buy, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  input        io_coin2, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  input        io_coin5, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  input  [7:0] io_totalMoney, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  input  [7:0] io_itemPrice, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  input        io_inpCoinBeingRej, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  output       io_signalCoin2, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  output       io_signalCoin5, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  output       io_signalSub, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  output       io_releaseCan, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  output       io_alarm, // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
  output       io_coinBeingRejected // @[\\src\\main\\scala\\VendingFSM.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[\\src\\main\\scala\\VendingFSM.scala 28:25]
  wire  _GEN_2 = io_coin2Edge ? 1'h0 : io_coin5Edge; // @[\\src\\main\\scala\\VendingFSM.scala 31:18 39:26]
  wire  _T_1 = io_totalMoney >= io_itemPrice; // @[\\src\\main\\scala\\VendingFSM.scala 46:28]
  wire [1:0] _GEN_4 = io_totalMoney >= io_itemPrice ? 2'h1 : 2'h3; // @[\\src\\main\\scala\\VendingFSM.scala 46:45 48:20 50:20]
  wire  _GEN_5 = io_buyEdge & _T_1; // @[\\src\\main\\scala\\VendingFSM.scala 32:18 45:24]
  wire  _T_4 = ~io_coin2; // @[\\src\\main\\scala\\VendingFSM.scala 64:12]
  wire  _T_5 = ~io_coin5; // @[\\src\\main\\scala\\VendingFSM.scala 64:25]
  wire [1:0] _GEN_8 = ~io_coin2 & ~io_coin5 ? 2'h0 : stateReg; // @[\\src\\main\\scala\\VendingFSM.scala 64:36 65:18 28:25]
  wire [1:0] _GEN_9 = ~io_buy & _T_4 & _T_5 ? 2'h0 : stateReg; // @[\\src\\main\\scala\\VendingFSM.scala 69:47 70:18 28:25]
  wire [1:0] _GEN_10 = 2'h3 == stateReg ? _GEN_9 : stateReg; // @[\\src\\main\\scala\\VendingFSM.scala 37:20 28:25]
  assign io_signalCoin2 = 2'h0 == stateReg & io_coin2Edge; // @[\\src\\main\\scala\\VendingFSM.scala 30:18 37:20]
  assign io_signalCoin5 = 2'h0 == stateReg & _GEN_2; // @[\\src\\main\\scala\\VendingFSM.scala 31:18 37:20]
  assign io_signalSub = 2'h0 == stateReg & _GEN_5; // @[\\src\\main\\scala\\VendingFSM.scala 32:18 37:20]
  assign io_releaseCan = stateReg == 2'h1; // @[\\src\\main\\scala\\VendingFSM.scala 76:30]
  assign io_alarm = stateReg == 2'h3; // @[\\src\\main\\scala\\VendingFSM.scala 77:30]
  assign io_coinBeingRejected = stateReg == 2'h2; // @[\\src\\main\\scala\\VendingFSM.scala 78:37]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\VendingFSM.scala 28:25]
      stateReg <= 2'h0; // @[\\src\\main\\scala\\VendingFSM.scala 28:25]
    end else if (2'h0 == stateReg) begin // @[\\src\\main\\scala\\VendingFSM.scala 37:20]
      if (io_inpCoinBeingRej) begin // @[\\src\\main\\scala\\VendingFSM.scala 54:32]
        stateReg <= 2'h2; // @[\\src\\main\\scala\\VendingFSM.scala 55:18]
      end else if (io_buyEdge) begin // @[\\src\\main\\scala\\VendingFSM.scala 45:24]
        stateReg <= _GEN_4;
      end
    end else if (2'h1 == stateReg) begin // @[\\src\\main\\scala\\VendingFSM.scala 37:20]
      if (io_buy) begin // @[\\src\\main\\scala\\VendingFSM.scala 60:22]
        stateReg <= 2'h1;
      end else begin
        stateReg <= 2'h0;
      end
    end else if (2'h2 == stateReg) begin // @[\\src\\main\\scala\\VendingFSM.scala 37:20]
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
  input  [4:0] io_price, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_coin2, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_coin5, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_buy, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_releaseCan, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_alarm, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_rejectCoinLED, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output [6:0] io_seg, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output [3:0] io_an // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
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
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] sevSegDecoder_io_in; // @[\\src\\main\\scala\\VendingMachine.scala 83:29]
  wire [6:0] sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 83:29]
  wire  fsm_clock; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_reset; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_coin2Edge; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_coin5Edge; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_buyEdge; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire [7:0] fsm_io_totalMoney; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire [7:0] fsm_io_itemPrice; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_inpCoinBeingRej; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_signalCoin2; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_signalCoin5; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_signalSub; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_releaseCan; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_alarm; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  wire  fsm_io_coinBeingRejected; // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
  reg [7:0] totalMoney; // @[\\src\\main\\scala\\VendingMachine.scala 20:27]
  wire [7:0] _GEN_26 = totalMoney % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 21:30]
  wire [3:0] onesDigit = _GEN_26[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 21:30]
  wire [7:0] _tensDigit_T = totalMoney / 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 22:31]
  wire [7:0] _GEN_46 = _tensDigit_T % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 22:39]
  wire [3:0] tensDigit = _GEN_46[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 22:39]
  wire [4:0] _GEN_0 = 5'h9 == io_price ? 5'h11 : 5'h0; // @[\\src\\main\\scala\\VendingMachine.scala 27:13 28:20 37:25]
  wire [4:0] _GEN_1 = 5'h8 == io_price ? 5'ha : _GEN_0; // @[\\src\\main\\scala\\VendingMachine.scala 28:20 36:25]
  wire [4:0] _GEN_2 = 5'h7 == io_price ? 5'he : _GEN_1; // @[\\src\\main\\scala\\VendingMachine.scala 28:20 35:25]
  wire [4:0] _GEN_3 = 5'h6 == io_price ? 5'h14 : _GEN_2; // @[\\src\\main\\scala\\VendingMachine.scala 28:20 34:25]
  wire [4:0] _GEN_4 = 5'h5 == io_price ? 5'h12 : _GEN_3; // @[\\src\\main\\scala\\VendingMachine.scala 28:20 33:25]
  wire [4:0] _GEN_5 = 5'h4 == io_price ? 5'h11 : _GEN_4; // @[\\src\\main\\scala\\VendingMachine.scala 28:20 32:25]
  wire [4:0] _GEN_6 = 5'h3 == io_price ? 5'h7 : _GEN_5; // @[\\src\\main\\scala\\VendingMachine.scala 28:20 31:25]
  wire [4:0] _GEN_7 = 5'h2 == io_price ? 5'h4 : _GEN_6; // @[\\src\\main\\scala\\VendingMachine.scala 28:20 30:25]
  wire [4:0] _GEN_8 = 5'h1 == io_price ? 5'h4 : _GEN_7; // @[\\src\\main\\scala\\VendingMachine.scala 28:20 29:25]
  wire [7:0] itemPrice = {{3'd0}, _GEN_8}; // @[\\src\\main\\scala\\VendingMachine.scala 26:23]
  wire [7:0] _GEN_47 = itemPrice % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 40:29]
  wire [3:0] priceOnes = _GEN_47[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 40:29]
  wire [7:0] _priceTens_T = itemPrice / 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 41:30]
  wire [7:0] _GEN_48 = _priceTens_T % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 41:38]
  wire [3:0] priceTens = _GEN_48[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 41:38]
  reg [31:0] blinkCounter; // @[\\src\\main\\scala\\VendingMachine.scala 46:29]
  reg  blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 47:25]
  reg [31:0] cntReg; // @[\\src\\main\\scala\\VendingMachine.scala 50:23]
  reg [1:0] selReg; // @[\\src\\main\\scala\\VendingMachine.scala 51:23]
  reg [5:0] coin2Count; // @[\\src\\main\\scala\\VendingMachine.scala 55:27]
  reg [5:0] coin5Count; // @[\\src\\main\\scala\\VendingMachine.scala 56:27]
  wire  coinFull = coin2Count >= 6'h3f | coin5Count >= 6'h3f; // @[\\src\\main\\scala\\VendingMachine.scala 57:37]
  reg [3:0] fullDisplayCount; // @[\\src\\main\\scala\\VendingMachine.scala 58:33]
  wire  showFull = fullDisplayCount > 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 59:35]
  reg  REG; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
  wire  _T_10 = io_coin2 & ~REG; // @[\\src\\main\\scala\\VendingMachine.scala 77:47]
  reg  REG_1; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
  wire  _T_13 = io_coin5 & ~REG_1; // @[\\src\\main\\scala\\VendingMachine.scala 77:47]
  reg  REG_2; // @[\\src\\main\\scala\\VendingMachine.scala 64:28]
  wire [3:0] _fullDisplayCount_T_1 = fullDisplayCount - 4'h1; // @[\\src\\main\\scala\\VendingMachine.scala 65:42]
  reg [4:0] canCount; // @[\\src\\main\\scala\\VendingMachine.scala 70:25]
  wire  canEmpty = canCount == 5'h0; // @[\\src\\main\\scala\\VendingMachine.scala 71:27]
  reg  buyFallingEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 72:42]
  wire  buyFallingEdge = ~io_buy & buyFallingEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 72:32]
  reg  coin2Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
  wire  _coin2Edge_T_1 = io_coin2 & ~coin2Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 77:47]
  wire  _coin2Edge_T_2 = ~canEmpty; // @[\\src\\main\\scala\\VendingMachine.scala 78:43]
  wire  _coin2Edge_T_4 = ~coinFull; // @[\\src\\main\\scala\\VendingMachine.scala 78:56]
  reg  coin5Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
  wire  _coin5Edge_T_1 = io_coin5 & ~coin5Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 77:47]
  reg  buyEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
  wire  _buyEdge_T_1 = io_buy & ~buyEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 77:47]
  reg [31:0] rejectCounter; // @[\\src\\main\\scala\\VendingMachine.scala 89:30]
  reg  rejectReg; // @[\\src\\main\\scala\\VendingMachine.scala 90:26]
  wire [31:0] _rejectCounter_T_1 = rejectCounter + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 92:34]
  wire [31:0] _blinkCounter_T_1 = blinkCounter + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 101:32]
  wire  _blinkReg_T = ~blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 104:17]
  wire  _T_21 = totalMoney <= 8'h61; // @[\\src\\main\\scala\\VendingMachine.scala 124:41]
  wire [5:0] _coin2Count_T_1 = coin2Count + 6'h1; // @[\\src\\main\\scala\\VendingMachine.scala 125:30]
  wire  _T_23 = totalMoney <= 8'h5e; // @[\\src\\main\\scala\\VendingMachine.scala 127:41]
  wire [5:0] _coin5Count_T_1 = coin5Count + 6'h1; // @[\\src\\main\\scala\\VendingMachine.scala 128:30]
  wire [4:0] _canCount_T_1 = canCount - 5'h1; // @[\\src\\main\\scala\\VendingMachine.scala 132:26]
  reg  fsm_io_inpCoinBeingRej_REG; // @[\\src\\main\\scala\\VendingMachine.scala 137:36]
  wire [7:0] _totalMoney_T_1 = totalMoney + 8'h2; // @[\\src\\main\\scala\\VendingMachine.scala 141:32]
  wire [7:0] _totalMoney_T_3 = totalMoney + 8'h5; // @[\\src\\main\\scala\\VendingMachine.scala 147:32]
  wire  _GEN_21 = _T_23 ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\VendingMachine.scala 146:30 136:31 149:18]
  wire [7:0] _totalMoney_T_5 = totalMoney - itemPrice; // @[\\src\\main\\scala\\VendingMachine.scala 152:30]
  wire  _GEN_24 = fsm_io_signalCoin5 & _GEN_21; // @[\\src\\main\\scala\\VendingMachine.scala 136:31 145:35]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 156:20]
  wire [1:0] _selReg_T_1 = selReg + 2'h1; // @[\\src\\main\\scala\\VendingMachine.scala 159:22]
  wire  blinkDuringAlarm = fsm_io_alarm & _blinkReg_T; // @[\\src\\main\\scala\\VendingMachine.scala 173:40]
  wire [3:0] _activeDigit_T = blinkDuringAlarm ? 4'hf : 4'h7; // @[\\src\\main\\scala\\VendingMachine.scala 178:25]
  wire [6:0] _GEN_29 = canEmpty ? 7'h79 : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 180:22 175:27 180:30]
  wire [6:0] _GEN_30 = showFull ? 7'h71 : _GEN_29; // @[\\src\\main\\scala\\VendingMachine.scala 181:{22,30}]
  wire [3:0] _activeDigit_T_1 = blinkDuringAlarm ? 4'hf : 4'hb; // @[\\src\\main\\scala\\VendingMachine.scala 184:25]
  wire [6:0] _GEN_31 = canEmpty ? 7'h73 : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 186:22 175:27 186:30]
  wire [6:0] _GEN_32 = showFull ? 7'h3e : _GEN_31; // @[\\src\\main\\scala\\VendingMachine.scala 187:{22,30}]
  wire [6:0] _GEN_33 = canEmpty ? 7'h78 : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 192:22 175:27 192:30]
  wire [6:0] _GEN_34 = showFull ? 7'h38 : _GEN_33; // @[\\src\\main\\scala\\VendingMachine.scala 193:{22,30}]
  wire [6:0] _GEN_35 = canEmpty ? 7'h6e : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 198:22 175:27 198:30]
  wire [6:0] _GEN_36 = showFull ? 7'h38 : _GEN_35; // @[\\src\\main\\scala\\VendingMachine.scala 199:{22,30}]
  wire [3:0] _GEN_37 = 2'h3 == selReg ? 4'he : 4'hf; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 196:19 84:32]
  wire [3:0] _GEN_38 = 2'h3 == selReg ? priceOnes : 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 197:27 85:23]
  wire [6:0] _GEN_39 = 2'h3 == selReg ? _GEN_36 : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 175:27]
  wire [3:0] _GEN_40 = 2'h2 == selReg ? 4'hd : _GEN_37; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 190:19]
  wire [3:0] _GEN_41 = 2'h2 == selReg ? priceTens : _GEN_38; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 191:27]
  wire [6:0] _GEN_42 = 2'h2 == selReg ? _GEN_34 : _GEN_39; // @[\\src\\main\\scala\\VendingMachine.scala 176:18]
  wire [3:0] _GEN_43 = 2'h1 == selReg ? _activeDigit_T_1 : _GEN_40; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 184:19]
  wire [3:0] _GEN_44 = 2'h1 == selReg ? onesDigit : _GEN_41; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 185:27]
  wire [6:0] _GEN_45 = 2'h1 == selReg ? _GEN_32 : _GEN_42; // @[\\src\\main\\scala\\VendingMachine.scala 176:18]
  wire [6:0] segOut = 2'h0 == selReg ? _GEN_30 : _GEN_45; // @[\\src\\main\\scala\\VendingMachine.scala 176:18]
  SevenSegDec sevSegDecoder ( // @[\\src\\main\\scala\\VendingMachine.scala 83:29]
    .io_in(sevSegDecoder_io_in),
    .io_out(sevSegDecoder_io_out)
  );
  VendingFSM fsm ( // @[\\src\\main\\scala\\VendingMachine.scala 110:19]
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
  assign io_releaseCan = fsm_io_releaseCan & _coin2Edge_T_2; // @[\\src\\main\\scala\\VendingMachine.scala 208:38]
  assign io_alarm = fsm_io_alarm & blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 209:28]
  assign io_rejectCoinLED = (fsm_io_coinBeingRejected | showFull) & rejectReg; // @[\\src\\main\\scala\\VendingMachine.scala 210:62]
  assign io_seg = ~segOut; // @[\\src\\main\\scala\\VendingMachine.scala 206:13]
  assign io_an = 2'h0 == selReg ? _activeDigit_T : _GEN_43; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 178:19]
  assign sevSegDecoder_io_in = 2'h0 == selReg ? tensDigit : _GEN_44; // @[\\src\\main\\scala\\VendingMachine.scala 176:18 179:27]
  assign fsm_clock = clock;
  assign fsm_reset = reset;
  assign fsm_io_coin2Edge = _coin2Edge_T_1 & ~canEmpty & ~coinFull; // @[\\src\\main\\scala\\VendingMachine.scala 78:53]
  assign fsm_io_coin5Edge = _coin5Edge_T_1 & _coin2Edge_T_2 & _coin2Edge_T_4; // @[\\src\\main\\scala\\VendingMachine.scala 79:53]
  assign fsm_io_buyEdge = _buyEdge_T_1 & _coin2Edge_T_2; // @[\\src\\main\\scala\\VendingMachine.scala 80:38]
  assign fsm_io_buy = io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 114:20]
  assign fsm_io_coin2 = io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 115:20]
  assign fsm_io_coin5 = io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 116:20]
  assign fsm_io_totalMoney = totalMoney; // @[\\src\\main\\scala\\VendingMachine.scala 117:21]
  assign fsm_io_itemPrice = {{3'd0}, _GEN_8}; // @[\\src\\main\\scala\\VendingMachine.scala 26:23]
  assign fsm_io_inpCoinBeingRej = fsm_io_inpCoinBeingRej_REG; // @[\\src\\main\\scala\\VendingMachine.scala 137:26]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 20:27]
      totalMoney <= 8'h0; // @[\\src\\main\\scala\\VendingMachine.scala 20:27]
    end else if (fsm_io_signalCoin2) begin // @[\\src\\main\\scala\\VendingMachine.scala 139:28]
      if (_T_21) begin // @[\\src\\main\\scala\\VendingMachine.scala 140:30]
        totalMoney <= _totalMoney_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 141:18]
      end
    end else if (fsm_io_signalCoin5) begin // @[\\src\\main\\scala\\VendingMachine.scala 145:35]
      if (_T_23) begin // @[\\src\\main\\scala\\VendingMachine.scala 146:30]
        totalMoney <= _totalMoney_T_3; // @[\\src\\main\\scala\\VendingMachine.scala 147:18]
      end
    end else if (fsm_io_signalSub) begin // @[\\src\\main\\scala\\VendingMachine.scala 151:33]
      totalMoney <= _totalMoney_T_5; // @[\\src\\main\\scala\\VendingMachine.scala 152:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 46:29]
      blinkCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 46:29]
    end else if (blinkCounter == 32'h17d7840) begin // @[\\src\\main\\scala\\VendingMachine.scala 102:36]
      blinkCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 103:18]
    end else begin
      blinkCounter <= _blinkCounter_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 101:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 47:25]
      blinkReg <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 47:25]
    end else if (blinkCounter == 32'h17d7840) begin // @[\\src\\main\\scala\\VendingMachine.scala 102:36]
      blinkReg <= ~blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 104:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 50:23]
      cntReg <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 50:23]
    end else if (cntReg == 32'h1869f) begin // @[\\src\\main\\scala\\VendingMachine.scala 157:27]
      cntReg <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 158:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 156:10]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 51:23]
      selReg <= 2'h0; // @[\\src\\main\\scala\\VendingMachine.scala 51:23]
    end else if (cntReg == 32'h1869f) begin // @[\\src\\main\\scala\\VendingMachine.scala 157:27]
      selReg <= _selReg_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 159:12]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 55:27]
      coin2Count <= 6'h0; // @[\\src\\main\\scala\\VendingMachine.scala 55:27]
    end else if (fsm_io_signalCoin2 & totalMoney <= 8'h61) begin // @[\\src\\main\\scala\\VendingMachine.scala 124:50]
      coin2Count <= _coin2Count_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 125:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 56:27]
      coin5Count <= 6'h0; // @[\\src\\main\\scala\\VendingMachine.scala 56:27]
    end else if (fsm_io_signalCoin5 & totalMoney <= 8'h5e) begin // @[\\src\\main\\scala\\VendingMachine.scala 127:50]
      coin5Count <= _coin5Count_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 128:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 58:33]
      fullDisplayCount <= 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 58:33]
    end else if (blinkReg & ~REG_2 & showFull) begin // @[\\src\\main\\scala\\VendingMachine.scala 64:52]
      fullDisplayCount <= _fullDisplayCount_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 65:22]
    end else if (_T_10 & coinFull | _T_13 & coinFull) begin // @[\\src\\main\\scala\\VendingMachine.scala 61:82]
      fullDisplayCount <= 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 62:22]
    end
    REG <= io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
    REG_1 <= io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
    REG_2 <= blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 64:28]
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 70:25]
      canCount <= 5'h14; // @[\\src\\main\\scala\\VendingMachine.scala 70:25]
    end else if (buyFallingEdge & fsm_io_releaseCan & _coin2Edge_T_2) begin // @[\\src\\main\\scala\\VendingMachine.scala 131:58]
      canCount <= _canCount_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 132:14]
    end
    buyFallingEdge_REG <= io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 72:42]
    coin2Edge_REG <= io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
    coin5Edge_REG <= io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
    buyEdge_REG <= io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 77:58]
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 89:30]
      rejectCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 89:30]
    end else if (rejectCounter == 32'h5f5e10) begin // @[\\src\\main\\scala\\VendingMachine.scala 93:38]
      rejectCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 94:19]
    end else begin
      rejectCounter <= _rejectCounter_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 92:17]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 90:26]
      rejectReg <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 90:26]
    end else if (rejectCounter == 32'h5f5e10) begin // @[\\src\\main\\scala\\VendingMachine.scala 93:38]
      rejectReg <= ~rejectReg; // @[\\src\\main\\scala\\VendingMachine.scala 95:15]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 137:36]
      fsm_io_inpCoinBeingRej_REG <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 137:36]
    end else if (fsm_io_signalCoin2) begin // @[\\src\\main\\scala\\VendingMachine.scala 139:28]
      if (_T_21) begin // @[\\src\\main\\scala\\VendingMachine.scala 140:30]
        fsm_io_inpCoinBeingRej_REG <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 136:31]
      end else begin
        fsm_io_inpCoinBeingRej_REG <= 1'h1; // @[\\src\\main\\scala\\VendingMachine.scala 143:18]
      end
    end else begin
      fsm_io_inpCoinBeingRej_REG <= _GEN_24;
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
  coin2Count = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  coin5Count = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  fullDisplayCount = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  REG_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  REG_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  canCount = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  buyFallingEdge_REG = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  coin2Edge_REG = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  coin5Edge_REG = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  buyEdge_REG = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  rejectCounter = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  rejectReg = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  fsm_io_inpCoinBeingRej_REG = _RAND_18[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
