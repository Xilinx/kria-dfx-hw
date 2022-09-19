// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// ==============================================================
`timescale 1 ns / 1 ps

module pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1_DSP48_12(
    input clk,
    input rst,
    input ce,
    input  [12 - 1:0] in0,
    input  [9 - 1:0] in1,
    input  [21 - 1:0] in2,
    output [22 - 1:0]  dout);

wire signed [27 - 1:0]     a;
wire signed [18 - 1:0]     b;
wire signed [48 - 1:0]     c;
wire signed [45 - 1:0]     m;
wire signed [48 - 1:0]     p;
reg  signed [45 - 1:0]     m_reg;
reg  signed [27 - 1:0]     a_reg;
reg  signed [18 - 1:0]     b_reg;
reg  signed [48 - 1:0]     p_reg;

assign a  = $unsigned(in0);
assign b  = $signed(in1);
assign c  = $signed(in2);

assign m  = a_reg * b_reg;
assign p  = m_reg + c;

always @(posedge clk) begin
    if (ce) begin
        m_reg  <= m;
        a_reg  <= a;
        b_reg  <= b;
        p_reg  <= p;
    end
end

assign dout = p_reg;

endmodule
`timescale 1 ns / 1 ps
module pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    din2,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter din2_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[din2_WIDTH - 1:0] din2;
output[dout_WIDTH - 1:0] dout;



pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1_DSP48_12 pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1_DSP48_12_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .in0( din0 ),
    .in1( din1 ),
    .in2( din2 ),
    .dout( dout ));

endmodule

