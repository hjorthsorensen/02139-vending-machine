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
module Tx(
  input        clock,
  input        reset,
  output       io_txd, // @[\\src\\main\\scala\\uart.scala 27:14]
  output       io_channel_ready, // @[\\src\\main\\scala\\uart.scala 27:14]
  input        io_channel_valid, // @[\\src\\main\\scala\\uart.scala 27:14]
  input  [7:0] io_channel_bits // @[\\src\\main\\scala\\uart.scala 27:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] shiftReg; // @[\\src\\main\\scala\\uart.scala 34:25]
  reg [19:0] cntReg; // @[\\src\\main\\scala\\uart.scala 35:23]
  reg [3:0] bitsReg; // @[\\src\\main\\scala\\uart.scala 36:24]
  wire  _io_channel_ready_T = cntReg == 20'h0; // @[\\src\\main\\scala\\uart.scala 38:31]
  wire [8:0] shift = shiftReg[9:1]; // @[\\src\\main\\scala\\uart.scala 45:28]
  wire [9:0] _shiftReg_T_1 = {1'h1,shift}; // @[\\src\\main\\scala\\uart.scala 46:23]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[\\src\\main\\scala\\uart.scala 47:26]
  wire [9:0] _shiftReg_T_3 = {1'h1,io_channel_bits,1'h0}; // @[\\src\\main\\scala\\uart.scala 51:44]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[\\src\\main\\scala\\uart.scala 59:22]
  assign io_txd = shiftReg[0]; // @[\\src\\main\\scala\\uart.scala 39:21]
  assign io_channel_ready = cntReg == 20'h0 & bitsReg == 4'h0; // @[\\src\\main\\scala\\uart.scala 38:40]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\uart.scala 34:25]
      shiftReg <= 10'h3ff; // @[\\src\\main\\scala\\uart.scala 34:25]
    end else if (_io_channel_ready_T) begin // @[\\src\\main\\scala\\uart.scala 41:24]
      if (bitsReg != 4'h0) begin // @[\\src\\main\\scala\\uart.scala 44:27]
        shiftReg <= _shiftReg_T_1; // @[\\src\\main\\scala\\uart.scala 46:16]
      end else if (io_channel_valid) begin // @[\\src\\main\\scala\\uart.scala 49:30]
        shiftReg <= _shiftReg_T_3; // @[\\src\\main\\scala\\uart.scala 51:18]
      end else begin
        shiftReg <= 10'h3ff; // @[\\src\\main\\scala\\uart.scala 54:18]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\uart.scala 35:23]
      cntReg <= 20'h0; // @[\\src\\main\\scala\\uart.scala 35:23]
    end else if (_io_channel_ready_T) begin // @[\\src\\main\\scala\\uart.scala 41:24]
      cntReg <= 20'h363; // @[\\src\\main\\scala\\uart.scala 43:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[\\src\\main\\scala\\uart.scala 59:12]
    end
    if (reset) begin // @[\\src\\main\\scala\\uart.scala 36:24]
      bitsReg <= 4'h0; // @[\\src\\main\\scala\\uart.scala 36:24]
    end else if (_io_channel_ready_T) begin // @[\\src\\main\\scala\\uart.scala 41:24]
      if (bitsReg != 4'h0) begin // @[\\src\\main\\scala\\uart.scala 44:27]
        bitsReg <= _bitsReg_T_1; // @[\\src\\main\\scala\\uart.scala 47:15]
      end else if (io_channel_valid) begin // @[\\src\\main\\scala\\uart.scala 49:30]
        bitsReg <= 4'ha; // @[\\src\\main\\scala\\uart.scala 52:17]
      end
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
  shiftReg = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  bitsReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Buffer(
  input        clock,
  input        reset,
  output       io_in_ready, // @[\\src\\main\\scala\\uart.scala 120:14]
  input        io_in_valid, // @[\\src\\main\\scala\\uart.scala 120:14]
  input  [7:0] io_in_bits, // @[\\src\\main\\scala\\uart.scala 120:14]
  input        io_out_ready, // @[\\src\\main\\scala\\uart.scala 120:14]
  output       io_out_valid, // @[\\src\\main\\scala\\uart.scala 120:14]
  output [7:0] io_out_bits // @[\\src\\main\\scala\\uart.scala 120:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[\\src\\main\\scala\\uart.scala 130:25]
  reg [7:0] dataReg; // @[\\src\\main\\scala\\uart.scala 131:24]
  wire  _io_in_ready_T = ~stateReg; // @[\\src\\main\\scala\\uart.scala 133:27]
  wire  _GEN_1 = io_in_valid | stateReg; // @[\\src\\main\\scala\\uart.scala 137:23 139:16 130:25]
  assign io_in_ready = ~stateReg; // @[\\src\\main\\scala\\uart.scala 133:27]
  assign io_out_valid = stateReg; // @[\\src\\main\\scala\\uart.scala 134:28]
  assign io_out_bits = dataReg; // @[\\src\\main\\scala\\uart.scala 146:15]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\uart.scala 130:25]
      stateReg <= 1'h0; // @[\\src\\main\\scala\\uart.scala 130:25]
    end else if (_io_in_ready_T) begin // @[\\src\\main\\scala\\uart.scala 136:28]
      stateReg <= _GEN_1;
    end else if (io_out_ready) begin // @[\\src\\main\\scala\\uart.scala 142:24]
      stateReg <= 1'h0; // @[\\src\\main\\scala\\uart.scala 143:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\uart.scala 131:24]
      dataReg <= 8'h0; // @[\\src\\main\\scala\\uart.scala 131:24]
    end else if (_io_in_ready_T) begin // @[\\src\\main\\scala\\uart.scala 136:28]
      if (io_in_valid) begin // @[\\src\\main\\scala\\uart.scala 137:23]
        dataReg <= io_in_bits; // @[\\src\\main\\scala\\uart.scala 138:15]
      end
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
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BufferedTx(
  input        clock,
  input        reset,
  output       io_txd, // @[\\src\\main\\scala\\uart.scala 155:14]
  output       io_channel_ready, // @[\\src\\main\\scala\\uart.scala 155:14]
  input        io_channel_valid, // @[\\src\\main\\scala\\uart.scala 155:14]
  input  [7:0] io_channel_bits // @[\\src\\main\\scala\\uart.scala 155:14]
);
  wire  tx_clock; // @[\\src\\main\\scala\\uart.scala 159:18]
  wire  tx_reset; // @[\\src\\main\\scala\\uart.scala 159:18]
  wire  tx_io_txd; // @[\\src\\main\\scala\\uart.scala 159:18]
  wire  tx_io_channel_ready; // @[\\src\\main\\scala\\uart.scala 159:18]
  wire  tx_io_channel_valid; // @[\\src\\main\\scala\\uart.scala 159:18]
  wire [7:0] tx_io_channel_bits; // @[\\src\\main\\scala\\uart.scala 159:18]
  wire  buf__clock; // @[\\src\\main\\scala\\uart.scala 160:19]
  wire  buf__reset; // @[\\src\\main\\scala\\uart.scala 160:19]
  wire  buf__io_in_ready; // @[\\src\\main\\scala\\uart.scala 160:19]
  wire  buf__io_in_valid; // @[\\src\\main\\scala\\uart.scala 160:19]
  wire [7:0] buf__io_in_bits; // @[\\src\\main\\scala\\uart.scala 160:19]
  wire  buf__io_out_ready; // @[\\src\\main\\scala\\uart.scala 160:19]
  wire  buf__io_out_valid; // @[\\src\\main\\scala\\uart.scala 160:19]
  wire [7:0] buf__io_out_bits; // @[\\src\\main\\scala\\uart.scala 160:19]
  Tx tx ( // @[\\src\\main\\scala\\uart.scala 159:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Buffer buf_ ( // @[\\src\\main\\scala\\uart.scala 160:19]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_in_ready(buf__io_in_ready),
    .io_in_valid(buf__io_in_valid),
    .io_in_bits(buf__io_in_bits),
    .io_out_ready(buf__io_out_ready),
    .io_out_valid(buf__io_out_valid),
    .io_out_bits(buf__io_out_bits)
  );
  assign io_txd = tx_io_txd; // @[\\src\\main\\scala\\uart.scala 164:10]
  assign io_channel_ready = buf__io_in_ready; // @[\\src\\main\\scala\\uart.scala 162:13]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = buf__io_out_valid; // @[\\src\\main\\scala\\uart.scala 163:17]
  assign tx_io_channel_bits = buf__io_out_bits; // @[\\src\\main\\scala\\uart.scala 163:17]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_in_valid = io_channel_valid; // @[\\src\\main\\scala\\uart.scala 162:13]
  assign buf__io_in_bits = io_channel_bits; // @[\\src\\main\\scala\\uart.scala 162:13]
  assign buf__io_out_ready = tx_io_channel_ready; // @[\\src\\main\\scala\\uart.scala 163:17]
endmodule
module UartDisplay(
  input   clock,
  input   reset,
  output  io_txd, // @[\\src\\main\\scala\\UartDisplay.scala 6:16]
  input   io_sold, // @[\\src\\main\\scala\\UartDisplay.scala 6:16]
  input   io_alarm, // @[\\src\\main\\scala\\UartDisplay.scala 6:16]
  input   io_empty, // @[\\src\\main\\scala\\UartDisplay.scala 6:16]
  input   io_full, // @[\\src\\main\\scala\\UartDisplay.scala 6:16]
  input   io_rtnCoin // @[\\src\\main\\scala\\UartDisplay.scala 6:16]
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
  wire  tx_clock; // @[\\src\\main\\scala\\UartDisplay.scala 15:20]
  wire  tx_reset; // @[\\src\\main\\scala\\UartDisplay.scala 15:20]
  wire  tx_io_txd; // @[\\src\\main\\scala\\UartDisplay.scala 15:20]
  wire  tx_io_channel_ready; // @[\\src\\main\\scala\\UartDisplay.scala 15:20]
  wire  tx_io_channel_valid; // @[\\src\\main\\scala\\UartDisplay.scala 15:20]
  wire [7:0] tx_io_channel_bits; // @[\\src\\main\\scala\\UartDisplay.scala 15:20]
  reg [2:0] msgSel; // @[\\src\\main\\scala\\UartDisplay.scala 38:29]
  reg [7:0] cntReg; // @[\\src\\main\\scala\\UartDisplay.scala 39:29]
  reg  sendingReg; // @[\\src\\main\\scala\\UartDisplay.scala 40:29]
  reg  soldEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 42:41]
  wire  soldEdge = io_sold & ~soldEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 42:30]
  reg  alarmEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 43:41]
  wire  alarmEdge = io_alarm & ~alarmEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 43:30]
  reg  emptyEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 44:41]
  wire  emptyEdge = io_empty & ~emptyEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 44:30]
  reg  fullEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 45:41]
  wire  fullEdge = io_full & ~fullEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 45:30]
  reg  rtnCoinEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 46:45]
  wire  rtnCoinEdge = io_rtnCoin & ~rtnCoinEdge_REG; // @[\\src\\main\\scala\\UartDisplay.scala 46:34]
  wire [2:0] _GEN_0 = rtnCoinEdge ? 3'h4 : msgSel; // @[\\src\\main\\scala\\UartDisplay.scala 52:28 38:29 52:37]
  wire [7:0] _GEN_1 = rtnCoinEdge ? 8'h0 : cntReg; // @[\\src\\main\\scala\\UartDisplay.scala 52:28 39:29 52:53]
  wire  _GEN_2 = rtnCoinEdge | sendingReg; // @[\\src\\main\\scala\\UartDisplay.scala 52:28 40:29 52:73]
  wire [2:0] _GEN_3 = fullEdge ? 3'h3 : _GEN_0; // @[\\src\\main\\scala\\UartDisplay.scala 51:{26,35}]
  wire [7:0] _GEN_4 = fullEdge ? 8'h0 : _GEN_1; // @[\\src\\main\\scala\\UartDisplay.scala 51:{26,51}]
  wire  _GEN_5 = fullEdge | _GEN_2; // @[\\src\\main\\scala\\UartDisplay.scala 51:{26,71}]
  wire [7:0] _GEN_7 = emptyEdge ? 8'h0 : _GEN_4; // @[\\src\\main\\scala\\UartDisplay.scala 50:{26,51}]
  wire  _GEN_8 = emptyEdge | _GEN_5; // @[\\src\\main\\scala\\UartDisplay.scala 50:{26,71}]
  wire  _GEN_11 = alarmEdge | _GEN_8; // @[\\src\\main\\scala\\UartDisplay.scala 49:{26,71}]
  wire  _GEN_14 = soldEdge | _GEN_11; // @[\\src\\main\\scala\\UartDisplay.scala 48:{20,65}]
  wire [7:0] _tx_io_channel_bits_T = msgSel * 5'h17; // @[\\src\\main\\scala\\UartDisplay.scala 54:45]
  wire [7:0] _tx_io_channel_bits_T_2 = _tx_io_channel_bits_T + cntReg; // @[\\src\\main\\scala\\UartDisplay.scala 54:57]
  wire [7:0] _GEN_16 = 7'h1 == _tx_io_channel_bits_T_2[6:0] ? 8'h74 : 8'h49; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_17 = 7'h2 == _tx_io_channel_bits_T_2[6:0] ? 8'h65 : _GEN_16; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_18 = 7'h3 == _tx_io_channel_bits_T_2[6:0] ? 8'h6d : _GEN_17; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_19 = 7'h4 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_18; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_20 = 7'h5 == _tx_io_channel_bits_T_2[6:0] ? 8'h73 : _GEN_19; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_21 = 7'h6 == _tx_io_channel_bits_T_2[6:0] ? 8'h6f : _GEN_20; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_22 = 7'h7 == _tx_io_channel_bits_T_2[6:0] ? 8'h6c : _GEN_21; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_23 = 7'h8 == _tx_io_channel_bits_T_2[6:0] ? 8'h64 : _GEN_22; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_24 = 7'h9 == _tx_io_channel_bits_T_2[6:0] ? 8'h21 : _GEN_23; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_25 = 7'ha == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_24; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_26 = 7'hb == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_25; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_27 = 7'hc == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_26; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_28 = 7'hd == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_27; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_29 = 7'he == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_28; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_30 = 7'hf == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_29; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_31 = 7'h10 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_30; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_32 = 7'h11 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_31; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_33 = 7'h12 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_32; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_34 = 7'h13 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_33; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_35 = 7'h14 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_34; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_36 = 7'h15 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_35; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_37 = 7'h16 == _tx_io_channel_bits_T_2[6:0] ? 8'ha : _GEN_36; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_38 = 7'h17 == _tx_io_channel_bits_T_2[6:0] ? 8'h4e : _GEN_37; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_39 = 7'h18 == _tx_io_channel_bits_T_2[6:0] ? 8'h6f : _GEN_38; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_40 = 7'h19 == _tx_io_channel_bits_T_2[6:0] ? 8'h74 : _GEN_39; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_41 = 7'h1a == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_40; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_42 = 7'h1b == _tx_io_channel_bits_T_2[6:0] ? 8'h65 : _GEN_41; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_43 = 7'h1c == _tx_io_channel_bits_T_2[6:0] ? 8'h6e : _GEN_42; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_44 = 7'h1d == _tx_io_channel_bits_T_2[6:0] ? 8'h6f : _GEN_43; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_45 = 7'h1e == _tx_io_channel_bits_T_2[6:0] ? 8'h75 : _GEN_44; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_46 = 7'h1f == _tx_io_channel_bits_T_2[6:0] ? 8'h67 : _GEN_45; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_47 = 7'h20 == _tx_io_channel_bits_T_2[6:0] ? 8'h68 : _GEN_46; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_48 = 7'h21 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_47; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_49 = 7'h22 == _tx_io_channel_bits_T_2[6:0] ? 8'h6d : _GEN_48; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_50 = 7'h23 == _tx_io_channel_bits_T_2[6:0] ? 8'h6f : _GEN_49; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_51 = 7'h24 == _tx_io_channel_bits_T_2[6:0] ? 8'h6e : _GEN_50; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_52 = 7'h25 == _tx_io_channel_bits_T_2[6:0] ? 8'h65 : _GEN_51; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_53 = 7'h26 == _tx_io_channel_bits_T_2[6:0] ? 8'h79 : _GEN_52; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_54 = 7'h27 == _tx_io_channel_bits_T_2[6:0] ? 8'h21 : _GEN_53; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_55 = 7'h28 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_54; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_56 = 7'h29 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_55; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_57 = 7'h2a == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_56; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_58 = 7'h2b == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_57; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_59 = 7'h2c == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_58; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_60 = 7'h2d == _tx_io_channel_bits_T_2[6:0] ? 8'ha : _GEN_59; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_61 = 7'h2e == _tx_io_channel_bits_T_2[6:0] ? 8'h4d : _GEN_60; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_62 = 7'h2f == _tx_io_channel_bits_T_2[6:0] ? 8'h61 : _GEN_61; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_63 = 7'h30 == _tx_io_channel_bits_T_2[6:0] ? 8'h63 : _GEN_62; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_64 = 7'h31 == _tx_io_channel_bits_T_2[6:0] ? 8'h68 : _GEN_63; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_65 = 7'h32 == _tx_io_channel_bits_T_2[6:0] ? 8'h69 : _GEN_64; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_66 = 7'h33 == _tx_io_channel_bits_T_2[6:0] ? 8'h6e : _GEN_65; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_67 = 7'h34 == _tx_io_channel_bits_T_2[6:0] ? 8'h65 : _GEN_66; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_68 = 7'h35 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_67; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_69 = 7'h36 == _tx_io_channel_bits_T_2[6:0] ? 8'h65 : _GEN_68; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_70 = 7'h37 == _tx_io_channel_bits_T_2[6:0] ? 8'h6d : _GEN_69; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_71 = 7'h38 == _tx_io_channel_bits_T_2[6:0] ? 8'h70 : _GEN_70; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_72 = 7'h39 == _tx_io_channel_bits_T_2[6:0] ? 8'h74 : _GEN_71; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_73 = 7'h3a == _tx_io_channel_bits_T_2[6:0] ? 8'h79 : _GEN_72; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_74 = 7'h3b == _tx_io_channel_bits_T_2[6:0] ? 8'h21 : _GEN_73; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_75 = 7'h3c == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_74; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_76 = 7'h3d == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_75; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_77 = 7'h3e == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_76; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_78 = 7'h3f == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_77; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_79 = 7'h40 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_78; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_80 = 7'h41 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_79; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_81 = 7'h42 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_80; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_82 = 7'h43 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_81; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_83 = 7'h44 == _tx_io_channel_bits_T_2[6:0] ? 8'ha : _GEN_82; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_84 = 7'h45 == _tx_io_channel_bits_T_2[6:0] ? 8'h43 : _GEN_83; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_85 = 7'h46 == _tx_io_channel_bits_T_2[6:0] ? 8'h6f : _GEN_84; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_86 = 7'h47 == _tx_io_channel_bits_T_2[6:0] ? 8'h69 : _GEN_85; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_87 = 7'h48 == _tx_io_channel_bits_T_2[6:0] ? 8'h6e : _GEN_86; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_88 = 7'h49 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_87; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_89 = 7'h4a == _tx_io_channel_bits_T_2[6:0] ? 8'h66 : _GEN_88; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_90 = 7'h4b == _tx_io_channel_bits_T_2[6:0] ? 8'h75 : _GEN_89; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_91 = 7'h4c == _tx_io_channel_bits_T_2[6:0] ? 8'h6c : _GEN_90; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_92 = 7'h4d == _tx_io_channel_bits_T_2[6:0] ? 8'h6c : _GEN_91; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_93 = 7'h4e == _tx_io_channel_bits_T_2[6:0] ? 8'h21 : _GEN_92; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_94 = 7'h4f == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_93; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_95 = 7'h50 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_94; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_96 = 7'h51 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_95; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_97 = 7'h52 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_96; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_98 = 7'h53 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_97; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_99 = 7'h54 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_98; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_100 = 7'h55 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_99; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_101 = 7'h56 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_100; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_102 = 7'h57 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_101; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_103 = 7'h58 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_102; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_104 = 7'h59 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_103; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_105 = 7'h5a == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_104; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_106 = 7'h5b == _tx_io_channel_bits_T_2[6:0] ? 8'ha : _GEN_105; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_107 = 7'h5c == _tx_io_channel_bits_T_2[6:0] ? 8'h52 : _GEN_106; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_108 = 7'h5d == _tx_io_channel_bits_T_2[6:0] ? 8'h65 : _GEN_107; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_109 = 7'h5e == _tx_io_channel_bits_T_2[6:0] ? 8'h74 : _GEN_108; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_110 = 7'h5f == _tx_io_channel_bits_T_2[6:0] ? 8'h75 : _GEN_109; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_111 = 7'h60 == _tx_io_channel_bits_T_2[6:0] ? 8'h72 : _GEN_110; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_112 = 7'h61 == _tx_io_channel_bits_T_2[6:0] ? 8'h6e : _GEN_111; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_113 = 7'h62 == _tx_io_channel_bits_T_2[6:0] ? 8'h69 : _GEN_112; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_114 = 7'h63 == _tx_io_channel_bits_T_2[6:0] ? 8'h6e : _GEN_113; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_115 = 7'h64 == _tx_io_channel_bits_T_2[6:0] ? 8'h67 : _GEN_114; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_116 = 7'h65 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_115; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_117 = 7'h66 == _tx_io_channel_bits_T_2[6:0] ? 8'h63 : _GEN_116; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_118 = 7'h67 == _tx_io_channel_bits_T_2[6:0] ? 8'h6f : _GEN_117; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_119 = 7'h68 == _tx_io_channel_bits_T_2[6:0] ? 8'h69 : _GEN_118; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_120 = 7'h69 == _tx_io_channel_bits_T_2[6:0] ? 8'h6e : _GEN_119; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_121 = 7'h6a == _tx_io_channel_bits_T_2[6:0] ? 8'h2e : _GEN_120; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_122 = 7'h6b == _tx_io_channel_bits_T_2[6:0] ? 8'h2e : _GEN_121; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_123 = 7'h6c == _tx_io_channel_bits_T_2[6:0] ? 8'h2e : _GEN_122; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_124 = 7'h6d == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_123; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_125 = 7'h6e == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_124; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_126 = 7'h6f == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_125; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_127 = 7'h70 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_126; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _GEN_128 = 7'h71 == _tx_io_channel_bits_T_2[6:0] ? 8'h20 : _GEN_127; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  wire [7:0] _cntReg_T_1 = cntReg + 8'h1; // @[\\src\\main\\scala\\UartDisplay.scala 62:30]
  BufferedTx tx ( // @[\\src\\main\\scala\\UartDisplay.scala 15:20]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  assign io_txd = tx_io_txd; // @[\\src\\main\\scala\\UartDisplay.scala 16:12]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = sendingReg; // @[\\src\\main\\scala\\UartDisplay.scala 55:25]
  assign tx_io_channel_bits = 7'h72 == _tx_io_channel_bits_T_2[6:0] ? 8'ha : _GEN_128; // @[\\src\\main\\scala\\UartDisplay.scala 54:{25,25}]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\UartDisplay.scala 38:29]
      msgSel <= 3'h0; // @[\\src\\main\\scala\\UartDisplay.scala 38:29]
    end else if (soldEdge) begin // @[\\src\\main\\scala\\UartDisplay.scala 48:20]
      msgSel <= 3'h0; // @[\\src\\main\\scala\\UartDisplay.scala 48:29]
    end else if (alarmEdge) begin // @[\\src\\main\\scala\\UartDisplay.scala 49:26]
      msgSel <= 3'h1; // @[\\src\\main\\scala\\UartDisplay.scala 49:35]
    end else if (emptyEdge) begin // @[\\src\\main\\scala\\UartDisplay.scala 50:26]
      msgSel <= 3'h2; // @[\\src\\main\\scala\\UartDisplay.scala 50:35]
    end else begin
      msgSel <= _GEN_3;
    end
    if (reset) begin // @[\\src\\main\\scala\\UartDisplay.scala 39:29]
      cntReg <= 8'h0; // @[\\src\\main\\scala\\UartDisplay.scala 39:29]
    end else if (tx_io_channel_ready & sendingReg) begin // @[\\src\\main\\scala\\UartDisplay.scala 57:45]
      if (cntReg == 8'h16) begin // @[\\src\\main\\scala\\UartDisplay.scala 58:41]
        cntReg <= 8'h0; // @[\\src\\main\\scala\\UartDisplay.scala 60:20]
      end else begin
        cntReg <= _cntReg_T_1; // @[\\src\\main\\scala\\UartDisplay.scala 62:20]
      end
    end else if (soldEdge) begin // @[\\src\\main\\scala\\UartDisplay.scala 48:20]
      cntReg <= 8'h0; // @[\\src\\main\\scala\\UartDisplay.scala 48:45]
    end else if (alarmEdge) begin // @[\\src\\main\\scala\\UartDisplay.scala 49:26]
      cntReg <= 8'h0; // @[\\src\\main\\scala\\UartDisplay.scala 49:51]
    end else begin
      cntReg <= _GEN_7;
    end
    if (reset) begin // @[\\src\\main\\scala\\UartDisplay.scala 40:29]
      sendingReg <= 1'h0; // @[\\src\\main\\scala\\UartDisplay.scala 40:29]
    end else if (tx_io_channel_ready & sendingReg) begin // @[\\src\\main\\scala\\UartDisplay.scala 57:45]
      if (cntReg == 8'h16) begin // @[\\src\\main\\scala\\UartDisplay.scala 58:41]
        sendingReg <= 1'h0; // @[\\src\\main\\scala\\UartDisplay.scala 59:24]
      end else begin
        sendingReg <= _GEN_14;
      end
    end else begin
      sendingReg <= _GEN_14;
    end
    soldEdge_REG <= io_sold; // @[\\src\\main\\scala\\UartDisplay.scala 42:41]
    alarmEdge_REG <= io_alarm; // @[\\src\\main\\scala\\UartDisplay.scala 43:41]
    emptyEdge_REG <= io_empty; // @[\\src\\main\\scala\\UartDisplay.scala 44:41]
    fullEdge_REG <= io_full; // @[\\src\\main\\scala\\UartDisplay.scala 45:41]
    rtnCoinEdge_REG <= io_rtnCoin; // @[\\src\\main\\scala\\UartDisplay.scala 46:45]
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
  msgSel = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  sendingReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  soldEdge_REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  alarmEdge_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  emptyEdge_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  fullEdge_REG = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  rtnCoinEdge_REG = _RAND_7[0:0];
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
  input  [4:0] io_price, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  input        io_coin2, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  input        io_coin5, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  input        io_buy, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  output       io_releaseCan, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  output       io_alarm, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  output       io_rejectCoinLED, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  output [6:0] io_seg, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  output [3:0] io_an, // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
  output       io_txd // @[\\src\\main\\scala\\VendingMachine.scala 6:14]
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
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] sevSegDecoder_io_in; // @[\\src\\main\\scala\\VendingMachine.scala 92:29]
  wire [6:0] sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 92:29]
  wire  fsm_clock; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_reset; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_coin2Edge; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_coin5Edge; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_buyEdge; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire [7:0] fsm_io_totalMoney; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire [7:0] fsm_io_itemPrice; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_inpCoinBeingRej; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_signalCoin2; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_signalCoin5; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_signalSub; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_releaseCan; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_alarm; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  fsm_io_coinBeingRejected; // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
  wire  uart_clock; // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
  wire  uart_reset; // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
  wire  uart_io_txd; // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
  wire  uart_io_sold; // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
  wire  uart_io_alarm; // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
  wire  uart_io_empty; // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
  wire  uart_io_full; // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
  wire  uart_io_rtnCoin; // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
  reg [7:0] totalMoney; // @[\\src\\main\\scala\\VendingMachine.scala 29:27]
  wire [7:0] _GEN_26 = totalMoney % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 30:30]
  wire [3:0] onesDigit = _GEN_26[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 30:30]
  wire [7:0] _tensDigit_T = totalMoney / 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 31:31]
  wire [7:0] _GEN_46 = _tensDigit_T % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 31:39]
  wire [3:0] tensDigit = _GEN_46[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 31:39]
  wire [4:0] _GEN_0 = 5'h9 == io_price ? 5'h11 : 5'h0; // @[\\src\\main\\scala\\VendingMachine.scala 36:13 37:20 46:25]
  wire [4:0] _GEN_1 = 5'h8 == io_price ? 5'ha : _GEN_0; // @[\\src\\main\\scala\\VendingMachine.scala 37:20 45:25]
  wire [4:0] _GEN_2 = 5'h7 == io_price ? 5'he : _GEN_1; // @[\\src\\main\\scala\\VendingMachine.scala 37:20 44:25]
  wire [4:0] _GEN_3 = 5'h6 == io_price ? 5'h14 : _GEN_2; // @[\\src\\main\\scala\\VendingMachine.scala 37:20 43:25]
  wire [4:0] _GEN_4 = 5'h5 == io_price ? 5'h12 : _GEN_3; // @[\\src\\main\\scala\\VendingMachine.scala 37:20 42:25]
  wire [4:0] _GEN_5 = 5'h4 == io_price ? 5'h11 : _GEN_4; // @[\\src\\main\\scala\\VendingMachine.scala 37:20 41:25]
  wire [4:0] _GEN_6 = 5'h3 == io_price ? 5'h7 : _GEN_5; // @[\\src\\main\\scala\\VendingMachine.scala 37:20 40:25]
  wire [4:0] _GEN_7 = 5'h2 == io_price ? 5'h4 : _GEN_6; // @[\\src\\main\\scala\\VendingMachine.scala 37:20 39:25]
  wire [4:0] _GEN_8 = 5'h1 == io_price ? 5'h4 : _GEN_7; // @[\\src\\main\\scala\\VendingMachine.scala 37:20 38:25]
  wire [7:0] itemPrice = {{3'd0}, _GEN_8}; // @[\\src\\main\\scala\\VendingMachine.scala 35:23]
  wire [7:0] _GEN_47 = itemPrice % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 49:29]
  wire [3:0] priceOnes = _GEN_47[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 49:29]
  wire [7:0] _priceTens_T = itemPrice / 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 50:30]
  wire [7:0] _GEN_48 = _priceTens_T % 8'ha; // @[\\src\\main\\scala\\VendingMachine.scala 50:38]
  wire [3:0] priceTens = _GEN_48[3:0]; // @[\\src\\main\\scala\\VendingMachine.scala 50:38]
  reg [31:0] blinkCounter; // @[\\src\\main\\scala\\VendingMachine.scala 55:29]
  reg  blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 56:25]
  reg [31:0] cntReg; // @[\\src\\main\\scala\\VendingMachine.scala 59:23]
  reg [1:0] selReg; // @[\\src\\main\\scala\\VendingMachine.scala 60:23]
  reg [5:0] coin2Count; // @[\\src\\main\\scala\\VendingMachine.scala 64:27]
  reg [5:0] coin5Count; // @[\\src\\main\\scala\\VendingMachine.scala 65:27]
  wire  coinFull = coin2Count >= 6'h3f | coin5Count >= 6'h3f; // @[\\src\\main\\scala\\VendingMachine.scala 66:37]
  reg [3:0] fullDisplayCount; // @[\\src\\main\\scala\\VendingMachine.scala 67:33]
  wire  showFull = fullDisplayCount > 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 68:35]
  reg  REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
  wire  _T_10 = io_coin2 & ~REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:47]
  reg  REG_1; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
  wire  _T_13 = io_coin5 & ~REG_1; // @[\\src\\main\\scala\\VendingMachine.scala 86:47]
  reg  REG_2; // @[\\src\\main\\scala\\VendingMachine.scala 73:28]
  wire [3:0] _fullDisplayCount_T_1 = fullDisplayCount - 4'h1; // @[\\src\\main\\scala\\VendingMachine.scala 74:42]
  reg [4:0] canCount; // @[\\src\\main\\scala\\VendingMachine.scala 79:25]
  wire  canEmpty = canCount == 5'h0; // @[\\src\\main\\scala\\VendingMachine.scala 80:27]
  reg  buyFallingEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 81:42]
  wire  buyFallingEdge = ~io_buy & buyFallingEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 81:32]
  reg  coin2Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
  wire  _coin2Edge_T_1 = io_coin2 & ~coin2Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:47]
  wire  _coin2Edge_T_2 = ~canEmpty; // @[\\src\\main\\scala\\VendingMachine.scala 87:43]
  wire  _coin2Edge_T_4 = ~coinFull; // @[\\src\\main\\scala\\VendingMachine.scala 87:56]
  reg  coin5Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
  wire  _coin5Edge_T_1 = io_coin5 & ~coin5Edge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:47]
  reg  buyEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
  wire  _buyEdge_T_1 = io_buy & ~buyEdge_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:47]
  reg [31:0] rejectCounter; // @[\\src\\main\\scala\\VendingMachine.scala 98:30]
  reg  rejectReg; // @[\\src\\main\\scala\\VendingMachine.scala 99:26]
  wire [31:0] _rejectCounter_T_1 = rejectCounter + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 101:34]
  wire [31:0] _blinkCounter_T_1 = blinkCounter + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 110:32]
  wire  _blinkReg_T = ~blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 113:17]
  wire  _T_21 = totalMoney <= 8'h61; // @[\\src\\main\\scala\\VendingMachine.scala 133:41]
  wire [5:0] _coin2Count_T_1 = coin2Count + 6'h1; // @[\\src\\main\\scala\\VendingMachine.scala 134:30]
  wire  _T_23 = totalMoney <= 8'h5e; // @[\\src\\main\\scala\\VendingMachine.scala 136:41]
  wire [5:0] _coin5Count_T_1 = coin5Count + 6'h1; // @[\\src\\main\\scala\\VendingMachine.scala 137:30]
  wire  _T_25 = buyFallingEdge & fsm_io_releaseCan; // @[\\src\\main\\scala\\VendingMachine.scala 140:23]
  wire [4:0] _canCount_T_1 = canCount - 5'h1; // @[\\src\\main\\scala\\VendingMachine.scala 141:26]
  reg  fsm_io_inpCoinBeingRej_REG; // @[\\src\\main\\scala\\VendingMachine.scala 146:36]
  wire [7:0] _totalMoney_T_1 = totalMoney + 8'h2; // @[\\src\\main\\scala\\VendingMachine.scala 150:32]
  wire [7:0] _totalMoney_T_3 = totalMoney + 8'h5; // @[\\src\\main\\scala\\VendingMachine.scala 156:32]
  wire  _GEN_21 = _T_23 ? 1'h0 : 1'h1; // @[\\src\\main\\scala\\VendingMachine.scala 155:30 145:31 158:18]
  wire [7:0] _totalMoney_T_5 = totalMoney - itemPrice; // @[\\src\\main\\scala\\VendingMachine.scala 161:30]
  wire  _GEN_24 = fsm_io_signalCoin5 & _GEN_21; // @[\\src\\main\\scala\\VendingMachine.scala 145:31 154:35]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 165:20]
  wire [1:0] _selReg_T_1 = selReg + 2'h1; // @[\\src\\main\\scala\\VendingMachine.scala 168:22]
  wire  blinkDuringAlarm = fsm_io_alarm & _blinkReg_T; // @[\\src\\main\\scala\\VendingMachine.scala 182:40]
  wire [3:0] _activeDigit_T = blinkDuringAlarm ? 4'hf : 4'h7; // @[\\src\\main\\scala\\VendingMachine.scala 187:25]
  wire [6:0] _GEN_29 = canEmpty ? 7'h79 : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 189:22 184:27 189:30]
  wire [6:0] _GEN_30 = showFull ? 7'h71 : _GEN_29; // @[\\src\\main\\scala\\VendingMachine.scala 190:{22,30}]
  wire [3:0] _activeDigit_T_1 = blinkDuringAlarm ? 4'hf : 4'hb; // @[\\src\\main\\scala\\VendingMachine.scala 193:25]
  wire [6:0] _GEN_31 = canEmpty ? 7'h73 : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 195:22 184:27 195:30]
  wire [6:0] _GEN_32 = showFull ? 7'h3e : _GEN_31; // @[\\src\\main\\scala\\VendingMachine.scala 196:{22,30}]
  wire [6:0] _GEN_33 = canEmpty ? 7'h78 : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 201:22 184:27 201:30]
  wire [6:0] _GEN_34 = showFull ? 7'h38 : _GEN_33; // @[\\src\\main\\scala\\VendingMachine.scala 202:{22,30}]
  wire [6:0] _GEN_35 = canEmpty ? 7'h6e : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 207:22 184:27 207:30]
  wire [6:0] _GEN_36 = showFull ? 7'h38 : _GEN_35; // @[\\src\\main\\scala\\VendingMachine.scala 208:{22,30}]
  wire [3:0] _GEN_37 = 2'h3 == selReg ? 4'he : 4'hf; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 205:19 93:32]
  wire [3:0] _GEN_38 = 2'h3 == selReg ? priceOnes : 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 206:27 94:23]
  wire [6:0] _GEN_39 = 2'h3 == selReg ? _GEN_36 : sevSegDecoder_io_out; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 184:27]
  wire [3:0] _GEN_40 = 2'h2 == selReg ? 4'hd : _GEN_37; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 199:19]
  wire [3:0] _GEN_41 = 2'h2 == selReg ? priceTens : _GEN_38; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 200:27]
  wire [6:0] _GEN_42 = 2'h2 == selReg ? _GEN_34 : _GEN_39; // @[\\src\\main\\scala\\VendingMachine.scala 185:18]
  wire [3:0] _GEN_43 = 2'h1 == selReg ? _activeDigit_T_1 : _GEN_40; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 193:19]
  wire [3:0] _GEN_44 = 2'h1 == selReg ? onesDigit : _GEN_41; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 194:27]
  wire [6:0] _GEN_45 = 2'h1 == selReg ? _GEN_32 : _GEN_42; // @[\\src\\main\\scala\\VendingMachine.scala 185:18]
  wire [6:0] segOut = 2'h0 == selReg ? _GEN_30 : _GEN_45; // @[\\src\\main\\scala\\VendingMachine.scala 185:18]
  reg  uart_io_empty_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
  reg  uart_io_full_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
  reg  uart_io_rtnCoin_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
  SevenSegDec sevSegDecoder ( // @[\\src\\main\\scala\\VendingMachine.scala 92:29]
    .io_in(sevSegDecoder_io_in),
    .io_out(sevSegDecoder_io_out)
  );
  VendingFSM fsm ( // @[\\src\\main\\scala\\VendingMachine.scala 119:19]
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
  UartDisplay uart ( // @[\\src\\main\\scala\\VendingMachine.scala 215:20]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_txd(uart_io_txd),
    .io_sold(uart_io_sold),
    .io_alarm(uart_io_alarm),
    .io_empty(uart_io_empty),
    .io_full(uart_io_full),
    .io_rtnCoin(uart_io_rtnCoin)
  );
  assign io_releaseCan = fsm_io_releaseCan & _coin2Edge_T_2; // @[\\src\\main\\scala\\VendingMachine.scala 231:38]
  assign io_alarm = fsm_io_alarm & blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 232:28]
  assign io_rejectCoinLED = (fsm_io_coinBeingRejected | showFull) & rejectReg; // @[\\src\\main\\scala\\VendingMachine.scala 233:62]
  assign io_seg = ~segOut; // @[\\src\\main\\scala\\VendingMachine.scala 229:13]
  assign io_an = 2'h0 == selReg ? _activeDigit_T : _GEN_43; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 187:19]
  assign io_txd = uart_io_txd; // @[\\src\\main\\scala\\VendingMachine.scala 226:10]
  assign sevSegDecoder_io_in = 2'h0 == selReg ? tensDigit : _GEN_44; // @[\\src\\main\\scala\\VendingMachine.scala 185:18 188:27]
  assign fsm_clock = clock;
  assign fsm_reset = reset;
  assign fsm_io_coin2Edge = _coin2Edge_T_1 & ~canEmpty & ~coinFull; // @[\\src\\main\\scala\\VendingMachine.scala 87:53]
  assign fsm_io_coin5Edge = _coin5Edge_T_1 & _coin2Edge_T_2 & _coin2Edge_T_4; // @[\\src\\main\\scala\\VendingMachine.scala 88:53]
  assign fsm_io_buyEdge = _buyEdge_T_1 & _coin2Edge_T_2; // @[\\src\\main\\scala\\VendingMachine.scala 89:38]
  assign fsm_io_buy = io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 123:20]
  assign fsm_io_coin2 = io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 124:20]
  assign fsm_io_coin5 = io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 125:20]
  assign fsm_io_totalMoney = totalMoney; // @[\\src\\main\\scala\\VendingMachine.scala 126:21]
  assign fsm_io_itemPrice = {{3'd0}, _GEN_8}; // @[\\src\\main\\scala\\VendingMachine.scala 35:23]
  assign fsm_io_inpCoinBeingRej = fsm_io_inpCoinBeingRej_REG; // @[\\src\\main\\scala\\VendingMachine.scala 146:26]
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_sold = _T_25 & _coin2Edge_T_2; // @[\\src\\main\\scala\\VendingMachine.scala 218:58]
  assign uart_io_alarm = buyFallingEdge & fsm_io_alarm; // @[\\src\\main\\scala\\VendingMachine.scala 219:37]
  assign uart_io_empty = canEmpty & ~uart_io_empty_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:47]
  assign uart_io_full = showFull & ~uart_io_full_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:47]
  assign uart_io_rtnCoin = fsm_io_coinBeingRejected & ~uart_io_rtnCoin_REG; // @[\\src\\main\\scala\\VendingMachine.scala 86:47]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 29:27]
      totalMoney <= 8'h0; // @[\\src\\main\\scala\\VendingMachine.scala 29:27]
    end else if (fsm_io_signalCoin2) begin // @[\\src\\main\\scala\\VendingMachine.scala 148:28]
      if (_T_21) begin // @[\\src\\main\\scala\\VendingMachine.scala 149:30]
        totalMoney <= _totalMoney_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 150:18]
      end
    end else if (fsm_io_signalCoin5) begin // @[\\src\\main\\scala\\VendingMachine.scala 154:35]
      if (_T_23) begin // @[\\src\\main\\scala\\VendingMachine.scala 155:30]
        totalMoney <= _totalMoney_T_3; // @[\\src\\main\\scala\\VendingMachine.scala 156:18]
      end
    end else if (fsm_io_signalSub) begin // @[\\src\\main\\scala\\VendingMachine.scala 160:33]
      totalMoney <= _totalMoney_T_5; // @[\\src\\main\\scala\\VendingMachine.scala 161:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 55:29]
      blinkCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 55:29]
    end else if (blinkCounter == 32'h17d7840) begin // @[\\src\\main\\scala\\VendingMachine.scala 111:36]
      blinkCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 112:18]
    end else begin
      blinkCounter <= _blinkCounter_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 110:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 56:25]
      blinkReg <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 56:25]
    end else if (blinkCounter == 32'h17d7840) begin // @[\\src\\main\\scala\\VendingMachine.scala 111:36]
      blinkReg <= ~blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 113:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 59:23]
      cntReg <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 59:23]
    end else if (cntReg == 32'h1869f) begin // @[\\src\\main\\scala\\VendingMachine.scala 166:27]
      cntReg <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 167:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 165:10]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 60:23]
      selReg <= 2'h0; // @[\\src\\main\\scala\\VendingMachine.scala 60:23]
    end else if (cntReg == 32'h1869f) begin // @[\\src\\main\\scala\\VendingMachine.scala 166:27]
      selReg <= _selReg_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 168:12]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 64:27]
      coin2Count <= 6'h0; // @[\\src\\main\\scala\\VendingMachine.scala 64:27]
    end else if (fsm_io_signalCoin2 & totalMoney <= 8'h61) begin // @[\\src\\main\\scala\\VendingMachine.scala 133:50]
      coin2Count <= _coin2Count_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 134:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 65:27]
      coin5Count <= 6'h0; // @[\\src\\main\\scala\\VendingMachine.scala 65:27]
    end else if (fsm_io_signalCoin5 & totalMoney <= 8'h5e) begin // @[\\src\\main\\scala\\VendingMachine.scala 136:50]
      coin5Count <= _coin5Count_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 137:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 67:33]
      fullDisplayCount <= 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 67:33]
    end else if (blinkReg & ~REG_2 & showFull) begin // @[\\src\\main\\scala\\VendingMachine.scala 73:52]
      fullDisplayCount <= _fullDisplayCount_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 74:22]
    end else if (_T_10 & coinFull | _T_13 & coinFull) begin // @[\\src\\main\\scala\\VendingMachine.scala 70:82]
      fullDisplayCount <= 4'ha; // @[\\src\\main\\scala\\VendingMachine.scala 71:22]
    end
    REG <= io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
    REG_1 <= io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
    REG_2 <= blinkReg; // @[\\src\\main\\scala\\VendingMachine.scala 73:28]
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 79:25]
      canCount <= 5'h14; // @[\\src\\main\\scala\\VendingMachine.scala 79:25]
    end else if (buyFallingEdge & fsm_io_releaseCan & _coin2Edge_T_2) begin // @[\\src\\main\\scala\\VendingMachine.scala 140:58]
      canCount <= _canCount_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 141:14]
    end
    buyFallingEdge_REG <= io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 81:42]
    coin2Edge_REG <= io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
    coin5Edge_REG <= io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
    buyEdge_REG <= io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 98:30]
      rejectCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 98:30]
    end else if (rejectCounter == 32'h5f5e10) begin // @[\\src\\main\\scala\\VendingMachine.scala 102:38]
      rejectCounter <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 103:19]
    end else begin
      rejectCounter <= _rejectCounter_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 101:17]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 99:26]
      rejectReg <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 99:26]
    end else if (rejectCounter == 32'h5f5e10) begin // @[\\src\\main\\scala\\VendingMachine.scala 102:38]
      rejectReg <= ~rejectReg; // @[\\src\\main\\scala\\VendingMachine.scala 104:15]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 146:36]
      fsm_io_inpCoinBeingRej_REG <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 146:36]
    end else if (fsm_io_signalCoin2) begin // @[\\src\\main\\scala\\VendingMachine.scala 148:28]
      if (_T_21) begin // @[\\src\\main\\scala\\VendingMachine.scala 149:30]
        fsm_io_inpCoinBeingRej_REG <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 145:31]
      end else begin
        fsm_io_inpCoinBeingRej_REG <= 1'h1; // @[\\src\\main\\scala\\VendingMachine.scala 152:18]
      end
    end else begin
      fsm_io_inpCoinBeingRej_REG <= _GEN_24;
    end
    uart_io_empty_REG <= canCount == 5'h0; // @[\\src\\main\\scala\\VendingMachine.scala 80:27]
    uart_io_full_REG <= fullDisplayCount > 4'h0; // @[\\src\\main\\scala\\VendingMachine.scala 68:35]
    uart_io_rtnCoin_REG <= fsm_io_coinBeingRejected; // @[\\src\\main\\scala\\VendingMachine.scala 86:58]
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
  _RAND_19 = {1{`RANDOM}};
  uart_io_empty_REG = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  uart_io_full_REG = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uart_io_rtnCoin_REG = _RAND_21[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
