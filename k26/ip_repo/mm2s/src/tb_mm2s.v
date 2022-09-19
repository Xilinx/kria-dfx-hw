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


module tb_mm2s(

    );
    
    
reg clk = 1;

always @(*)
  clk <= #2 ~clk;
      
reg[15:0] resetn_reg = 0;
wire resetn;
wire send_data;
always @(posedge clk)
  resetn_reg <= {resetn_reg[14:0], 1'b1};

assign resetn    = resetn_reg[12];
assign send_data = resetn_reg[15];
      
reg[31:0] reg_data;
initial begin
  wait(send_data == 1);
  @(posedge clk);

  axilite_wr(16'h10, 32'h4000); //mm2s
  axilite_wr(16'h18, 32'd6);
  axilite_wr(16'h00, 32'h1); //ap start
  
  wait(axis_out_tvalid && axis_out_tready && axis_out_tlast == 1'b1);
  @(posedge clk);
    
  axilite_wr(16'h10, 32'h4200); //mm2s
  axilite_wr(16'h18, 32'd1028);
  axilite_wr(16'h00, 32'h1); //ap start
end
	  
	  wire [127:0] axis_out_tdata;
	  wire [15:0]  axis_out_tkeep;
	  wire         axis_out_tlast;
	  wire         axis_out_tvalid;
	  reg          axis_out_tready = 1'b1;
	  
	  
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
       (.axis_out_tdata(axis_out_tdata),
        .axis_out_tkeep(axis_out_tkeep),
        .axis_out_tlast(axis_out_tlast),
        .axis_out_tready(axis_out_tready),
        .axis_out_tvalid(axis_out_tvalid),
        .clk(clk),
        .resetn(resetn),
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
endmodule
