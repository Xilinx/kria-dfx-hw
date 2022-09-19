// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// ==============================================================
`timescale 1 ns / 1 ps
module testDec_updateKey_Rcon_ROM_AUTO_1R (
address0, ce0, q0, reset,clk);

parameter DataWidth = 8;
parameter AddressWidth = 4;
parameter AddressRange = 10;

input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;
input reset;
input clk;

reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./testDec_updateKey_Rcon_ROM_AUTO_1R.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[address0];
    end
end



endmodule

