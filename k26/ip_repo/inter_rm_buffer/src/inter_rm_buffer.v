// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
`timescale 1 ns / 1 ps
module inter_rm_buffer (
input                 clk,
input                 resetn,

input                 s_axi_inter_rm_awvalid,
output reg            s_axi_inter_rm_awready,
input  [29:0]         s_axi_inter_rm_awaddr,
input  [7:0]          s_axi_inter_rm_awlen,
input  [2:0]          s_axi_inter_rm_awsize,
input  [1:0]          s_axi_inter_rm_awburst,
input  [1:0]          s_axi_inter_rm_awlock,
input  [3:0]          s_axi_inter_rm_awcache,
input  [2:0]          s_axi_inter_rm_awprot,
input  [3:0]          s_axi_inter_rm_awqos,
input  [3:0]          s_axi_inter_rm_awregion,
input                 s_axi_inter_rm_wvalid,
output reg            s_axi_inter_rm_wready,
input  [127:0]        s_axi_inter_rm_wdata,
input  [15:0]         s_axi_inter_rm_wstrb,
input                 s_axi_inter_rm_wlast,
output reg            s_axi_inter_rm_bvalid,
input                 s_axi_inter_rm_bready,
output reg [1:0]      s_axi_inter_rm_bresp = 2'b0,
input                 s_axi_inter_rm_arvalid,
output reg            s_axi_inter_rm_arready,
input  [29:0]         s_axi_inter_rm_araddr,
input  [7:0]          s_axi_inter_rm_arlen,
input  [2:0]          s_axi_inter_rm_arsize,
input  [1:0]          s_axi_inter_rm_arburst,
input  [1:0]          s_axi_inter_rm_arlock,
input  [3:0]          s_axi_inter_rm_arcache,
input  [2:0]          s_axi_inter_rm_arprot,
input  [3:0]          s_axi_inter_rm_arqos,
input  [3:0]          s_axi_inter_rm_arregion,
output reg            s_axi_inter_rm_rvalid,
input                 s_axi_inter_rm_rready,
output wire [127:0]   s_axi_inter_rm_rdata,
output wire           s_axi_inter_rm_rlast,
output reg [1:0]      s_axi_inter_rm_rresp = 2'b0
);

wire [127:0]        axis_in_tdata;
reg                 axis_in_tvalid;
wire                axis_in_tready;
wire [15:0]         axis_in_tkeep;
wire [0:0]          axis_in_tlast;

wire [127:0]        axis_out_tdata;
wire                axis_out_tvalid;
reg                 axis_out_tready;
wire [15:0]         axis_out_tkeep;
wire [0:0]          axis_out_tlast;

//AXI Write Channel
reg [1:0] axi_wr_state = 0;
localparam w_reset = 2'b00;
localparam aw_hs   = 2'b01;
localparam w_hs    = 2'b10;
localparam b_hs    = 2'b11;

always @(posedge clk)
begin
  if (~resetn)
  begin
    axi_wr_state <= w_reset;
  end
  else
  begin  //~reset
    case(axi_wr_state)
      
      w_reset : axi_wr_state <= aw_hs;

      aw_hs   : if (s_axi_inter_rm_awvalid && s_axi_inter_rm_awready)
                begin
                  axi_wr_state <= w_hs;
                end

      w_hs    : if (s_axi_inter_rm_wvalid && s_axi_inter_rm_wready)
                begin
                  if (s_axi_inter_rm_wlast)
                    axi_wr_state <= b_hs;
                end

      b_hs    : if (s_axi_inter_rm_bvalid && s_axi_inter_rm_bready)
                begin
                  axi_wr_state <= aw_hs;
                end

      default : axi_wr_state <= aw_hs;
    endcase
  end  //~reset
end

always @(*)
begin
  s_axi_inter_rm_awready <= 1'b0;
  axis_in_tvalid         <= 1'b0;
  s_axi_inter_rm_wready  <= 1'b0;
  s_axi_inter_rm_bvalid  <= 1'b0;
  case (axi_wr_state)
    aw_hs   : s_axi_inter_rm_awready  <= 1'b1;
    w_hs    : begin
                axis_in_tvalid        <= s_axi_inter_rm_wvalid;
                s_axi_inter_rm_wready <= axis_in_tready;
              end
    b_hs    : s_axi_inter_rm_bvalid   <= 1'b1;
  endcase
end
assign axis_in_tdata = s_axi_inter_rm_wdata;
assign axis_in_tkeep = s_axi_inter_rm_wstrb;
assign axis_in_tlast = s_axi_inter_rm_wlast;

//AXI Read Channel
reg [1:0] axi_rd_state = 0;
localparam r_reset       = 2'h0;
localparam ar_hs         = 2'h1;
localparam r_hs          = 2'h2;

always @(posedge clk)
begin
  if (~resetn)
  begin
    axi_rd_state <= r_reset;
  end
  else
  begin  //~reset
    case(axi_rd_state)
      
      r_reset : axi_rd_state <= ar_hs;

      ar_hs   : if (s_axi_inter_rm_arvalid && s_axi_inter_rm_arready)
                begin
                  axi_rd_state <= r_hs;
                end

      r_hs    : if (s_axi_inter_rm_rvalid && s_axi_inter_rm_rready && s_axi_inter_rm_rlast)
                begin
                  axi_rd_state <= ar_hs;
                end

      default : axi_rd_state <= ar_hs;
    endcase
  end  //~reset
end

always @(*)
begin
  s_axi_inter_rm_arready  <= 1'b0;
  s_axi_inter_rm_rvalid   <= 1'b0;
  axis_out_tready          <= 1'b0;
  
  case (axi_rd_state)
    ar_hs : begin
              s_axi_inter_rm_arready  <= 1'b1;
            end
    r_hs  : begin
              s_axi_inter_rm_rvalid <= axis_out_tvalid;
              axis_out_tready       <= s_axi_inter_rm_rready;
           end
  endcase
end
assign s_axi_inter_rm_rdata = axis_out_tdata;
assign s_axi_inter_rm_rlast = axis_out_tlast;


ir_buffer i_ir_buffer (
  .s_axis_aresetn(resetn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid (axis_in_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready (axis_in_tready),    // output wire s_axis_tready
  .s_axis_tdata  (axis_in_tdata),      // input wire [127 : 0] s_axis_tdata
//  .s_axis_tkeep  (axis_in_tkeep),      // input wire [15 : 0] s_axis_tkeep
  .s_axis_tlast  (axis_in_tlast),      // input wire s_axis_tlast

  .m_axis_tvalid (axis_out_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready (axis_out_tready),    // input wire m_axis_tready
  .m_axis_tdata  (axis_out_tdata),      // output wire [127 : 0] m_axis_tdata
//  .m_axis_tkeep  (axis_out_tkeep),      // output wire [15 : 0] m_axis_tkeep
  .m_axis_tlast  (axis_out_tlast)      // output wire m_axis_tlast
);
endmodule
