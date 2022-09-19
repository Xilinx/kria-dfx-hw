// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
module dma_wrapper  (
input           clk,
input           resetn,

output          m_axi_gmem_AWVALID,
input           m_axi_gmem_AWREADY,
output  [63:0]  m_axi_gmem_AWADDR,
output  [0:0]   m_axi_gmem_AWID,
output  [7:0]   m_axi_gmem_AWLEN,
output  [2:0]   m_axi_gmem_AWSIZE,
output  [1:0]   m_axi_gmem_AWBURST,
output  [1:0]   m_axi_gmem_AWLOCK,
output  [3:0]   m_axi_gmem_AWCACHE,
output  [2:0]   m_axi_gmem_AWPROT,
output  [3:0]   m_axi_gmem_AWQOS,
output  [3:0]   m_axi_gmem_AWREGION,
output          m_axi_gmem_WVALID,
input           m_axi_gmem_WREADY,
output  [127:0] m_axi_gmem_WDATA,
output  [15:0]  m_axi_gmem_WSTRB,
output          m_axi_gmem_WLAST,
//output  [15:0]  m_axi_gmem_WUSER,
output          m_axi_gmem_ARVALID,
input           m_axi_gmem_ARREADY,
output  [63:0]  m_axi_gmem_ARADDR,
output  [0:0]   m_axi_gmem_ARID,
output  [7:0]   m_axi_gmem_ARLEN,
output  [2:0]   m_axi_gmem_ARSIZE,
output  [1:0]   m_axi_gmem_ARBURST,
output  [1:0]   m_axi_gmem_ARLOCK,
output  [3:0]   m_axi_gmem_ARCACHE,
output  [2:0]   m_axi_gmem_ARPROT,
output  [3:0]   m_axi_gmem_ARQOS,
output  [3:0]   m_axi_gmem_ARREGION,
output  [0:0]   m_axi_gmem_ARUSER,
input           m_axi_gmem_RVALID,
output          m_axi_gmem_RREADY,
input  [127:0]  m_axi_gmem_RDATA,
input           m_axi_gmem_RLAST,
input  [0:0]    m_axi_gmem_RID,
//input  [15:0]   m_axi_gmem_RUSER,
input  [1:0]    m_axi_gmem_RRESP,
input           m_axi_gmem_BVALID,
output          m_axi_gmem_BREADY,
input  [1:0]    m_axi_gmem_BRESP,
input  [0:0]    m_axi_gmem_BID,
input  [0:0]    m_axi_gmem_BUSER,

input  [127:0]  axis_in_TDATA,
input           axis_in_TVALID,
output          axis_in_TREADY,
input  [15:0]   axis_in_TKEEP,
input  [0:0]    axis_in_TLAST,
input  [7:0]    axis_in_TUSER,
input  [7:0]    axis_in_TID,
input  [7:0]    axis_in_TDEST,

output  [127:0] axis_out_TDATA,
output          axis_out_TVALID,
input           axis_out_TREADY,
output  [15:0]  axis_out_TKEEP,
output  [0:0]   axis_out_TLAST,
output  [7:0]   axis_out_TUSER,
output  [7:0]   axis_out_TID,
output  [7:0]   axis_out_TDEST,

input           s_axi_control_AWVALID,
output          s_axi_control_AWREADY,
input  [16:0]   s_axi_control_AWADDR,
input           s_axi_control_WVALID,
output          s_axi_control_WREADY,
input  [31:0]   s_axi_control_WDATA,
input  [3:0]    s_axi_control_WSTRB,
input           s_axi_control_ARVALID,
output          s_axi_control_ARREADY,
input  [16:0]   s_axi_control_ARADDR,
output          s_axi_control_RVALID,
input           s_axi_control_RREADY,
output  [31:0]  s_axi_control_RDATA,
output  [1:0]   s_axi_control_RRESP,
output          s_axi_control_BVALID,
input           s_axi_control_BREADY,
output  [1:0]   s_axi_control_BRESP,

output          ap_done_s2mm,
output          ap_done_mm2s,
output          interrupt_s2mm,
output          interrupt_mm2s
);

wire          m00_axi_awvalid;
wire          m00_axi_awready;
wire [15:0]   m00_axi_awaddr;
wire          m00_axi_wvalid;
wire          m00_axi_wready;
wire [31:0]   m00_axi_wdata;
wire [3:0]    m00_axi_wstrb;
wire          m00_axi_arvalid;
wire          m00_axi_arready;
wire [15:0]   m00_axi_araddr;
wire          m00_axi_rvalid;
wire          m00_axi_rready;
wire  [31:0]  m00_axi_rdata;
wire  [1:0]   m00_axi_rresp;
wire          m00_axi_bvalid;
wire          m00_axi_bready;
wire  [1:0]   m00_axi_bresp;

wire          m01_axi_awvalid;
wire          m01_axi_awready;
wire [15:0]   m01_axi_awaddr;
wire          m01_axi_wvalid;
wire          m01_axi_wready;
wire [31:0]   m01_axi_wdata;
wire [3:0]    m01_axi_wstrb;
wire          m01_axi_arvalid;
wire          m01_axi_arready;
wire [15:0]   m01_axi_araddr;
wire          m01_axi_rvalid;
wire          m01_axi_rready;
wire  [31:0]  m01_axi_rdata;
wire  [1:0]   m01_axi_rresp;
wire          m01_axi_bvalid;
wire          m01_axi_bready;
wire  [1:0]   m01_axi_bresp;

axilite_ic axilite_ic_inst(
.clk              ( clk                   ),
.resetn           ( resetn              ),

.s_axi_awvalid    ( s_axi_control_AWVALID ),
.s_axi_awready    ( s_axi_control_AWREADY ), 
.s_axi_awaddr     ( s_axi_control_AWADDR  ),
.s_axi_wvalid     ( s_axi_control_WVALID  ),
.s_axi_wready     ( s_axi_control_WREADY  ),
.s_axi_wdata      ( s_axi_control_WDATA   ),
.s_axi_wstrb      ( s_axi_control_WSTRB   ),
.s_axi_arvalid    ( s_axi_control_ARVALID ),
.s_axi_arready    ( s_axi_control_ARREADY ), 
.s_axi_araddr     ( s_axi_control_ARADDR  ),
.s_axi_rvalid     ( s_axi_control_RVALID  ),
.s_axi_rready     ( s_axi_control_RREADY  ),
.s_axi_rdata      ( s_axi_control_RDATA   ),
.s_axi_rresp      ( s_axi_control_RRESP   ),
.s_axi_bvalid     ( s_axi_control_BVALID  ),
.s_axi_bready     ( s_axi_control_BREADY  ),
.s_axi_bresp      ( s_axi_control_BRESP   ), 

.m00_axi_awvalid  ( m00_axi_awvalid ),
.m00_axi_awready  ( m00_axi_awready ),
.m00_axi_awaddr   ( m00_axi_awaddr  ),
.m00_axi_wvalid   ( m00_axi_wvalid  ),
.m00_axi_wready   ( m00_axi_wready  ),
.m00_axi_wdata    ( m00_axi_wdata   ),
.m00_axi_wstrb    ( m00_axi_wstrb   ),
.m00_axi_arvalid  ( m00_axi_arvalid ),
.m00_axi_arready  ( m00_axi_arready ),
.m00_axi_araddr   ( m00_axi_araddr  ),
.m00_axi_rvalid   ( m00_axi_rvalid  ),
.m00_axi_rready   ( m00_axi_rready  ),
.m00_axi_rdata    ( m00_axi_rdata   ),
.m00_axi_rresp    ( m00_axi_rresp   ),
.m00_axi_bvalid   ( m00_axi_bvalid  ),
.m00_axi_bready   ( m00_axi_bready  ),
.m00_axi_bresp    ( m00_axi_bresp   ),

.m01_axi_awvalid  ( m01_axi_awvalid ),
.m01_axi_awready  ( m01_axi_awready ),
.m01_axi_awaddr   ( m01_axi_awaddr  ),
.m01_axi_wvalid   ( m01_axi_wvalid  ),
.m01_axi_wready   ( m01_axi_wready  ),
.m01_axi_wdata    ( m01_axi_wdata   ),
.m01_axi_wstrb    ( m01_axi_wstrb   ),
.m01_axi_arvalid  ( m01_axi_arvalid ),
.m01_axi_arready  ( m01_axi_arready ),
.m01_axi_araddr   ( m01_axi_araddr  ),
.m01_axi_rvalid   ( m01_axi_rvalid  ),
.m01_axi_rready   ( m01_axi_rready  ),
.m01_axi_rdata    ( m01_axi_rdata   ),
.m01_axi_rresp    ( m01_axi_rresp   ),
.m01_axi_bvalid   ( m01_axi_bvalid  ),
.m01_axi_bready   ( m01_axi_bready  ),
.m01_axi_bresp    ( m01_axi_bresp   )
);

mm2s mm2s_0_inst (
  .ap_clk               (clk),                                // input wire ap_clk
  .ap_rst_n             (resetn),                            // input wire ap_rst_n
  
  .m_axi_gmem_AWVALID   (),        // output wire m_axi_gmem_AWVALID
  .m_axi_gmem_AWREADY   (1'b0),    // input wire m_axi_gmem_AWREADY
  .m_axi_gmem_AWADDR    (),        // output wire [31 : 0] m_axi_gmem_AWADDR
  .m_axi_gmem_AWID      (),        // output wire [0 : 0] m_axi_gmem_AWID
  .m_axi_gmem_AWLEN     (),        // output wire [7 : 0] m_axi_gmem_AWLEN
  .m_axi_gmem_AWSIZE    (),        // output wire [2 : 0] m_axi_gmem_AWSIZE
  .m_axi_gmem_AWBURST   (),        // output wire [1 : 0] m_axi_gmem_AWBURST
  .m_axi_gmem_AWLOCK    (),        // output wire [1 : 0] m_axi_gmem_AWLOCK
  .m_axi_gmem_AWCACHE   (),        // output wire [3 : 0] m_axi_gmem_AWCACHE
  .m_axi_gmem_AWPROT    (),        // output wire [2 : 0] m_axi_gmem_AWPROT
  .m_axi_gmem_AWQOS     (),        // output wire [3 : 0] m_axi_gmem_AWQOS
  .m_axi_gmem_AWREGION  (),        // output wire [3 : 0] m_axi_gmem_AWREGION
  .m_axi_gmem_WVALID    (),        // output wire m_axi_gmem_WVALID
  .m_axi_gmem_WREADY    (1'b0),    // input wire m_axi_gmem_WREADY
  .m_axi_gmem_WDATA     (),        // output wire [127 : 0] m_axi_gmem_WDATA
  .m_axi_gmem_WSTRB     (),        // output wire [15 : 0] m_axi_gmem_WSTRB
  .m_axi_gmem_WLAST     (),        // output wire m_axi_gmem_WLAST
  .m_axi_gmem_WUSER     (),        // output wire [0 : 0] m_axi_gmem_WUSER
  
  .m_axi_gmem_ARVALID   (m_axi_gmem_ARVALID),        // output wire m_axi_gmem_ARVALID
  .m_axi_gmem_ARREADY   (m_axi_gmem_ARREADY),        // input wire m_axi_gmem_ARREADY
  .m_axi_gmem_ARADDR    (m_axi_gmem_ARADDR),         // output wire [31 : 0] m_axi_gmem_ARADDR
  .m_axi_gmem_ARID      (m_axi_gmem_ARID),           // output wire [0 : 0] m_axi_gmem_ARID
  .m_axi_gmem_ARLEN     (m_axi_gmem_ARLEN),          // output wire [7 : 0] m_axi_gmem_ARLEN
  .m_axi_gmem_ARSIZE    (m_axi_gmem_ARSIZE),         // output wire [2 : 0] m_axi_gmem_ARSIZE
  .m_axi_gmem_ARBURST   (m_axi_gmem_ARBURST),        // output wire [1 : 0] m_axi_gmem_ARBURST
  .m_axi_gmem_ARLOCK    (m_axi_gmem_ARLOCK),         // output wire [1 : 0] m_axi_gmem_ARLOCK
  .m_axi_gmem_ARCACHE   (m_axi_gmem_ARCACHE),        // output wire [3 : 0] m_axi_gmem_ARCACHE
  .m_axi_gmem_ARPROT    (m_axi_gmem_ARPROT),         // output wire [2 : 0] m_axi_gmem_ARPROT
  .m_axi_gmem_ARQOS     (m_axi_gmem_ARQOS),          // output wire [3 : 0] m_axi_gmem_ARQOS
  .m_axi_gmem_ARREGION  (m_axi_gmem_ARREGION),       // output wire [3 : 0] m_axi_gmem_ARREGION
  .m_axi_gmem_ARUSER    (m_axi_gmem_ARUSER),         // output wire [0 : 0] m_axi_gmem_ARUSER
  .m_axi_gmem_RVALID    (m_axi_gmem_RVALID),         // input wire m_axi_gmem_RVALID
  .m_axi_gmem_RREADY    (m_axi_gmem_RREADY),         // output wire m_axi_gmem_RREADY
  .m_axi_gmem_RDATA     (m_axi_gmem_RDATA),          // input wire [127 : 0] m_axi_gmem_RDATA
  .m_axi_gmem_RLAST     (m_axi_gmem_RLAST),          // input wire m_axi_gmem_RLAST
  .m_axi_gmem_RID       (m_axi_gmem_RID),            // input wire [0 : 0] m_axi_gmem_RID
  .m_axi_gmem_RUSER     (m_axi_gmem_RUSER),          // input wire [0 : 0] m_axi_gmem_RUSER
  .m_axi_gmem_RRESP     (m_axi_gmem_RRESP),          // input wire [1 : 0] m_axi_gmem_RRESP
  
  .m_axi_gmem_BVALID    (1'b0),         // input wire m_axi_gmem_BVALID
  .m_axi_gmem_BREADY    (),             // output wire m_axi_gmem_BREADY
  .m_axi_gmem_BRESP     (2'b00),        // input wire [1 : 0] m_axi_gmem_BRESP
  .m_axi_gmem_BID       (1'b0),         // input wire [0 : 0] m_axi_gmem_BID
  .m_axi_gmem_BUSER     (1'b0),         // input wire [0 : 0] m_axi_gmem_BUSER
  
  .axis_out_TDATA        (axis_out_TDATA),   // output wire [127 : 0] axis_out_TDATA
  .axis_out_TVALID       (axis_out_TVALID),  // output wire axis_out_TVALID
  .axis_out_TREADY       (axis_out_TREADY),  // input wire axis_out_TREADY
  .axis_out_TKEEP        (axis_out_TKEEP),   // output wire [15 : 0] axis_out_TKEEP
  .axis_out_TLAST        (axis_out_TLAST),   // output wire [0 : 0] axis_out_TLAST
  .axis_out_TUSER        (axis_out_TUSER),
  .axis_out_TID          (axis_out_TID),
  .axis_out_TDEST        (axis_out_TDEST),  
  
  .s_axi_control_AWVALID(m01_axi_awvalid),   // input wire s_axi_control_AWVALID
  .s_axi_control_AWREADY(m01_axi_awready),   // output wire s_axi_control_AWREADY
  .s_axi_control_AWADDR (m01_axi_awaddr),    // input wire [4 : 0] s_axi_control_AWADDR
  .s_axi_control_WVALID (m01_axi_wvalid),    // input wire s_axi_control_WVALID
  .s_axi_control_WREADY (m01_axi_wready),    // output wire s_axi_control_WREADY
  .s_axi_control_WDATA  (m01_axi_wdata),     // input wire [31 : 0] s_axi_control_WDATA
  .s_axi_control_WSTRB  (m01_axi_wstrb),     // input wire [3 : 0] s_axi_control_WSTRB
  .s_axi_control_ARVALID(m01_axi_arvalid),   // input wire s_axi_control_ARVALID
  .s_axi_control_ARREADY(m01_axi_arready),   // output wire s_axi_control_ARREADY
  .s_axi_control_ARADDR (m01_axi_araddr),    // input wire [4 : 0] s_axi_control_ARADDR
  .s_axi_control_RVALID (m01_axi_rvalid),    // output wire s_axi_control_RVALID
  .s_axi_control_RREADY (m01_axi_rready),    // input wire s_axi_control_RREADY
  .s_axi_control_RDATA  (m01_axi_rdata),     // output wire [31 : 0] s_axi_control_RDATA
  .s_axi_control_RRESP  (m01_axi_rresp),     // output wire [1 : 0] s_axi_control_RRESP
  .s_axi_control_BVALID (m01_axi_bvalid),    // output wire s_axi_control_BVALID
  .s_axi_control_BREADY (m01_axi_bready),    // input wire s_axi_control_BREADY
  .s_axi_control_BRESP  (m01_axi_bresp),     // output wire [1 : 0] s_axi_control_BRESP
  .ap_done_o            (ap_done_mm2s),
  .interrupt            (interrupt_mm2s)     // output wire interrupt
);
  
s2mm s2mm_0_inst (
  .ap_clk                (clk),                    // input wire ap_clk
  .ap_rst_n              (resetn),                  // input wire ap_rst_n
  .m_axi_gmem_AWVALID    (m_axi_gmem_AWVALID),        // output wire m_axi_gmem_AWVALID
  .m_axi_gmem_AWREADY    (m_axi_gmem_AWREADY),        // input wire m_axi_gmem_AWREADY
  .m_axi_gmem_AWADDR     (m_axi_gmem_AWADDR),         // output wire [31 : 0] m_axi_gmem_AWADDR
  .m_axi_gmem_AWID       (m_axi_gmem_AWID),           // output wire [0 : 0] m_axi_gmem_AWID
  .m_axi_gmem_AWLEN      (m_axi_gmem_AWLEN),          // output wire [7 : 0] m_axi_gmem_AWLEN
  .m_axi_gmem_AWSIZE     (m_axi_gmem_AWSIZE),         // output wire [2 : 0] m_axi_gmem_AWSIZE
  .m_axi_gmem_AWBURST    (m_axi_gmem_AWBURST),        // output wire [1 : 0] m_axi_gmem_AWBURST
  .m_axi_gmem_AWLOCK     (m_axi_gmem_AWLOCK),         // output wire [1 : 0] m_axi_gmem_AWLOCK
  .m_axi_gmem_AWCACHE    (m_axi_gmem_AWCACHE),        // output wire [3 : 0] m_axi_gmem_AWCACHE
  .m_axi_gmem_AWPROT     (m_axi_gmem_AWPROT),         // output wire [2 : 0] m_axi_gmem_AWPROT
  .m_axi_gmem_AWQOS      (m_axi_gmem_AWQOS),          // output wire [3 : 0] m_axi_gmem_AWQOS
  .m_axi_gmem_AWREGION   (m_axi_gmem_AWREGION),       // output wire [3 : 0] m_axi_gmem_AWREGION
  .m_axi_gmem_WVALID     (m_axi_gmem_WVALID),         // output wire m_axi_gmem_WVALID
  .m_axi_gmem_WREADY     (m_axi_gmem_WREADY),         // input wire m_axi_gmem_WREADY
  .m_axi_gmem_WDATA      (m_axi_gmem_WDATA),          // output wire [127 : 0] m_axi_gmem_WDATA
  .m_axi_gmem_WSTRB      (m_axi_gmem_WSTRB),          // output wire [15 : 0] m_axi_gmem_WSTRB
  .m_axi_gmem_WLAST      (m_axi_gmem_WLAST),          // output wire m_axi_gmem_WLAST
  .m_axi_gmem_WUSER      (m_axi_gmem_WUSER),          // output wire [0 : 0] m_axi_gmem_WUSER
  
  .m_axi_gmem_ARVALID    (),        // output wire m_axi_gmem_ARVALID
  .m_axi_gmem_ARREADY    (1'b0),    // input wire m_axi_gmem_ARREADY
  .m_axi_gmem_ARADDR     (),        // output wire [31 : 0] m_axi_gmem_ARADDR
  .m_axi_gmem_ARID       (),        // output wire [0 : 0] m_axi_gmem_ARID
  .m_axi_gmem_ARLEN      (),        // output wire [7 : 0] m_axi_gmem_ARLEN
  .m_axi_gmem_ARSIZE     (),        // output wire [2 : 0] m_axi_gmem_ARSIZE
  .m_axi_gmem_ARBURST    (),        // output wire [1 : 0] m_axi_gmem_ARBURST
  .m_axi_gmem_ARLOCK     (),        // output wire [1 : 0] m_axi_gmem_ARLOCK
  .m_axi_gmem_ARCACHE    (),        // output wire [3 : 0] m_axi_gmem_ARCACHE
  .m_axi_gmem_ARPROT     (),        // output wire [2 : 0] m_axi_gmem_ARPROT
  .m_axi_gmem_ARQOS      (),        // output wire [3 : 0] m_axi_gmem_ARQOS
  .m_axi_gmem_ARREGION   (),        // output wire [3 : 0] m_axi_gmem_ARREGION
  .m_axi_gmem_ARUSER     (),        // output wire [0 : 0] m_axi_gmem_ARUSER
  .m_axi_gmem_RVALID     (1'b0),    // input wire m_axi_gmem_RVALID
  .m_axi_gmem_RREADY     (),        // output wire m_axi_gmem_RREADY
  .m_axi_gmem_RDATA      (128'b0),  // input wire [127 : 0] m_axi_gmem_RDATA
  .m_axi_gmem_RLAST      (1'b0),    // input wire m_axi_gmem_RLAST
  .m_axi_gmem_RID        (1'b0),    // input wire [0 : 0] m_axi_gmem_RID
  .m_axi_gmem_RUSER      (1'b0),    // input wire [0 : 0] m_axi_gmem_RUSER
  .m_axi_gmem_RRESP      (2'b0),    // input wire [1 : 0] m_axi_gmem_RRESP
  
  .m_axi_gmem_BVALID     (m_axi_gmem_BVALID),          // input wire m_axi_gmem_BVALID
  .m_axi_gmem_BREADY     (m_axi_gmem_BREADY),          // output wire m_axi_gmem_BREADY
  .m_axi_gmem_BRESP      (m_axi_gmem_BRESP),           // input wire [1 : 0] m_axi_gmem_BRESP
  .m_axi_gmem_BID        (m_axi_gmem_BID),             // input wire [0 : 0] m_axi_gmem_BID
  .m_axi_gmem_BUSER      (m_axi_gmem_BUSER),           // input wire [0 : 0] m_axi_gmem_BUSER
                         
  .axis_in_TDATA         (axis_in_TDATA),              // input wire [127 : 0] axis_in_TDATA
  .axis_in_TVALID        (axis_in_TVALID),             // input wire axis_in_TVALID
  .axis_in_TREADY        (axis_in_TREADY),             // output wire axis_in_TREADY
  .axis_in_TKEEP         (axis_in_TKEEP),              // input wire [15 : 0] axis_in_TKEEP
  .axis_in_TLAST         (axis_in_TLAST),              // input wire [0 : 0] axis_in_TLAST
  .axis_in_TUSER         (axis_in_TUSER),
  .axis_in_TID           (axis_in_TID),
  .axis_in_TDEST         (axis_in_TDEST),
  
  .s_axi_control_AWVALID(m00_axi_awvalid),  // input wire s_axi_control_AWVALID
  .s_axi_control_AWREADY(m00_axi_awready),  // output wire s_axi_control_AWREADY
  .s_axi_control_AWADDR (m00_axi_awaddr),   // input wire [4 : 0] s_axi_control_AWADDR
  .s_axi_control_WVALID (m00_axi_wvalid),   // input wire s_axi_control_WVALID
  .s_axi_control_WREADY (m00_axi_wready),   // output wire s_axi_control_WREADY
  .s_axi_control_WDATA  (m00_axi_wdata),    // input wire [31 : 0] s_axi_control_WDATA
  .s_axi_control_WSTRB  (m00_axi_wstrb),    // input wire [3 : 0] s_axi_control_WSTRB
  .s_axi_control_ARVALID(m00_axi_arvalid),  // input wire s_axi_control_ARVALID
  .s_axi_control_ARREADY(m00_axi_arready),  // output wire s_axi_control_ARREADY
  .s_axi_control_ARADDR (m00_axi_araddr),   // input wire [4 : 0] s_axi_control_ARADDR
  .s_axi_control_RVALID (m00_axi_rvalid),   // output wire s_axi_control_RVALID
  .s_axi_control_RREADY (m00_axi_rready),   // input wire s_axi_control_RREADY
  .s_axi_control_RDATA  (m00_axi_rdata),    // output wire [31 : 0] s_axi_control_RDATA
  .s_axi_control_RRESP  (m00_axi_rresp),    // output wire [1 : 0] s_axi_control_RRESP
  .s_axi_control_BVALID (m00_axi_bvalid),   // output wire s_axi_control_BVALID
  .s_axi_control_BREADY (m00_axi_bready),   // input wire s_axi_control_BREADY
  .s_axi_control_BRESP  (m00_axi_bresp),    // output wire [1 : 0] s_axi_control_BRESP
  .ap_done_o            (ap_done_s2mm),
  .interrupt            (interrupt_s2mm)                          // output wire interrupt
);

endmodule
