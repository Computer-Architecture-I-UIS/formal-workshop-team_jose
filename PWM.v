module PWM(
  input        clock,
  input        reset,
  input  [7:0] io_periodCounter,
  input        io_en,
  input  [7:0] io_dutyCicle,
  output       io_out,
  output [7:0] io_contador
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] x; // @[PWM.scala 15:24]
  wire [7:0] _T_1 = x + 8'h1; // @[PWM.scala 19:24]
  wire  _T_2 = x <= io_dutyCicle; // @[PWM.scala 20:23]
  wire  _T_3 = x > 8'h0; // @[PWM.scala 20:41]
  wire  _T_4 = _T_2 & _T_3; // @[PWM.scala 20:38]
  wire  _T_5 = x < io_periodCounter; // @[PWM.scala 22:29]
  wire  _T_6 = x > io_dutyCicle; // @[PWM.scala 22:51]
  wire  _T_7 = _T_5 & _T_6; // @[PWM.scala 22:48]
  assign io_out = io_en & _T_4; // @[PWM.scala 17:16 PWM.scala 21:32 PWM.scala 23:32 PWM.scala 26:32 PWM.scala 29:24]
  assign io_contador = x; // @[PWM.scala 16:21]
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
  x = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      x <= 8'h0;
    end else if (io_en) begin
      if (_T_4) begin
        x <= _T_1;
      end else if (_T_7) begin
        x <= _T_1;
      end else begin
        x <= 8'h1;
      end
    end
  end
endmodule
