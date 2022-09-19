// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2020 07:42:33 AM
// Design Name: 
// Module Name: axisMask
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axisMask(
input clk,
input resetn,

input [31:0]       in_AXIS_tdata,
input              in_AXIS_tvalid,
input              in_AXIS_tlast,
output wire        in_AXIS_tready,

output wire [23:0] out_AXIS_tdata,
output wire        out_AXIS_tvalid,
output wire        out_AXIS_tlast,
input              out_AXIS_tready
);

(* KEEP = "TRUE" *) wire [31:0] tmp;


assign tmp = in_AXIS_tdata;
assign out_AXIS_tdata  = tmp[23:0];
assign out_AXIS_tvalid = in_AXIS_tvalid;
assign out_AXIS_tlast  = in_AXIS_tlast;
assign in_AXIS_tready  = out_AXIS_tready;

endmodule