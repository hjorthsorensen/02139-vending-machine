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
module VendingMachine(
  input        clock,
  input        reset,
  input  [4:0] io_price, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_coin2, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_coin5, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_buy, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_releaseCan, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_alarm, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
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
`endif // RANDOMIZE_REG_INIT
  wire [3:0] sevSegDecoder_io_in; // @[\\src\\main\\scala\\VendingMachine.scala 41:29]
  wire [6:0] sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 41:29]
  reg [7:0] totalMoney; // @[\\src\\main\\scala\\VendingMachine.scala 18:27]
  wire [7:0] _GEN_2 = totalMoney % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 19:30]
  wire [3:0] onesDigit = _GEN_2[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 19:30]
  wire [7:0] _tensDigit_T = totalMoney / 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 20:31]
  wire [7:0] _GEN_3 = _tensDigit_T % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 20:39]
  wire [3:0] tensDigit = _GEN_3[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 20:39]
  wire [4:0] _GEN_5 = io_price % 5'ha; // @[\\src\\main\\scala\\VendingMachine.scala 22:28]
  wire [3:0] priceOnes = _GEN_5[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 22:28]
  wire [4:0] _priceTens_T = io_price / 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 23:29]
  wire [4:0] _GEN_13 = _priceTens_T % 5'ha; // @[\\src\\main\\scala\\VendingMachine.scala 23:37]
  wire [3:0] priceTens = _GEN_13[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 23:37]
  reg [31:0] blinkCounter; // @[\\src\\main\\scala\\VendingMachine.scala 28:29]
  reg  blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 29:25]
  reg [31:0] cntReg; // @[\\src\\main\\scala\\VendingMachine.scala 32:23]
  reg [1:0] selReg; // @[\\src\\main\\scala\\VendingMachine.scala 33:23]
  reg  coin2Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 36:39]
  wire  coin2Edge = io_coin2 & ~coin2Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 36:28]
  reg  coin5Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 37:39]
  wire  coin5Edge = io_coin5 & ~coin5Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 37:28]
  reg  buyEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 38:39]
  wire  buyEdge = io_buy & ~buyEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 38:28]
  reg [1:0] stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 51:25]
  wire [31:0] _blinkCounter_T_1 = blinkCounter + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 59:32]
  wire  _GEN_4 = coin2Edge ? 1'h0 : coin5Edge; // @[\\src\\main\\scala\\VendingMachine.scala 67:23 54:32]
  wire [7:0] _GEN_30 = {{3'd0}, io_price}; // @[\\src\\main\\scala\\VendingMachine.scala 74:25]
  wire  _T_2 = totalMoney >= _GEN_30; // @[\\src\\main\\scala\\VendingMachine.scala 74:25]
  wire  _GEN_7 = buyEdge & _T_2; // @[\\src\\main\\scala\\VendingMachine.scala 73:21 55:31]
  wire [1:0] _GEN_10 = ~io_buy ? 2'h0 : stateReg; // @[\\src\\main\\scala\\VendingMachine.scala 90:23 91:20 51:25]
  wire  signalCoin2 = 2'h0 == stateReg & coin2Edge; // @[\\src\\main\\scala\\VendingMachine.scala 65:20 53:32]
  wire  signalCoin5 = 2'h0 == stateReg & _GEN_4; // @[\\src\\main\\scala\\VendingMachine.scala 65:20 54:32]
  wire  signalSub = 2'h0 == stateReg & _GEN_7; // @[\\src\\main\\scala\\VendingMachine.scala 65:20 55:31]
  wire [7:0] _totalMoney_T_1 = totalMoney + 8'h2; // @[\\src\\main\\scala\\VendingMachine.scala 98:30]
  wire [7:0] _totalMoney_T_3 = totalMoney + 8'h5; // @[\\src\\main\\scala\\VendingMachine.scala 100:30]
  wire [7:0] _totalMoney_T_5 = totalMoney - _GEN_30; // @[\\src\\main\\scala\\VendingMachine.scala 102:30]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 106:20]
  wire [1:0] _selReg_T_1 = selReg + 2'h1; // @[\\src\\main\\scala\\VendingMachine.scala 109:22]
  wire [3:0] _GEN_22 = 2'h3 == selReg ? 4'he : 4'hf; // @[\\src\\main\\scala\\VendingMachine.scala 112:18 126:19 42:32]
  wire [3:0] _GEN_23 = 2'h3 == selReg ? priceOnes : 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 112:18 127:27 43:23]
  wire [3:0] _GEN_24 = 2'h2 == selReg ? 4'hd : _GEN_22; // @[\\src\\main\\scala\\VendingMachine.scala 112:18 122:19]
  wire [3:0] _GEN_25 = 2'h2 == selReg ? priceTens : _GEN_23; // @[\\src\\main\\scala\\VendingMachine.scala 112:18 123:27]
  wire [3:0] _GEN_26 = 2'h1 == selReg ? 4'hb : _GEN_24; // @[\\src\\main\\scala\\VendingMachine.scala 112:18 118:19]
  wire [3:0] _GEN_27 = 2'h1 == selReg ? onesDigit : _GEN_25; // @[\\src\\main\\scala\\VendingMachine.scala 112:18 119:27]
  SevenSegDec sevSegDecoder ( // @[\\src\\main\\scala\\VendingMachine.scala 41:29]
    .io_in(sevSegDecoder_io_in),
    .io_out(sevSegDecoder_io_out)
  );
  assign io_releaseCan = stateReg == 2'h1; // @[\\src\\main\\scala\\VendingMachine.scala 135:30]
  assign io_alarm = stateReg == 2'h2 & blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 136:36]
  assign io_seg = ~sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 133:13]
  assign io_an = 2'h0 == selReg ? 4'h7 : _GEN_26; // @[\\src\\main\\scala\\VendingMachine.scala 112:18 114:19]
  assign sevSegDecoder_io_in = 2'h0 == selReg ? tensDigit : _GEN_27; // @[\\src\\main\\scala\\VendingMachine.scala 112:18 115:27]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 18:27]
      totalMoney <= 8'h0; // @[\\src\\main\\scala\\VendingMachine.scala 18:27]
    end else if (signalCoin2) begin // @[\\src\\main\\scala\\VendingMachine.scala 97:21]
      totalMoney <= _totalMoney_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 98:16]
    end else if (signalCoin5) begin // @[\\src\\main\\scala\\VendingMachine.scala 99:28]
      totalMoney <= _totalMoney_T_3; // @[\\src\\main\\scala\\VendingMachine.scala 100:16]
    end else if (signalSub) begin // @[\\src\\main\\scala\\VendingMachine.scala 101:26]
      totalMoney <= _totalMoney_T_5; // @[\\src\\main\\scala\\VendingMachine.scala 102:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 28:29]
      blinkCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 28:29]
    end else if (blinkCounter == 32'h17d7840) begin // @[\\src\\main\\scala\\VendingMachine.scala 60:36]
      blinkCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 61:18]
    end else begin
      blinkCounter <= _blinkCounter_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 59:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 29:25]
      blinkReg <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 29:25]
    end else if (blinkCounter == 32'h17d7840) begin // @[\\src\\main\\scala\\VendingMachine.scala 60:36]
      blinkReg <= ~blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 62:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 32:23]
      cntReg <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 32:23]
    end else if (cntReg == 32'h1869f) begin // @[\\src\\main\\scala\\VendingMachine.scala 107:27]
      cntReg <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 108:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 106:10]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 33:23]
      selReg <= 2'h0; // @[\\src\\main\\scala\\VendingMachine.scala 33:23]
    end else if (cntReg == 32'h1869f) begin // @[\\src\\main\\scala\\VendingMachine.scala 107:27]
      selReg <= _selReg_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 109:12]
    end
    coin2Edge_REG <= io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 36:39]
    coin5Edge_REG <= io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 37:39]
    buyEdge_REG <= io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 38:39]
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 51:25]
      stateReg <= 2'h0; // @[\\src\\main\\scala\\VendingMachine.scala 51:25]
    end else if (2'h0 == stateReg) begin // @[\\src\\main\\scala\\VendingMachine.scala 65:20]
      if (buyEdge) begin // @[\\src\\main\\scala\\VendingMachine.scala 73:21]
        if (totalMoney >= _GEN_30) begin // @[\\src\\main\\scala\\VendingMachine.scala 74:38]
          stateReg <= 2'h1; // @[\\src\\main\\scala\\VendingMachine.scala 76:20]
        end else begin
          stateReg <= 2'h2; // @[\\src\\main\\scala\\VendingMachine.scala 78:20]
        end
      end
    end else if (2'h1 == stateReg) begin // @[\\src\\main\\scala\\VendingMachine.scala 65:20]
      if (io_buy) begin // @[\\src\\main\\scala\\VendingMachine.scala 83:20]
        stateReg <= 2'h1; // @[\\src\\main\\scala\\VendingMachine.scala 84:18]
      end else begin
        stateReg <= 2'h0; // @[\\src\\main\\scala\\VendingMachine.scala 86:18]
      end
    end else if (2'h2 == stateReg) begin // @[\\src\\main\\scala\\VendingMachine.scala 65:20]
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
  _RAND_8 = {1{`RANDOM}};
  stateReg = _RAND_8[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
