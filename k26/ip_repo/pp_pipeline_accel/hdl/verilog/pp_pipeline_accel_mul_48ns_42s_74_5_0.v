// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// ==============================================================

`timescale 1 ns / 1 ps

module pp_pipeline_accel_mul_48ns_42s_74_5_0(clk, ce, reset, din0, din1, dout);
parameter ID = 1;
parameter NUM_STAGE = 4;
parameter din0_WIDTH = 14;
parameter din1_WIDTH = 12;
parameter dout_WIDTH = 26;
input clk;
input ce;
input reset;
input[din0_WIDTH - 1 : 0] din0; 
input[din1_WIDTH - 1 : 0] din1; 
output[dout_WIDTH - 1 : 0] dout;

reg [din0_WIDTH - 1 : 0] a_reg0;
reg signed [din1_WIDTH - 1 : 0] b_reg0;
wire signed [dout_WIDTH - 1 : 0] tmp_product;
reg signed [dout_WIDTH - 1 : 0] buff0;
reg signed [dout_WIDTH - 1 : 0] buff1;
reg signed [dout_WIDTH - 1 : 0] buff2;

assign dout = buff2;
assign tmp_product = $signed({1'b0, a_reg0}) * b_reg0;
always @ (posedge clk) begin
    if (ce) begin
        a_reg0 <= din0;
        b_reg0 <= din1;
        buff0 <= tmp_product;
        buff1 <= buff0;
        buff2 <= buff1;
    end
end
endmodule
