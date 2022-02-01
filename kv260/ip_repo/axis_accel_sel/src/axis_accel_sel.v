`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Deeksha
// 
// Create Date: 08/04/2020 02:12:57 AM
// Design Name: 
// Module Name: axis_accel_sel
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


module axis_accel_sel(
input USE_ENC,
input ap_clk,
input ap_start,
output ap_done,
input [127:0] in_V_TDATA,
input in_V_TVALID,
output in_V_TREADY,

output [127:0] in_V_enc_TDATA,
output in_V_enc_TVALID,
input in_V_enc_TREADY,

output [127:0] in_V_dec_TDATA,
output in_V_dec_TVALID,
input in_V_dec_TREADY,

input [127 : 0] out_V_dec_TDATA,
input out_V_dec_TVALID,
output wire out_V_dec_TREADY,

input [127 : 0] out_V_enc_TDATA,
input out_V_enc_TVALID,
output wire out_V_enc_TREADY,

output [127 : 0] out_V_TDATA,
output out_V_TVALID,
input out_V_TREADY,

output ap_start_enc, ap_start_dec,
input ap_done_enc, ap_done_dec
);

assign out_V_TDATA = USE_ENC ? out_V_enc_TDATA : out_V_dec_TDATA;
assign out_V_TVALID = USE_ENC ? out_V_enc_TVALID : out_V_dec_TVALID;
assign in_V_TREADY = USE_ENC ? in_V_enc_TREADY : in_V_dec_TREADY;

assign in_V_dec_TVALID = USE_ENC ? 0 : in_V_TVALID;
assign out_V_dec_TREADY = USE_ENC ? 0 : out_V_TREADY;

assign in_V_enc_TVALID = USE_ENC ? in_V_TVALID : 0;
assign out_V_enc_TREADY = USE_ENC ? out_V_TREADY : 0;

assign ap_done = USE_ENC ? ap_done_enc : ap_done_dec;
assign ap_start_enc = USE_ENC ? ap_start :0 ;
assign ap_start_dec = USE_ENC ? 0 : ap_start;

assign in_V_dec_TDATA = in_V_TDATA;
assign in_V_enc_TDATA = in_V_TDATA;

assign out_V_TDATA = USE_ENC ? out_V_enc_TDATA : out_V_dec_TDATA;

endmodule
