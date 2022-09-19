// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="pp_pipeline_accel_pp_pipeline_accel,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=3.333000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=2.656545,HLS_SYN_LAT=8322254,HLS_SYN_TPT=8322246,HLS_SYN_MEM=22,HLS_SYN_DSP=0,HLS_SYN_FF=19877,HLS_SYN_LUT=28218,HLS_VERSION=2022_1}" *)

module pp_pipeline_accel (
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        ap_clk,
        ap_rst_n,
        interrupt,
        m_axi_gmem1_AWVALID,
        m_axi_gmem1_AWREADY,
        m_axi_gmem1_AWADDR,
        m_axi_gmem1_AWID,
        m_axi_gmem1_AWLEN,
        m_axi_gmem1_AWSIZE,
        m_axi_gmem1_AWBURST,
        m_axi_gmem1_AWLOCK,
        m_axi_gmem1_AWCACHE,
        m_axi_gmem1_AWPROT,
        m_axi_gmem1_AWQOS,
        m_axi_gmem1_AWREGION,
        m_axi_gmem1_AWUSER,
        m_axi_gmem1_WVALID,
        m_axi_gmem1_WREADY,
        m_axi_gmem1_WDATA,
        m_axi_gmem1_WSTRB,
        m_axi_gmem1_WLAST,
        m_axi_gmem1_WID,
        m_axi_gmem1_WUSER,
        m_axi_gmem1_ARVALID,
        m_axi_gmem1_ARREADY,
        m_axi_gmem1_ARADDR,
        m_axi_gmem1_ARID,
        m_axi_gmem1_ARLEN,
        m_axi_gmem1_ARSIZE,
        m_axi_gmem1_ARBURST,
        m_axi_gmem1_ARLOCK,
        m_axi_gmem1_ARCACHE,
        m_axi_gmem1_ARPROT,
        m_axi_gmem1_ARQOS,
        m_axi_gmem1_ARREGION,
        m_axi_gmem1_ARUSER,
        m_axi_gmem1_RVALID,
        m_axi_gmem1_RREADY,
        m_axi_gmem1_RDATA,
        m_axi_gmem1_RLAST,
        m_axi_gmem1_RID,
        m_axi_gmem1_RUSER,
        m_axi_gmem1_RRESP,
        m_axi_gmem1_BVALID,
        m_axi_gmem1_BREADY,
        m_axi_gmem1_BRESP,
        m_axi_gmem1_BID,
        m_axi_gmem1_BUSER,
        m_axi_gmem2_AWVALID,
        m_axi_gmem2_AWREADY,
        m_axi_gmem2_AWADDR,
        m_axi_gmem2_AWID,
        m_axi_gmem2_AWLEN,
        m_axi_gmem2_AWSIZE,
        m_axi_gmem2_AWBURST,
        m_axi_gmem2_AWLOCK,
        m_axi_gmem2_AWCACHE,
        m_axi_gmem2_AWPROT,
        m_axi_gmem2_AWQOS,
        m_axi_gmem2_AWREGION,
        m_axi_gmem2_AWUSER,
        m_axi_gmem2_WVALID,
        m_axi_gmem2_WREADY,
        m_axi_gmem2_WDATA,
        m_axi_gmem2_WSTRB,
        m_axi_gmem2_WLAST,
        m_axi_gmem2_WID,
        m_axi_gmem2_WUSER,
        m_axi_gmem2_ARVALID,
        m_axi_gmem2_ARREADY,
        m_axi_gmem2_ARADDR,
        m_axi_gmem2_ARID,
        m_axi_gmem2_ARLEN,
        m_axi_gmem2_ARSIZE,
        m_axi_gmem2_ARBURST,
        m_axi_gmem2_ARLOCK,
        m_axi_gmem2_ARCACHE,
        m_axi_gmem2_ARPROT,
        m_axi_gmem2_ARQOS,
        m_axi_gmem2_ARREGION,
        m_axi_gmem2_ARUSER,
        m_axi_gmem2_RVALID,
        m_axi_gmem2_RREADY,
        m_axi_gmem2_RDATA,
        m_axi_gmem2_RLAST,
        m_axi_gmem2_RID,
        m_axi_gmem2_RUSER,
        m_axi_gmem2_RRESP,
        m_axi_gmem2_BVALID,
        m_axi_gmem2_BREADY,
        m_axi_gmem2_BRESP,
        m_axi_gmem2_BID,
        m_axi_gmem2_BUSER,
        m_axi_gmem3_AWVALID,
        m_axi_gmem3_AWREADY,
        m_axi_gmem3_AWADDR,
        m_axi_gmem3_AWID,
        m_axi_gmem3_AWLEN,
        m_axi_gmem3_AWSIZE,
        m_axi_gmem3_AWBURST,
        m_axi_gmem3_AWLOCK,
        m_axi_gmem3_AWCACHE,
        m_axi_gmem3_AWPROT,
        m_axi_gmem3_AWQOS,
        m_axi_gmem3_AWREGION,
        m_axi_gmem3_AWUSER,
        m_axi_gmem3_WVALID,
        m_axi_gmem3_WREADY,
        m_axi_gmem3_WDATA,
        m_axi_gmem3_WSTRB,
        m_axi_gmem3_WLAST,
        m_axi_gmem3_WID,
        m_axi_gmem3_WUSER,
        m_axi_gmem3_ARVALID,
        m_axi_gmem3_ARREADY,
        m_axi_gmem3_ARADDR,
        m_axi_gmem3_ARID,
        m_axi_gmem3_ARLEN,
        m_axi_gmem3_ARSIZE,
        m_axi_gmem3_ARBURST,
        m_axi_gmem3_ARLOCK,
        m_axi_gmem3_ARCACHE,
        m_axi_gmem3_ARPROT,
        m_axi_gmem3_ARQOS,
        m_axi_gmem3_ARREGION,
        m_axi_gmem3_ARUSER,
        m_axi_gmem3_RVALID,
        m_axi_gmem3_RREADY,
        m_axi_gmem3_RDATA,
        m_axi_gmem3_RLAST,
        m_axi_gmem3_RID,
        m_axi_gmem3_RUSER,
        m_axi_gmem3_RRESP,
        m_axi_gmem3_BVALID,
        m_axi_gmem3_BREADY,
        m_axi_gmem3_BRESP,
        m_axi_gmem3_BID,
        m_axi_gmem3_BUSER,
        m_axi_gmem4_AWVALID,
        m_axi_gmem4_AWREADY,
        m_axi_gmem4_AWADDR,
        m_axi_gmem4_AWID,
        m_axi_gmem4_AWLEN,
        m_axi_gmem4_AWSIZE,
        m_axi_gmem4_AWBURST,
        m_axi_gmem4_AWLOCK,
        m_axi_gmem4_AWCACHE,
        m_axi_gmem4_AWPROT,
        m_axi_gmem4_AWQOS,
        m_axi_gmem4_AWREGION,
        m_axi_gmem4_AWUSER,
        m_axi_gmem4_WVALID,
        m_axi_gmem4_WREADY,
        m_axi_gmem4_WDATA,
        m_axi_gmem4_WSTRB,
        m_axi_gmem4_WLAST,
        m_axi_gmem4_WID,
        m_axi_gmem4_WUSER,
        m_axi_gmem4_ARVALID,
        m_axi_gmem4_ARREADY,
        m_axi_gmem4_ARADDR,
        m_axi_gmem4_ARID,
        m_axi_gmem4_ARLEN,
        m_axi_gmem4_ARSIZE,
        m_axi_gmem4_ARBURST,
        m_axi_gmem4_ARLOCK,
        m_axi_gmem4_ARCACHE,
        m_axi_gmem4_ARPROT,
        m_axi_gmem4_ARQOS,
        m_axi_gmem4_ARREGION,
        m_axi_gmem4_ARUSER,
        m_axi_gmem4_RVALID,
        m_axi_gmem4_RREADY,
        m_axi_gmem4_RDATA,
        m_axi_gmem4_RLAST,
        m_axi_gmem4_RID,
        m_axi_gmem4_RUSER,
        m_axi_gmem4_RRESP,
        m_axi_gmem4_BVALID,
        m_axi_gmem4_BREADY,
        m_axi_gmem4_BRESP,
        m_axi_gmem4_BID,
        m_axi_gmem4_BUSER
);

parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 7;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM1_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM1_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM1_DATA_WIDTH = 64;
parameter    C_M_AXI_GMEM1_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM1_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM1_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM1_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM1_BUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM1_USER_VALUE = 0;
parameter    C_M_AXI_GMEM1_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM1_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM2_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM2_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM2_DATA_WIDTH = 64;
parameter    C_M_AXI_GMEM2_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM2_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM2_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM2_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM2_BUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM2_USER_VALUE = 0;
parameter    C_M_AXI_GMEM2_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM2_CACHE_VALUE = 3;
parameter    C_M_AXI_GMEM3_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM3_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM3_DATA_WIDTH = 64;
parameter    C_M_AXI_GMEM3_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM3_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM3_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM3_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM3_BUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM3_USER_VALUE = 0;
parameter    C_M_AXI_GMEM3_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM3_CACHE_VALUE = 3;
parameter    C_M_AXI_GMEM4_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM4_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM4_DATA_WIDTH = 64;
parameter    C_M_AXI_GMEM4_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM4_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM4_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM4_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM4_BUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM4_USER_VALUE = 0;
parameter    C_M_AXI_GMEM4_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM4_CACHE_VALUE = 3;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_GMEM1_WSTRB_WIDTH = (64 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_GMEM2_WSTRB_WIDTH = (64 / 8);
parameter C_M_AXI_GMEM3_WSTRB_WIDTH = (64 / 8);
parameter C_M_AXI_GMEM4_WSTRB_WIDTH = (64 / 8);

input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
input   ap_clk;
input   ap_rst_n;
output   interrupt;
output   m_axi_gmem1_AWVALID;
input   m_axi_gmem1_AWREADY;
output  [C_M_AXI_GMEM1_ADDR_WIDTH - 1:0] m_axi_gmem1_AWADDR;
output  [C_M_AXI_GMEM1_ID_WIDTH - 1:0] m_axi_gmem1_AWID;
output  [7:0] m_axi_gmem1_AWLEN;
output  [2:0] m_axi_gmem1_AWSIZE;
output  [1:0] m_axi_gmem1_AWBURST;
output  [1:0] m_axi_gmem1_AWLOCK;
output  [3:0] m_axi_gmem1_AWCACHE;
output  [2:0] m_axi_gmem1_AWPROT;
output  [3:0] m_axi_gmem1_AWQOS;
output  [3:0] m_axi_gmem1_AWREGION;
output  [C_M_AXI_GMEM1_AWUSER_WIDTH - 1:0] m_axi_gmem1_AWUSER;
output   m_axi_gmem1_WVALID;
input   m_axi_gmem1_WREADY;
output  [C_M_AXI_GMEM1_DATA_WIDTH - 1:0] m_axi_gmem1_WDATA;
output  [C_M_AXI_GMEM1_WSTRB_WIDTH - 1:0] m_axi_gmem1_WSTRB;
output   m_axi_gmem1_WLAST;
output  [C_M_AXI_GMEM1_ID_WIDTH - 1:0] m_axi_gmem1_WID;
output  [C_M_AXI_GMEM1_WUSER_WIDTH - 1:0] m_axi_gmem1_WUSER;
output   m_axi_gmem1_ARVALID;
input   m_axi_gmem1_ARREADY;
output  [C_M_AXI_GMEM1_ADDR_WIDTH - 1:0] m_axi_gmem1_ARADDR;
output  [C_M_AXI_GMEM1_ID_WIDTH - 1:0] m_axi_gmem1_ARID;
output  [7:0] m_axi_gmem1_ARLEN;
output  [2:0] m_axi_gmem1_ARSIZE;
output  [1:0] m_axi_gmem1_ARBURST;
output  [1:0] m_axi_gmem1_ARLOCK;
output  [3:0] m_axi_gmem1_ARCACHE;
output  [2:0] m_axi_gmem1_ARPROT;
output  [3:0] m_axi_gmem1_ARQOS;
output  [3:0] m_axi_gmem1_ARREGION;
output  [C_M_AXI_GMEM1_ARUSER_WIDTH - 1:0] m_axi_gmem1_ARUSER;
input   m_axi_gmem1_RVALID;
output   m_axi_gmem1_RREADY;
input  [C_M_AXI_GMEM1_DATA_WIDTH - 1:0] m_axi_gmem1_RDATA;
input   m_axi_gmem1_RLAST;
input  [C_M_AXI_GMEM1_ID_WIDTH - 1:0] m_axi_gmem1_RID;
input  [C_M_AXI_GMEM1_RUSER_WIDTH - 1:0] m_axi_gmem1_RUSER;
input  [1:0] m_axi_gmem1_RRESP;
input   m_axi_gmem1_BVALID;
output   m_axi_gmem1_BREADY;
input  [1:0] m_axi_gmem1_BRESP;
input  [C_M_AXI_GMEM1_ID_WIDTH - 1:0] m_axi_gmem1_BID;
input  [C_M_AXI_GMEM1_BUSER_WIDTH - 1:0] m_axi_gmem1_BUSER;
output   m_axi_gmem2_AWVALID;
input   m_axi_gmem2_AWREADY;
output  [C_M_AXI_GMEM2_ADDR_WIDTH - 1:0] m_axi_gmem2_AWADDR;
output  [C_M_AXI_GMEM2_ID_WIDTH - 1:0] m_axi_gmem2_AWID;
output  [7:0] m_axi_gmem2_AWLEN;
output  [2:0] m_axi_gmem2_AWSIZE;
output  [1:0] m_axi_gmem2_AWBURST;
output  [1:0] m_axi_gmem2_AWLOCK;
output  [3:0] m_axi_gmem2_AWCACHE;
output  [2:0] m_axi_gmem2_AWPROT;
output  [3:0] m_axi_gmem2_AWQOS;
output  [3:0] m_axi_gmem2_AWREGION;
output  [C_M_AXI_GMEM2_AWUSER_WIDTH - 1:0] m_axi_gmem2_AWUSER;
output   m_axi_gmem2_WVALID;
input   m_axi_gmem2_WREADY;
output  [C_M_AXI_GMEM2_DATA_WIDTH - 1:0] m_axi_gmem2_WDATA;
output  [C_M_AXI_GMEM2_WSTRB_WIDTH - 1:0] m_axi_gmem2_WSTRB;
output   m_axi_gmem2_WLAST;
output  [C_M_AXI_GMEM2_ID_WIDTH - 1:0] m_axi_gmem2_WID;
output  [C_M_AXI_GMEM2_WUSER_WIDTH - 1:0] m_axi_gmem2_WUSER;
output   m_axi_gmem2_ARVALID;
input   m_axi_gmem2_ARREADY;
output  [C_M_AXI_GMEM2_ADDR_WIDTH - 1:0] m_axi_gmem2_ARADDR;
output  [C_M_AXI_GMEM2_ID_WIDTH - 1:0] m_axi_gmem2_ARID;
output  [7:0] m_axi_gmem2_ARLEN;
output  [2:0] m_axi_gmem2_ARSIZE;
output  [1:0] m_axi_gmem2_ARBURST;
output  [1:0] m_axi_gmem2_ARLOCK;
output  [3:0] m_axi_gmem2_ARCACHE;
output  [2:0] m_axi_gmem2_ARPROT;
output  [3:0] m_axi_gmem2_ARQOS;
output  [3:0] m_axi_gmem2_ARREGION;
output  [C_M_AXI_GMEM2_ARUSER_WIDTH - 1:0] m_axi_gmem2_ARUSER;
input   m_axi_gmem2_RVALID;
output   m_axi_gmem2_RREADY;
input  [C_M_AXI_GMEM2_DATA_WIDTH - 1:0] m_axi_gmem2_RDATA;
input   m_axi_gmem2_RLAST;
input  [C_M_AXI_GMEM2_ID_WIDTH - 1:0] m_axi_gmem2_RID;
input  [C_M_AXI_GMEM2_RUSER_WIDTH - 1:0] m_axi_gmem2_RUSER;
input  [1:0] m_axi_gmem2_RRESP;
input   m_axi_gmem2_BVALID;
output   m_axi_gmem2_BREADY;
input  [1:0] m_axi_gmem2_BRESP;
input  [C_M_AXI_GMEM2_ID_WIDTH - 1:0] m_axi_gmem2_BID;
input  [C_M_AXI_GMEM2_BUSER_WIDTH - 1:0] m_axi_gmem2_BUSER;
output   m_axi_gmem3_AWVALID;
input   m_axi_gmem3_AWREADY;
output  [C_M_AXI_GMEM3_ADDR_WIDTH - 1:0] m_axi_gmem3_AWADDR;
output  [C_M_AXI_GMEM3_ID_WIDTH - 1:0] m_axi_gmem3_AWID;
output  [7:0] m_axi_gmem3_AWLEN;
output  [2:0] m_axi_gmem3_AWSIZE;
output  [1:0] m_axi_gmem3_AWBURST;
output  [1:0] m_axi_gmem3_AWLOCK;
output  [3:0] m_axi_gmem3_AWCACHE;
output  [2:0] m_axi_gmem3_AWPROT;
output  [3:0] m_axi_gmem3_AWQOS;
output  [3:0] m_axi_gmem3_AWREGION;
output  [C_M_AXI_GMEM3_AWUSER_WIDTH - 1:0] m_axi_gmem3_AWUSER;
output   m_axi_gmem3_WVALID;
input   m_axi_gmem3_WREADY;
output  [C_M_AXI_GMEM3_DATA_WIDTH - 1:0] m_axi_gmem3_WDATA;
output  [C_M_AXI_GMEM3_WSTRB_WIDTH - 1:0] m_axi_gmem3_WSTRB;
output   m_axi_gmem3_WLAST;
output  [C_M_AXI_GMEM3_ID_WIDTH - 1:0] m_axi_gmem3_WID;
output  [C_M_AXI_GMEM3_WUSER_WIDTH - 1:0] m_axi_gmem3_WUSER;
output   m_axi_gmem3_ARVALID;
input   m_axi_gmem3_ARREADY;
output  [C_M_AXI_GMEM3_ADDR_WIDTH - 1:0] m_axi_gmem3_ARADDR;
output  [C_M_AXI_GMEM3_ID_WIDTH - 1:0] m_axi_gmem3_ARID;
output  [7:0] m_axi_gmem3_ARLEN;
output  [2:0] m_axi_gmem3_ARSIZE;
output  [1:0] m_axi_gmem3_ARBURST;
output  [1:0] m_axi_gmem3_ARLOCK;
output  [3:0] m_axi_gmem3_ARCACHE;
output  [2:0] m_axi_gmem3_ARPROT;
output  [3:0] m_axi_gmem3_ARQOS;
output  [3:0] m_axi_gmem3_ARREGION;
output  [C_M_AXI_GMEM3_ARUSER_WIDTH - 1:0] m_axi_gmem3_ARUSER;
input   m_axi_gmem3_RVALID;
output   m_axi_gmem3_RREADY;
input  [C_M_AXI_GMEM3_DATA_WIDTH - 1:0] m_axi_gmem3_RDATA;
input   m_axi_gmem3_RLAST;
input  [C_M_AXI_GMEM3_ID_WIDTH - 1:0] m_axi_gmem3_RID;
input  [C_M_AXI_GMEM3_RUSER_WIDTH - 1:0] m_axi_gmem3_RUSER;
input  [1:0] m_axi_gmem3_RRESP;
input   m_axi_gmem3_BVALID;
output   m_axi_gmem3_BREADY;
input  [1:0] m_axi_gmem3_BRESP;
input  [C_M_AXI_GMEM3_ID_WIDTH - 1:0] m_axi_gmem3_BID;
input  [C_M_AXI_GMEM3_BUSER_WIDTH - 1:0] m_axi_gmem3_BUSER;
output   m_axi_gmem4_AWVALID;
input   m_axi_gmem4_AWREADY;
output  [C_M_AXI_GMEM4_ADDR_WIDTH - 1:0] m_axi_gmem4_AWADDR;
output  [C_M_AXI_GMEM4_ID_WIDTH - 1:0] m_axi_gmem4_AWID;
output  [7:0] m_axi_gmem4_AWLEN;
output  [2:0] m_axi_gmem4_AWSIZE;
output  [1:0] m_axi_gmem4_AWBURST;
output  [1:0] m_axi_gmem4_AWLOCK;
output  [3:0] m_axi_gmem4_AWCACHE;
output  [2:0] m_axi_gmem4_AWPROT;
output  [3:0] m_axi_gmem4_AWQOS;
output  [3:0] m_axi_gmem4_AWREGION;
output  [C_M_AXI_GMEM4_AWUSER_WIDTH - 1:0] m_axi_gmem4_AWUSER;
output   m_axi_gmem4_WVALID;
input   m_axi_gmem4_WREADY;
output  [C_M_AXI_GMEM4_DATA_WIDTH - 1:0] m_axi_gmem4_WDATA;
output  [C_M_AXI_GMEM4_WSTRB_WIDTH - 1:0] m_axi_gmem4_WSTRB;
output   m_axi_gmem4_WLAST;
output  [C_M_AXI_GMEM4_ID_WIDTH - 1:0] m_axi_gmem4_WID;
output  [C_M_AXI_GMEM4_WUSER_WIDTH - 1:0] m_axi_gmem4_WUSER;
output   m_axi_gmem4_ARVALID;
input   m_axi_gmem4_ARREADY;
output  [C_M_AXI_GMEM4_ADDR_WIDTH - 1:0] m_axi_gmem4_ARADDR;
output  [C_M_AXI_GMEM4_ID_WIDTH - 1:0] m_axi_gmem4_ARID;
output  [7:0] m_axi_gmem4_ARLEN;
output  [2:0] m_axi_gmem4_ARSIZE;
output  [1:0] m_axi_gmem4_ARBURST;
output  [1:0] m_axi_gmem4_ARLOCK;
output  [3:0] m_axi_gmem4_ARCACHE;
output  [2:0] m_axi_gmem4_ARPROT;
output  [3:0] m_axi_gmem4_ARQOS;
output  [3:0] m_axi_gmem4_ARREGION;
output  [C_M_AXI_GMEM4_ARUSER_WIDTH - 1:0] m_axi_gmem4_ARUSER;
input   m_axi_gmem4_RVALID;
output   m_axi_gmem4_RREADY;
input  [C_M_AXI_GMEM4_DATA_WIDTH - 1:0] m_axi_gmem4_RDATA;
input   m_axi_gmem4_RLAST;
input  [C_M_AXI_GMEM4_ID_WIDTH - 1:0] m_axi_gmem4_RID;
input  [C_M_AXI_GMEM4_RUSER_WIDTH - 1:0] m_axi_gmem4_RUSER;
input  [1:0] m_axi_gmem4_RRESP;
input   m_axi_gmem4_BVALID;
output   m_axi_gmem4_BREADY;
input  [1:0] m_axi_gmem4_BRESP;
input  [C_M_AXI_GMEM4_ID_WIDTH - 1:0] m_axi_gmem4_BID;
input  [C_M_AXI_GMEM4_BUSER_WIDTH - 1:0] m_axi_gmem4_BUSER;

(* shreg_extract = "no" *) reg    ap_rst_reg_2;
(* shreg_extract = "no" *) reg    ap_rst_reg_1;
(* shreg_extract = "no" *) reg    ap_rst_n_inv;
wire   [63:0] img_inp_y;
wire   [63:0] img_inp_uv;
wire   [63:0] img_out;
wire   [63:0] params;
wire   [31:0] in_img_width;
wire   [31:0] in_img_height;
wire   [31:0] in_img_linestride;
wire   [31:0] out_img_width;
wire   [31:0] out_img_height;
wire   [31:0] out_img_linestride;
wire    ap_start;
wire    ap_ready;
wire    ap_done;
wire    ap_continue;
wire    ap_idle;
wire    gmem1_AWREADY;
wire    gmem1_WREADY;
wire    gmem1_ARREADY;
wire    gmem1_RVALID;
wire   [63:0] gmem1_RDATA;
wire    gmem1_RLAST;
wire   [0:0] gmem1_RID;
wire   [8:0] gmem1_RFIFONUM;
wire   [0:0] gmem1_RUSER;
wire   [1:0] gmem1_RRESP;
wire    gmem1_BVALID;
wire    gmem2_AWREADY;
wire    gmem2_WREADY;
wire    gmem2_ARREADY;
wire    gmem2_RVALID;
wire   [63:0] gmem2_RDATA;
wire    gmem2_RLAST;
wire   [0:0] gmem2_RID;
wire   [8:0] gmem2_RFIFONUM;
wire   [0:0] gmem2_RUSER;
wire   [1:0] gmem2_RRESP;
wire    gmem2_BVALID;
wire    gmem3_AWREADY;
wire    gmem3_WREADY;
wire    gmem3_ARREADY;
wire    gmem3_RVALID;
wire   [63:0] gmem3_RDATA;
wire   [8:0] gmem3_RFIFONUM;
wire    gmem3_BVALID;
wire   [1:0] gmem3_BRESP;
wire   [0:0] gmem3_BID;
wire   [0:0] gmem3_BUSER;
wire    gmem4_AWREADY;
wire    gmem4_WREADY;
wire    gmem4_ARREADY;
wire    gmem4_RVALID;
wire   [63:0] gmem4_RDATA;
wire    gmem4_RLAST;
wire   [0:0] gmem4_RID;
wire   [8:0] gmem4_RFIFONUM;
wire   [0:0] gmem4_RUSER;
wire   [1:0] gmem4_RRESP;
wire    gmem4_BVALID;
wire    entry_proc11_U0_ap_start;
wire    entry_proc11_U0_ap_done;
wire    entry_proc11_U0_ap_continue;
wire    entry_proc11_U0_ap_idle;
wire    entry_proc11_U0_ap_ready;
wire   [63:0] entry_proc11_U0_img_out_c_din;
wire    entry_proc11_U0_img_out_c_write;
wire   [31:0] entry_proc11_U0_out_img_linestride_c_din;
wire    entry_proc11_U0_out_img_linestride_c_write;
wire    Block_entry20_proc_U0_ap_start;
wire    Block_entry20_proc_U0_ap_done;
wire    Block_entry20_proc_U0_ap_continue;
wire    Block_entry20_proc_U0_ap_idle;
wire    Block_entry20_proc_U0_ap_ready;
wire   [10:0] Block_entry20_proc_U0_ap_return_0;
wire   [10:0] Block_entry20_proc_U0_ap_return_1;
wire   [31:0] Block_entry20_proc_U0_ap_return_2;
wire   [31:0] Block_entry20_proc_U0_ap_return_3;
wire   [31:0] Block_entry20_proc_U0_ap_return_4;
wire   [31:0] Block_entry20_proc_U0_ap_return_5;
wire   [31:0] Block_entry20_proc_U0_ap_return_6;
wire   [31:0] Block_entry20_proc_U0_ap_return_7;
wire   [31:0] Block_entry20_proc_U0_ap_return_8;
wire   [31:0] Block_entry20_proc_U0_ap_return_9;
wire    ap_channel_done_resize_out_mat_cols_c39_channel;
wire    resize_out_mat_cols_c39_channel_full_n;
reg    ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel;
wire    ap_sync_channel_write_resize_out_mat_cols_c39_channel;
wire    ap_channel_done_resize_out_mat_rows_c38_channel;
wire    resize_out_mat_rows_c38_channel_full_n;
reg    ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel;
wire    ap_sync_channel_write_resize_out_mat_rows_c38_channel;
wire    ap_channel_done_imgInput_y_cols_c37_channel;
wire    imgInput_y_cols_c37_channel_full_n;
reg    ap_sync_reg_channel_write_imgInput_y_cols_c37_channel;
wire    ap_sync_channel_write_imgInput_y_cols_c37_channel;
wire    ap_channel_done_imgInput_y_rows_c36_channel;
wire    imgInput_y_rows_c36_channel_full_n;
reg    ap_sync_reg_channel_write_imgInput_y_rows_c36_channel;
wire    ap_sync_channel_write_imgInput_y_rows_c36_channel;
wire    ap_channel_done_out_mat_cols_channel;
wire    out_mat_cols_channel_full_n;
reg    ap_sync_reg_channel_write_out_mat_cols_channel;
wire    ap_sync_channel_write_out_mat_cols_channel;
wire    ap_channel_done_out_mat_rows_channel;
wire    out_mat_rows_channel_full_n;
reg    ap_sync_reg_channel_write_out_mat_rows_channel;
wire    ap_sync_channel_write_out_mat_rows_channel;
wire    ap_channel_done_rgb_mat_cols_channel;
wire    rgb_mat_cols_channel_full_n;
reg    ap_sync_reg_channel_write_rgb_mat_cols_channel;
wire    ap_sync_channel_write_rgb_mat_cols_channel;
wire    ap_channel_done_rgb_mat_rows_channel;
wire    rgb_mat_rows_channel_full_n;
reg    ap_sync_reg_channel_write_rgb_mat_rows_channel;
wire    ap_sync_channel_write_rgb_mat_rows_channel;
wire    ap_channel_done_imgInput_uv_cols_channel;
wire    imgInput_uv_cols_channel_full_n;
reg    ap_sync_reg_channel_write_imgInput_uv_cols_channel;
wire    ap_sync_channel_write_imgInput_uv_cols_channel;
wire    ap_channel_done_imgInput_uv_rows_channel;
wire    imgInput_uv_rows_channel_full_n;
reg    ap_sync_reg_channel_write_imgInput_uv_rows_channel;
wire    ap_sync_channel_write_imgInput_uv_rows_channel;
wire    Array2xfMat_64_0_2160_3840_1_U0_ap_start;
wire    Array2xfMat_64_0_2160_3840_1_U0_ap_done;
wire    Array2xfMat_64_0_2160_3840_1_U0_ap_continue;
wire    Array2xfMat_64_0_2160_3840_1_U0_ap_idle;
wire    Array2xfMat_64_0_2160_3840_1_U0_ap_ready;
wire    Array2xfMat_64_0_2160_3840_1_U0_start_out;
wire    Array2xfMat_64_0_2160_3840_1_U0_start_write;
wire    Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWVALID;
wire   [63:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWADDR;
wire   [0:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWID;
wire   [31:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWLEN;
wire   [2:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWSIZE;
wire   [1:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWBURST;
wire   [1:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWLOCK;
wire   [3:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWCACHE;
wire   [2:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWPROT;
wire   [3:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWQOS;
wire   [3:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWREGION;
wire   [0:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWUSER;
wire    Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WVALID;
wire   [63:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WDATA;
wire   [7:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WSTRB;
wire    Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WLAST;
wire   [0:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WID;
wire   [0:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WUSER;
wire    Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARVALID;
wire   [63:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARADDR;
wire   [0:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARID;
wire   [31:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLEN;
wire   [2:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARSIZE;
wire   [1:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARBURST;
wire   [1:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLOCK;
wire   [3:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARCACHE;
wire   [2:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARPROT;
wire   [3:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARQOS;
wire   [3:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARREGION;
wire   [0:0] Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARUSER;
wire    Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_RREADY;
wire    Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_BREADY;
wire   [7:0] Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_din;
wire    Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_write;
wire   [31:0] Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_din;
wire    Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_write;
wire   [31:0] Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_din;
wire    Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_write;
wire    Block_entry2022_proc_U0_ap_start;
wire    Block_entry2022_proc_U0_ap_done;
wire    Block_entry2022_proc_U0_ap_continue;
wire    Block_entry2022_proc_U0_ap_idle;
wire    Block_entry2022_proc_U0_ap_ready;
wire   [31:0] Block_entry2022_proc_U0_ap_return;
wire    select_ln59_loc_channel_full_n;
wire    Array2xfMat_64_6_1080_1920_1_U0_ap_start;
wire    Array2xfMat_64_6_1080_1920_1_U0_ap_done;
wire    Array2xfMat_64_6_1080_1920_1_U0_ap_continue;
wire    Array2xfMat_64_6_1080_1920_1_U0_ap_idle;
wire    Array2xfMat_64_6_1080_1920_1_U0_ap_ready;
wire    Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWVALID;
wire   [63:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWADDR;
wire   [0:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWID;
wire   [31:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWLEN;
wire   [2:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWSIZE;
wire   [1:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWBURST;
wire   [1:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWLOCK;
wire   [3:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWCACHE;
wire   [2:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWPROT;
wire   [3:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWQOS;
wire   [3:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWREGION;
wire   [0:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWUSER;
wire    Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WVALID;
wire   [63:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WDATA;
wire   [7:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WSTRB;
wire    Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WLAST;
wire   [0:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WID;
wire   [0:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WUSER;
wire    Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARVALID;
wire   [63:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARADDR;
wire   [0:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARID;
wire   [31:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLEN;
wire   [2:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARSIZE;
wire   [1:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARBURST;
wire   [1:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLOCK;
wire   [3:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARCACHE;
wire   [2:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARPROT;
wire   [3:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARQOS;
wire   [3:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARREGION;
wire   [0:0] Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARUSER;
wire    Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_RREADY;
wire    Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_BREADY;
wire   [15:0] Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_din;
wire    Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_write;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_ap_start;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_ap_done;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_ap_continue;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_ap_idle;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_ap_ready;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_rows_read;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_cols_read;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_y_data81_read;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_uv_data82_read;
wire   [23:0] nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_din;
wire    nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_write;
wire    resize_1_9_2160_3840_720_720_1_9_U0_ap_start;
wire    resize_1_9_2160_3840_720_720_1_9_U0_ap_done;
wire    resize_1_9_2160_3840_720_720_1_9_U0_ap_continue;
wire    resize_1_9_2160_3840_720_720_1_9_U0_ap_idle;
wire    resize_1_9_2160_3840_720_720_1_9_U0_ap_ready;
wire    resize_1_9_2160_3840_720_720_1_9_U0_rgb_mat_data83_read;
wire   [23:0] resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_din;
wire    resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_write;
wire   [31:0] resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_din;
wire    resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_write;
wire   [31:0] resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_din;
wire    resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_write;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_start;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_done;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_continue;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_idle;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_rows_read;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_cols_read;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_resize_out_mat_data84_read;
wire   [23:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_din;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_write;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWVALID;
wire   [63:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWADDR;
wire   [0:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWID;
wire   [31:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWLEN;
wire   [2:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWSIZE;
wire   [1:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWBURST;
wire   [1:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWLOCK;
wire   [3:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWCACHE;
wire   [2:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWPROT;
wire   [3:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWQOS;
wire   [3:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWREGION;
wire   [0:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWUSER;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WVALID;
wire   [63:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WDATA;
wire   [7:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WSTRB;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WLAST;
wire   [0:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WID;
wire   [0:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WUSER;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARVALID;
wire   [63:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARADDR;
wire   [0:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARID;
wire   [31:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLEN;
wire   [2:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARSIZE;
wire   [1:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARBURST;
wire   [1:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLOCK;
wire   [3:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARCACHE;
wire   [2:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARPROT;
wire   [3:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARQOS;
wire   [3:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARREGION;
wire   [0:0] preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARUSER;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_RREADY;
wire    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_BREADY;
wire    xfMat2Array_64_9_720_720_1_1_U0_ap_start;
wire    xfMat2Array_64_9_720_720_1_1_U0_ap_done;
wire    xfMat2Array_64_9_720_720_1_1_U0_ap_continue;
wire    xfMat2Array_64_9_720_720_1_1_U0_ap_idle;
wire    xfMat2Array_64_9_720_720_1_1_U0_ap_ready;
wire    xfMat2Array_64_9_720_720_1_1_U0_out_mat_data85_read;
wire    xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWVALID;
wire   [63:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWADDR;
wire   [0:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWID;
wire   [31:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLEN;
wire   [2:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWSIZE;
wire   [1:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWBURST;
wire   [1:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLOCK;
wire   [3:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWCACHE;
wire   [2:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWPROT;
wire   [3:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWQOS;
wire   [3:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWREGION;
wire   [0:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWUSER;
wire    xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WVALID;
wire   [63:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WDATA;
wire   [7:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WSTRB;
wire    xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WLAST;
wire   [0:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WID;
wire   [0:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WUSER;
wire    xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARVALID;
wire   [63:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARADDR;
wire   [0:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARID;
wire   [31:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARLEN;
wire   [2:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARSIZE;
wire   [1:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARBURST;
wire   [1:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARLOCK;
wire   [3:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARCACHE;
wire   [2:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARPROT;
wire   [3:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARQOS;
wire   [3:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARREGION;
wire   [0:0] xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARUSER;
wire    xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_RREADY;
wire    xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_BREADY;
wire    xfMat2Array_64_9_720_720_1_1_U0_dstPtr_read;
wire    xfMat2Array_64_9_720_720_1_1_U0_stride_read;
wire    img_out_c_full_n;
wire   [63:0] img_out_c_dout;
wire   [3:0] img_out_c_num_data_valid;
wire   [3:0] img_out_c_fifo_cap;
wire    img_out_c_empty_n;
wire    out_img_linestride_c_full_n;
wire   [31:0] out_img_linestride_c_dout;
wire   [3:0] out_img_linestride_c_num_data_valid;
wire   [3:0] out_img_linestride_c_fifo_cap;
wire    out_img_linestride_c_empty_n;
wire   [10:0] imgInput_uv_rows_channel_dout;
wire   [1:0] imgInput_uv_rows_channel_num_data_valid;
wire   [1:0] imgInput_uv_rows_channel_fifo_cap;
wire    imgInput_uv_rows_channel_empty_n;
wire   [10:0] imgInput_uv_cols_channel_dout;
wire   [1:0] imgInput_uv_cols_channel_num_data_valid;
wire   [1:0] imgInput_uv_cols_channel_fifo_cap;
wire    imgInput_uv_cols_channel_empty_n;
wire   [31:0] rgb_mat_rows_channel_dout;
wire   [2:0] rgb_mat_rows_channel_num_data_valid;
wire   [2:0] rgb_mat_rows_channel_fifo_cap;
wire    rgb_mat_rows_channel_empty_n;
wire   [31:0] rgb_mat_cols_channel_dout;
wire   [2:0] rgb_mat_cols_channel_num_data_valid;
wire   [2:0] rgb_mat_cols_channel_fifo_cap;
wire    rgb_mat_cols_channel_empty_n;
wire   [31:0] out_mat_rows_channel_dout;
wire   [3:0] out_mat_rows_channel_num_data_valid;
wire   [3:0] out_mat_rows_channel_fifo_cap;
wire    out_mat_rows_channel_empty_n;
wire   [31:0] out_mat_cols_channel_dout;
wire   [3:0] out_mat_cols_channel_num_data_valid;
wire   [3:0] out_mat_cols_channel_fifo_cap;
wire    out_mat_cols_channel_empty_n;
wire   [31:0] imgInput_y_rows_c36_channel_dout;
wire   [1:0] imgInput_y_rows_c36_channel_num_data_valid;
wire   [1:0] imgInput_y_rows_c36_channel_fifo_cap;
wire    imgInput_y_rows_c36_channel_empty_n;
wire   [31:0] imgInput_y_cols_c37_channel_dout;
wire   [1:0] imgInput_y_cols_c37_channel_num_data_valid;
wire   [1:0] imgInput_y_cols_c37_channel_fifo_cap;
wire    imgInput_y_cols_c37_channel_empty_n;
wire   [31:0] resize_out_mat_rows_c38_channel_dout;
wire   [2:0] resize_out_mat_rows_c38_channel_num_data_valid;
wire   [2:0] resize_out_mat_rows_c38_channel_fifo_cap;
wire    resize_out_mat_rows_c38_channel_empty_n;
wire   [31:0] resize_out_mat_cols_c39_channel_dout;
wire   [2:0] resize_out_mat_cols_c39_channel_num_data_valid;
wire   [2:0] resize_out_mat_cols_c39_channel_fifo_cap;
wire    resize_out_mat_cols_c39_channel_empty_n;
wire    imgInput_y_data_full_n;
wire   [7:0] imgInput_y_data_dout;
wire   [1:0] imgInput_y_data_num_data_valid;
wire   [1:0] imgInput_y_data_fifo_cap;
wire    imgInput_y_data_empty_n;
wire    imgInput_y_rows_c_full_n;
wire   [31:0] imgInput_y_rows_c_dout;
wire   [1:0] imgInput_y_rows_c_num_data_valid;
wire   [1:0] imgInput_y_rows_c_fifo_cap;
wire    imgInput_y_rows_c_empty_n;
wire    imgInput_y_cols_c_full_n;
wire   [31:0] imgInput_y_cols_c_dout;
wire   [1:0] imgInput_y_cols_c_num_data_valid;
wire   [1:0] imgInput_y_cols_c_fifo_cap;
wire    imgInput_y_cols_c_empty_n;
wire   [31:0] select_ln59_loc_channel_dout;
wire   [1:0] select_ln59_loc_channel_num_data_valid;
wire   [1:0] select_ln59_loc_channel_fifo_cap;
wire    select_ln59_loc_channel_empty_n;
wire    imgInput_uv_data_full_n;
wire   [15:0] imgInput_uv_data_dout;
wire   [1:0] imgInput_uv_data_num_data_valid;
wire   [1:0] imgInput_uv_data_fifo_cap;
wire    imgInput_uv_data_empty_n;
wire    rgb_mat_data_full_n;
wire   [23:0] rgb_mat_data_dout;
wire   [1:0] rgb_mat_data_num_data_valid;
wire   [1:0] rgb_mat_data_fifo_cap;
wire    rgb_mat_data_empty_n;
wire    resize_out_mat_data_full_n;
wire   [23:0] resize_out_mat_data_dout;
wire   [1:0] resize_out_mat_data_num_data_valid;
wire   [1:0] resize_out_mat_data_fifo_cap;
wire    resize_out_mat_data_empty_n;
wire    resize_out_mat_rows_c_full_n;
wire   [31:0] resize_out_mat_rows_c_dout;
wire   [1:0] resize_out_mat_rows_c_num_data_valid;
wire   [1:0] resize_out_mat_rows_c_fifo_cap;
wire    resize_out_mat_rows_c_empty_n;
wire    resize_out_mat_cols_c_full_n;
wire   [31:0] resize_out_mat_cols_c_dout;
wire   [1:0] resize_out_mat_cols_c_num_data_valid;
wire   [1:0] resize_out_mat_cols_c_fifo_cap;
wire    resize_out_mat_cols_c_empty_n;
wire    out_mat_data_full_n;
wire   [23:0] out_mat_data_dout;
wire   [1:0] out_mat_data_num_data_valid;
wire   [1:0] out_mat_data_fifo_cap;
wire    out_mat_data_empty_n;
wire    ap_sync_ready;
reg    ap_sync_reg_entry_proc11_U0_ap_ready;
wire    ap_sync_entry_proc11_U0_ap_ready;
reg    ap_sync_reg_Block_entry20_proc_U0_ap_ready;
wire    ap_sync_Block_entry20_proc_U0_ap_ready;
reg    ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready;
wire    ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready;
reg    ap_sync_reg_Block_entry2022_proc_U0_ap_ready;
wire    ap_sync_Block_entry2022_proc_U0_ap_ready;
reg    ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready;
wire    ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready;
reg    ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready;
wire    ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready;
wire   [0:0] start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_din;
wire    start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_full_n;
wire   [0:0] start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_dout;
wire    start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_empty_n;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_rst_reg_2 = 1'b1;
#0 ap_rst_reg_1 = 1'b1;
#0 ap_rst_n_inv = 1'b1;
#0 ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel = 1'b0;
#0 ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel = 1'b0;
#0 ap_sync_reg_channel_write_imgInput_y_cols_c37_channel = 1'b0;
#0 ap_sync_reg_channel_write_imgInput_y_rows_c36_channel = 1'b0;
#0 ap_sync_reg_channel_write_out_mat_cols_channel = 1'b0;
#0 ap_sync_reg_channel_write_out_mat_rows_channel = 1'b0;
#0 ap_sync_reg_channel_write_rgb_mat_cols_channel = 1'b0;
#0 ap_sync_reg_channel_write_rgb_mat_rows_channel = 1'b0;
#0 ap_sync_reg_channel_write_imgInput_uv_cols_channel = 1'b0;
#0 ap_sync_reg_channel_write_imgInput_uv_rows_channel = 1'b0;
#0 ap_sync_reg_entry_proc11_U0_ap_ready = 1'b0;
#0 ap_sync_reg_Block_entry20_proc_U0_ap_ready = 1'b0;
#0 ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready = 1'b0;
#0 ap_sync_reg_Block_entry2022_proc_U0_ap_ready = 1'b0;
#0 ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready = 1'b0;
#0 ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready = 1'b0;
end

pp_pipeline_accel_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .img_inp_y(img_inp_y),
    .img_inp_uv(img_inp_uv),
    .img_out(img_out),
    .params(params),
    .in_img_width(in_img_width),
    .in_img_height(in_img_height),
    .in_img_linestride(in_img_linestride),
    .out_img_width(out_img_width),
    .out_img_height(out_img_height),
    .out_img_linestride(out_img_linestride),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_continue(ap_continue),
    .ap_idle(ap_idle)
);

pp_pipeline_accel_gmem1_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 69 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM1_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM1_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM1_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM1_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM1_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM1_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM1_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM1_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM1_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM1_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM1_CACHE_VALUE ),
    .USER_DW( 64 ),
    .USER_AW( 64 ))
gmem1_m_axi_U(
    .AWVALID(m_axi_gmem1_AWVALID),
    .AWREADY(m_axi_gmem1_AWREADY),
    .AWADDR(m_axi_gmem1_AWADDR),
    .AWID(m_axi_gmem1_AWID),
    .AWLEN(m_axi_gmem1_AWLEN),
    .AWSIZE(m_axi_gmem1_AWSIZE),
    .AWBURST(m_axi_gmem1_AWBURST),
    .AWLOCK(m_axi_gmem1_AWLOCK),
    .AWCACHE(m_axi_gmem1_AWCACHE),
    .AWPROT(m_axi_gmem1_AWPROT),
    .AWQOS(m_axi_gmem1_AWQOS),
    .AWREGION(m_axi_gmem1_AWREGION),
    .AWUSER(m_axi_gmem1_AWUSER),
    .WVALID(m_axi_gmem1_WVALID),
    .WREADY(m_axi_gmem1_WREADY),
    .WDATA(m_axi_gmem1_WDATA),
    .WSTRB(m_axi_gmem1_WSTRB),
    .WLAST(m_axi_gmem1_WLAST),
    .WID(m_axi_gmem1_WID),
    .WUSER(m_axi_gmem1_WUSER),
    .ARVALID(m_axi_gmem1_ARVALID),
    .ARREADY(m_axi_gmem1_ARREADY),
    .ARADDR(m_axi_gmem1_ARADDR),
    .ARID(m_axi_gmem1_ARID),
    .ARLEN(m_axi_gmem1_ARLEN),
    .ARSIZE(m_axi_gmem1_ARSIZE),
    .ARBURST(m_axi_gmem1_ARBURST),
    .ARLOCK(m_axi_gmem1_ARLOCK),
    .ARCACHE(m_axi_gmem1_ARCACHE),
    .ARPROT(m_axi_gmem1_ARPROT),
    .ARQOS(m_axi_gmem1_ARQOS),
    .ARREGION(m_axi_gmem1_ARREGION),
    .ARUSER(m_axi_gmem1_ARUSER),
    .RVALID(m_axi_gmem1_RVALID),
    .RREADY(m_axi_gmem1_RREADY),
    .RDATA(m_axi_gmem1_RDATA),
    .RLAST(m_axi_gmem1_RLAST),
    .RID(m_axi_gmem1_RID),
    .RUSER(m_axi_gmem1_RUSER),
    .RRESP(m_axi_gmem1_RRESP),
    .BVALID(m_axi_gmem1_BVALID),
    .BREADY(m_axi_gmem1_BREADY),
    .BRESP(m_axi_gmem1_BRESP),
    .BID(m_axi_gmem1_BID),
    .BUSER(m_axi_gmem1_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARVALID),
    .I_ARREADY(gmem1_ARREADY),
    .I_ARADDR(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARADDR),
    .I_ARLEN(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLEN),
    .I_RVALID(gmem1_RVALID),
    .I_RREADY(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_RREADY),
    .I_RDATA(gmem1_RDATA),
    .I_RFIFONUM(gmem1_RFIFONUM),
    .I_AWVALID(1'b0),
    .I_AWREADY(gmem1_AWREADY),
    .I_AWADDR(64'd0),
    .I_AWLEN(32'd0),
    .I_WVALID(1'b0),
    .I_WREADY(gmem1_WREADY),
    .I_WDATA(64'd0),
    .I_WSTRB(8'd0),
    .I_BVALID(gmem1_BVALID),
    .I_BREADY(1'b0)
);

pp_pipeline_accel_gmem2_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 69 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM2_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM2_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM2_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM2_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM2_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM2_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM2_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM2_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM2_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM2_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM2_CACHE_VALUE ),
    .USER_DW( 64 ),
    .USER_AW( 64 ))
gmem2_m_axi_U(
    .AWVALID(m_axi_gmem2_AWVALID),
    .AWREADY(m_axi_gmem2_AWREADY),
    .AWADDR(m_axi_gmem2_AWADDR),
    .AWID(m_axi_gmem2_AWID),
    .AWLEN(m_axi_gmem2_AWLEN),
    .AWSIZE(m_axi_gmem2_AWSIZE),
    .AWBURST(m_axi_gmem2_AWBURST),
    .AWLOCK(m_axi_gmem2_AWLOCK),
    .AWCACHE(m_axi_gmem2_AWCACHE),
    .AWPROT(m_axi_gmem2_AWPROT),
    .AWQOS(m_axi_gmem2_AWQOS),
    .AWREGION(m_axi_gmem2_AWREGION),
    .AWUSER(m_axi_gmem2_AWUSER),
    .WVALID(m_axi_gmem2_WVALID),
    .WREADY(m_axi_gmem2_WREADY),
    .WDATA(m_axi_gmem2_WDATA),
    .WSTRB(m_axi_gmem2_WSTRB),
    .WLAST(m_axi_gmem2_WLAST),
    .WID(m_axi_gmem2_WID),
    .WUSER(m_axi_gmem2_WUSER),
    .ARVALID(m_axi_gmem2_ARVALID),
    .ARREADY(m_axi_gmem2_ARREADY),
    .ARADDR(m_axi_gmem2_ARADDR),
    .ARID(m_axi_gmem2_ARID),
    .ARLEN(m_axi_gmem2_ARLEN),
    .ARSIZE(m_axi_gmem2_ARSIZE),
    .ARBURST(m_axi_gmem2_ARBURST),
    .ARLOCK(m_axi_gmem2_ARLOCK),
    .ARCACHE(m_axi_gmem2_ARCACHE),
    .ARPROT(m_axi_gmem2_ARPROT),
    .ARQOS(m_axi_gmem2_ARQOS),
    .ARREGION(m_axi_gmem2_ARREGION),
    .ARUSER(m_axi_gmem2_ARUSER),
    .RVALID(m_axi_gmem2_RVALID),
    .RREADY(m_axi_gmem2_RREADY),
    .RDATA(m_axi_gmem2_RDATA),
    .RLAST(m_axi_gmem2_RLAST),
    .RID(m_axi_gmem2_RID),
    .RUSER(m_axi_gmem2_RUSER),
    .RRESP(m_axi_gmem2_RRESP),
    .BVALID(m_axi_gmem2_BVALID),
    .BREADY(m_axi_gmem2_BREADY),
    .BRESP(m_axi_gmem2_BRESP),
    .BID(m_axi_gmem2_BID),
    .BUSER(m_axi_gmem2_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARVALID),
    .I_ARREADY(gmem2_ARREADY),
    .I_ARADDR(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARADDR),
    .I_ARLEN(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLEN),
    .I_RVALID(gmem2_RVALID),
    .I_RREADY(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_RREADY),
    .I_RDATA(gmem2_RDATA),
    .I_RFIFONUM(gmem2_RFIFONUM),
    .I_AWVALID(1'b0),
    .I_AWREADY(gmem2_AWREADY),
    .I_AWADDR(64'd0),
    .I_AWLEN(32'd0),
    .I_WVALID(1'b0),
    .I_WREADY(gmem2_WREADY),
    .I_WDATA(64'd0),
    .I_WSTRB(8'd0),
    .I_BVALID(gmem2_BVALID),
    .I_BREADY(1'b0)
);

pp_pipeline_accel_gmem3_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 69 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM3_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM3_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM3_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM3_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM3_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM3_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM3_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM3_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM3_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM3_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM3_CACHE_VALUE ),
    .USER_DW( 64 ),
    .USER_AW( 64 ))
gmem3_m_axi_U(
    .AWVALID(m_axi_gmem3_AWVALID),
    .AWREADY(m_axi_gmem3_AWREADY),
    .AWADDR(m_axi_gmem3_AWADDR),
    .AWID(m_axi_gmem3_AWID),
    .AWLEN(m_axi_gmem3_AWLEN),
    .AWSIZE(m_axi_gmem3_AWSIZE),
    .AWBURST(m_axi_gmem3_AWBURST),
    .AWLOCK(m_axi_gmem3_AWLOCK),
    .AWCACHE(m_axi_gmem3_AWCACHE),
    .AWPROT(m_axi_gmem3_AWPROT),
    .AWQOS(m_axi_gmem3_AWQOS),
    .AWREGION(m_axi_gmem3_AWREGION),
    .AWUSER(m_axi_gmem3_AWUSER),
    .WVALID(m_axi_gmem3_WVALID),
    .WREADY(m_axi_gmem3_WREADY),
    .WDATA(m_axi_gmem3_WDATA),
    .WSTRB(m_axi_gmem3_WSTRB),
    .WLAST(m_axi_gmem3_WLAST),
    .WID(m_axi_gmem3_WID),
    .WUSER(m_axi_gmem3_WUSER),
    .ARVALID(m_axi_gmem3_ARVALID),
    .ARREADY(m_axi_gmem3_ARREADY),
    .ARADDR(m_axi_gmem3_ARADDR),
    .ARID(m_axi_gmem3_ARID),
    .ARLEN(m_axi_gmem3_ARLEN),
    .ARSIZE(m_axi_gmem3_ARSIZE),
    .ARBURST(m_axi_gmem3_ARBURST),
    .ARLOCK(m_axi_gmem3_ARLOCK),
    .ARCACHE(m_axi_gmem3_ARCACHE),
    .ARPROT(m_axi_gmem3_ARPROT),
    .ARQOS(m_axi_gmem3_ARQOS),
    .ARREGION(m_axi_gmem3_ARREGION),
    .ARUSER(m_axi_gmem3_ARUSER),
    .RVALID(m_axi_gmem3_RVALID),
    .RREADY(m_axi_gmem3_RREADY),
    .RDATA(m_axi_gmem3_RDATA),
    .RLAST(m_axi_gmem3_RLAST),
    .RID(m_axi_gmem3_RID),
    .RUSER(m_axi_gmem3_RUSER),
    .RRESP(m_axi_gmem3_RRESP),
    .BVALID(m_axi_gmem3_BVALID),
    .BREADY(m_axi_gmem3_BREADY),
    .BRESP(m_axi_gmem3_BRESP),
    .BID(m_axi_gmem3_BID),
    .BUSER(m_axi_gmem3_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(1'b0),
    .I_ARREADY(gmem3_ARREADY),
    .I_ARADDR(64'd0),
    .I_ARLEN(32'd0),
    .I_RVALID(gmem3_RVALID),
    .I_RREADY(1'b0),
    .I_RDATA(gmem3_RDATA),
    .I_RFIFONUM(gmem3_RFIFONUM),
    .I_AWVALID(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWVALID),
    .I_AWREADY(gmem3_AWREADY),
    .I_AWADDR(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWADDR),
    .I_AWLEN(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLEN),
    .I_WVALID(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WVALID),
    .I_WREADY(gmem3_WREADY),
    .I_WDATA(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WDATA),
    .I_WSTRB(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WSTRB),
    .I_BVALID(gmem3_BVALID),
    .I_BREADY(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_BREADY)
);

pp_pipeline_accel_gmem4_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 69 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM4_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM4_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM4_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM4_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM4_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM4_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM4_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM4_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM4_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM4_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM4_CACHE_VALUE ),
    .USER_DW( 64 ),
    .USER_AW( 64 ))
gmem4_m_axi_U(
    .AWVALID(m_axi_gmem4_AWVALID),
    .AWREADY(m_axi_gmem4_AWREADY),
    .AWADDR(m_axi_gmem4_AWADDR),
    .AWID(m_axi_gmem4_AWID),
    .AWLEN(m_axi_gmem4_AWLEN),
    .AWSIZE(m_axi_gmem4_AWSIZE),
    .AWBURST(m_axi_gmem4_AWBURST),
    .AWLOCK(m_axi_gmem4_AWLOCK),
    .AWCACHE(m_axi_gmem4_AWCACHE),
    .AWPROT(m_axi_gmem4_AWPROT),
    .AWQOS(m_axi_gmem4_AWQOS),
    .AWREGION(m_axi_gmem4_AWREGION),
    .AWUSER(m_axi_gmem4_AWUSER),
    .WVALID(m_axi_gmem4_WVALID),
    .WREADY(m_axi_gmem4_WREADY),
    .WDATA(m_axi_gmem4_WDATA),
    .WSTRB(m_axi_gmem4_WSTRB),
    .WLAST(m_axi_gmem4_WLAST),
    .WID(m_axi_gmem4_WID),
    .WUSER(m_axi_gmem4_WUSER),
    .ARVALID(m_axi_gmem4_ARVALID),
    .ARREADY(m_axi_gmem4_ARREADY),
    .ARADDR(m_axi_gmem4_ARADDR),
    .ARID(m_axi_gmem4_ARID),
    .ARLEN(m_axi_gmem4_ARLEN),
    .ARSIZE(m_axi_gmem4_ARSIZE),
    .ARBURST(m_axi_gmem4_ARBURST),
    .ARLOCK(m_axi_gmem4_ARLOCK),
    .ARCACHE(m_axi_gmem4_ARCACHE),
    .ARPROT(m_axi_gmem4_ARPROT),
    .ARQOS(m_axi_gmem4_ARQOS),
    .ARREGION(m_axi_gmem4_ARREGION),
    .ARUSER(m_axi_gmem4_ARUSER),
    .RVALID(m_axi_gmem4_RVALID),
    .RREADY(m_axi_gmem4_RREADY),
    .RDATA(m_axi_gmem4_RDATA),
    .RLAST(m_axi_gmem4_RLAST),
    .RID(m_axi_gmem4_RID),
    .RUSER(m_axi_gmem4_RUSER),
    .RRESP(m_axi_gmem4_RRESP),
    .BVALID(m_axi_gmem4_BVALID),
    .BREADY(m_axi_gmem4_BREADY),
    .BRESP(m_axi_gmem4_BRESP),
    .BID(m_axi_gmem4_BID),
    .BUSER(m_axi_gmem4_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARVALID),
    .I_ARREADY(gmem4_ARREADY),
    .I_ARADDR(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARADDR),
    .I_ARLEN(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLEN),
    .I_RVALID(gmem4_RVALID),
    .I_RREADY(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_RREADY),
    .I_RDATA(gmem4_RDATA),
    .I_RFIFONUM(gmem4_RFIFONUM),
    .I_AWVALID(1'b0),
    .I_AWREADY(gmem4_AWREADY),
    .I_AWADDR(64'd0),
    .I_AWLEN(32'd0),
    .I_WVALID(1'b0),
    .I_WREADY(gmem4_WREADY),
    .I_WDATA(64'd0),
    .I_WSTRB(8'd0),
    .I_BVALID(gmem4_BVALID),
    .I_BREADY(1'b0)
);

pp_pipeline_accel_entry_proc11 entry_proc11_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(entry_proc11_U0_ap_start),
    .ap_done(entry_proc11_U0_ap_done),
    .ap_continue(entry_proc11_U0_ap_continue),
    .ap_idle(entry_proc11_U0_ap_idle),
    .ap_ready(entry_proc11_U0_ap_ready),
    .img_out(img_out),
    .img_out_c_din(entry_proc11_U0_img_out_c_din),
    .img_out_c_num_data_valid(img_out_c_num_data_valid),
    .img_out_c_fifo_cap(img_out_c_fifo_cap),
    .img_out_c_full_n(img_out_c_full_n),
    .img_out_c_write(entry_proc11_U0_img_out_c_write),
    .out_img_linestride(out_img_linestride),
    .out_img_linestride_c_din(entry_proc11_U0_out_img_linestride_c_din),
    .out_img_linestride_c_num_data_valid(out_img_linestride_c_num_data_valid),
    .out_img_linestride_c_fifo_cap(out_img_linestride_c_fifo_cap),
    .out_img_linestride_c_full_n(out_img_linestride_c_full_n),
    .out_img_linestride_c_write(entry_proc11_U0_out_img_linestride_c_write)
);

pp_pipeline_accel_Block_entry20_proc Block_entry20_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Block_entry20_proc_U0_ap_start),
    .ap_done(Block_entry20_proc_U0_ap_done),
    .ap_continue(Block_entry20_proc_U0_ap_continue),
    .ap_idle(Block_entry20_proc_U0_ap_idle),
    .ap_ready(Block_entry20_proc_U0_ap_ready),
    .in_img_height(in_img_height),
    .in_img_width(in_img_width),
    .out_img_height(out_img_height),
    .out_img_width(out_img_width),
    .ap_return_0(Block_entry20_proc_U0_ap_return_0),
    .ap_return_1(Block_entry20_proc_U0_ap_return_1),
    .ap_return_2(Block_entry20_proc_U0_ap_return_2),
    .ap_return_3(Block_entry20_proc_U0_ap_return_3),
    .ap_return_4(Block_entry20_proc_U0_ap_return_4),
    .ap_return_5(Block_entry20_proc_U0_ap_return_5),
    .ap_return_6(Block_entry20_proc_U0_ap_return_6),
    .ap_return_7(Block_entry20_proc_U0_ap_return_7),
    .ap_return_8(Block_entry20_proc_U0_ap_return_8),
    .ap_return_9(Block_entry20_proc_U0_ap_return_9)
);

pp_pipeline_accel_Array2xfMat_64_0_2160_3840_1_s Array2xfMat_64_0_2160_3840_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Array2xfMat_64_0_2160_3840_1_U0_ap_start),
    .start_full_n(start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_full_n),
    .ap_done(Array2xfMat_64_0_2160_3840_1_U0_ap_done),
    .ap_continue(Array2xfMat_64_0_2160_3840_1_U0_ap_continue),
    .ap_idle(Array2xfMat_64_0_2160_3840_1_U0_ap_idle),
    .ap_ready(Array2xfMat_64_0_2160_3840_1_U0_ap_ready),
    .start_out(Array2xfMat_64_0_2160_3840_1_U0_start_out),
    .start_write(Array2xfMat_64_0_2160_3840_1_U0_start_write),
    .m_axi_gmem1_AWVALID(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWVALID),
    .m_axi_gmem1_AWREADY(1'b0),
    .m_axi_gmem1_AWADDR(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWADDR),
    .m_axi_gmem1_AWID(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWID),
    .m_axi_gmem1_AWLEN(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWLEN),
    .m_axi_gmem1_AWSIZE(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWSIZE),
    .m_axi_gmem1_AWBURST(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWBURST),
    .m_axi_gmem1_AWLOCK(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWLOCK),
    .m_axi_gmem1_AWCACHE(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWCACHE),
    .m_axi_gmem1_AWPROT(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWPROT),
    .m_axi_gmem1_AWQOS(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWQOS),
    .m_axi_gmem1_AWREGION(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWREGION),
    .m_axi_gmem1_AWUSER(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWUSER),
    .m_axi_gmem1_WVALID(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WVALID),
    .m_axi_gmem1_WREADY(1'b0),
    .m_axi_gmem1_WDATA(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WDATA),
    .m_axi_gmem1_WSTRB(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WSTRB),
    .m_axi_gmem1_WLAST(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WLAST),
    .m_axi_gmem1_WID(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WID),
    .m_axi_gmem1_WUSER(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WUSER),
    .m_axi_gmem1_ARVALID(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARVALID),
    .m_axi_gmem1_ARREADY(gmem1_ARREADY),
    .m_axi_gmem1_ARADDR(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARADDR),
    .m_axi_gmem1_ARID(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARID),
    .m_axi_gmem1_ARLEN(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLEN),
    .m_axi_gmem1_ARSIZE(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARSIZE),
    .m_axi_gmem1_ARBURST(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARBURST),
    .m_axi_gmem1_ARLOCK(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLOCK),
    .m_axi_gmem1_ARCACHE(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARCACHE),
    .m_axi_gmem1_ARPROT(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARPROT),
    .m_axi_gmem1_ARQOS(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARQOS),
    .m_axi_gmem1_ARREGION(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARREGION),
    .m_axi_gmem1_ARUSER(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARUSER),
    .m_axi_gmem1_RVALID(gmem1_RVALID),
    .m_axi_gmem1_RREADY(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_RREADY),
    .m_axi_gmem1_RDATA(gmem1_RDATA),
    .m_axi_gmem1_RLAST(gmem1_RLAST),
    .m_axi_gmem1_RID(gmem1_RID),
    .m_axi_gmem1_RFIFONUM(gmem1_RFIFONUM),
    .m_axi_gmem1_RUSER(gmem1_RUSER),
    .m_axi_gmem1_RRESP(gmem1_RRESP),
    .m_axi_gmem1_BVALID(1'b0),
    .m_axi_gmem1_BREADY(Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_BREADY),
    .m_axi_gmem1_BRESP(2'd0),
    .m_axi_gmem1_BID(1'd0),
    .m_axi_gmem1_BUSER(1'd0),
    .srcPtr(img_inp_y),
    .p_read(imgInput_y_rows_c36_channel_dout),
    .p_read1(imgInput_y_cols_c37_channel_dout),
    .imgInput_y_data81_din(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_din),
    .imgInput_y_data81_num_data_valid(imgInput_y_data_num_data_valid),
    .imgInput_y_data81_fifo_cap(imgInput_y_data_fifo_cap),
    .imgInput_y_data81_full_n(imgInput_y_data_full_n),
    .imgInput_y_data81_write(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_write),
    .stride(in_img_linestride),
    .imgInput_y_rows_c_din(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_din),
    .imgInput_y_rows_c_num_data_valid(imgInput_y_rows_c_num_data_valid),
    .imgInput_y_rows_c_fifo_cap(imgInput_y_rows_c_fifo_cap),
    .imgInput_y_rows_c_full_n(imgInput_y_rows_c_full_n),
    .imgInput_y_rows_c_write(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_write),
    .imgInput_y_cols_c_din(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_din),
    .imgInput_y_cols_c_num_data_valid(imgInput_y_cols_c_num_data_valid),
    .imgInput_y_cols_c_fifo_cap(imgInput_y_cols_c_fifo_cap),
    .imgInput_y_cols_c_full_n(imgInput_y_cols_c_full_n),
    .imgInput_y_cols_c_write(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_write)
);

pp_pipeline_accel_Block_entry2022_proc Block_entry2022_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Block_entry2022_proc_U0_ap_start),
    .ap_done(Block_entry2022_proc_U0_ap_done),
    .ap_continue(Block_entry2022_proc_U0_ap_continue),
    .ap_idle(Block_entry2022_proc_U0_ap_idle),
    .ap_ready(Block_entry2022_proc_U0_ap_ready),
    .in_img_linestride(in_img_linestride),
    .ap_return(Block_entry2022_proc_U0_ap_return)
);

pp_pipeline_accel_Array2xfMat_64_6_1080_1920_1_s Array2xfMat_64_6_1080_1920_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Array2xfMat_64_6_1080_1920_1_U0_ap_start),
    .ap_done(Array2xfMat_64_6_1080_1920_1_U0_ap_done),
    .ap_continue(Array2xfMat_64_6_1080_1920_1_U0_ap_continue),
    .ap_idle(Array2xfMat_64_6_1080_1920_1_U0_ap_idle),
    .ap_ready(Array2xfMat_64_6_1080_1920_1_U0_ap_ready),
    .m_axi_gmem2_AWVALID(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWVALID),
    .m_axi_gmem2_AWREADY(1'b0),
    .m_axi_gmem2_AWADDR(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWADDR),
    .m_axi_gmem2_AWID(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWID),
    .m_axi_gmem2_AWLEN(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWLEN),
    .m_axi_gmem2_AWSIZE(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWSIZE),
    .m_axi_gmem2_AWBURST(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWBURST),
    .m_axi_gmem2_AWLOCK(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWLOCK),
    .m_axi_gmem2_AWCACHE(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWCACHE),
    .m_axi_gmem2_AWPROT(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWPROT),
    .m_axi_gmem2_AWQOS(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWQOS),
    .m_axi_gmem2_AWREGION(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWREGION),
    .m_axi_gmem2_AWUSER(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWUSER),
    .m_axi_gmem2_WVALID(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WVALID),
    .m_axi_gmem2_WREADY(1'b0),
    .m_axi_gmem2_WDATA(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WDATA),
    .m_axi_gmem2_WSTRB(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WSTRB),
    .m_axi_gmem2_WLAST(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WLAST),
    .m_axi_gmem2_WID(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WID),
    .m_axi_gmem2_WUSER(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WUSER),
    .m_axi_gmem2_ARVALID(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARVALID),
    .m_axi_gmem2_ARREADY(gmem2_ARREADY),
    .m_axi_gmem2_ARADDR(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARADDR),
    .m_axi_gmem2_ARID(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARID),
    .m_axi_gmem2_ARLEN(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLEN),
    .m_axi_gmem2_ARSIZE(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARSIZE),
    .m_axi_gmem2_ARBURST(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARBURST),
    .m_axi_gmem2_ARLOCK(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLOCK),
    .m_axi_gmem2_ARCACHE(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARCACHE),
    .m_axi_gmem2_ARPROT(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARPROT),
    .m_axi_gmem2_ARQOS(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARQOS),
    .m_axi_gmem2_ARREGION(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARREGION),
    .m_axi_gmem2_ARUSER(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARUSER),
    .m_axi_gmem2_RVALID(gmem2_RVALID),
    .m_axi_gmem2_RREADY(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_RREADY),
    .m_axi_gmem2_RDATA(gmem2_RDATA),
    .m_axi_gmem2_RLAST(gmem2_RLAST),
    .m_axi_gmem2_RID(gmem2_RID),
    .m_axi_gmem2_RFIFONUM(gmem2_RFIFONUM),
    .m_axi_gmem2_RUSER(gmem2_RUSER),
    .m_axi_gmem2_RRESP(gmem2_RRESP),
    .m_axi_gmem2_BVALID(1'b0),
    .m_axi_gmem2_BREADY(Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_BREADY),
    .m_axi_gmem2_BRESP(2'd0),
    .m_axi_gmem2_BID(1'd0),
    .m_axi_gmem2_BUSER(1'd0),
    .img_inp_uv(img_inp_uv),
    .p_read(imgInput_uv_rows_channel_dout),
    .p_read1(imgInput_uv_cols_channel_dout),
    .imgInput_uv_data_din(Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_din),
    .imgInput_uv_data_num_data_valid(imgInput_uv_data_num_data_valid),
    .imgInput_uv_data_fifo_cap(imgInput_uv_data_fifo_cap),
    .imgInput_uv_data_full_n(imgInput_uv_data_full_n),
    .imgInput_uv_data_write(Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_write),
    .p_read2(select_ln59_loc_channel_dout)
);

pp_pipeline_accel_nv122bgr_0_6_9_2160_3840_1_1_s nv122bgr_0_6_9_2160_3840_1_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(nv122bgr_0_6_9_2160_3840_1_1_U0_ap_start),
    .ap_done(nv122bgr_0_6_9_2160_3840_1_1_U0_ap_done),
    .ap_continue(nv122bgr_0_6_9_2160_3840_1_1_U0_ap_continue),
    .ap_idle(nv122bgr_0_6_9_2160_3840_1_1_U0_ap_idle),
    .ap_ready(nv122bgr_0_6_9_2160_3840_1_1_U0_ap_ready),
    .src_y_rows_dout(imgInput_y_rows_c_dout),
    .src_y_rows_num_data_valid(imgInput_y_rows_c_num_data_valid),
    .src_y_rows_fifo_cap(imgInput_y_rows_c_fifo_cap),
    .src_y_rows_empty_n(imgInput_y_rows_c_empty_n),
    .src_y_rows_read(nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_rows_read),
    .src_y_cols_dout(imgInput_y_cols_c_dout),
    .src_y_cols_num_data_valid(imgInput_y_cols_c_num_data_valid),
    .src_y_cols_fifo_cap(imgInput_y_cols_c_fifo_cap),
    .src_y_cols_empty_n(imgInput_y_cols_c_empty_n),
    .src_y_cols_read(nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_cols_read),
    .imgInput_y_data81_dout(imgInput_y_data_dout),
    .imgInput_y_data81_num_data_valid(imgInput_y_data_num_data_valid),
    .imgInput_y_data81_fifo_cap(imgInput_y_data_fifo_cap),
    .imgInput_y_data81_empty_n(imgInput_y_data_empty_n),
    .imgInput_y_data81_read(nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_y_data81_read),
    .imgInput_uv_data82_dout(imgInput_uv_data_dout),
    .imgInput_uv_data82_num_data_valid(imgInput_uv_data_num_data_valid),
    .imgInput_uv_data82_fifo_cap(imgInput_uv_data_fifo_cap),
    .imgInput_uv_data82_empty_n(imgInput_uv_data_empty_n),
    .imgInput_uv_data82_read(nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_uv_data82_read),
    .rgb_mat_data83_din(nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_din),
    .rgb_mat_data83_num_data_valid(rgb_mat_data_num_data_valid),
    .rgb_mat_data83_fifo_cap(rgb_mat_data_fifo_cap),
    .rgb_mat_data83_full_n(rgb_mat_data_full_n),
    .rgb_mat_data83_write(nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_write)
);

pp_pipeline_accel_resize_1_9_2160_3840_720_720_1_9_s resize_1_9_2160_3840_720_720_1_9_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(resize_1_9_2160_3840_720_720_1_9_U0_ap_start),
    .ap_done(resize_1_9_2160_3840_720_720_1_9_U0_ap_done),
    .ap_continue(resize_1_9_2160_3840_720_720_1_9_U0_ap_continue),
    .ap_idle(resize_1_9_2160_3840_720_720_1_9_U0_ap_idle),
    .ap_ready(resize_1_9_2160_3840_720_720_1_9_U0_ap_ready),
    .p_read(rgb_mat_rows_channel_dout),
    .p_read1(rgb_mat_cols_channel_dout),
    .rgb_mat_data83_dout(rgb_mat_data_dout),
    .rgb_mat_data83_num_data_valid(rgb_mat_data_num_data_valid),
    .rgb_mat_data83_fifo_cap(rgb_mat_data_fifo_cap),
    .rgb_mat_data83_empty_n(rgb_mat_data_empty_n),
    .rgb_mat_data83_read(resize_1_9_2160_3840_720_720_1_9_U0_rgb_mat_data83_read),
    .p_read2(resize_out_mat_rows_c38_channel_dout),
    .p_read3(resize_out_mat_cols_c39_channel_dout),
    .resize_out_mat_data84_din(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_din),
    .resize_out_mat_data84_num_data_valid(resize_out_mat_data_num_data_valid),
    .resize_out_mat_data84_fifo_cap(resize_out_mat_data_fifo_cap),
    .resize_out_mat_data84_full_n(resize_out_mat_data_full_n),
    .resize_out_mat_data84_write(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_write),
    .resize_out_mat_rows_c_din(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_din),
    .resize_out_mat_rows_c_num_data_valid(resize_out_mat_rows_c_num_data_valid),
    .resize_out_mat_rows_c_fifo_cap(resize_out_mat_rows_c_fifo_cap),
    .resize_out_mat_rows_c_full_n(resize_out_mat_rows_c_full_n),
    .resize_out_mat_rows_c_write(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_write),
    .resize_out_mat_cols_c_din(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_din),
    .resize_out_mat_cols_c_num_data_valid(resize_out_mat_cols_c_num_data_valid),
    .resize_out_mat_cols_c_fifo_cap(resize_out_mat_cols_c_fifo_cap),
    .resize_out_mat_cols_c_full_n(resize_out_mat_cols_c_full_n),
    .resize_out_mat_cols_c_write(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_write)
);

pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_s preProcess_9_9_720_720_1_8_8_8_4_8_8_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_start),
    .ap_done(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_done),
    .ap_continue(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_continue),
    .ap_idle(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_idle),
    .ap_ready(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready),
    .in_mat_rows_dout(resize_out_mat_rows_c_dout),
    .in_mat_rows_num_data_valid(resize_out_mat_rows_c_num_data_valid),
    .in_mat_rows_fifo_cap(resize_out_mat_rows_c_fifo_cap),
    .in_mat_rows_empty_n(resize_out_mat_rows_c_empty_n),
    .in_mat_rows_read(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_rows_read),
    .in_mat_cols_dout(resize_out_mat_cols_c_dout),
    .in_mat_cols_num_data_valid(resize_out_mat_cols_c_num_data_valid),
    .in_mat_cols_fifo_cap(resize_out_mat_cols_c_fifo_cap),
    .in_mat_cols_empty_n(resize_out_mat_cols_c_empty_n),
    .in_mat_cols_read(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_cols_read),
    .resize_out_mat_data84_dout(resize_out_mat_data_dout),
    .resize_out_mat_data84_num_data_valid(resize_out_mat_data_num_data_valid),
    .resize_out_mat_data84_fifo_cap(resize_out_mat_data_fifo_cap),
    .resize_out_mat_data84_empty_n(resize_out_mat_data_empty_n),
    .resize_out_mat_data84_read(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_resize_out_mat_data84_read),
    .out_mat_data85_din(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_din),
    .out_mat_data85_num_data_valid(out_mat_data_num_data_valid),
    .out_mat_data85_fifo_cap(out_mat_data_fifo_cap),
    .out_mat_data85_full_n(out_mat_data_full_n),
    .out_mat_data85_write(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_write),
    .m_axi_gmem4_AWVALID(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWVALID),
    .m_axi_gmem4_AWREADY(1'b0),
    .m_axi_gmem4_AWADDR(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWADDR),
    .m_axi_gmem4_AWID(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWID),
    .m_axi_gmem4_AWLEN(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWLEN),
    .m_axi_gmem4_AWSIZE(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWSIZE),
    .m_axi_gmem4_AWBURST(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWBURST),
    .m_axi_gmem4_AWLOCK(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWLOCK),
    .m_axi_gmem4_AWCACHE(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWCACHE),
    .m_axi_gmem4_AWPROT(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWPROT),
    .m_axi_gmem4_AWQOS(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWQOS),
    .m_axi_gmem4_AWREGION(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWREGION),
    .m_axi_gmem4_AWUSER(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWUSER),
    .m_axi_gmem4_WVALID(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WVALID),
    .m_axi_gmem4_WREADY(1'b0),
    .m_axi_gmem4_WDATA(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WDATA),
    .m_axi_gmem4_WSTRB(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WSTRB),
    .m_axi_gmem4_WLAST(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WLAST),
    .m_axi_gmem4_WID(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WID),
    .m_axi_gmem4_WUSER(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WUSER),
    .m_axi_gmem4_ARVALID(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARVALID),
    .m_axi_gmem4_ARREADY(gmem4_ARREADY),
    .m_axi_gmem4_ARADDR(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARADDR),
    .m_axi_gmem4_ARID(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARID),
    .m_axi_gmem4_ARLEN(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLEN),
    .m_axi_gmem4_ARSIZE(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARSIZE),
    .m_axi_gmem4_ARBURST(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARBURST),
    .m_axi_gmem4_ARLOCK(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLOCK),
    .m_axi_gmem4_ARCACHE(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARCACHE),
    .m_axi_gmem4_ARPROT(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARPROT),
    .m_axi_gmem4_ARQOS(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARQOS),
    .m_axi_gmem4_ARREGION(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARREGION),
    .m_axi_gmem4_ARUSER(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARUSER),
    .m_axi_gmem4_RVALID(gmem4_RVALID),
    .m_axi_gmem4_RREADY(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_RREADY),
    .m_axi_gmem4_RDATA(gmem4_RDATA),
    .m_axi_gmem4_RLAST(gmem4_RLAST),
    .m_axi_gmem4_RID(gmem4_RID),
    .m_axi_gmem4_RFIFONUM(gmem4_RFIFONUM),
    .m_axi_gmem4_RUSER(gmem4_RUSER),
    .m_axi_gmem4_RRESP(gmem4_RRESP),
    .m_axi_gmem4_BVALID(1'b0),
    .m_axi_gmem4_BREADY(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_BREADY),
    .m_axi_gmem4_BRESP(2'd0),
    .m_axi_gmem4_BID(1'd0),
    .m_axi_gmem4_BUSER(1'd0),
    .params(params)
);

pp_pipeline_accel_xfMat2Array_64_9_720_720_1_1_s xfMat2Array_64_9_720_720_1_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(xfMat2Array_64_9_720_720_1_1_U0_ap_start),
    .ap_done(xfMat2Array_64_9_720_720_1_1_U0_ap_done),
    .ap_continue(xfMat2Array_64_9_720_720_1_1_U0_ap_continue),
    .ap_idle(xfMat2Array_64_9_720_720_1_1_U0_ap_idle),
    .ap_ready(xfMat2Array_64_9_720_720_1_1_U0_ap_ready),
    .p_read(out_mat_rows_channel_dout),
    .p_read1(out_mat_cols_channel_dout),
    .out_mat_data85_dout(out_mat_data_dout),
    .out_mat_data85_num_data_valid(out_mat_data_num_data_valid),
    .out_mat_data85_fifo_cap(out_mat_data_fifo_cap),
    .out_mat_data85_empty_n(out_mat_data_empty_n),
    .out_mat_data85_read(xfMat2Array_64_9_720_720_1_1_U0_out_mat_data85_read),
    .m_axi_gmem3_AWVALID(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWVALID),
    .m_axi_gmem3_AWREADY(gmem3_AWREADY),
    .m_axi_gmem3_AWADDR(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWADDR),
    .m_axi_gmem3_AWID(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWID),
    .m_axi_gmem3_AWLEN(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLEN),
    .m_axi_gmem3_AWSIZE(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWSIZE),
    .m_axi_gmem3_AWBURST(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWBURST),
    .m_axi_gmem3_AWLOCK(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLOCK),
    .m_axi_gmem3_AWCACHE(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWCACHE),
    .m_axi_gmem3_AWPROT(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWPROT),
    .m_axi_gmem3_AWQOS(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWQOS),
    .m_axi_gmem3_AWREGION(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWREGION),
    .m_axi_gmem3_AWUSER(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWUSER),
    .m_axi_gmem3_WVALID(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WVALID),
    .m_axi_gmem3_WREADY(gmem3_WREADY),
    .m_axi_gmem3_WDATA(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WDATA),
    .m_axi_gmem3_WSTRB(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WSTRB),
    .m_axi_gmem3_WLAST(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WLAST),
    .m_axi_gmem3_WID(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WID),
    .m_axi_gmem3_WUSER(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WUSER),
    .m_axi_gmem3_ARVALID(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARVALID),
    .m_axi_gmem3_ARREADY(1'b0),
    .m_axi_gmem3_ARADDR(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARADDR),
    .m_axi_gmem3_ARID(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARID),
    .m_axi_gmem3_ARLEN(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARLEN),
    .m_axi_gmem3_ARSIZE(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARSIZE),
    .m_axi_gmem3_ARBURST(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARBURST),
    .m_axi_gmem3_ARLOCK(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARLOCK),
    .m_axi_gmem3_ARCACHE(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARCACHE),
    .m_axi_gmem3_ARPROT(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARPROT),
    .m_axi_gmem3_ARQOS(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARQOS),
    .m_axi_gmem3_ARREGION(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARREGION),
    .m_axi_gmem3_ARUSER(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARUSER),
    .m_axi_gmem3_RVALID(1'b0),
    .m_axi_gmem3_RREADY(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_RREADY),
    .m_axi_gmem3_RDATA(64'd0),
    .m_axi_gmem3_RLAST(1'b0),
    .m_axi_gmem3_RID(1'd0),
    .m_axi_gmem3_RFIFONUM(9'd0),
    .m_axi_gmem3_RUSER(1'd0),
    .m_axi_gmem3_RRESP(2'd0),
    .m_axi_gmem3_BVALID(gmem3_BVALID),
    .m_axi_gmem3_BREADY(xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_BREADY),
    .m_axi_gmem3_BRESP(gmem3_BRESP),
    .m_axi_gmem3_BID(gmem3_BID),
    .m_axi_gmem3_BUSER(gmem3_BUSER),
    .dstPtr_dout(img_out_c_dout),
    .dstPtr_num_data_valid(img_out_c_num_data_valid),
    .dstPtr_fifo_cap(img_out_c_fifo_cap),
    .dstPtr_empty_n(img_out_c_empty_n),
    .dstPtr_read(xfMat2Array_64_9_720_720_1_1_U0_dstPtr_read),
    .stride_dout(out_img_linestride_c_dout),
    .stride_num_data_valid(out_img_linestride_c_num_data_valid),
    .stride_fifo_cap(out_img_linestride_c_fifo_cap),
    .stride_empty_n(out_img_linestride_c_empty_n),
    .stride_read(xfMat2Array_64_9_720_720_1_1_U0_stride_read)
);

pp_pipeline_accel_fifo_w64_d7_S img_out_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(entry_proc11_U0_img_out_c_din),
    .if_full_n(img_out_c_full_n),
    .if_write(entry_proc11_U0_img_out_c_write),
    .if_dout(img_out_c_dout),
    .if_num_data_valid(img_out_c_num_data_valid),
    .if_fifo_cap(img_out_c_fifo_cap),
    .if_empty_n(img_out_c_empty_n),
    .if_read(xfMat2Array_64_9_720_720_1_1_U0_dstPtr_read)
);

pp_pipeline_accel_fifo_w32_d7_S out_img_linestride_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(entry_proc11_U0_out_img_linestride_c_din),
    .if_full_n(out_img_linestride_c_full_n),
    .if_write(entry_proc11_U0_out_img_linestride_c_write),
    .if_dout(out_img_linestride_c_dout),
    .if_num_data_valid(out_img_linestride_c_num_data_valid),
    .if_fifo_cap(out_img_linestride_c_fifo_cap),
    .if_empty_n(out_img_linestride_c_empty_n),
    .if_read(xfMat2Array_64_9_720_720_1_1_U0_stride_read)
);

pp_pipeline_accel_fifo_w11_d2_S_x imgInput_uv_rows_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_0),
    .if_full_n(imgInput_uv_rows_channel_full_n),
    .if_write(ap_channel_done_imgInput_uv_rows_channel),
    .if_dout(imgInput_uv_rows_channel_dout),
    .if_num_data_valid(imgInput_uv_rows_channel_num_data_valid),
    .if_fifo_cap(imgInput_uv_rows_channel_fifo_cap),
    .if_empty_n(imgInput_uv_rows_channel_empty_n),
    .if_read(Array2xfMat_64_6_1080_1920_1_U0_ap_ready)
);

pp_pipeline_accel_fifo_w11_d2_S_x imgInput_uv_cols_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_1),
    .if_full_n(imgInput_uv_cols_channel_full_n),
    .if_write(ap_channel_done_imgInput_uv_cols_channel),
    .if_dout(imgInput_uv_cols_channel_dout),
    .if_num_data_valid(imgInput_uv_cols_channel_num_data_valid),
    .if_fifo_cap(imgInput_uv_cols_channel_fifo_cap),
    .if_empty_n(imgInput_uv_cols_channel_empty_n),
    .if_read(Array2xfMat_64_6_1080_1920_1_U0_ap_ready)
);

pp_pipeline_accel_fifo_w32_d4_S rgb_mat_rows_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_2),
    .if_full_n(rgb_mat_rows_channel_full_n),
    .if_write(ap_channel_done_rgb_mat_rows_channel),
    .if_dout(rgb_mat_rows_channel_dout),
    .if_num_data_valid(rgb_mat_rows_channel_num_data_valid),
    .if_fifo_cap(rgb_mat_rows_channel_fifo_cap),
    .if_empty_n(rgb_mat_rows_channel_empty_n),
    .if_read(resize_1_9_2160_3840_720_720_1_9_U0_ap_ready)
);

pp_pipeline_accel_fifo_w32_d4_S rgb_mat_cols_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_3),
    .if_full_n(rgb_mat_cols_channel_full_n),
    .if_write(ap_channel_done_rgb_mat_cols_channel),
    .if_dout(rgb_mat_cols_channel_dout),
    .if_num_data_valid(rgb_mat_cols_channel_num_data_valid),
    .if_fifo_cap(rgb_mat_cols_channel_fifo_cap),
    .if_empty_n(rgb_mat_cols_channel_empty_n),
    .if_read(resize_1_9_2160_3840_720_720_1_9_U0_ap_ready)
);

pp_pipeline_accel_fifo_w32_d6_S out_mat_rows_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_4),
    .if_full_n(out_mat_rows_channel_full_n),
    .if_write(ap_channel_done_out_mat_rows_channel),
    .if_dout(out_mat_rows_channel_dout),
    .if_num_data_valid(out_mat_rows_channel_num_data_valid),
    .if_fifo_cap(out_mat_rows_channel_fifo_cap),
    .if_empty_n(out_mat_rows_channel_empty_n),
    .if_read(xfMat2Array_64_9_720_720_1_1_U0_ap_ready)
);

pp_pipeline_accel_fifo_w32_d6_S out_mat_cols_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_5),
    .if_full_n(out_mat_cols_channel_full_n),
    .if_write(ap_channel_done_out_mat_cols_channel),
    .if_dout(out_mat_cols_channel_dout),
    .if_num_data_valid(out_mat_cols_channel_num_data_valid),
    .if_fifo_cap(out_mat_cols_channel_fifo_cap),
    .if_empty_n(out_mat_cols_channel_empty_n),
    .if_read(xfMat2Array_64_9_720_720_1_1_U0_ap_ready)
);

pp_pipeline_accel_fifo_w32_d2_S_x imgInput_y_rows_c36_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_6),
    .if_full_n(imgInput_y_rows_c36_channel_full_n),
    .if_write(ap_channel_done_imgInput_y_rows_c36_channel),
    .if_dout(imgInput_y_rows_c36_channel_dout),
    .if_num_data_valid(imgInput_y_rows_c36_channel_num_data_valid),
    .if_fifo_cap(imgInput_y_rows_c36_channel_fifo_cap),
    .if_empty_n(imgInput_y_rows_c36_channel_empty_n),
    .if_read(Array2xfMat_64_0_2160_3840_1_U0_ap_ready)
);

pp_pipeline_accel_fifo_w32_d2_S_x imgInput_y_cols_c37_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_7),
    .if_full_n(imgInput_y_cols_c37_channel_full_n),
    .if_write(ap_channel_done_imgInput_y_cols_c37_channel),
    .if_dout(imgInput_y_cols_c37_channel_dout),
    .if_num_data_valid(imgInput_y_cols_c37_channel_num_data_valid),
    .if_fifo_cap(imgInput_y_cols_c37_channel_fifo_cap),
    .if_empty_n(imgInput_y_cols_c37_channel_empty_n),
    .if_read(Array2xfMat_64_0_2160_3840_1_U0_ap_ready)
);

pp_pipeline_accel_fifo_w32_d4_S resize_out_mat_rows_c38_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_8),
    .if_full_n(resize_out_mat_rows_c38_channel_full_n),
    .if_write(ap_channel_done_resize_out_mat_rows_c38_channel),
    .if_dout(resize_out_mat_rows_c38_channel_dout),
    .if_num_data_valid(resize_out_mat_rows_c38_channel_num_data_valid),
    .if_fifo_cap(resize_out_mat_rows_c38_channel_fifo_cap),
    .if_empty_n(resize_out_mat_rows_c38_channel_empty_n),
    .if_read(resize_1_9_2160_3840_720_720_1_9_U0_ap_ready)
);

pp_pipeline_accel_fifo_w32_d4_S resize_out_mat_cols_c39_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry20_proc_U0_ap_return_9),
    .if_full_n(resize_out_mat_cols_c39_channel_full_n),
    .if_write(ap_channel_done_resize_out_mat_cols_c39_channel),
    .if_dout(resize_out_mat_cols_c39_channel_dout),
    .if_num_data_valid(resize_out_mat_cols_c39_channel_num_data_valid),
    .if_fifo_cap(resize_out_mat_cols_c39_channel_fifo_cap),
    .if_empty_n(resize_out_mat_cols_c39_channel_empty_n),
    .if_read(resize_1_9_2160_3840_720_720_1_9_U0_ap_ready)
);

pp_pipeline_accel_fifo_w8_d2_S imgInput_y_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_din),
    .if_full_n(imgInput_y_data_full_n),
    .if_write(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_write),
    .if_dout(imgInput_y_data_dout),
    .if_num_data_valid(imgInput_y_data_num_data_valid),
    .if_fifo_cap(imgInput_y_data_fifo_cap),
    .if_empty_n(imgInput_y_data_empty_n),
    .if_read(nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_y_data81_read)
);

pp_pipeline_accel_fifo_w32_d2_S_x imgInput_y_rows_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_din),
    .if_full_n(imgInput_y_rows_c_full_n),
    .if_write(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_write),
    .if_dout(imgInput_y_rows_c_dout),
    .if_num_data_valid(imgInput_y_rows_c_num_data_valid),
    .if_fifo_cap(imgInput_y_rows_c_fifo_cap),
    .if_empty_n(imgInput_y_rows_c_empty_n),
    .if_read(nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_rows_read)
);

pp_pipeline_accel_fifo_w32_d2_S_x imgInput_y_cols_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_din),
    .if_full_n(imgInput_y_cols_c_full_n),
    .if_write(Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_write),
    .if_dout(imgInput_y_cols_c_dout),
    .if_num_data_valid(imgInput_y_cols_c_num_data_valid),
    .if_fifo_cap(imgInput_y_cols_c_fifo_cap),
    .if_empty_n(imgInput_y_cols_c_empty_n),
    .if_read(nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_cols_read)
);

pp_pipeline_accel_fifo_w32_d2_S_x select_ln59_loc_channel_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_entry2022_proc_U0_ap_return),
    .if_full_n(select_ln59_loc_channel_full_n),
    .if_write(Block_entry2022_proc_U0_ap_done),
    .if_dout(select_ln59_loc_channel_dout),
    .if_num_data_valid(select_ln59_loc_channel_num_data_valid),
    .if_fifo_cap(select_ln59_loc_channel_fifo_cap),
    .if_empty_n(select_ln59_loc_channel_empty_n),
    .if_read(Array2xfMat_64_6_1080_1920_1_U0_ap_ready)
);

pp_pipeline_accel_fifo_w16_d2_S_x0 imgInput_uv_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_din),
    .if_full_n(imgInput_uv_data_full_n),
    .if_write(Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_write),
    .if_dout(imgInput_uv_data_dout),
    .if_num_data_valid(imgInput_uv_data_num_data_valid),
    .if_fifo_cap(imgInput_uv_data_fifo_cap),
    .if_empty_n(imgInput_uv_data_empty_n),
    .if_read(nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_uv_data82_read)
);

pp_pipeline_accel_fifo_w24_d2_S rgb_mat_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_din),
    .if_full_n(rgb_mat_data_full_n),
    .if_write(nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_write),
    .if_dout(rgb_mat_data_dout),
    .if_num_data_valid(rgb_mat_data_num_data_valid),
    .if_fifo_cap(rgb_mat_data_fifo_cap),
    .if_empty_n(rgb_mat_data_empty_n),
    .if_read(resize_1_9_2160_3840_720_720_1_9_U0_rgb_mat_data83_read)
);

pp_pipeline_accel_fifo_w24_d2_S resize_out_mat_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_din),
    .if_full_n(resize_out_mat_data_full_n),
    .if_write(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_write),
    .if_dout(resize_out_mat_data_dout),
    .if_num_data_valid(resize_out_mat_data_num_data_valid),
    .if_fifo_cap(resize_out_mat_data_fifo_cap),
    .if_empty_n(resize_out_mat_data_empty_n),
    .if_read(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_resize_out_mat_data84_read)
);

pp_pipeline_accel_fifo_w32_d2_S_x resize_out_mat_rows_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_din),
    .if_full_n(resize_out_mat_rows_c_full_n),
    .if_write(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_write),
    .if_dout(resize_out_mat_rows_c_dout),
    .if_num_data_valid(resize_out_mat_rows_c_num_data_valid),
    .if_fifo_cap(resize_out_mat_rows_c_fifo_cap),
    .if_empty_n(resize_out_mat_rows_c_empty_n),
    .if_read(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_rows_read)
);

pp_pipeline_accel_fifo_w32_d2_S_x resize_out_mat_cols_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_din),
    .if_full_n(resize_out_mat_cols_c_full_n),
    .if_write(resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_write),
    .if_dout(resize_out_mat_cols_c_dout),
    .if_num_data_valid(resize_out_mat_cols_c_num_data_valid),
    .if_fifo_cap(resize_out_mat_cols_c_fifo_cap),
    .if_empty_n(resize_out_mat_cols_c_empty_n),
    .if_read(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_cols_read)
);

pp_pipeline_accel_fifo_w24_d2_S out_mat_data_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_din),
    .if_full_n(out_mat_data_full_n),
    .if_write(preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_write),
    .if_dout(out_mat_data_dout),
    .if_num_data_valid(out_mat_data_num_data_valid),
    .if_fifo_cap(out_mat_data_fifo_cap),
    .if_empty_n(out_mat_data_empty_n),
    .if_read(xfMat2Array_64_9_720_720_1_1_U0_out_mat_data85_read)
);

pp_pipeline_accel_start_for_nv122bgr_0_6_9_2160_3840_1_1_U0 start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_din),
    .if_full_n(start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_full_n),
    .if_write(Array2xfMat_64_0_2160_3840_1_U0_start_write),
    .if_dout(start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_dout),
    .if_empty_n(start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_empty_n),
    .if_read(nv122bgr_0_6_9_2160_3840_1_1_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready <= ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready <= ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Block_entry2022_proc_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Block_entry2022_proc_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Block_entry2022_proc_U0_ap_ready <= ap_sync_Block_entry2022_proc_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Block_entry20_proc_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Block_entry20_proc_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Block_entry20_proc_U0_ap_ready <= ap_sync_Block_entry20_proc_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_imgInput_uv_cols_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_imgInput_uv_cols_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_imgInput_uv_cols_channel <= ap_sync_channel_write_imgInput_uv_cols_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_imgInput_uv_rows_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_imgInput_uv_rows_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_imgInput_uv_rows_channel <= ap_sync_channel_write_imgInput_uv_rows_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_imgInput_y_cols_c37_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_imgInput_y_cols_c37_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_imgInput_y_cols_c37_channel <= ap_sync_channel_write_imgInput_y_cols_c37_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_imgInput_y_rows_c36_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_imgInput_y_rows_c36_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_imgInput_y_rows_c36_channel <= ap_sync_channel_write_imgInput_y_rows_c36_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_out_mat_cols_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_out_mat_cols_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_out_mat_cols_channel <= ap_sync_channel_write_out_mat_cols_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_out_mat_rows_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_out_mat_rows_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_out_mat_rows_channel <= ap_sync_channel_write_out_mat_rows_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel <= ap_sync_channel_write_resize_out_mat_cols_c39_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel <= ap_sync_channel_write_resize_out_mat_rows_c38_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_rgb_mat_cols_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_rgb_mat_cols_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_rgb_mat_cols_channel <= ap_sync_channel_write_rgb_mat_cols_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_rgb_mat_rows_channel <= 1'b0;
    end else begin
        if (((Block_entry20_proc_U0_ap_done & Block_entry20_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_rgb_mat_rows_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_rgb_mat_rows_channel <= ap_sync_channel_write_rgb_mat_rows_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_entry_proc11_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_entry_proc11_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_entry_proc11_U0_ap_ready <= ap_sync_entry_proc11_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready <= ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    ap_rst_n_inv <= ap_rst_reg_1;
end

always @ (posedge ap_clk) begin
    ap_rst_reg_1 <= ap_rst_reg_2;
end

always @ (posedge ap_clk) begin
    ap_rst_reg_2 <= ~ap_rst_n;
end

assign Array2xfMat_64_0_2160_3840_1_U0_ap_continue = 1'b1;

assign Array2xfMat_64_0_2160_3840_1_U0_ap_start = (imgInput_y_rows_c36_channel_empty_n & imgInput_y_cols_c37_channel_empty_n & (ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready ^ 1'b1) & ap_start);

assign Array2xfMat_64_6_1080_1920_1_U0_ap_continue = 1'b1;

assign Array2xfMat_64_6_1080_1920_1_U0_ap_start = (select_ln59_loc_channel_empty_n & imgInput_uv_rows_channel_empty_n & imgInput_uv_cols_channel_empty_n & (ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready ^ 1'b1) & ap_start);

assign Block_entry2022_proc_U0_ap_continue = select_ln59_loc_channel_full_n;

assign Block_entry2022_proc_U0_ap_start = ((ap_sync_reg_Block_entry2022_proc_U0_ap_ready ^ 1'b1) & ap_start);

assign Block_entry20_proc_U0_ap_continue = (ap_sync_channel_write_rgb_mat_rows_channel & ap_sync_channel_write_rgb_mat_cols_channel & ap_sync_channel_write_resize_out_mat_rows_c38_channel & ap_sync_channel_write_resize_out_mat_cols_c39_channel & ap_sync_channel_write_out_mat_rows_channel & ap_sync_channel_write_out_mat_cols_channel & ap_sync_channel_write_imgInput_y_rows_c36_channel & ap_sync_channel_write_imgInput_y_cols_c37_channel & ap_sync_channel_write_imgInput_uv_rows_channel & ap_sync_channel_write_imgInput_uv_cols_channel);

assign Block_entry20_proc_U0_ap_start = ((ap_sync_reg_Block_entry20_proc_U0_ap_ready ^ 1'b1) & ap_start);

assign ap_channel_done_imgInput_uv_cols_channel = ((ap_sync_reg_channel_write_imgInput_uv_cols_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_imgInput_uv_rows_channel = ((ap_sync_reg_channel_write_imgInput_uv_rows_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_imgInput_y_cols_c37_channel = ((ap_sync_reg_channel_write_imgInput_y_cols_c37_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_imgInput_y_rows_c36_channel = ((ap_sync_reg_channel_write_imgInput_y_rows_c36_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_out_mat_cols_channel = ((ap_sync_reg_channel_write_out_mat_cols_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_out_mat_rows_channel = ((ap_sync_reg_channel_write_out_mat_rows_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_resize_out_mat_cols_c39_channel = ((ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_resize_out_mat_rows_c38_channel = ((ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_rgb_mat_cols_channel = ((ap_sync_reg_channel_write_rgb_mat_cols_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_channel_done_rgb_mat_rows_channel = ((ap_sync_reg_channel_write_rgb_mat_rows_channel ^ 1'b1) & Block_entry20_proc_U0_ap_done);

assign ap_done = xfMat2Array_64_9_720_720_1_1_U0_ap_done;

assign ap_idle = (xfMat2Array_64_9_720_720_1_1_U0_ap_idle & resize_1_9_2160_3840_720_720_1_9_U0_ap_idle & preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_idle & nv122bgr_0_6_9_2160_3840_1_1_U0_ap_idle & (select_ln59_loc_channel_empty_n ^ 1'b1) & (resize_out_mat_cols_c39_channel_empty_n ^ 1'b1) & (resize_out_mat_rows_c38_channel_empty_n ^ 1'b1) & (imgInput_y_cols_c37_channel_empty_n ^ 1'b1) & (imgInput_y_rows_c36_channel_empty_n ^ 1'b1) & (out_mat_cols_channel_empty_n ^ 1'b1) & (out_mat_rows_channel_empty_n ^ 1'b1) & (rgb_mat_cols_channel_empty_n ^ 1'b1) & (rgb_mat_rows_channel_empty_n ^ 1'b1) & (imgInput_uv_cols_channel_empty_n ^ 1'b1) & (imgInput_uv_rows_channel_empty_n ^ 1'b1) & entry_proc11_U0_ap_idle & Block_entry20_proc_U0_ap_idle & Block_entry2022_proc_U0_ap_idle & Array2xfMat_64_6_1080_1920_1_U0_ap_idle & Array2xfMat_64_0_2160_3840_1_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready = (ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready | Array2xfMat_64_0_2160_3840_1_U0_ap_ready);

assign ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready = (ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready | Array2xfMat_64_6_1080_1920_1_U0_ap_ready);

assign ap_sync_Block_entry2022_proc_U0_ap_ready = (ap_sync_reg_Block_entry2022_proc_U0_ap_ready | Block_entry2022_proc_U0_ap_ready);

assign ap_sync_Block_entry20_proc_U0_ap_ready = (ap_sync_reg_Block_entry20_proc_U0_ap_ready | Block_entry20_proc_U0_ap_ready);

assign ap_sync_channel_write_imgInput_uv_cols_channel = ((imgInput_uv_cols_channel_full_n & ap_channel_done_imgInput_uv_cols_channel) | ap_sync_reg_channel_write_imgInput_uv_cols_channel);

assign ap_sync_channel_write_imgInput_uv_rows_channel = ((imgInput_uv_rows_channel_full_n & ap_channel_done_imgInput_uv_rows_channel) | ap_sync_reg_channel_write_imgInput_uv_rows_channel);

assign ap_sync_channel_write_imgInput_y_cols_c37_channel = ((imgInput_y_cols_c37_channel_full_n & ap_channel_done_imgInput_y_cols_c37_channel) | ap_sync_reg_channel_write_imgInput_y_cols_c37_channel);

assign ap_sync_channel_write_imgInput_y_rows_c36_channel = ((imgInput_y_rows_c36_channel_full_n & ap_channel_done_imgInput_y_rows_c36_channel) | ap_sync_reg_channel_write_imgInput_y_rows_c36_channel);

assign ap_sync_channel_write_out_mat_cols_channel = ((out_mat_cols_channel_full_n & ap_channel_done_out_mat_cols_channel) | ap_sync_reg_channel_write_out_mat_cols_channel);

assign ap_sync_channel_write_out_mat_rows_channel = ((out_mat_rows_channel_full_n & ap_channel_done_out_mat_rows_channel) | ap_sync_reg_channel_write_out_mat_rows_channel);

assign ap_sync_channel_write_resize_out_mat_cols_c39_channel = ((resize_out_mat_cols_c39_channel_full_n & ap_channel_done_resize_out_mat_cols_c39_channel) | ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel);

assign ap_sync_channel_write_resize_out_mat_rows_c38_channel = ((resize_out_mat_rows_c38_channel_full_n & ap_channel_done_resize_out_mat_rows_c38_channel) | ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel);

assign ap_sync_channel_write_rgb_mat_cols_channel = ((rgb_mat_cols_channel_full_n & ap_channel_done_rgb_mat_cols_channel) | ap_sync_reg_channel_write_rgb_mat_cols_channel);

assign ap_sync_channel_write_rgb_mat_rows_channel = ((rgb_mat_rows_channel_full_n & ap_channel_done_rgb_mat_rows_channel) | ap_sync_reg_channel_write_rgb_mat_rows_channel);

assign ap_sync_entry_proc11_U0_ap_ready = (entry_proc11_U0_ap_ready | ap_sync_reg_entry_proc11_U0_ap_ready);

assign ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready = (preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready | ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready);

assign ap_sync_ready = (ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready & ap_sync_entry_proc11_U0_ap_ready & ap_sync_Block_entry20_proc_U0_ap_ready & ap_sync_Block_entry2022_proc_U0_ap_ready & ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready & ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready);

assign entry_proc11_U0_ap_continue = 1'b1;

assign entry_proc11_U0_ap_start = ((ap_sync_reg_entry_proc11_U0_ap_ready ^ 1'b1) & ap_start);

assign gmem1_RID = 1'd0;

assign gmem1_RLAST = 1'b0;

assign gmem1_RRESP = 2'd0;

assign gmem1_RUSER = 1'd0;

assign gmem2_RID = 1'd0;

assign gmem2_RLAST = 1'b0;

assign gmem2_RRESP = 2'd0;

assign gmem2_RUSER = 1'd0;

assign gmem3_BID = 1'd0;

assign gmem3_BRESP = 2'd0;

assign gmem3_BUSER = 1'd0;

assign gmem4_RID = 1'd0;

assign gmem4_RLAST = 1'b0;

assign gmem4_RRESP = 2'd0;

assign gmem4_RUSER = 1'd0;

assign nv122bgr_0_6_9_2160_3840_1_1_U0_ap_continue = 1'b1;

assign nv122bgr_0_6_9_2160_3840_1_1_U0_ap_start = start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_empty_n;

assign preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_continue = 1'b1;

assign preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_start = ((ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready ^ 1'b1) & ap_start);

assign resize_1_9_2160_3840_720_720_1_9_U0_ap_continue = 1'b1;

assign resize_1_9_2160_3840_720_720_1_9_U0_ap_start = (rgb_mat_rows_channel_empty_n & rgb_mat_cols_channel_empty_n & resize_out_mat_rows_c38_channel_empty_n & resize_out_mat_cols_c39_channel_empty_n);

assign start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_din = 1'b1;

assign xfMat2Array_64_9_720_720_1_1_U0_ap_continue = ap_continue;

assign xfMat2Array_64_9_720_720_1_1_U0_ap_start = (out_mat_rows_channel_empty_n & out_mat_cols_channel_empty_n);


reg find_df_deadlock = 0;
// synthesis translate_off
`include "pp_pipeline_accel_hls_deadlock_detector.vh"
// synthesis translate_on

endmodule //pp_pipeline_accel

