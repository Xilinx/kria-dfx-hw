// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
`timescale 1 ns / 1 ps

	module outputbits_selector_v1_0 #
	(
		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 128,

		// Parameters of Axi Slave Bus Interface S01_AXIS
		parameter integer C_S01_AXIS_TDATA_WIDTH	= 160,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 128
	)
	(
	    input aclk,
		input aresetn,
		
		// Ports of Axi Slave Bus Interface S00_AXIS
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tkeep,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Slave Bus Interface S01_AXIS
		output wire  s01_axis_tready,
		input wire [C_S01_AXIS_TDATA_WIDTH-1 : 0] s01_axis_tdata,
		input wire  s01_axis_tuser,
		input wire  s01_axis_tlast,
		input wire  s01_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire  m00_axis_tuser,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
	// Add user logic here
	assign m00_axis_tuser = s01_axis_tuser;
	assign m00_axis_tlast = s01_axis_tlast;
	assign m00_axis_tvalid = s01_axis_tvalid;
	assign s01_axis_tready = m00_axis_tready;
	
	reg s00_axis_tready_int;
	reg resetn_reg=0;
	reg resetn_reg1=0;
	always@(posedge aclk)
	begin 
	   resetn_reg <= aresetn;
	   resetn_reg1 <= resetn_reg;
	end
    assign reset_pulse = resetn_reg & ~resetn_reg1;
    
    always@(posedge aclk)
    begin 
       if (~aresetn)
        s00_axis_tready_int <= 0;
        else
        begin
          
        if(reset_pulse)
            s00_axis_tready_int <=1;
        else
        begin
            if(s01_axis_tvalid)
            begin
                s00_axis_tready_int <=0;
                if(s01_axis_tready && s01_axis_tlast)
                    s00_axis_tready_int <=1;
            end
         end   
        end
    end
    
	assign s00_axis_tready = s00_axis_tready_int && ~s01_axis_tvalid;
	reg [3:0] in_tdata=0;
	always @(posedge aclk)
    begin
        if(~aresetn)
            in_tdata <= 4'hE;
        else
        begin    
            if (s00_axis_tvalid && s00_axis_tready)
            begin
            in_tdata <= s00_axis_tdata;
            end  
        end  
    end
    
	reg [127:0] out_tdata=0;
	assign m00_axis_tdata = out_tdata;
    
    always@(*)
    begin
        out_tdata[127:0] <= 128'h0;
        
        if(in_tdata[3:0]==4'hC)
        begin
            out_tdata[15:0] <= s01_axis_tdata[20:5];
            out_tdata[47:32] <= s01_axis_tdata[60:45];
            out_tdata[79:64] <= s01_axis_tdata[100:85];
            out_tdata[111:96] <= s01_axis_tdata[140:125]; 
        end    
        
        if(in_tdata[3:0]==4'hD)
        begin
            out_tdata[15:0] <= s01_axis_tdata[21:6];
            out_tdata[47:32] <= s01_axis_tdata[61:46];
            out_tdata[79:64] <= s01_axis_tdata[101:86];
            out_tdata[111:96] <= s01_axis_tdata[141:126]; 
        end
        
        if(in_tdata[3:0]==4'hE)
        begin
            out_tdata[15:0] <= s01_axis_tdata[22:7];
            out_tdata[47:32] <= s01_axis_tdata[62:47];
            out_tdata[79:64] <= s01_axis_tdata[102:87];
            out_tdata[111:96] <= s01_axis_tdata[142:127]; 
        end
    
        if(in_tdata[3:0]==4'hF)
        begin
            out_tdata[15:0] <= s01_axis_tdata[23:8];
            out_tdata[47:32] <= s01_axis_tdata[63:48];
            out_tdata[79:64] <= s01_axis_tdata[103:88];
            out_tdata[111:96] <= s01_axis_tdata[143:128]; 
        end
    end
	// User logic ends
	endmodule
