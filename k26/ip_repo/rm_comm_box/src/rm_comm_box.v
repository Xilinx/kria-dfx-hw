// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
`timescale 1 ns / 1 ps
module rm_comm_box #(parameter USE_BUILT_IN_DMA = 1)
(
input                 clk,
input                 resetn,

input                 s_axi_control_AWVALID,
output                s_axi_control_AWREADY,
input  [16:0]         s_axi_control_AWADDR,
input                 s_axi_control_WVALID,
output                s_axi_control_WREADY,
input  [31:0]         s_axi_control_WDATA,
input  [3:0]          s_axi_control_WSTRB,
input                 s_axi_control_ARVALID,
output                s_axi_control_ARREADY,
input  [16:0]         s_axi_control_ARADDR,
output                s_axi_control_RVALID,
input                 s_axi_control_RREADY,
output  [31:0]        s_axi_control_RDATA,
output  [1:0]         s_axi_control_RRESP,
output                s_axi_control_BVALID,
input                 s_axi_control_BREADY,
output  [1:0]         s_axi_control_BRESP,
                      
output                m_axi_gmem_awvalid,
input                 m_axi_gmem_awready,
output  [48:0]        m_axi_gmem_awaddr,
output  [7:0]         m_axi_gmem_awid,
output  [7:0]         m_axi_gmem_awlen,
output  [2:0]         m_axi_gmem_awsize,
output  [1:0]         m_axi_gmem_awburst,
output  [1:0]         m_axi_gmem_awlock,
output  [3:0]         m_axi_gmem_awcache,
output  [2:0]         m_axi_gmem_awprot,
output  [3:0]         m_axi_gmem_awqos,
output  [3:0]         m_axi_gmem_awregion,
output                m_axi_gmem_wvalid,
input                 m_axi_gmem_wready,
output  [127:0]       m_axi_gmem_wdata,
output  [15:0]        m_axi_gmem_wstrb,
output                m_axi_gmem_wlast,
input                 m_axi_gmem_bvalid,
output                m_axi_gmem_bready,
input  [1:0]          m_axi_gmem_bresp,
input  [7:0]          m_axi_gmem_bid,
output                m_axi_gmem_arvalid,
input                 m_axi_gmem_arready,
output  [48:0]        m_axi_gmem_araddr,
output  [7:0]         m_axi_gmem_arid,
output  [7:0]         m_axi_gmem_arlen,
output  [2:0]         m_axi_gmem_arsize,
output  [1:0]         m_axi_gmem_arburst,
output  [1:0]         m_axi_gmem_arlock,
output  [3:0]         m_axi_gmem_arcache,
output  [2:0]         m_axi_gmem_arprot,
output  [3:0]         m_axi_gmem_arqos,
output  [3:0]         m_axi_gmem_arregion,
input                 m_axi_gmem_rvalid,
output                m_axi_gmem_rready,
input  [127:0]        m_axi_gmem_rdata,
input                 m_axi_gmem_rlast,
input  [7:0]          m_axi_gmem_rid,
input  [1:0]          m_axi_gmem_rresp,

//
input  [127:0]        s2mm_axis_TDATA,
input                 s2mm_axis_TVALID,
output                s2mm_axis_TREADY,
input  [15:0]         s2mm_axis_TKEEP,
input  [0:0]          s2mm_axis_TLAST,
input  [7:0]          s2mm_axis_TUSER,
input  [7:0]          s2mm_axis_TID,
input  [7:0]          s2mm_axis_TDEST,
                      
output  [127:0]       mm2s_axis_TDATA,
output                mm2s_axis_TVALID,
input                 mm2s_axis_TREADY,
output  [15:0]        mm2s_axis_TKEEP,
output  [0:0]         mm2s_axis_TLAST,
output  [7:0]         mm2s_axis_TUSER,
output  [7:0]         mm2s_axis_TID,
output  [7:0]         mm2s_axis_TDEST,

input                 s_axi_accel_awvalid,
output                s_axi_accel_awready,
input  [48:0]         s_axi_accel_awaddr,
input  [7:0]          s_axi_accel_awid,
input  [7:0]          s_axi_accel_awlen,
input  [2:0]          s_axi_accel_awsize,
input  [1:0]          s_axi_accel_awburst,
input  [1:0]          s_axi_accel_awlock,
input  [3:0]          s_axi_accel_awcache,
input  [2:0]          s_axi_accel_awprot,
input  [3:0]          s_axi_accel_awqos,
input  [3:0]          s_axi_accel_awregion,
input                 s_axi_accel_wvalid,
output                s_axi_accel_wready,
input  [127:0]        s_axi_accel_wdata,
input  [15:0]         s_axi_accel_wstrb,
input                 s_axi_accel_wlast,
output                s_axi_accel_bvalid,
input                 s_axi_accel_bready,
output  [1:0]         s_axi_accel_bresp,
output  [7:0]         s_axi_accel_bid,
input                 s_axi_accel_arvalid,
output                s_axi_accel_arready,
input  [48:0]         s_axi_accel_araddr,
input  [7:0]          s_axi_accel_arid,
input  [7:0]          s_axi_accel_arlen,
input  [2:0]          s_axi_accel_arsize,
input  [1:0]          s_axi_accel_arburst,
input  [1:0]          s_axi_accel_arlock,
input  [3:0]          s_axi_accel_arcache,
input  [2:0]          s_axi_accel_arprot,
input  [3:0]          s_axi_accel_arqos,
input  [3:0]          s_axi_accel_arregion,
output                s_axi_accel_rvalid,
input                 s_axi_accel_rready,
output     [127:0]    s_axi_accel_rdata,
output                s_axi_accel_rlast,
output [7:0]          s_axi_accel_rid,
output [1:0]          s_axi_accel_rresp,

//output                ap_done_s2mm,
//output                ap_done_mm2s
output wire           interrupt_s2mm,
output wire           interrupt_mm2s
);

wire                s_axi_dma_awvalid;
wire                s_axi_dma_awready;
wire [48:0]         s_axi_dma_awaddr;
wire [0:0]          s_axi_dma_awid;
wire [7:0]          s_axi_dma_awlen;
wire [2:0]          s_axi_dma_awsize;
wire [1:0]          s_axi_dma_awburst;
wire [1:0]          s_axi_dma_awlock;
wire [3:0]          s_axi_dma_awcache;
wire [2:0]          s_axi_dma_awprot;
wire [3:0]          s_axi_dma_awqos;
wire [3:0]          s_axi_dma_awregion;
wire                s_axi_dma_wvalid;
wire                s_axi_dma_wready;
wire [127:0]        s_axi_dma_wdata;
wire [15:0]         s_axi_dma_wstrb;
wire                s_axi_dma_wlast;
wire                s_axi_dma_bvalid;
wire                s_axi_dma_bready;
wire  [1:0]         s_axi_dma_bresp;
wire  [0:0]         s_axi_dma_bid;
wire                s_axi_dma_arvalid;
wire                s_axi_dma_arready;
wire [48:0]         s_axi_dma_araddr;
wire [0:0]          s_axi_dma_arid;
wire [7:0]          s_axi_dma_arlen;
wire [2:0]          s_axi_dma_arsize;
wire [1:0]          s_axi_dma_arburst;
wire [1:0]          s_axi_dma_arlock;
wire [3:0]          s_axi_dma_arcache;
wire [2:0]          s_axi_dma_arprot;
wire [3:0]          s_axi_dma_arqos;
wire [3:0]          s_axi_dma_arregion;
wire                s_axi_dma_rvalid;
wire                s_axi_dma_rready;
wire [127:0]        s_axi_dma_rdata;
wire                s_axi_dma_rlast;
wire [0:0]          s_axi_dma_rid;
wire [1:0]          s_axi_dma_rresp;

generate if (USE_BUILT_IN_DMA == 1)
begin: GenDMA
dma_wrapper i_dma_wrapper(
.clk                        (clk),
.resetn                     (resetn),

.m_axi_gmem_AWVALID         (m_axi_gmem_awvalid),
.m_axi_gmem_AWREADY         (m_axi_gmem_awready),
.m_axi_gmem_AWADDR          (m_axi_gmem_awaddr),
.m_axi_gmem_AWID            (m_axi_gmem_awid),
.m_axi_gmem_AWLEN           (m_axi_gmem_awlen),
.m_axi_gmem_AWSIZE          (m_axi_gmem_awsize),
.m_axi_gmem_AWBURST         (m_axi_gmem_awburst),
.m_axi_gmem_AWLOCK          (m_axi_gmem_awlock),
.m_axi_gmem_AWCACHE         (m_axi_gmem_awcache),
.m_axi_gmem_AWPROT          (m_axi_gmem_awprot),
.m_axi_gmem_AWQOS           (m_axi_gmem_awqos),
.m_axi_gmem_AWREGION        (m_axi_gmem_awregion),
.m_axi_gmem_WVALID          (m_axi_gmem_wvalid),
.m_axi_gmem_WREADY          (m_axi_gmem_wready),
.m_axi_gmem_WDATA           (m_axi_gmem_wdata),
.m_axi_gmem_WSTRB           (m_axi_gmem_wstrb),
.m_axi_gmem_WLAST           (m_axi_gmem_wlast),
.m_axi_gmem_ARVALID         (m_axi_gmem_arvalid),
.m_axi_gmem_ARREADY         (m_axi_gmem_arready),
.m_axi_gmem_ARADDR          (m_axi_gmem_araddr),
.m_axi_gmem_ARID            (m_axi_gmem_arid),
.m_axi_gmem_ARLEN           (m_axi_gmem_arlen),
.m_axi_gmem_ARSIZE          (m_axi_gmem_arsize),
.m_axi_gmem_ARBURST         (m_axi_gmem_arburst),
.m_axi_gmem_ARLOCK          (m_axi_gmem_arlock),
.m_axi_gmem_ARCACHE         (m_axi_gmem_arcache),
.m_axi_gmem_ARPROT          (m_axi_gmem_arprot),
.m_axi_gmem_ARQOS           (m_axi_gmem_arqos),
.m_axi_gmem_ARREGION        (m_axi_gmem_arregion),
.m_axi_gmem_RVALID          (m_axi_gmem_rvalid),
.m_axi_gmem_RREADY          (m_axi_gmem_rready),
.m_axi_gmem_RDATA           (m_axi_gmem_rdata),
.m_axi_gmem_RLAST           (m_axi_gmem_rlast),
.m_axi_gmem_RID             (m_axi_gmem_rid),
.m_axi_gmem_RRESP           (m_axi_gmem_rresp),
.m_axi_gmem_BVALID          (m_axi_gmem_bvalid),
.m_axi_gmem_BREADY          (m_axi_gmem_bready),
.m_axi_gmem_BRESP           (m_axi_gmem_bresp),
.m_axi_gmem_BID             (m_axi_gmem_bid),

.axis_in_TDATA              (s2mm_axis_TDATA),
.axis_in_TVALID             (s2mm_axis_TVALID),
.axis_in_TREADY             (s2mm_axis_TREADY),
.axis_in_TKEEP              (s2mm_axis_TKEEP),
.axis_in_TLAST              (s2mm_axis_TLAST),
.axis_in_TUSER              (s2mm_axis_TUSER),
.axis_in_TID                (s2mm_axis_TID),
.axis_in_TDEST              (s2mm_axis_TDEST),

.axis_out_TDATA             (mm2s_axis_TDATA),
.axis_out_TVALID            (mm2s_axis_TVALID),
.axis_out_TREADY            (mm2s_axis_TREADY),
.axis_out_TKEEP             (mm2s_axis_TKEEP),
.axis_out_TLAST             (mm2s_axis_TLAST),
.axis_out_TUSER             (mm2s_axis_TUSER),
.axis_out_TID               (mm2s_axis_TID),
.axis_out_TDEST             (mm2s_axis_TDEST),

.s_axi_control_AWVALID      (s_axi_control_AWVALID ),
.s_axi_control_AWREADY      (s_axi_control_AWREADY ),
.s_axi_control_AWADDR       (s_axi_control_AWADDR  ),
.s_axi_control_WVALID       (s_axi_control_WVALID  ),
.s_axi_control_WREADY       (s_axi_control_WREADY  ),
.s_axi_control_WDATA        (s_axi_control_WDATA   ),
.s_axi_control_WSTRB        (s_axi_control_WSTRB   ),
.s_axi_control_ARVALID      (s_axi_control_ARVALID ),
.s_axi_control_ARREADY      (s_axi_control_ARREADY ),
.s_axi_control_ARADDR       (s_axi_control_ARADDR  ),
.s_axi_control_RVALID       (s_axi_control_RVALID  ),
.s_axi_control_RREADY       (s_axi_control_RREADY  ),
.s_axi_control_RDATA        (s_axi_control_RDATA   ),
.s_axi_control_RRESP        (s_axi_control_RRESP   ),
.s_axi_control_BVALID       (s_axi_control_BVALID  ),
.s_axi_control_BREADY       (s_axi_control_BREADY  ),
.s_axi_control_BRESP        (s_axi_control_BRESP   ),

.ap_done_s2mm               (), //ap_done_s2mm),
.ap_done_mm2s               (), //ap_done_mm2s),
.interrupt_s2mm             (interrupt_s2mm),
.interrupt_mm2s             (interrupt_mm2s)
);
end
else
begin: Passthru
   assign s_axi_control_AWREADY = 1'b1;
   assign s_axi_control_WREADY = 1'b1;
   assign s_axi_control_ARREADY = 1'b1;
   assign s_axi_control_RVALID = 1'b1;
   assign s_axi_control_RDATA = 32'h0;
   assign s_axi_control_RRESP = 2'b0;
   assign s_axi_control_BVALID = 1'b1;
   assign s_axi_control_BRESP = 2'b0;

   assign m_axi_gmem_awvalid = s_axi_accel_awvalid;
   assign s_axi_accel_awready = m_axi_gmem_awready;
   assign m_axi_gmem_awaddr = s_axi_accel_awaddr;
   assign m_axi_gmem_awid =  s_axi_accel_awid;
   assign m_axi_gmem_awlen = s_axi_accel_awlen;
   assign m_axi_gmem_awsize= s_axi_accel_awsize;
   assign m_axi_gmem_awburst = s_axi_accel_awburst;
   assign m_axi_gmem_awlock = s_axi_accel_awlock;
   assign m_axi_gmem_awcache = s_axi_accel_awcache;
   assign m_axi_gmem_awprot = s_axi_accel_awprot;
   assign m_axi_gmem_awqos = s_axi_accel_awqos;
   assign m_axi_gmem_awregion = s_axi_accel_awregion;
   assign m_axi_gmem_wvalid = s_axi_accel_wvalid;
   assign s_axi_accel_wready = m_axi_gmem_wready;
   assign m_axi_gmem_wdata = s_axi_accel_wdata; 
   assign m_axi_gmem_wstrb = s_axi_accel_wstrb;
   assign m_axi_gmem_wlast = s_axi_accel_wlast;
   assign s_axi_accel_bvalid = m_axi_gmem_bvalid;
   assign m_axi_gmem_bready = s_axi_accel_bready;
   assign s_axi_accel_bresp = m_axi_gmem_bresp;
   assign s_axi_accel_bid =  m_axi_gmem_bid;
   assign m_axi_gmem_arvalid = s_axi_accel_arvalid;
   assign s_axi_accel_arready = m_axi_gmem_arready;
   assign m_axi_gmem_araddr = s_axi_accel_araddr;
   assign m_axi_gmem_arid = s_axi_accel_arid;
   assign m_axi_gmem_arlen = s_axi_accel_arlen;
   assign m_axi_gmem_arsize = s_axi_accel_arsize;
   assign m_axi_gmem_arburst = s_axi_accel_arburst;
   assign m_axi_gmem_arlock = s_axi_accel_arlock;
   assign m_axi_gmem_arcache = s_axi_accel_arcache;
   assign m_axi_gmem_arprot = s_axi_accel_arprot;
   assign m_axi_gmem_arqos = s_axi_accel_arqos;
   assign m_axi_gmem_arregion = s_axi_accel_arregion;
   assign s_axi_accel_rvalid = m_axi_gmem_rvalid;
   assign m_axi_gmem_rready= s_axi_accel_rready;
   assign s_axi_accel_rdata = m_axi_gmem_rdata;
   assign s_axi_accel_rlast = m_axi_gmem_rlast;
   assign s_axi_accel_rid = m_axi_gmem_rid;
   assign s_axi_accel_rresp = m_axi_gmem_rresp;
end
endgenerate


endmodule

