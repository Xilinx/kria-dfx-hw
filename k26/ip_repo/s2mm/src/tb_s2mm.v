// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2020 12:32:53 PM
// Design Name: 
// Module Name: tb
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


module tb_s2mm(

    );
    
    
    
    reg clk = 0;
    
    always @(*)
      clk <= #1 ~clk;
      
      
reg[15:0] resetn_reg = 0;
wire resetn;
wire send_data;
always @(posedge clk)
  resetn_reg <= {resetn_reg[14:0], 1'b1};

assign resetn    = resetn_reg[12];
assign send_data = resetn_reg[15];
		
      initial begin
  wait(send_data == 1);
  @(posedge clk);
	  
  axilite_wr(16'h10, 32'hc000_0000); //s2mm addr 
  axilite_wr(16'h18, 32'd6); //s2m size
  axilite_wr(16'h0, 32'h1); //ap start
  axis128_wr(16'd48, 128'hffee_ddcc_bbaa_0099_8877_6655_4433_2211);
  axis128_wr(16'd48, 128'heeff_ccdd_bbaa_0099_8877_6655_4433_2211);

      end
      
	  
	  reg [127:0] axis_in_tdata = 0;
	  reg [15:0]  axis_in_tkeep = 16'hFFFF;
	  reg         axis_in_tlast=0;
	  reg         axis_in_tvalid= 0;
	  wire        axis_in_tready;
	  
	  
reg [15:0]   s_axi_araddr  = 0;
wire        s_axi_arready;
reg         s_axi_arvalid = 0;
wire [31:0] s_axi_rdata  ;
reg         s_axi_rready =1;
wire [1:0]  s_axi_rresp  ;
wire        s_axi_rvalid ;

reg [15:0]   s_axi_awaddr =0;
wire        s_axi_awready;
reg         s_axi_awvalid = 0;
reg         s_axi_bready = 1;
wire        s_axi_bresp  ;
wire        s_axi_bvalid ;
reg [31:0]  s_axi_wdata  = 0;
wire        s_axi_wready ;
reg [3:0]   s_axi_wstrb   = 0;
reg         s_axi_wvalid  = 0;
	    
  design_1 design_1_i
       (.resetn(resetn),
        .axis_in_tdata(axis_in_tdata),
        .axis_in_tkeep(axis_in_tkeep),
        .axis_in_tlast(axis_in_tlast),
        .axis_in_tready(axis_in_tready),
        .axis_in_tvalid(axis_in_tvalid),
        .clk(clk),
        .s_axi_control_araddr (s_axi_araddr ),
        .s_axi_control_arready(s_axi_arready),
        .s_axi_control_arvalid(s_axi_arvalid),
        .s_axi_control_awaddr (s_axi_awaddr ),
        .s_axi_control_awready(s_axi_awready),
        .s_axi_control_awvalid(s_axi_awvalid),
        .s_axi_control_bready (s_axi_bready ),
        .s_axi_control_bresp  (s_axi_bresp  ),
        .s_axi_control_bvalid (s_axi_bvalid ),
        .s_axi_control_rdata  (s_axi_rdata  ),
        .s_axi_control_rready (s_axi_rready ),
        .s_axi_control_rresp  (s_axi_rresp  ),
        .s_axi_control_rvalid (s_axi_rvalid ),
        .s_axi_control_wdata  (s_axi_wdata  ),
        .s_axi_control_wready (s_axi_wready ),
        .s_axi_control_wstrb  (s_axi_wstrb  ),
        .s_axi_control_wvalid (s_axi_wvalid ));	
		
//Task to write given data at the given address using axilite interface
task axilite_wr;
input [15:0]  address;
input [31:0]  data;
  begin
    @(posedge clk)
      s_axi_awaddr  <= address;
	  s_axi_awvalid <= 1'b1;
      wait((s_axi_awvalid && s_axi_awready) ==1);
    @(posedge clk)
      s_axi_awvalid <= 1'b0;
	  s_axi_wdata <= data;
	  s_axi_wstrb <= 4'hF;
	  s_axi_wvalid <= 1'b1;
      wait((s_axi_wvalid && s_axi_wready) ==1);
    @(posedge clk)
	  s_axi_wvalid <= 1'b0;
      wait ((s_axi_bvalid && s_axi_bready) == 1);
    @(posedge clk);
  end
endtask


task axis128_wr;
  input [15:0]  num_bytes;
  input [127:0] start_data;
  reg [15:0] num_iterations;
  reg [15:0] iter_count;
  begin
    $display("--------------------Inside AXIS write function------------------");
    num_iterations = num_bytes >> 4;
    iter_count = 0;
    $display("--------------------No. of iterations = %d----------------------", num_iterations);
    repeat (num_iterations) begin
	    axis_in_tvalid <= 1'b1;
            axis_in_tdata  <= axis_in_tdata + start_data;
            axis_in_tlast  <= (iter_count == (num_iterations-1)) ? 1'b1 : 1'b0;
            iter_count <= iter_count + 1'b1;
//	    @(posedge clk);
	      wait ((axis_in_tvalid && axis_in_tready && ~clk) == 1);
	    @(posedge clk);
            $display("axis_in_tdata = %32h", axis_in_tdata);
    end  //repeat
      axis_in_tvalid <= 1'b0;
      axis_in_tlast  <= 1'b0;
    $display("-------------------Exiting AXIS write function--------------------");
  end
endtask		
		
endmodule
