// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// ==============================================================
`timescale 1 ns / 1 ps
(* rom_style = "distributed" *) module testDec_updateKey_decipher_0_ssbox_ROM_NP_LUTRAM_1R (
address0, ce0, q0, address1, ce1, q1, address2, ce2, q2, address3, ce3, q3, reset,clk);

parameter DataWidth = 8;
parameter AddressWidth = 8;
parameter AddressRange = 256;

input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;
input[AddressWidth-1:0] address1;
input ce1;
output reg[DataWidth-1:0] q1;
input[AddressWidth-1:0] address2;
input ce2;
output reg[DataWidth-1:0] q2;
input[AddressWidth-1:0] address3;
input ce3;
output reg[DataWidth-1:0] q3;
input reset;
input clk;

(* ram_style = "distributed" *)reg [DataWidth-1:0] ram0[0:AddressRange-1];
(* ram_style = "distributed" *)reg [DataWidth-1:0] ram1[0:AddressRange-1];

initial begin
    $readmemh("./testDec_updateKey_decipher_0_ssbox_ROM_NP_LUTRAM_1R.dat", ram0);
    $readmemh("./testDec_updateKey_decipher_0_ssbox_ROM_NP_LUTRAM_1R.dat", ram1);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram0[address0];
    end
end



always @(posedge clk)  
begin 
    if (ce1) 
    begin
        q1 <= ram0[address1];
    end
end



always @(posedge clk)  
begin 
    if (ce2) 
    begin
        q2 <= ram1[address2];
    end
end



always @(posedge clk)  
begin 
    if (ce3) 
    begin
        q3 <= ram1[address3];
    end
end



endmodule

