// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
`timescale 1 ns / 1 ps
module axiwr_to_axis(
input clk,
input resetn,


input          s_axi_gmem_AWVALID,
output reg     s_axi_gmem_AWREADY,
input  [63:0]  s_axi_gmem_AWADDR,
input  [0:0]   s_axi_gmem_AWID,
input  [7:0]   s_axi_gmem_AWLEN,
input  [2:0]   s_axi_gmem_AWSIZE,
input  [1:0]   s_axi_gmem_AWBURST,
input  [1:0]   s_axi_gmem_AWLOCK,
input  [3:0]   s_axi_gmem_AWCACHE,
input  [2:0]   s_axi_gmem_AWPROT,
input  [3:0]   s_axi_gmem_AWQOS,
input  [3:0]   s_axi_gmem_AWREGION,
input  [31:0]  s_axi_gmem_AWUSER,
input          s_axi_gmem_WVALID,
output reg     s_axi_gmem_WREADY,
input  [127:0] s_axi_gmem_WDATA,
input  [15:0]  s_axi_gmem_WSTRB,
input          s_axi_gmem_WLAST,
input  [0:0]   s_axi_gmem_WID,
//input  [15:0]   s_axi_gmem_WUSER,
input          s_axi_gmem_ARVALID,
output         s_axi_gmem_ARREADY,
input  [63:0]  s_axi_gmem_ARADDR,
input  [0:0]   s_axi_gmem_ARID,
input  [7:0]   s_axi_gmem_ARLEN,
input  [2:0]   s_axi_gmem_ARSIZE,
input  [1:0]   s_axi_gmem_ARBURST,
input  [1:0]   s_axi_gmem_ARLOCK,
input  [3:0]   s_axi_gmem_ARCACHE,
input  [2:0]   s_axi_gmem_ARPROT,
input  [3:0]   s_axi_gmem_ARQOS,
input  [3:0]   s_axi_gmem_ARREGION,
input  [0:0]   s_axi_gmem_ARUSER,
output         s_axi_gmem_RVALID,
input          s_axi_gmem_RREADY,
output  [127:0]  s_axi_gmem_RDATA,
output           s_axi_gmem_RLAST,
output  [0:0]    s_axi_gmem_RID,
//output  [15:0]    s_axi_gmem_RUSER,
output reg [1:0]    s_axi_gmem_RRESP = 2'b0,
output reg       s_axi_gmem_BVALID,
input            s_axi_gmem_BREADY,
output reg [1:0]    s_axi_gmem_BRESP = 2'b0,
output  [0:0]    s_axi_gmem_BID,
output  [0:0]    s_axi_gmem_BUSER,


input  [127:0]  axis_in_TDATA,
input           axis_in_TVALID,
output          axis_in_TREADY,
input  [15:0]   axis_in_TKEEP,
input  [7:0]    axis_in_TID,
input  [7:0]    axis_in_TDEST,
input  [7:0]    axis_in_TUSER,
input  [0:0]    axis_in_TLAST,

output wire [127:0] axis_out_TDATA,
output wire         axis_out_TVALID,
input               axis_out_TREADY,
output wire [15:0]  axis_out_TKEEP,
output wire [7:0]   axis_out_TID,
output wire [7:0]   axis_out_TDEST,
output wire [7:0]   axis_out_TUSER,
output wire [0:0]   axis_out_TLAST,

input select_rm_data  // 0 - to select axis_in, 1 - to select MM
);

//AXI Write Channel
reg [31:0] trfrLenBeats = 0;
reg [31:0] trfrBeatCntr = 0;
reg [1:0] axi_wr_state = 0;
//reg [7:0]  awlen = 0;
localparam w_reset = 2'b00;
localparam aw_hs   = 2'b01;
localparam w_hs    = 2'b10;
localparam b_hs    = 2'b11;

always @(posedge clk)
begin
  if (~resetn)
  begin
    axi_wr_state <= w_reset;
    trfrLenBeats <= 32'h0;
    trfrBeatCntr <= 32'h0;
  end
  else
  begin  //~reset
    case(axi_wr_state)
      
      w_reset : axi_wr_state <= aw_hs;

      aw_hs   : if (s_axi_gmem_AWVALID && s_axi_gmem_AWREADY)
                begin
//                  if (s_axi_gmem_AWUSER != 0)
                  trfrLenBeats <= s_axi_gmem_AWUSER;
                  axi_wr_state <= w_hs;
                end

      w_hs    : if (s_axi_gmem_WVALID && s_axi_gmem_WREADY)
                begin
                  trfrBeatCntr <= trfrBeatCntr + 1'b1;
                  if (s_axi_gmem_WLAST)
                    axi_wr_state <= b_hs;
                end

      b_hs    : if (s_axi_gmem_BVALID && s_axi_gmem_BREADY)
                begin
                  if (trfrBeatCntr == trfrLenBeats)
                    trfrBeatCntr <= 32'h0;
                  axi_wr_state <= aw_hs;
                end

      default : axi_wr_state <= aw_hs;
    endcase
  end  //~reset
end


wire  [127:0]  axis_slot_TDATA;
wire           axis_slot_TVALID;
wire           axis_slot_TREADY;
wire  [15:0]   axis_slot_TKEEP;
wire  [0:0]    axis_slot_TLAST;


wire  [127:0]  axis_slot_fifo_out_TDATA;
wire           axis_slot_fifo_out_TVALID;
wire           axis_slot_fifo_out_TREADY;
wire  [15:0]   axis_slot_fifo_out_TKEEP;
wire  [0:0]    axis_slot_fifo_out_TLAST;

always @(*)
begin
  s_axi_gmem_AWREADY <= 1'b0;
  s_axi_gmem_WREADY  <= 1'b0;
  s_axi_gmem_BVALID  <= 1'b0;
  case (axi_wr_state)
    aw_hs   : s_axi_gmem_AWREADY <= 1'b1;
    w_hs    : s_axi_gmem_WREADY  <= axis_slot_TREADY;
    b_hs    : s_axi_gmem_BVALID  <= 1'b1;
  endcase
end

assign axis_slot_TDATA = s_axi_gmem_WDATA;
assign axis_slot_TVALID = (axi_wr_state == w_hs) ? s_axi_gmem_WVALID : 1'b0;
assign axis_slot_TLAST = (trfrBeatCntr == trfrLenBeats - 1'b1) ? s_axi_gmem_WLAST : 1'b0; //Not gating as gating axis_out_TVALID is sufficient
assign axis_slot_TKEEP = s_axi_gmem_WSTRB; //Not gating as gating axis_out_TVALID is sufficient


axis_data_fifo i_axis_data_fifo (
  .s_axis_aresetn(resetn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(axis_slot_TVALID),    // input wire s_axis_tvalid
  .s_axis_tready(axis_slot_TREADY),    // output wire s_axis_tready
  .s_axis_tdata (axis_slot_TDATA),      // input wire [127 : 0] s_axis_tdata
  .s_axis_tkeep (axis_slot_TKEEP),      // input wire [15 : 0] s_axis_tkeep
  .s_axis_tlast (axis_slot_TLAST),      // input wire s_axis_tlast
  
  .m_axis_tvalid(axis_slot_fifo_out_TVALID),    // output wire m_axis_tvalid
  .m_axis_tready(axis_slot_fifo_out_TREADY),    // input wire m_axis_tready
  .m_axis_tdata (axis_slot_fifo_out_TDATA),      // output wire [127 : 0] m_axis_tdata
  .m_axis_tkeep (axis_slot_fifo_out_TKEEP),      // output wire [15 : 0] m_axis_tkeep
  .m_axis_tlast (axis_slot_fifo_out_TLAST)      // output wire m_axis_tlast
);

assign axis_out_TDATA   = select_rm_data ? axis_slot_fifo_out_TDATA : axis_in_TDATA;
assign axis_out_TVALID  = select_rm_data ? axis_slot_fifo_out_TVALID : axis_in_TVALID;
assign axis_out_TLAST   = select_rm_data ? axis_slot_fifo_out_TLAST : axis_in_TLAST;
assign axis_out_TKEEP   = select_rm_data ? axis_slot_fifo_out_TKEEP: axis_in_TKEEP;
assign axis_out_TID     = select_rm_data ? 8'h0 : axis_in_TID;
assign axis_out_TDEST   = select_rm_data ? 8'h0 : axis_in_TDEST;
assign axis_out_TUSER   = select_rm_data ? 8'h0 : axis_in_TUSER;
assign axis_slot_fifo_out_TREADY = select_rm_data ? axis_out_TREADY : 1'b0;
assign axis_in_TREADY = select_rm_data ? 1'b0 : axis_out_TREADY;

endmodule
