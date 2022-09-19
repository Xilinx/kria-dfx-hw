// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2020 02:37:29 PM
// Design Name: 
// Module Name: channelSelectLogic
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


module channelSelectLogic(
input clk,
input resetn,

input [3:0]        channelSellect_V_din,
output wire        channelSellect_V_full_n,
input              channelSellect_V_write,

output reg         S00_suppress,
output reg         S01_suppress,
output reg         S02_suppress,
output reg         S03_suppress,


input              event_frame_started_0,
input              event_tlast_unexpected_0,
input              event_tlast_missing_0,
input              event_status_channel_halt_0,
input              event_data_in_channel_halt_0,
input              event_data_out_channel_halt_0,
input              event_frame_started_1,
input              event_tlast_unexpected_1,
input              event_tlast_missing_1,
input              event_status_channel_halt_1,
input              event_data_in_channel_halt_1,
input              event_data_out_channel_halt_1,
input              event_frame_started_2,
input              event_tlast_unexpected_2,
input              event_tlast_missing_2,
input              event_status_channel_halt_2,
input              event_data_in_channel_halt_2,
input              event_data_out_channel_halt_2,
input              event_frame_started_3,
input              event_tlast_unexpected_3,
input              event_tlast_missing_3,
input              event_status_channel_halt_3,
input              event_data_in_channel_halt_3,
input              event_data_out_channel_halt_3,

output wire [3:0]  events_frame_started,
output wire [3:0]  events_tlast_unexpected,
output wire [3:0]  events_tlast_missing,
output wire [3:0]  events_status_channel_halt,
output wire [3:0]  events_data_in_channel_halt,
output wire [3:0]  events_data_out_channel_halt
);

assign events_frame_started[0] = event_frame_started_0;
assign events_tlast_unexpected[0] = event_tlast_unexpected_0;
assign events_tlast_missing[0] = event_tlast_missing_0;
assign events_status_channel_halt[0] = event_status_channel_halt_0;
assign events_data_in_channel_halt[0] = event_data_in_channel_halt_0;
assign events_data_out_channel_halt[0] = event_data_out_channel_halt_0;

assign events_frame_started[1] = event_frame_started_1;
assign events_tlast_unexpected[1] = event_tlast_unexpected_1;
assign events_tlast_missing[1] = event_tlast_missing_1;
assign events_status_channel_halt[1] = event_status_channel_halt_1;
assign events_data_in_channel_halt[1] = event_data_in_channel_halt_1;
assign events_data_out_channel_halt[1] = event_data_out_channel_halt_1;

assign events_frame_started[2] = event_frame_started_2;
assign events_tlast_unexpected[2] = event_tlast_unexpected_2;
assign events_tlast_missing[2] = event_tlast_missing_2;
assign events_status_channel_halt[2] = event_status_channel_halt_2;
assign events_data_in_channel_halt[2] = event_data_in_channel_halt_2;
assign events_data_out_channel_halt[2] = event_data_out_channel_halt_2;

assign events_frame_started[3] = event_frame_started_3;
assign events_tlast_unexpected[3] = event_tlast_unexpected_3;
assign events_tlast_missing[3] = event_tlast_missing_3;
assign events_status_channel_halt[3] = event_status_channel_halt_3;
assign events_data_in_channel_halt[3] = event_data_in_channel_halt_3;
assign events_data_out_channel_halt[3] = event_data_out_channel_halt_3;

assign channelSellect_V_full_n = 1;

always @ (posedge clk) begin
    if (resetn == 1'b0) begin
        S00_suppress <= 0;
        S01_suppress <= 0;
        S02_suppress <= 0;
        S03_suppress <= 0;
    end else begin
        if (channelSellect_V_write) begin
            S00_suppress <= channelSellect_V_din[0];
            S01_suppress <= channelSellect_V_din[1];
            S02_suppress <= channelSellect_V_din[2];
            S03_suppress <= channelSellect_V_din[3];
        end
    end
end
endmodule