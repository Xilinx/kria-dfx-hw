// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
/**************************************
* Module: sync
* Date:2014-11-07  
* Author: rdikshi     
*
* Description: 
***************************************/
`timescale 1ps / 1ps

module sync #(
  parameter INITIALISE = 6'b000000,
  parameter WIDTH = 1
)
(
  input        clk,              // clock to be sync'ed to
  input        [WIDTH-1:0]data_in,          // Data to be 'synced'
  output       [WIDTH-1:0]data_out          // synced data
);

  // Internal Signals
  wire [WIDTH-1:0]data_sync1;
  wire [WIDTH-1:0]data_sync2;
  wire [WIDTH-1:0]data_sync3;
  wire [WIDTH-1:0]data_sync4;
  wire [WIDTH-1:0]data_sync5;
  wire [WIDTH-1:0]data_sync6;

genvar ik;
generate
    for (ik = 0; ik < WIDTH; ik = ik + 1) begin : block
           (* shreg_extract = "no", ASYNC_REG = "TRUE" *)
          FD #(
            .INIT (INITIALISE[0])
          ) data_sync_reg1 (
            .C  (clk),
            .D  (data_in[ik]),
            .Q  (data_sync1[ik])
          );
        
        
          (* shreg_extract = "no", ASYNC_REG = "TRUE" *)
          FD #(
           .INIT (INITIALISE[1])
          ) data_sync_reg2 (
          .C  (clk),
          .D  (data_sync1[ik]),
          .Q  (data_sync2[ik])
          );
        
        
          (* shreg_extract = "no", ASYNC_REG = "TRUE" *)
          FD #(
           .INIT (INITIALISE[2])
          ) data_sync_reg3 (
          .C  (clk),
          .D  (data_sync2[ik]),
          .Q  (data_sync3[ik])
          );
        
          (* shreg_extract = "no", ASYNC_REG = "TRUE" *)
          FD #(
           .INIT (INITIALISE[3])
          ) data_sync_reg4 (
          .C  (clk),
          .D  (data_sync3[ik]),
          .Q  (data_sync4[ik])
          );
        
          (* shreg_extract = "no", ASYNC_REG = "TRUE" *)
          FD #(
           .INIT (INITIALISE[4])
          ) data_sync_reg5 (
          .C  (clk),
          .D  (data_sync4[ik]),
          .Q  (data_sync5[ik])
          );
        
          (* shreg_extract = "no", ASYNC_REG = "TRUE" *)
          FD #(
           .INIT (INITIALISE[5])
          ) data_sync_reg6 (
          .C  (clk),
          .D  (data_sync5[ik]),
          .Q  (data_sync6[ik])
          );
          assign data_out[ik] = data_sync3[ik];
    end
endgenerate




endmodule

