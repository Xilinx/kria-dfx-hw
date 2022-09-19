// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// ==============================================================
`timescale 1 ns / 1 ps
module pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_line_buffer_V_RAM_1WNR_AUTO_1R1W (address0, ce0, d0, we0, q0, address1, ce1, q1,  reset, clk);

parameter DataWidth = 24;
parameter AddressWidth = 12;
parameter AddressRange = 3840;

input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0;
output reg[DataWidth-1:0] q0;
input[AddressWidth-1:0] address1;
input ce1;
output reg[DataWidth-1:0] q1;
input reset;
input clk;

(* ram_style = "auto" *)reg [DataWidth-1:0] ram0[0:AddressRange-1];



always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram0[address0] <= d0; 
        q0 <= ram0[address0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        q1 <= ram0[address1];
    end
end


endmodule

