// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// ==============================================================

`timescale 1 ns / 1 ps

module pp_pipeline_accel_mul_31ns_21ns_52_2_1(clk, ce, reset, din0, din1, dout);
parameter ID = 1;
parameter NUM_STAGE = 1;
parameter din0_WIDTH = 14;
parameter din1_WIDTH = 12;
parameter dout_WIDTH = 26;
input clk;
input ce;
input reset;
input [din0_WIDTH - 1 : 0] din0;
input [din1_WIDTH - 1 : 0] din1;
output[dout_WIDTH - 1 : 0] dout;
reg signed [dout_WIDTH - 1 : 0] dout;
wire [dout_WIDTH - 1 : 0] tmp_product;

assign tmp_product = din0 * din1;
always @ (posedge clk) begin
    if (ce) begin
        dout <= tmp_product;
    end
end
endmodule
