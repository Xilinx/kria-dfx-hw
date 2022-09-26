// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="add_sub_mm_add_sub_mm,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=3.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.190000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2638,HLS_SYN_LUT=3654,HLS_VERSION=2022_1}" *)

module add_sub_mm (
        ap_clk,
        ap_rst_n,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
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
        interrupt
);

parameter    ap_ST_fsm_state1 = 85'd1;
parameter    ap_ST_fsm_pp0_stage0 = 85'd2;
parameter    ap_ST_fsm_pp0_stage1 = 85'd4;
parameter    ap_ST_fsm_pp0_stage2 = 85'd8;
parameter    ap_ST_fsm_pp0_stage3 = 85'd16;
parameter    ap_ST_fsm_pp0_stage4 = 85'd32;
parameter    ap_ST_fsm_pp0_stage5 = 85'd64;
parameter    ap_ST_fsm_pp0_stage6 = 85'd128;
parameter    ap_ST_fsm_pp0_stage7 = 85'd256;
parameter    ap_ST_fsm_pp0_stage8 = 85'd512;
parameter    ap_ST_fsm_pp0_stage9 = 85'd1024;
parameter    ap_ST_fsm_pp0_stage10 = 85'd2048;
parameter    ap_ST_fsm_pp0_stage11 = 85'd4096;
parameter    ap_ST_fsm_pp0_stage12 = 85'd8192;
parameter    ap_ST_fsm_pp0_stage13 = 85'd16384;
parameter    ap_ST_fsm_pp0_stage14 = 85'd32768;
parameter    ap_ST_fsm_pp0_stage15 = 85'd65536;
parameter    ap_ST_fsm_pp0_stage16 = 85'd131072;
parameter    ap_ST_fsm_pp0_stage17 = 85'd262144;
parameter    ap_ST_fsm_pp0_stage18 = 85'd524288;
parameter    ap_ST_fsm_pp0_stage19 = 85'd1048576;
parameter    ap_ST_fsm_pp0_stage20 = 85'd2097152;
parameter    ap_ST_fsm_pp0_stage21 = 85'd4194304;
parameter    ap_ST_fsm_pp0_stage22 = 85'd8388608;
parameter    ap_ST_fsm_pp0_stage23 = 85'd16777216;
parameter    ap_ST_fsm_pp0_stage24 = 85'd33554432;
parameter    ap_ST_fsm_pp0_stage25 = 85'd67108864;
parameter    ap_ST_fsm_pp0_stage26 = 85'd134217728;
parameter    ap_ST_fsm_pp0_stage27 = 85'd268435456;
parameter    ap_ST_fsm_pp0_stage28 = 85'd536870912;
parameter    ap_ST_fsm_pp0_stage29 = 85'd1073741824;
parameter    ap_ST_fsm_pp0_stage30 = 85'd2147483648;
parameter    ap_ST_fsm_pp0_stage31 = 85'd4294967296;
parameter    ap_ST_fsm_pp0_stage32 = 85'd8589934592;
parameter    ap_ST_fsm_pp0_stage33 = 85'd17179869184;
parameter    ap_ST_fsm_pp0_stage34 = 85'd34359738368;
parameter    ap_ST_fsm_pp0_stage35 = 85'd68719476736;
parameter    ap_ST_fsm_pp0_stage36 = 85'd137438953472;
parameter    ap_ST_fsm_pp0_stage37 = 85'd274877906944;
parameter    ap_ST_fsm_pp0_stage38 = 85'd549755813888;
parameter    ap_ST_fsm_pp0_stage39 = 85'd1099511627776;
parameter    ap_ST_fsm_pp0_stage40 = 85'd2199023255552;
parameter    ap_ST_fsm_pp0_stage41 = 85'd4398046511104;
parameter    ap_ST_fsm_pp0_stage42 = 85'd8796093022208;
parameter    ap_ST_fsm_pp0_stage43 = 85'd17592186044416;
parameter    ap_ST_fsm_pp0_stage44 = 85'd35184372088832;
parameter    ap_ST_fsm_pp0_stage45 = 85'd70368744177664;
parameter    ap_ST_fsm_pp0_stage46 = 85'd140737488355328;
parameter    ap_ST_fsm_pp0_stage47 = 85'd281474976710656;
parameter    ap_ST_fsm_pp0_stage48 = 85'd562949953421312;
parameter    ap_ST_fsm_pp0_stage49 = 85'd1125899906842624;
parameter    ap_ST_fsm_pp0_stage50 = 85'd2251799813685248;
parameter    ap_ST_fsm_pp0_stage51 = 85'd4503599627370496;
parameter    ap_ST_fsm_pp0_stage52 = 85'd9007199254740992;
parameter    ap_ST_fsm_pp0_stage53 = 85'd18014398509481984;
parameter    ap_ST_fsm_pp0_stage54 = 85'd36028797018963968;
parameter    ap_ST_fsm_pp0_stage55 = 85'd72057594037927936;
parameter    ap_ST_fsm_pp0_stage56 = 85'd144115188075855872;
parameter    ap_ST_fsm_pp0_stage57 = 85'd288230376151711744;
parameter    ap_ST_fsm_pp0_stage58 = 85'd576460752303423488;
parameter    ap_ST_fsm_pp0_stage59 = 85'd1152921504606846976;
parameter    ap_ST_fsm_pp0_stage60 = 85'd2305843009213693952;
parameter    ap_ST_fsm_pp0_stage61 = 85'd4611686018427387904;
parameter    ap_ST_fsm_pp0_stage62 = 85'd9223372036854775808;
parameter    ap_ST_fsm_pp0_stage63 = 85'd18446744073709551616;
parameter    ap_ST_fsm_pp0_stage64 = 85'd36893488147419103232;
parameter    ap_ST_fsm_pp0_stage65 = 85'd73786976294838206464;
parameter    ap_ST_fsm_pp0_stage66 = 85'd147573952589676412928;
parameter    ap_ST_fsm_pp0_stage67 = 85'd295147905179352825856;
parameter    ap_ST_fsm_pp0_stage68 = 85'd590295810358705651712;
parameter    ap_ST_fsm_pp0_stage69 = 85'd1180591620717411303424;
parameter    ap_ST_fsm_pp0_stage70 = 85'd2361183241434822606848;
parameter    ap_ST_fsm_pp0_stage71 = 85'd4722366482869645213696;
parameter    ap_ST_fsm_pp0_stage72 = 85'd9444732965739290427392;
parameter    ap_ST_fsm_pp0_stage73 = 85'd18889465931478580854784;
parameter    ap_ST_fsm_pp0_stage74 = 85'd37778931862957161709568;
parameter    ap_ST_fsm_pp0_stage75 = 85'd75557863725914323419136;
parameter    ap_ST_fsm_pp0_stage76 = 85'd151115727451828646838272;
parameter    ap_ST_fsm_pp0_stage77 = 85'd302231454903657293676544;
parameter    ap_ST_fsm_pp0_stage78 = 85'd604462909807314587353088;
parameter    ap_ST_fsm_pp0_stage79 = 85'd1208925819614629174706176;
parameter    ap_ST_fsm_pp0_stage80 = 85'd2417851639229258349412352;
parameter    ap_ST_fsm_pp0_stage81 = 85'd4835703278458516698824704;
parameter    ap_ST_fsm_pp0_stage82 = 85'd9671406556917033397649408;
parameter    ap_ST_fsm_state100 = 85'd19342813113834066795298816;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 7;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM_DATA_WIDTH = 128;
parameter    C_M_AXI_GMEM_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_BUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_USER_VALUE = 0;
parameter    C_M_AXI_GMEM_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_GMEM_WSTRB_WIDTH = (128 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [C_M_AXI_GMEM_ADDR_WIDTH - 1:0] m_axi_gmem_AWADDR;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_AWID;
output  [7:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [C_M_AXI_GMEM_AWUSER_WIDTH - 1:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [C_M_AXI_GMEM_DATA_WIDTH - 1:0] m_axi_gmem_WDATA;
output  [C_M_AXI_GMEM_WSTRB_WIDTH - 1:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_WID;
output  [C_M_AXI_GMEM_WUSER_WIDTH - 1:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [C_M_AXI_GMEM_ADDR_WIDTH - 1:0] m_axi_gmem_ARADDR;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_ARID;
output  [7:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [C_M_AXI_GMEM_ARUSER_WIDTH - 1:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [C_M_AXI_GMEM_DATA_WIDTH - 1:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_RID;
input  [C_M_AXI_GMEM_RUSER_WIDTH - 1:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_BID;
input  [C_M_AXI_GMEM_BUSER_WIDTH - 1:0] m_axi_gmem_BUSER;
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
output   interrupt;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [84:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [63:0] arg1;
wire   [63:0] arg2;
wire   [63:0] mem;
wire   [31:0] src_addr1;
wire   [31:0] src_addr2;
wire   [31:0] dst_addr;
wire   [31:0] size;
wire   [0:0] op;
reg    gmem_blk_n_AR;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage1;
reg   [0:0] icmp_ln1073_reg_676;
reg    gmem_blk_n_R;
wire    ap_CS_fsm_pp0_stage8;
wire    ap_block_pp0_stage8;
wire    ap_CS_fsm_pp0_stage50;
wire    ap_block_pp0_stage50;
reg   [0:0] op_read_reg_640;
wire    ap_CS_fsm_pp0_stage57;
wire    ap_block_pp0_stage57;
wire    ap_CS_fsm_pp0_stage66;
wire    ap_block_pp0_stage66;
wire    ap_CS_fsm_pp0_stage73;
wire    ap_block_pp0_stage73;
wire    ap_CS_fsm_pp0_stage82;
wire    ap_block_pp0_stage82;
wire    ap_CS_fsm_pp0_stage6;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage6;
reg   [0:0] icmp_ln1073_reg_676_pp0_iter1_reg;
wire    ap_CS_fsm_pp0_stage17;
wire    ap_block_pp0_stage17;
wire    ap_CS_fsm_pp0_stage24;
wire    ap_block_pp0_stage24;
wire    ap_CS_fsm_pp0_stage33;
wire    ap_block_pp0_stage33;
wire    ap_CS_fsm_pp0_stage40;
wire    ap_block_pp0_stage40;
wire    ap_CS_fsm_pp0_stage49;
wire    ap_block_pp0_stage49;
wire    ap_CS_fsm_pp0_stage56;
wire    ap_block_pp0_stage56;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_pp0_stage2;
wire    ap_CS_fsm_pp0_stage9;
wire    ap_block_pp0_stage9;
wire    ap_CS_fsm_pp0_stage51;
wire    ap_block_pp0_stage51;
wire    ap_CS_fsm_pp0_stage58;
wire    ap_block_pp0_stage58;
wire    ap_CS_fsm_pp0_stage67;
wire    ap_block_pp0_stage67;
wire    ap_CS_fsm_pp0_stage74;
wire    ap_block_pp0_stage74;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_pp0_stage0;
wire    ap_CS_fsm_pp0_stage7;
wire    ap_block_pp0_stage7;
wire    ap_CS_fsm_pp0_stage18;
wire    ap_block_pp0_stage18;
wire    ap_CS_fsm_pp0_stage25;
wire    ap_block_pp0_stage25;
wire    ap_CS_fsm_pp0_stage34;
wire    ap_block_pp0_stage34;
wire    ap_CS_fsm_pp0_stage41;
wire    ap_block_pp0_stage41;
reg    gmem_blk_n_AW;
reg    gmem_blk_n_W;
wire    ap_CS_fsm_pp0_stage44;
wire    ap_block_pp0_stage44;
reg    gmem_blk_n_B;
wire    ap_CS_fsm_pp0_stage60;
wire    ap_block_pp0_stage60;
wire    ap_CS_fsm_pp0_stage65;
wire    ap_block_pp0_stage65;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_pp0_stage3;
wire    ap_CS_fsm_pp0_stage76;
wire    ap_block_pp0_stage76;
wire    ap_CS_fsm_pp0_stage81;
wire    ap_block_pp0_stage81;
wire    ap_CS_fsm_pp0_stage11;
wire    ap_block_pp0_stage11;
wire    ap_CS_fsm_pp0_stage16;
wire    ap_block_pp0_stage16;
wire    ap_CS_fsm_pp0_stage27;
wire    ap_block_pp0_stage27;
wire    ap_CS_fsm_pp0_stage32;
wire    ap_block_pp0_stage32;
wire    ap_CS_fsm_pp0_stage43;
wire    ap_block_pp0_stage43;
wire    ap_CS_fsm_pp0_stage48;
wire    ap_block_pp0_stage48;
wire    ap_CS_fsm_pp0_stage10;
wire    ap_block_pp0_stage10;
wire    ap_CS_fsm_pp0_stage14;
wire    ap_block_pp0_stage14;
reg   [31:0] reg_320;
reg    gmem_AWVALID;
wire    gmem_AWREADY;
reg   [63:0] gmem_AWADDR;
reg    gmem_WVALID;
wire    gmem_WREADY;
reg   [127:0] gmem_WDATA;
reg   [15:0] gmem_WSTRB;
reg    gmem_ARVALID;
wire    gmem_ARREADY;
reg   [63:0] gmem_ARADDR;
wire    gmem_RVALID;
reg    gmem_RREADY;
wire   [127:0] gmem_RDATA;
wire   [8:0] gmem_RFIFONUM;
wire    gmem_BVALID;
reg    gmem_BREADY;
reg    ap_predicate_op213_read_state26;
reg    ap_block_state26_pp0_stage24_iter0;
reg    ap_block_pp0_stage24_11001;
reg    ap_predicate_op290_read_state59;
reg    ap_predicate_op292_read_state59;
reg    ap_block_state59_pp0_stage57_iter0;
reg    ap_block_pp0_stage57_11001;
reg   [31:0] reg_324;
reg    ap_predicate_op216_read_state27;
reg    ap_block_state27_pp0_stage25_iter0;
reg    ap_block_pp0_stage25_11001;
reg    ap_predicate_op298_read_state60;
reg    ap_block_state60_pp0_stage58_iter0;
reg    ap_block_pp0_stage58_11001;
reg   [31:0] reg_328;
reg    ap_predicate_op240_read_state42;
reg    ap_block_state42_pp0_stage40_iter0;
reg    ap_block_pp0_stage40_11001;
reg    ap_predicate_op322_read_state75;
reg    ap_block_state75_pp0_stage73_iter0;
reg    ap_block_pp0_stage73_11001;
reg   [31:0] reg_332;
reg    ap_predicate_op243_read_state43;
reg    ap_block_state43_pp0_stage41_iter0;
reg    ap_block_pp0_stage41_11001;
reg    ap_predicate_op325_read_state76;
reg    ap_block_state76_pp0_stage74_iter0;
reg    ap_block_pp0_stage74_11001;
reg   [31:0] reg_336;
reg    ap_predicate_op285_read_state58;
reg    ap_block_state58_pp0_stage56_iter0;
reg    ap_block_pp0_stage56_11001;
wire    ap_block_state8_pp0_stage6_iter0;
reg    ap_predicate_op351_read_state91;
reg    ap_block_state91_pp0_stage6_iter1;
reg    ap_block_pp0_stage6_11001;
reg   [31:0] reg_340;
wire    ap_block_state9_pp0_stage7_iter0;
reg    ap_predicate_op354_read_state92;
reg    ap_block_state92_pp0_stage7_iter1;
reg    ap_block_pp0_stage7_11001;
reg   [31:0] size_read_reg_644;
reg   [63:0] mem_read_reg_649;
wire   [33:0] lhs_fu_344_p1;
reg   [33:0] lhs_reg_656;
wire   [33:0] lhs_5_fu_348_p1;
reg   [33:0] lhs_5_reg_661;
wire   [33:0] lhs_6_fu_352_p1;
reg   [33:0] lhs_6_reg_666;
reg  signed [31:0] i_V_2_reg_671;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state85_pp0_stage0_iter1;
reg    ap_predicate_op340_readreq_state85;
reg    ap_block_state85_io;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln1073_fu_364_p2;
reg   [59:0] trunc_ln_reg_680;
reg   [59:0] trunc_ln357_1_reg_685;
reg   [59:0] trunc_ln1_reg_690;
reg   [63:0] gmem_addr_reg_695;
wire    ap_block_state3_pp0_stage1_iter0;
reg    ap_predicate_op164_writereq_state3;
reg    ap_predicate_op165_writereq_state3;
reg    ap_block_state3_io;
wire    ap_block_state86_pp0_stage1_iter1;
reg    ap_block_pp0_stage1_11001;
reg   [63:0] gmem_addr_2_reg_701;
reg   [63:0] gmem_addr_1_reg_713;
wire    ap_block_state4_pp0_stage2_iter0;
reg    ap_predicate_op170_writereq_state4;
reg    ap_predicate_op171_writereq_state4;
reg    ap_block_state4_io;
wire    ap_block_state87_pp0_stage2_iter1;
reg    ap_block_pp0_stage2_11001;
wire   [31:0] trunc_ln357_fu_499_p1;
reg   [31:0] trunc_ln357_reg_719;
reg    ap_block_state10_pp0_stage8_iter0;
wire    ap_block_state93_pp0_stage8_iter1;
reg    ap_block_pp0_stage8_11001;
wire   [31:0] trunc_ln357_2_fu_503_p1;
reg   [31:0] trunc_ln357_2_reg_725;
reg    ap_block_state11_pp0_stage9_iter0;
wire    ap_block_state94_pp0_stage9_iter1;
reg    ap_block_pp0_stage9_11001;
wire   [31:0] sub_ln414_fu_507_p2;
reg   [31:0] sub_ln414_reg_731;
wire    ap_block_state12_pp0_stage10_iter0;
reg    ap_block_state12_io;
wire    ap_block_state95_pp0_stage10_iter1;
reg    ap_block_pp0_stage10_11001;
wire   [31:0] add_ln414_1_fu_511_p2;
reg   [31:0] add_ln414_1_reg_739;
wire   [31:0] sub_ln414_1_fu_519_p2;
reg   [31:0] sub_ln414_1_reg_747;
wire    ap_CS_fsm_pp0_stage26;
wire    ap_block_state28_pp0_stage26_iter0;
wire    ap_block_pp0_stage26_11001;
wire   [31:0] sub_ln414_2_fu_536_p2;
reg   [31:0] sub_ln414_2_reg_754;
wire    ap_CS_fsm_pp0_stage42;
wire    ap_block_state44_pp0_stage42_iter0;
wire    ap_block_pp0_stage42_11001;
wire   [127:0] p_Result_4_fu_564_p5;
wire   [31:0] add_ln414_2_fu_573_p2;
reg   [31:0] add_ln414_2_reg_765;
wire    ap_CS_fsm_pp0_stage59;
wire    ap_block_state61_pp0_stage59_iter0;
wire    ap_block_pp0_stage59_11001;
wire   [31:0] add_ln414_3_fu_590_p2;
reg   [31:0] add_ln414_3_reg_772;
wire    ap_CS_fsm_pp0_stage75;
wire    ap_block_state77_pp0_stage75_iter0;
wire    ap_block_pp0_stage75_11001;
wire   [127:0] p_Result_s_fu_624_p5;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
wire    ap_block_state84_pp0_stage82_iter0;
reg    ap_predicate_op336_readreq_state84;
reg    ap_block_state84_io;
reg    ap_block_pp0_stage82_subdone;
wire    ap_block_state16_pp0_stage14_iter0;
reg    ap_block_state99_pp0_stage14_iter1;
reg    ap_block_pp0_stage14_subdone;
reg   [127:0] ap_phi_reg_pp0_iter0_storemerge_reg_250;
reg   [127:0] ap_phi_reg_pp0_iter1_storemerge_reg_250;
reg    ap_block_pp0_stage82_11001;
wire  signed [63:0] sext_ln357_fu_469_p1;
wire  signed [63:0] sext_ln414_fu_479_p1;
wire  signed [63:0] sext_ln357_1_fu_489_p1;
wire    ap_block_state19_pp0_stage17_iter0;
reg    ap_predicate_op200_readreq_state19;
reg    ap_block_state19_io;
reg    ap_block_pp0_stage17_11001;
wire    ap_block_state35_pp0_stage33_iter0;
reg    ap_predicate_op227_readreq_state35;
reg    ap_block_state35_io;
reg    ap_block_pp0_stage33_11001;
reg    ap_predicate_op261_writeresp_state51;
reg    ap_block_state51_pp0_stage49_iter0;
reg    ap_predicate_op260_readreq_state51;
reg    ap_block_state51_io;
reg    ap_block_pp0_stage49_11001;
wire    ap_block_state52_pp0_stage50_iter0;
reg    ap_predicate_op263_readreq_state52;
reg    ap_predicate_op264_readreq_state52;
reg    ap_block_state52_io;
reg    ap_block_pp0_stage50_11001;
wire    ap_block_state68_pp0_stage66_iter0;
reg    ap_predicate_op309_readreq_state68;
reg    ap_block_state68_io;
reg    ap_block_pp0_stage66_11001;
wire    ap_block_state5_pp0_stage3_iter0;
reg    ap_predicate_op174_writereq_state5;
reg    ap_predicate_op175_writereq_state5;
reg    ap_block_state5_io;
wire    ap_block_state88_pp0_stage3_iter1;
reg    ap_block_pp0_stage3_11001;
reg    ap_predicate_op199_writeresp_state18;
reg    ap_block_state18_pp0_stage16_iter0;
reg    ap_block_pp0_stage16_11001;
reg    ap_predicate_op226_writeresp_state34;
reg    ap_block_state34_pp0_stage32_iter0;
reg    ap_block_pp0_stage32_11001;
reg    ap_predicate_op258_writeresp_state50;
reg    ap_block_state50_pp0_stage48_iter0;
reg    ap_block_pp0_stage48_11001;
reg    ap_predicate_op308_writeresp_state67;
reg    ap_block_state67_pp0_stage65_iter0;
reg    ap_block_pp0_stage65_11001;
reg    ap_predicate_op335_writeresp_state83;
reg    ap_block_state83_pp0_stage81_iter0;
reg    ap_block_pp0_stage81_11001;
reg    ap_block_pp0_stage14_11001;
wire    ap_block_state20_pp0_stage18_iter0;
reg    ap_predicate_op202_readreq_state20;
reg    ap_block_state20_io;
reg    ap_block_pp0_stage18_11001;
wire    ap_block_state36_pp0_stage34_iter0;
reg    ap_predicate_op229_readreq_state36;
reg    ap_block_state36_io;
reg    ap_block_pp0_stage34_11001;
wire    ap_block_state53_pp0_stage51_iter0;
reg    ap_predicate_op268_readreq_state53;
reg    ap_block_state53_io;
reg    ap_block_pp0_stage51_11001;
wire    ap_block_state69_pp0_stage67_iter0;
reg    ap_predicate_op311_readreq_state69;
reg    ap_block_state69_io;
reg    ap_block_pp0_stage67_11001;
wire    ap_block_state13_pp0_stage11_iter0;
reg    ap_predicate_op194_write_state13;
reg    ap_block_state13_io;
wire    ap_block_state96_pp0_stage11_iter1;
reg    ap_block_pp0_stage11_11001;
wire   [127:0] p_Result_11_fu_515_p1;
wire    ap_block_pp0_stage11_01001;
wire    ap_block_state29_pp0_stage27_iter0;
reg    ap_predicate_op221_write_state29;
reg    ap_block_state29_io;
reg    ap_block_pp0_stage27_11001;
wire   [127:0] p_Result_12_fu_531_p1;
wire    ap_block_pp0_stage27_01001;
wire    ap_block_state45_pp0_stage43_iter0;
reg    ap_predicate_op248_write_state45;
reg    ap_block_state45_io;
reg    ap_block_pp0_stage43_11001;
wire   [127:0] p_Result_13_fu_549_p1;
wire    ap_block_pp0_stage43_01001;
wire    ap_block_state46_pp0_stage44_iter0;
reg    ap_predicate_op251_write_state46;
reg    ap_block_state46_io;
reg    ap_block_pp0_stage44_11001;
wire   [127:0] p_Result_8_fu_554_p1;
wire    ap_block_pp0_stage44_01001;
wire    ap_block_state62_pp0_stage60_iter0;
reg    ap_predicate_op303_write_state62;
reg    ap_block_state62_io;
reg    ap_block_pp0_stage60_11001;
wire   [127:0] p_Result_9_fu_585_p1;
wire    ap_block_pp0_stage60_01001;
wire    ap_block_state78_pp0_stage76_iter0;
reg    ap_predicate_op330_write_state78;
reg    ap_block_state78_io;
reg    ap_block_pp0_stage76_11001;
wire   [127:0] p_Result_10_fu_603_p1;
wire    ap_block_pp0_stage76_01001;
reg    ap_block_pp0_stage9_01001;
reg   [31:0] rhs_V_fu_122;
wire   [31:0] i_V_fu_608_p2;
wire  signed [31:0] icmp_ln1073_fu_364_p0;
wire  signed [31:0] sext_ln232_fu_369_p0;
wire  signed [33:0] sext_ln232_fu_369_p1;
wire   [33:0] ret_V_fu_373_p2;
wire   [37:0] shl_ln_fu_383_p3;
wire  signed [63:0] sext_ln357_2_fu_391_p1;
wire   [33:0] ret_V_1_fu_378_p2;
wire   [37:0] shl_ln357_1_fu_400_p3;
wire  signed [63:0] sext_ln357_3_fu_408_p1;
wire   [33:0] ret_V_2_fu_417_p2;
wire   [37:0] shl_ln1_fu_422_p3;
wire  signed [63:0] sext_ln414_1_fu_430_p1;
wire   [63:0] add_ln357_fu_395_p2;
wire   [63:0] add_ln357_1_fu_412_p2;
wire   [63:0] add_ln414_fu_434_p2;
wire    ap_block_pp0_stage26;
wire   [63:0] tmp_9_fu_525_p3;
wire    ap_block_pp0_stage42;
wire   [95:0] tmp_12_fu_542_p4;
wire   [31:0] sub_ln414_3_fu_558_p2;
wire    ap_block_pp0_stage59;
wire   [63:0] tmp_fu_579_p3;
wire    ap_block_pp0_stage75;
wire   [95:0] tmp_4_fu_596_p4;
wire   [31:0] add_ln414_4_fu_618_p2;
wire    ap_CS_fsm_state100;
reg   [84:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state100_blk;
reg    ap_block_pp0_stage1_subdone;
reg    ap_block_pp0_stage2_subdone;
reg    ap_block_pp0_stage3_subdone;
wire    ap_block_state6_pp0_stage4_iter0;
wire    ap_block_state89_pp0_stage4_iter1;
wire    ap_block_pp0_stage4_subdone;
wire    ap_block_pp0_stage4_11001;
wire    ap_block_state7_pp0_stage5_iter0;
wire    ap_block_state90_pp0_stage5_iter1;
wire    ap_block_pp0_stage5_subdone;
wire    ap_block_pp0_stage5_11001;
reg    ap_block_pp0_stage6_subdone;
reg    ap_block_pp0_stage7_subdone;
reg    ap_block_pp0_stage8_subdone;
reg    ap_block_pp0_stage9_subdone;
reg    ap_block_pp0_stage10_subdone;
reg    ap_block_pp0_stage11_subdone;
wire    ap_block_state14_pp0_stage12_iter0;
wire    ap_block_state97_pp0_stage12_iter1;
wire    ap_block_pp0_stage12_subdone;
wire    ap_block_pp0_stage12_11001;
wire    ap_block_state15_pp0_stage13_iter0;
wire    ap_block_state98_pp0_stage13_iter1;
wire    ap_block_pp0_stage13_subdone;
wire    ap_block_pp0_stage13_11001;
wire    ap_block_state17_pp0_stage15_iter0;
wire    ap_block_pp0_stage15_subdone;
wire    ap_block_pp0_stage15_11001;
reg    ap_block_pp0_stage16_subdone;
reg    ap_block_pp0_stage17_subdone;
reg    ap_block_pp0_stage18_subdone;
wire    ap_block_state21_pp0_stage19_iter0;
wire    ap_block_pp0_stage19_subdone;
wire    ap_block_pp0_stage19_11001;
wire    ap_block_state22_pp0_stage20_iter0;
wire    ap_block_pp0_stage20_subdone;
wire    ap_block_pp0_stage20_11001;
wire    ap_block_state23_pp0_stage21_iter0;
wire    ap_block_pp0_stage21_subdone;
wire    ap_block_pp0_stage21_11001;
wire    ap_block_state24_pp0_stage22_iter0;
wire    ap_block_pp0_stage22_subdone;
wire    ap_block_pp0_stage22_11001;
wire    ap_block_state25_pp0_stage23_iter0;
wire    ap_block_pp0_stage23_subdone;
wire    ap_block_pp0_stage23_11001;
reg    ap_block_pp0_stage24_subdone;
reg    ap_block_pp0_stage25_subdone;
wire    ap_block_pp0_stage26_subdone;
reg    ap_block_pp0_stage27_subdone;
wire    ap_block_state30_pp0_stage28_iter0;
wire    ap_block_pp0_stage28_subdone;
wire    ap_block_pp0_stage28_11001;
wire    ap_block_state31_pp0_stage29_iter0;
wire    ap_block_pp0_stage29_subdone;
wire    ap_block_pp0_stage29_11001;
wire    ap_block_state32_pp0_stage30_iter0;
wire    ap_block_pp0_stage30_subdone;
wire    ap_block_pp0_stage30_11001;
wire    ap_block_state33_pp0_stage31_iter0;
wire    ap_block_pp0_stage31_subdone;
wire    ap_block_pp0_stage31_11001;
reg    ap_block_pp0_stage32_subdone;
reg    ap_block_pp0_stage33_subdone;
reg    ap_block_pp0_stage34_subdone;
wire    ap_block_state37_pp0_stage35_iter0;
wire    ap_block_pp0_stage35_subdone;
wire    ap_block_pp0_stage35_11001;
wire    ap_block_state38_pp0_stage36_iter0;
wire    ap_block_pp0_stage36_subdone;
wire    ap_block_pp0_stage36_11001;
wire    ap_block_state39_pp0_stage37_iter0;
wire    ap_block_pp0_stage37_subdone;
wire    ap_block_pp0_stage37_11001;
wire    ap_block_state40_pp0_stage38_iter0;
wire    ap_block_pp0_stage38_subdone;
wire    ap_block_pp0_stage38_11001;
wire    ap_block_state41_pp0_stage39_iter0;
wire    ap_block_pp0_stage39_subdone;
wire    ap_block_pp0_stage39_11001;
reg    ap_block_pp0_stage40_subdone;
reg    ap_block_pp0_stage41_subdone;
wire    ap_block_pp0_stage42_subdone;
reg    ap_block_pp0_stage43_subdone;
reg    ap_block_pp0_stage44_subdone;
wire    ap_block_state47_pp0_stage45_iter0;
wire    ap_block_pp0_stage45_subdone;
wire    ap_block_pp0_stage45_11001;
wire    ap_block_state48_pp0_stage46_iter0;
wire    ap_block_pp0_stage46_subdone;
wire    ap_block_pp0_stage46_11001;
wire    ap_block_state49_pp0_stage47_iter0;
wire    ap_block_pp0_stage47_subdone;
wire    ap_block_pp0_stage47_11001;
reg    ap_block_pp0_stage48_subdone;
reg    ap_block_pp0_stage49_subdone;
reg    ap_block_pp0_stage50_subdone;
reg    ap_block_pp0_stage51_subdone;
wire    ap_block_state54_pp0_stage52_iter0;
wire    ap_block_pp0_stage52_subdone;
wire    ap_block_pp0_stage52_11001;
wire    ap_block_state55_pp0_stage53_iter0;
wire    ap_block_pp0_stage53_subdone;
wire    ap_block_pp0_stage53_11001;
wire    ap_block_state56_pp0_stage54_iter0;
wire    ap_block_pp0_stage54_subdone;
wire    ap_block_pp0_stage54_11001;
wire    ap_block_state57_pp0_stage55_iter0;
wire    ap_block_pp0_stage55_subdone;
wire    ap_block_pp0_stage55_11001;
reg    ap_block_pp0_stage56_subdone;
reg    ap_block_pp0_stage57_subdone;
reg    ap_block_pp0_stage58_subdone;
wire    ap_block_pp0_stage59_subdone;
reg    ap_block_pp0_stage60_subdone;
wire    ap_block_state63_pp0_stage61_iter0;
wire    ap_block_pp0_stage61_subdone;
wire    ap_block_pp0_stage61_11001;
wire    ap_block_state64_pp0_stage62_iter0;
wire    ap_block_pp0_stage62_subdone;
wire    ap_block_pp0_stage62_11001;
wire    ap_block_state65_pp0_stage63_iter0;
wire    ap_block_pp0_stage63_subdone;
wire    ap_block_pp0_stage63_11001;
wire    ap_block_state66_pp0_stage64_iter0;
wire    ap_block_pp0_stage64_subdone;
wire    ap_block_pp0_stage64_11001;
reg    ap_block_pp0_stage65_subdone;
reg    ap_block_pp0_stage66_subdone;
reg    ap_block_pp0_stage67_subdone;
wire    ap_block_state70_pp0_stage68_iter0;
wire    ap_block_pp0_stage68_subdone;
wire    ap_block_pp0_stage68_11001;
wire    ap_block_state71_pp0_stage69_iter0;
wire    ap_block_pp0_stage69_subdone;
wire    ap_block_pp0_stage69_11001;
wire    ap_block_state72_pp0_stage70_iter0;
wire    ap_block_pp0_stage70_subdone;
wire    ap_block_pp0_stage70_11001;
wire    ap_block_state73_pp0_stage71_iter0;
wire    ap_block_pp0_stage71_subdone;
wire    ap_block_pp0_stage71_11001;
wire    ap_block_state74_pp0_stage72_iter0;
wire    ap_block_pp0_stage72_subdone;
wire    ap_block_pp0_stage72_11001;
reg    ap_block_pp0_stage73_subdone;
reg    ap_block_pp0_stage74_subdone;
wire    ap_block_pp0_stage75_subdone;
reg    ap_block_pp0_stage76_subdone;
wire    ap_block_state79_pp0_stage77_iter0;
wire    ap_block_pp0_stage77_subdone;
wire    ap_block_pp0_stage77_11001;
wire    ap_block_state80_pp0_stage78_iter0;
wire    ap_block_pp0_stage78_subdone;
wire    ap_block_pp0_stage78_11001;
wire    ap_block_state81_pp0_stage79_iter0;
wire    ap_block_pp0_stage79_subdone;
wire    ap_block_pp0_stage79_11001;
wire    ap_block_state82_pp0_stage80_iter0;
wire    ap_block_pp0_stage80_subdone;
wire    ap_block_pp0_stage80_11001;
reg    ap_block_pp0_stage81_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 85'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

add_sub_mm_control_s_axi #(
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
    .arg1(arg1),
    .arg2(arg2),
    .mem(mem),
    .src_addr1(src_addr1),
    .src_addr2(src_addr2),
    .dst_addr(dst_addr),
    .size(size),
    .op(op),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

add_sub_mm_gmem_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 5 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM_CACHE_VALUE ),
    .USER_DW( 128 ),
    .USER_AW( 64 ))
gmem_m_axi_U(
    .AWVALID(m_axi_gmem_AWVALID),
    .AWREADY(m_axi_gmem_AWREADY),
    .AWADDR(m_axi_gmem_AWADDR),
    .AWID(m_axi_gmem_AWID),
    .AWLEN(m_axi_gmem_AWLEN),
    .AWSIZE(m_axi_gmem_AWSIZE),
    .AWBURST(m_axi_gmem_AWBURST),
    .AWLOCK(m_axi_gmem_AWLOCK),
    .AWCACHE(m_axi_gmem_AWCACHE),
    .AWPROT(m_axi_gmem_AWPROT),
    .AWQOS(m_axi_gmem_AWQOS),
    .AWREGION(m_axi_gmem_AWREGION),
    .AWUSER(m_axi_gmem_AWUSER),
    .WVALID(m_axi_gmem_WVALID),
    .WREADY(m_axi_gmem_WREADY),
    .WDATA(m_axi_gmem_WDATA),
    .WSTRB(m_axi_gmem_WSTRB),
    .WLAST(m_axi_gmem_WLAST),
    .WID(m_axi_gmem_WID),
    .WUSER(m_axi_gmem_WUSER),
    .ARVALID(m_axi_gmem_ARVALID),
    .ARREADY(m_axi_gmem_ARREADY),
    .ARADDR(m_axi_gmem_ARADDR),
    .ARID(m_axi_gmem_ARID),
    .ARLEN(m_axi_gmem_ARLEN),
    .ARSIZE(m_axi_gmem_ARSIZE),
    .ARBURST(m_axi_gmem_ARBURST),
    .ARLOCK(m_axi_gmem_ARLOCK),
    .ARCACHE(m_axi_gmem_ARCACHE),
    .ARPROT(m_axi_gmem_ARPROT),
    .ARQOS(m_axi_gmem_ARQOS),
    .ARREGION(m_axi_gmem_ARREGION),
    .ARUSER(m_axi_gmem_ARUSER),
    .RVALID(m_axi_gmem_RVALID),
    .RREADY(m_axi_gmem_RREADY),
    .RDATA(m_axi_gmem_RDATA),
    .RLAST(m_axi_gmem_RLAST),
    .RID(m_axi_gmem_RID),
    .RUSER(m_axi_gmem_RUSER),
    .RRESP(m_axi_gmem_RRESP),
    .BVALID(m_axi_gmem_BVALID),
    .BREADY(m_axi_gmem_BREADY),
    .BRESP(m_axi_gmem_BRESP),
    .BID(m_axi_gmem_BID),
    .BUSER(m_axi_gmem_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(gmem_ARVALID),
    .I_ARREADY(gmem_ARREADY),
    .I_ARADDR(gmem_ARADDR),
    .I_ARLEN(32'd1),
    .I_RVALID(gmem_RVALID),
    .I_RREADY(gmem_RREADY),
    .I_RDATA(gmem_RDATA),
    .I_RFIFONUM(gmem_RFIFONUM),
    .I_AWVALID(gmem_AWVALID),
    .I_AWREADY(gmem_AWREADY),
    .I_AWADDR(gmem_AWADDR),
    .I_AWLEN(32'd1),
    .I_WVALID(gmem_WVALID),
    .I_WREADY(gmem_WREADY),
    .I_WDATA(gmem_WDATA),
    .I_WSTRB(gmem_WSTRB),
    .I_BVALID(gmem_BVALID),
    .I_BREADY(gmem_BREADY)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((((1'b1 == ap_CS_fsm_pp0_stage14) & (1'b0 == ap_block_pp0_stage14_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)) | ((1'b1 == ap_CS_fsm_pp0_stage82) & (1'b0 == ap_block_pp0_stage82_subdone)))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1073_reg_676_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage8) & (1'b0 == ap_block_pp0_stage8_11001))) begin
        ap_phi_reg_pp0_iter1_storemerge_reg_250 <= p_Result_s_fu_624_p5;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage82) & (1'b0 == ap_block_pp0_stage82_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        ap_phi_reg_pp0_iter1_storemerge_reg_250 <= ap_phi_reg_pp0_iter0_storemerge_reg_250;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        rhs_V_fu_122 <= 32'd0;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage82) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage82_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        rhs_V_fu_122 <= i_V_fu_608_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage10) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage10_11001))) begin
        add_ln414_1_reg_739 <= add_ln414_1_fu_511_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage59) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage59_11001))) begin
        add_ln414_2_reg_765 <= add_ln414_2_fu_573_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage75) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage75_11001))) begin
        add_ln414_3_reg_772 <= add_ln414_3_fu_590_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage58) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage58_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        ap_phi_reg_pp0_iter0_storemerge_reg_250 <= p_Result_4_fu_564_p5;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001))) begin
        gmem_addr_1_reg_713 <= sext_ln357_1_fu_489_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        gmem_addr_2_reg_701 <= sext_ln414_fu_479_p1;
        gmem_addr_reg_695 <= sext_ln357_fu_469_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_V_2_reg_671 <= rhs_V_fu_122;
        icmp_ln1073_reg_676 <= icmp_ln1073_fu_364_p2;
        icmp_ln1073_reg_676_pp0_iter1_reg <= icmp_ln1073_reg_676;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        lhs_5_reg_661[31 : 0] <= lhs_5_fu_348_p1[31 : 0];
        lhs_6_reg_666[31 : 0] <= lhs_6_fu_352_p1[31 : 0];
        lhs_reg_656[31 : 0] <= lhs_fu_344_p1[31 : 0];
        mem_read_reg_649 <= mem;
        op_read_reg_640 <= op;
        size_read_reg_644 <= size;
    end
end

always @ (posedge ap_clk) begin
    if ((((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage24) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage24_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage57) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage57_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        reg_320 <= {{gmem_RDATA[63:32]}};
    end
end

always @ (posedge ap_clk) begin
    if ((((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage25) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage25_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage58) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage58_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        reg_324 <= {{gmem_RDATA[63:32]}};
    end
end

always @ (posedge ap_clk) begin
    if ((((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage40) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage40_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage73) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage73_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        reg_328 <= {{gmem_RDATA[95:64]}};
    end
end

always @ (posedge ap_clk) begin
    if ((((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage41) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage41_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage74) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage74_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        reg_332 <= {{gmem_RDATA[95:64]}};
    end
end

always @ (posedge ap_clk) begin
    if ((((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage56) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage56_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((icmp_ln1073_reg_676_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6_11001)))) begin
        reg_336 <= {{gmem_RDATA[127:96]}};
    end
end

always @ (posedge ap_clk) begin
    if ((((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage57) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage57_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((icmp_ln1073_reg_676_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage7) & (1'b0 == ap_block_pp0_stage7_11001)))) begin
        reg_340 <= {{gmem_RDATA[127:96]}};
    end
end

always @ (posedge ap_clk) begin
    if (((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage26) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage26_11001))) begin
        sub_ln414_1_reg_747 <= sub_ln414_1_fu_519_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage42) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage42_11001))) begin
        sub_ln414_2_reg_754 <= sub_ln414_2_fu_536_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage10) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage10_11001))) begin
        sub_ln414_reg_731 <= sub_ln414_fu_507_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1073_fu_364_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln1_reg_690 <= {{add_ln414_fu_434_p2[63:4]}};
        trunc_ln357_1_reg_685 <= {{add_ln357_1_fu_412_p2[63:4]}};
        trunc_ln_reg_680 <= {{add_ln357_fu_395_p2[63:4]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage9) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage9_11001))) begin
        trunc_ln357_2_reg_725 <= trunc_ln357_2_fu_503_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage8) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage8_11001))) begin
        trunc_ln357_reg_719 <= trunc_ln357_fu_499_p1;
    end
end

assign ap_ST_fsm_state100_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln1073_fu_364_p2 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state100)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state100)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op340_readreq_state85 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage34) & (1'b0 == ap_block_pp0_stage34_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op229_readreq_state36 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage18) & (1'b0 == ap_block_pp0_stage18_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op202_readreq_state20 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage67) & (1'b0 == ap_block_pp0_stage67_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op311_readreq_state69 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage51) & (1'b0 == ap_block_pp0_stage51_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op268_readreq_state53 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage50) & (1'b0 == ap_block_pp0_stage50_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op263_readreq_state52 == 1'b1)))) begin
        gmem_ARADDR = gmem_addr_1_reg_713;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        gmem_ARADDR = sext_ln357_1_fu_489_p1;
    end else if ((((1'b1 == ap_CS_fsm_pp0_stage49) & (1'b0 == ap_block_pp0_stage49_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op260_readreq_state51 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage33) & (1'b0 == ap_block_pp0_stage33_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op227_readreq_state35 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage17) & (1'b0 == ap_block_pp0_stage17_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op200_readreq_state19 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage82) & (1'b0 == ap_block_pp0_stage82_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op336_readreq_state84 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage66) & (1'b0 == ap_block_pp0_stage66_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op309_readreq_state68 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage50) & (1'b0 == ap_block_pp0_stage50_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op264_readreq_state52 == 1'b1)))) begin
        gmem_ARADDR = gmem_addr_reg_695;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        gmem_ARADDR = sext_ln357_fu_469_p1;
    end else begin
        gmem_ARADDR = 'bx;
    end
end

always @ (*) begin
    if ((((ap_predicate_op340_readreq_state85 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage34) & (1'b0 == ap_block_pp0_stage34_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op229_readreq_state36 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage18) & (1'b0 == ap_block_pp0_stage18_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op202_readreq_state20 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage67) & (1'b0 == ap_block_pp0_stage67_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op311_readreq_state69 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage51) & (1'b0 == ap_block_pp0_stage51_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op268_readreq_state53 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage49) & (1'b0 == ap_block_pp0_stage49_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op260_readreq_state51 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage33) & (1'b0 == ap_block_pp0_stage33_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op227_readreq_state35 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage17) & (1'b0 == ap_block_pp0_stage17_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op200_readreq_state19 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage82) & (1'b0 == ap_block_pp0_stage82_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op336_readreq_state84 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage66) & (1'b0 == ap_block_pp0_stage66_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op309_readreq_state68 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage50) & (1'b0 == ap_block_pp0_stage50_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op264_readreq_state52 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage50) & (1'b0 == ap_block_pp0_stage50_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op263_readreq_state52 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        gmem_ARVALID = 1'b1;
    end else begin
        gmem_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op171_writereq_state4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op170_writereq_state4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage10) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage10_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op175_writereq_state5 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op174_writereq_state5 == 1'b1)))) begin
        gmem_AWADDR = gmem_addr_2_reg_701;
    end else if ((((ap_predicate_op165_writereq_state3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op164_writereq_state3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        gmem_AWADDR = sext_ln414_fu_479_p1;
    end else begin
        gmem_AWADDR = 'bx;
    end
end

always @ (*) begin
    if ((((ap_predicate_op171_writereq_state4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op170_writereq_state4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op165_writereq_state3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op164_writereq_state3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage10) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage10_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op175_writereq_state5 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op174_writereq_state5 == 1'b1)))) begin
        gmem_AWVALID = 1'b1;
    end else begin
        gmem_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage48) & (1'b0 == ap_block_pp0_stage48_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op258_writeresp_state50 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage32) & (1'b0 == ap_block_pp0_stage32_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op226_writeresp_state34 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage16) & (1'b0 == ap_block_pp0_stage16_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op199_writeresp_state18 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage81) & (1'b0 == ap_block_pp0_stage81_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op335_writeresp_state83 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage65) & (1'b0 == ap_block_pp0_stage65_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op308_writeresp_state67 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage49) & (1'b0 == ap_block_pp0_stage49_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op261_writeresp_state51 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage14) & (1'b0 == ap_block_pp0_stage14_11001)))) begin
        gmem_BREADY = 1'b1;
    end else begin
        gmem_BREADY = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op354_read_state92 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage7) & (1'b0 == ap_block_pp0_stage7_11001)) | ((ap_predicate_op351_read_state91 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6_11001)) | ((ap_predicate_op285_read_state58 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage56) & (1'b0 == ap_block_pp0_stage56_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op325_read_state76 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage74) & (1'b0 == ap_block_pp0_stage74_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op243_read_state43 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage41) & (1'b0 == ap_block_pp0_stage41_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op322_read_state75 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage73) & (1'b0 == ap_block_pp0_stage73_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op240_read_state42 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage40) & (1'b0 == ap_block_pp0_stage40_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op298_read_state60 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage58) & (1'b0 == ap_block_pp0_stage58_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op216_read_state27 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage25) & (1'b0 == ap_block_pp0_stage25_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op292_read_state59 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage57) & (1'b0 == ap_block_pp0_stage57_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op290_read_state59 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage57) & (1'b0 == ap_block_pp0_stage57_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_predicate_op213_read_state26 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage24) & (1'b0 == ap_block_pp0_stage24_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage9) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage9_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage8) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage8_11001) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        gmem_RREADY = 1'b1;
    end else begin
        gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage9) & (1'b0 == ap_block_pp0_stage9_01001))) begin
        gmem_WDATA = ap_phi_reg_pp0_iter1_storemerge_reg_250;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage76) & (1'b0 == ap_block_pp0_stage76_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op330_write_state78 == 1'b1))) begin
        gmem_WDATA = p_Result_10_fu_603_p1;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage60) & (1'b0 == ap_block_pp0_stage60_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op303_write_state62 == 1'b1))) begin
        gmem_WDATA = p_Result_9_fu_585_p1;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage44) & (1'b0 == ap_block_pp0_stage44_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op251_write_state46 == 1'b1))) begin
        gmem_WDATA = p_Result_8_fu_554_p1;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage43) & (1'b0 == ap_block_pp0_stage43_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op248_write_state45 == 1'b1))) begin
        gmem_WDATA = p_Result_13_fu_549_p1;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage27) & (1'b0 == ap_block_pp0_stage27_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op221_write_state29 == 1'b1))) begin
        gmem_WDATA = p_Result_12_fu_531_p1;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage11) & (1'b0 == ap_block_pp0_stage11_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op194_write_state13 == 1'b1))) begin
        gmem_WDATA = p_Result_11_fu_515_p1;
    end else begin
        gmem_WDATA = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage43) & (1'b0 == ap_block_pp0_stage43_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op248_write_state45 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage27) & (1'b0 == ap_block_pp0_stage27_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op221_write_state29 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage76) & (1'b0 == ap_block_pp0_stage76_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op330_write_state78 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage60) & (1'b0 == ap_block_pp0_stage60_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op303_write_state62 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage9) & (1'b0 == ap_block_pp0_stage9_01001)))) begin
        gmem_WSTRB = 16'd65535;
    end else if ((((1'b1 == ap_CS_fsm_pp0_stage11) & (1'b0 == ap_block_pp0_stage11_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op194_write_state13 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage44) & (1'b0 == ap_block_pp0_stage44_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op251_write_state46 == 1'b1)))) begin
        gmem_WSTRB = 16'd15;
    end else begin
        gmem_WSTRB = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage43) & (1'b0 == ap_block_pp0_stage43_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op248_write_state45 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage27) & (1'b0 == ap_block_pp0_stage27_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op221_write_state29 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage11) & (1'b0 == ap_block_pp0_stage11_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op194_write_state13 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage76) & (1'b0 == ap_block_pp0_stage76_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op330_write_state78 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage60) & (1'b0 == ap_block_pp0_stage60_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op303_write_state62 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage44) & (1'b0 == ap_block_pp0_stage44_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op251_write_state46 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage9) & (1'b0 == ap_block_pp0_stage9_11001)))) begin
        gmem_WVALID = 1'b1;
    end else begin
        gmem_WVALID = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage34) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage34) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage18) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage18) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage49) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage49) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage33) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage33) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage17) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage17) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage50) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage50) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage0)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage67) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage67) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage51) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage51) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage82) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage82) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage66) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage66) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage50) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage50) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        gmem_blk_n_AR = m_axi_gmem_ARREADY;
    end else begin
        gmem_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage10) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage10) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage3) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage3) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        gmem_blk_n_AW = m_axi_gmem_AWREADY;
    end else begin
        gmem_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if ((((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage48) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage48) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage32) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage32) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage16) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage16) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage14) & (1'b0 == ap_block_pp0_stage14)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage81) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage81) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage65) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage65) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage49) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage49) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        gmem_blk_n_B = m_axi_gmem_BVALID;
    end else begin
        gmem_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage9) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage9) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage41) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage41) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage25) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage25) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage56) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage56) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage40) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage40) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage24) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage24) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage57) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage57) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((icmp_ln1073_reg_676_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage7) & (1'b0 == ap_block_pp0_stage7)) | ((icmp_ln1073_reg_676_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage74) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage74) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage58) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage58) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage73) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage73) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage57) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage57) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_CS_fsm_pp0_stage8) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage8) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        gmem_blk_n_R = m_axi_gmem_RVALID;
    end else begin
        gmem_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if ((((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage43) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage43) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage27) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage27) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage11) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage11) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage9) & (1'b0 == ap_block_pp0_stage9)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage76) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage76) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage60) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage60) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((op_read_reg_640 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage44) & (icmp_ln1073_reg_676 == 1'd1) & (1'b0 == ap_block_pp0_stage44) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        gmem_blk_n_W = m_axi_gmem_WREADY;
    end else begin
        gmem_blk_n_W = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((icmp_ln1073_fu_364_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if (((icmp_ln1073_fu_364_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state100;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_pp0_stage5 : begin
            if ((1'b0 == ap_block_pp0_stage5_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end
        end
        ap_ST_fsm_pp0_stage6 : begin
            if ((1'b0 == ap_block_pp0_stage6_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end
        end
        ap_ST_fsm_pp0_stage7 : begin
            if ((1'b0 == ap_block_pp0_stage7_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage7;
            end
        end
        ap_ST_fsm_pp0_stage8 : begin
            if ((1'b0 == ap_block_pp0_stage8_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage8;
            end
        end
        ap_ST_fsm_pp0_stage9 : begin
            if ((1'b0 == ap_block_pp0_stage9_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage9;
            end
        end
        ap_ST_fsm_pp0_stage10 : begin
            if ((1'b0 == ap_block_pp0_stage10_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage10;
            end
        end
        ap_ST_fsm_pp0_stage11 : begin
            if ((1'b0 == ap_block_pp0_stage11_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage11;
            end
        end
        ap_ST_fsm_pp0_stage12 : begin
            if ((1'b0 == ap_block_pp0_stage12_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage12;
            end
        end
        ap_ST_fsm_pp0_stage13 : begin
            if ((1'b0 == ap_block_pp0_stage13_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage13;
            end
        end
        ap_ST_fsm_pp0_stage14 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage14) & (1'b0 == ap_block_pp0_stage14_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)) & (1'b0 == ap_block_pp0_stage14_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage15;
            end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage14) & (1'b0 == ap_block_pp0_stage14_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state100;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage14;
            end
        end
        ap_ST_fsm_pp0_stage15 : begin
            if ((1'b0 == ap_block_pp0_stage15_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage15;
            end
        end
        ap_ST_fsm_pp0_stage16 : begin
            if ((1'b0 == ap_block_pp0_stage16_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage17;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage16;
            end
        end
        ap_ST_fsm_pp0_stage17 : begin
            if ((1'b0 == ap_block_pp0_stage17_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage17;
            end
        end
        ap_ST_fsm_pp0_stage18 : begin
            if ((1'b0 == ap_block_pp0_stage18_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage19;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage18;
            end
        end
        ap_ST_fsm_pp0_stage19 : begin
            if ((1'b0 == ap_block_pp0_stage19_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage20;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage19;
            end
        end
        ap_ST_fsm_pp0_stage20 : begin
            if ((1'b0 == ap_block_pp0_stage20_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage21;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage20;
            end
        end
        ap_ST_fsm_pp0_stage21 : begin
            if ((1'b0 == ap_block_pp0_stage21_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage22;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage21;
            end
        end
        ap_ST_fsm_pp0_stage22 : begin
            if ((1'b0 == ap_block_pp0_stage22_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage23;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage22;
            end
        end
        ap_ST_fsm_pp0_stage23 : begin
            if ((1'b0 == ap_block_pp0_stage23_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage24;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage23;
            end
        end
        ap_ST_fsm_pp0_stage24 : begin
            if ((1'b0 == ap_block_pp0_stage24_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage25;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage24;
            end
        end
        ap_ST_fsm_pp0_stage25 : begin
            if ((1'b0 == ap_block_pp0_stage25_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage26;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage25;
            end
        end
        ap_ST_fsm_pp0_stage26 : begin
            if ((1'b0 == ap_block_pp0_stage26_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage27;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage26;
            end
        end
        ap_ST_fsm_pp0_stage27 : begin
            if ((1'b0 == ap_block_pp0_stage27_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage28;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage27;
            end
        end
        ap_ST_fsm_pp0_stage28 : begin
            if ((1'b0 == ap_block_pp0_stage28_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage29;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage28;
            end
        end
        ap_ST_fsm_pp0_stage29 : begin
            if ((1'b0 == ap_block_pp0_stage29_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage30;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage29;
            end
        end
        ap_ST_fsm_pp0_stage30 : begin
            if ((1'b0 == ap_block_pp0_stage30_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage31;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage30;
            end
        end
        ap_ST_fsm_pp0_stage31 : begin
            if ((1'b0 == ap_block_pp0_stage31_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage32;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage31;
            end
        end
        ap_ST_fsm_pp0_stage32 : begin
            if ((1'b0 == ap_block_pp0_stage32_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage33;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage32;
            end
        end
        ap_ST_fsm_pp0_stage33 : begin
            if ((1'b0 == ap_block_pp0_stage33_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage34;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage33;
            end
        end
        ap_ST_fsm_pp0_stage34 : begin
            if ((1'b0 == ap_block_pp0_stage34_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage35;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage34;
            end
        end
        ap_ST_fsm_pp0_stage35 : begin
            if ((1'b0 == ap_block_pp0_stage35_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage36;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage35;
            end
        end
        ap_ST_fsm_pp0_stage36 : begin
            if ((1'b0 == ap_block_pp0_stage36_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage37;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage36;
            end
        end
        ap_ST_fsm_pp0_stage37 : begin
            if ((1'b0 == ap_block_pp0_stage37_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage38;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage37;
            end
        end
        ap_ST_fsm_pp0_stage38 : begin
            if ((1'b0 == ap_block_pp0_stage38_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage39;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage38;
            end
        end
        ap_ST_fsm_pp0_stage39 : begin
            if ((1'b0 == ap_block_pp0_stage39_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage40;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage39;
            end
        end
        ap_ST_fsm_pp0_stage40 : begin
            if ((1'b0 == ap_block_pp0_stage40_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage41;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage40;
            end
        end
        ap_ST_fsm_pp0_stage41 : begin
            if ((1'b0 == ap_block_pp0_stage41_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage42;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage41;
            end
        end
        ap_ST_fsm_pp0_stage42 : begin
            if ((1'b0 == ap_block_pp0_stage42_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage43;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage42;
            end
        end
        ap_ST_fsm_pp0_stage43 : begin
            if ((1'b0 == ap_block_pp0_stage43_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage44;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage43;
            end
        end
        ap_ST_fsm_pp0_stage44 : begin
            if ((1'b0 == ap_block_pp0_stage44_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage45;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage44;
            end
        end
        ap_ST_fsm_pp0_stage45 : begin
            if ((1'b0 == ap_block_pp0_stage45_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage46;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage45;
            end
        end
        ap_ST_fsm_pp0_stage46 : begin
            if ((1'b0 == ap_block_pp0_stage46_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage47;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage46;
            end
        end
        ap_ST_fsm_pp0_stage47 : begin
            if ((1'b0 == ap_block_pp0_stage47_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage48;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage47;
            end
        end
        ap_ST_fsm_pp0_stage48 : begin
            if ((1'b0 == ap_block_pp0_stage48_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage49;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage48;
            end
        end
        ap_ST_fsm_pp0_stage49 : begin
            if ((1'b0 == ap_block_pp0_stage49_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage50;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage49;
            end
        end
        ap_ST_fsm_pp0_stage50 : begin
            if ((1'b0 == ap_block_pp0_stage50_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage51;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage50;
            end
        end
        ap_ST_fsm_pp0_stage51 : begin
            if ((1'b0 == ap_block_pp0_stage51_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage52;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage51;
            end
        end
        ap_ST_fsm_pp0_stage52 : begin
            if ((1'b0 == ap_block_pp0_stage52_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage53;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage52;
            end
        end
        ap_ST_fsm_pp0_stage53 : begin
            if ((1'b0 == ap_block_pp0_stage53_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage54;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage53;
            end
        end
        ap_ST_fsm_pp0_stage54 : begin
            if ((1'b0 == ap_block_pp0_stage54_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage55;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage54;
            end
        end
        ap_ST_fsm_pp0_stage55 : begin
            if ((1'b0 == ap_block_pp0_stage55_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage56;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage55;
            end
        end
        ap_ST_fsm_pp0_stage56 : begin
            if ((1'b0 == ap_block_pp0_stage56_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage57;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage56;
            end
        end
        ap_ST_fsm_pp0_stage57 : begin
            if ((1'b0 == ap_block_pp0_stage57_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage58;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage57;
            end
        end
        ap_ST_fsm_pp0_stage58 : begin
            if ((1'b0 == ap_block_pp0_stage58_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage59;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage58;
            end
        end
        ap_ST_fsm_pp0_stage59 : begin
            if ((1'b0 == ap_block_pp0_stage59_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage60;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage59;
            end
        end
        ap_ST_fsm_pp0_stage60 : begin
            if ((1'b0 == ap_block_pp0_stage60_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage61;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage60;
            end
        end
        ap_ST_fsm_pp0_stage61 : begin
            if ((1'b0 == ap_block_pp0_stage61_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage62;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage61;
            end
        end
        ap_ST_fsm_pp0_stage62 : begin
            if ((1'b0 == ap_block_pp0_stage62_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage63;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage62;
            end
        end
        ap_ST_fsm_pp0_stage63 : begin
            if ((1'b0 == ap_block_pp0_stage63_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage64;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage63;
            end
        end
        ap_ST_fsm_pp0_stage64 : begin
            if ((1'b0 == ap_block_pp0_stage64_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage65;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage64;
            end
        end
        ap_ST_fsm_pp0_stage65 : begin
            if ((1'b0 == ap_block_pp0_stage65_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage66;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage65;
            end
        end
        ap_ST_fsm_pp0_stage66 : begin
            if ((1'b0 == ap_block_pp0_stage66_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage67;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage66;
            end
        end
        ap_ST_fsm_pp0_stage67 : begin
            if ((1'b0 == ap_block_pp0_stage67_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage68;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage67;
            end
        end
        ap_ST_fsm_pp0_stage68 : begin
            if ((1'b0 == ap_block_pp0_stage68_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage69;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage68;
            end
        end
        ap_ST_fsm_pp0_stage69 : begin
            if ((1'b0 == ap_block_pp0_stage69_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage70;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage69;
            end
        end
        ap_ST_fsm_pp0_stage70 : begin
            if ((1'b0 == ap_block_pp0_stage70_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage71;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage70;
            end
        end
        ap_ST_fsm_pp0_stage71 : begin
            if ((1'b0 == ap_block_pp0_stage71_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage72;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage71;
            end
        end
        ap_ST_fsm_pp0_stage72 : begin
            if ((1'b0 == ap_block_pp0_stage72_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage73;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage72;
            end
        end
        ap_ST_fsm_pp0_stage73 : begin
            if ((1'b0 == ap_block_pp0_stage73_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage74;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage73;
            end
        end
        ap_ST_fsm_pp0_stage74 : begin
            if ((1'b0 == ap_block_pp0_stage74_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage75;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage74;
            end
        end
        ap_ST_fsm_pp0_stage75 : begin
            if ((1'b0 == ap_block_pp0_stage75_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage76;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage75;
            end
        end
        ap_ST_fsm_pp0_stage76 : begin
            if ((1'b0 == ap_block_pp0_stage76_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage77;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage76;
            end
        end
        ap_ST_fsm_pp0_stage77 : begin
            if ((1'b0 == ap_block_pp0_stage77_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage78;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage77;
            end
        end
        ap_ST_fsm_pp0_stage78 : begin
            if ((1'b0 == ap_block_pp0_stage78_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage79;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage78;
            end
        end
        ap_ST_fsm_pp0_stage79 : begin
            if ((1'b0 == ap_block_pp0_stage79_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage80;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage79;
            end
        end
        ap_ST_fsm_pp0_stage80 : begin
            if ((1'b0 == ap_block_pp0_stage80_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage81;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage80;
            end
        end
        ap_ST_fsm_pp0_stage81 : begin
            if ((1'b0 == ap_block_pp0_stage81_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage82;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage81;
            end
        end
        ap_ST_fsm_pp0_stage82 : begin
            if ((1'b0 == ap_block_pp0_stage82_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage82;
            end
        end
        ap_ST_fsm_state100 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln357_1_fu_412_p2 = ($signed(sext_ln357_3_fu_408_p1) + $signed(mem_read_reg_649));

assign add_ln357_fu_395_p2 = ($signed(sext_ln357_2_fu_391_p1) + $signed(mem_read_reg_649));

assign add_ln414_1_fu_511_p2 = (trunc_ln357_2_reg_725 + trunc_ln357_reg_719);

assign add_ln414_2_fu_573_p2 = (reg_324 + reg_320);

assign add_ln414_3_fu_590_p2 = (reg_332 + reg_328);

assign add_ln414_4_fu_618_p2 = (reg_340 + reg_336);

assign add_ln414_fu_434_p2 = ($signed(sext_ln414_1_fu_430_p1) + $signed(mem_read_reg_649));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage10 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_pp0_stage11 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_pp0_stage14 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_pp0_stage16 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_pp0_stage17 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_pp0_stage18 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage24 = ap_CS_fsm[32'd25];

assign ap_CS_fsm_pp0_stage25 = ap_CS_fsm[32'd26];

assign ap_CS_fsm_pp0_stage26 = ap_CS_fsm[32'd27];

assign ap_CS_fsm_pp0_stage27 = ap_CS_fsm[32'd28];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp0_stage32 = ap_CS_fsm[32'd33];

assign ap_CS_fsm_pp0_stage33 = ap_CS_fsm[32'd34];

assign ap_CS_fsm_pp0_stage34 = ap_CS_fsm[32'd35];

assign ap_CS_fsm_pp0_stage40 = ap_CS_fsm[32'd41];

assign ap_CS_fsm_pp0_stage41 = ap_CS_fsm[32'd42];

assign ap_CS_fsm_pp0_stage42 = ap_CS_fsm[32'd43];

assign ap_CS_fsm_pp0_stage43 = ap_CS_fsm[32'd44];

assign ap_CS_fsm_pp0_stage44 = ap_CS_fsm[32'd45];

assign ap_CS_fsm_pp0_stage48 = ap_CS_fsm[32'd49];

assign ap_CS_fsm_pp0_stage49 = ap_CS_fsm[32'd50];

assign ap_CS_fsm_pp0_stage50 = ap_CS_fsm[32'd51];

assign ap_CS_fsm_pp0_stage51 = ap_CS_fsm[32'd52];

assign ap_CS_fsm_pp0_stage56 = ap_CS_fsm[32'd57];

assign ap_CS_fsm_pp0_stage57 = ap_CS_fsm[32'd58];

assign ap_CS_fsm_pp0_stage58 = ap_CS_fsm[32'd59];

assign ap_CS_fsm_pp0_stage59 = ap_CS_fsm[32'd60];

assign ap_CS_fsm_pp0_stage6 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_pp0_stage60 = ap_CS_fsm[32'd61];

assign ap_CS_fsm_pp0_stage65 = ap_CS_fsm[32'd66];

assign ap_CS_fsm_pp0_stage66 = ap_CS_fsm[32'd67];

assign ap_CS_fsm_pp0_stage67 = ap_CS_fsm[32'd68];

assign ap_CS_fsm_pp0_stage7 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_pp0_stage73 = ap_CS_fsm[32'd74];

assign ap_CS_fsm_pp0_stage74 = ap_CS_fsm[32'd75];

assign ap_CS_fsm_pp0_stage75 = ap_CS_fsm[32'd76];

assign ap_CS_fsm_pp0_stage76 = ap_CS_fsm[32'd77];

assign ap_CS_fsm_pp0_stage8 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_pp0_stage81 = ap_CS_fsm[32'd82];

assign ap_CS_fsm_pp0_stage82 = ap_CS_fsm[32'd83];

assign ap_CS_fsm_pp0_stage9 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state100 = ap_CS_fsm[32'd84];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state85_io));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state85_io));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage10 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage10_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state12_io));
end

always @ (*) begin
    ap_block_pp0_stage10_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state12_io));
end

assign ap_block_pp0_stage11 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage11_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage11_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state13_io));
end

always @ (*) begin
    ap_block_pp0_stage11_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state13_io));
end

assign ap_block_pp0_stage12_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage12_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage14 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage14_11001 = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage14_subdone = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage15_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage15_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage16 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage16_11001 = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op199_writeresp_state18 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage16_subdone = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op199_writeresp_state18 == 1'b1));
end

assign ap_block_pp0_stage17 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage17_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state19_io));
end

always @ (*) begin
    ap_block_pp0_stage17_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state19_io));
end

assign ap_block_pp0_stage18 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage18_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state20_io));
end

always @ (*) begin
    ap_block_pp0_stage18_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state20_io));
end

assign ap_block_pp0_stage19_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage19_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state3_io));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state3_io));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage20_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage20_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage21_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage21_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage22_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage22_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage23_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage23_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage24 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage24_11001 = ((ap_predicate_op213_read_state26 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage24_subdone = ((ap_predicate_op213_read_state26 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage25 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage25_11001 = ((ap_predicate_op216_read_state27 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage25_subdone = ((ap_predicate_op216_read_state27 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage26 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage26_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage26_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage27 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage27_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage27_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state29_io));
end

always @ (*) begin
    ap_block_pp0_stage27_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state29_io));
end

assign ap_block_pp0_stage28_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage28_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage29_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage29_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage2_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state4_io));
end

always @ (*) begin
    ap_block_pp0_stage2_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state4_io));
end

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage30_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage30_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage31_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage31_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage32 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage32_11001 = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op226_writeresp_state34 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage32_subdone = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op226_writeresp_state34 == 1'b1));
end

assign ap_block_pp0_stage33 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage33_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state35_io));
end

always @ (*) begin
    ap_block_pp0_stage33_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state35_io));
end

assign ap_block_pp0_stage34 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage34_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state36_io));
end

always @ (*) begin
    ap_block_pp0_stage34_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state36_io));
end

assign ap_block_pp0_stage35_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage35_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage36_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage36_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage37_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage37_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage38_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage38_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage39_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage39_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage3_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state5_io));
end

always @ (*) begin
    ap_block_pp0_stage3_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state5_io));
end

assign ap_block_pp0_stage40 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage40_11001 = ((ap_predicate_op240_read_state42 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage40_subdone = ((ap_predicate_op240_read_state42 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage41 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage41_11001 = ((ap_predicate_op243_read_state43 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage41_subdone = ((ap_predicate_op243_read_state43 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage42 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage42_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage42_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage43 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage43_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage43_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state45_io));
end

always @ (*) begin
    ap_block_pp0_stage43_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state45_io));
end

assign ap_block_pp0_stage44 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage44_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage44_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state46_io));
end

always @ (*) begin
    ap_block_pp0_stage44_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state46_io));
end

assign ap_block_pp0_stage45_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage45_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage46_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage46_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage47_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage47_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage48 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage48_11001 = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op258_writeresp_state50 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage48_subdone = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op258_writeresp_state50 == 1'b1));
end

assign ap_block_pp0_stage49 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage49_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state51_io) | ((gmem_BVALID == 1'b0) & (ap_predicate_op261_writeresp_state51 == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage49_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state51_io) | ((gmem_BVALID == 1'b0) & (ap_predicate_op261_writeresp_state51 == 1'b1))));
end

assign ap_block_pp0_stage4_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage50 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage50_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state52_io));
end

always @ (*) begin
    ap_block_pp0_stage50_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state52_io));
end

assign ap_block_pp0_stage51 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage51_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state53_io));
end

always @ (*) begin
    ap_block_pp0_stage51_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state53_io));
end

assign ap_block_pp0_stage52_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage52_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage53_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage53_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage54_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage54_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage55_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage55_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage56 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage56_11001 = ((ap_predicate_op285_read_state58 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage56_subdone = ((ap_predicate_op285_read_state58 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage57 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage57_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((ap_predicate_op292_read_state59 == 1'b1) & (gmem_RVALID == 1'b0)) | ((ap_predicate_op290_read_state59 == 1'b1) & (gmem_RVALID == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage57_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((ap_predicate_op292_read_state59 == 1'b1) & (gmem_RVALID == 1'b0)) | ((ap_predicate_op290_read_state59 == 1'b1) & (gmem_RVALID == 1'b0))));
end

assign ap_block_pp0_stage58 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage58_11001 = ((ap_predicate_op298_read_state60 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage58_subdone = ((ap_predicate_op298_read_state60 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage59 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage59_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage59_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage60 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage60_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage60_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state62_io));
end

always @ (*) begin
    ap_block_pp0_stage60_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state62_io));
end

assign ap_block_pp0_stage61_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage61_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage62_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage62_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage63_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage63_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage64_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage64_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage65 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage65_11001 = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op308_writeresp_state67 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage65_subdone = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op308_writeresp_state67 == 1'b1));
end

assign ap_block_pp0_stage66 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage66_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state68_io));
end

always @ (*) begin
    ap_block_pp0_stage66_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state68_io));
end

assign ap_block_pp0_stage67 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage67_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state69_io));
end

always @ (*) begin
    ap_block_pp0_stage67_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state69_io));
end

assign ap_block_pp0_stage68_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage68_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage69_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage69_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage6_11001 = ((ap_predicate_op351_read_state91 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage6_subdone = ((ap_predicate_op351_read_state91 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage7 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage70_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage70_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage71_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage71_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage72_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage72_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage73 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage73_11001 = ((ap_predicate_op322_read_state75 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage73_subdone = ((ap_predicate_op322_read_state75 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage74 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage74_11001 = ((ap_predicate_op325_read_state76 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage74_subdone = ((ap_predicate_op325_read_state76 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage75 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage75_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage75_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage76 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage76_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage76_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state78_io));
end

always @ (*) begin
    ap_block_pp0_stage76_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state78_io));
end

assign ap_block_pp0_stage77_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage77_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage78_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage78_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage79_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage79_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage7_11001 = ((ap_predicate_op354_read_state92 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage7_subdone = ((ap_predicate_op354_read_state92 == 1'b1) & (gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage8 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage80_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage80_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage81 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage81_11001 = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op335_writeresp_state83 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage81_subdone = ((gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_predicate_op335_writeresp_state83 == 1'b1));
end

assign ap_block_pp0_stage82 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage82_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state84_io));
end

always @ (*) begin
    ap_block_pp0_stage82_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state84_io));
end

always @ (*) begin
    ap_block_pp0_stage8_11001 = ((gmem_RVALID == 1'b0) & (icmp_ln1073_reg_676 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage8_subdone = ((gmem_RVALID == 1'b0) & (icmp_ln1073_reg_676 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp0_stage9 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage9_01001 = ((gmem_RVALID == 1'b0) & (icmp_ln1073_reg_676 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage9_11001 = (((gmem_WREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((gmem_RVALID == 1'b0) & (icmp_ln1073_reg_676 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage9_subdone = (((gmem_WREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((gmem_RVALID == 1'b0) & (icmp_ln1073_reg_676 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)));
end

always @ (*) begin
    ap_block_state10_pp0_stage8_iter0 = ((gmem_RVALID == 1'b0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_block_state11_pp0_stage9_iter0 = ((gmem_RVALID == 1'b0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_block_state12_io = ((gmem_AWREADY == 1'b0) & (icmp_ln1073_reg_676 == 1'd1));
end

assign ap_block_state12_pp0_stage10_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state13_io = ((gmem_WREADY == 1'b0) & (ap_predicate_op194_write_state13 == 1'b1));
end

assign ap_block_state13_pp0_stage11_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage12_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage13_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage14_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage15_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state18_pp0_stage16_iter0 = ((gmem_BVALID == 1'b0) & (ap_predicate_op199_writeresp_state18 == 1'b1));
end

always @ (*) begin
    ap_block_state19_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op200_readreq_state19 == 1'b1));
end

assign ap_block_state19_pp0_stage17_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state20_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op202_readreq_state20 == 1'b1));
end

assign ap_block_state20_pp0_stage18_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state21_pp0_stage19_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state22_pp0_stage20_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state23_pp0_stage21_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state24_pp0_stage22_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state25_pp0_stage23_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state26_pp0_stage24_iter0 = ((ap_predicate_op213_read_state26 == 1'b1) & (gmem_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state27_pp0_stage25_iter0 = ((ap_predicate_op216_read_state27 == 1'b1) & (gmem_RVALID == 1'b0));
end

assign ap_block_state28_pp0_stage26_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state29_io = ((gmem_WREADY == 1'b0) & (ap_predicate_op221_write_state29 == 1'b1));
end

assign ap_block_state29_pp0_stage27_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state30_pp0_stage28_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state31_pp0_stage29_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state32_pp0_stage30_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state33_pp0_stage31_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state34_pp0_stage32_iter0 = ((gmem_BVALID == 1'b0) & (ap_predicate_op226_writeresp_state34 == 1'b1));
end

always @ (*) begin
    ap_block_state35_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op227_readreq_state35 == 1'b1));
end

assign ap_block_state35_pp0_stage33_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state36_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op229_readreq_state36 == 1'b1));
end

assign ap_block_state36_pp0_stage34_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state37_pp0_stage35_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state38_pp0_stage36_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state39_pp0_stage37_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = (((ap_predicate_op165_writereq_state3 == 1'b1) & (gmem_AWREADY == 1'b0)) | ((ap_predicate_op164_writereq_state3 == 1'b1) & (gmem_AWREADY == 1'b0)) | ((gmem_ARREADY == 1'b0) & (icmp_ln1073_reg_676 == 1'd1)));
end

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state40_pp0_stage38_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state41_pp0_stage39_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state42_pp0_stage40_iter0 = ((ap_predicate_op240_read_state42 == 1'b1) & (gmem_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state43_pp0_stage41_iter0 = ((ap_predicate_op243_read_state43 == 1'b1) & (gmem_RVALID == 1'b0));
end

assign ap_block_state44_pp0_stage42_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state45_io = ((gmem_WREADY == 1'b0) & (ap_predicate_op248_write_state45 == 1'b1));
end

assign ap_block_state45_pp0_stage43_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state46_io = ((gmem_WREADY == 1'b0) & (ap_predicate_op251_write_state46 == 1'b1));
end

assign ap_block_state46_pp0_stage44_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state47_pp0_stage45_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state48_pp0_stage46_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state49_pp0_stage47_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_io = (((ap_predicate_op171_writereq_state4 == 1'b1) & (gmem_AWREADY == 1'b0)) | ((ap_predicate_op170_writereq_state4 == 1'b1) & (gmem_AWREADY == 1'b0)) | ((gmem_ARREADY == 1'b0) & (icmp_ln1073_reg_676 == 1'd1)));
end

assign ap_block_state4_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state50_pp0_stage48_iter0 = ((gmem_BVALID == 1'b0) & (ap_predicate_op258_writeresp_state50 == 1'b1));
end

always @ (*) begin
    ap_block_state51_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op260_readreq_state51 == 1'b1));
end

always @ (*) begin
    ap_block_state51_pp0_stage49_iter0 = ((gmem_BVALID == 1'b0) & (ap_predicate_op261_writeresp_state51 == 1'b1));
end

always @ (*) begin
    ap_block_state52_io = (((gmem_ARREADY == 1'b0) & (ap_predicate_op264_readreq_state52 == 1'b1)) | ((gmem_ARREADY == 1'b0) & (ap_predicate_op263_readreq_state52 == 1'b1)));
end

assign ap_block_state52_pp0_stage50_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state53_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op268_readreq_state53 == 1'b1));
end

assign ap_block_state53_pp0_stage51_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state54_pp0_stage52_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state55_pp0_stage53_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state56_pp0_stage54_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state57_pp0_stage55_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state58_pp0_stage56_iter0 = ((ap_predicate_op285_read_state58 == 1'b1) & (gmem_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state59_pp0_stage57_iter0 = (((ap_predicate_op292_read_state59 == 1'b1) & (gmem_RVALID == 1'b0)) | ((ap_predicate_op290_read_state59 == 1'b1) & (gmem_RVALID == 1'b0)));
end

always @ (*) begin
    ap_block_state5_io = (((gmem_AWREADY == 1'b0) & (ap_predicate_op175_writereq_state5 == 1'b1)) | ((gmem_AWREADY == 1'b0) & (ap_predicate_op174_writereq_state5 == 1'b1)));
end

assign ap_block_state5_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state60_pp0_stage58_iter0 = ((ap_predicate_op298_read_state60 == 1'b1) & (gmem_RVALID == 1'b0));
end

assign ap_block_state61_pp0_stage59_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state62_io = ((gmem_WREADY == 1'b0) & (ap_predicate_op303_write_state62 == 1'b1));
end

assign ap_block_state62_pp0_stage60_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state63_pp0_stage61_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state64_pp0_stage62_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state65_pp0_stage63_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state66_pp0_stage64_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state67_pp0_stage65_iter0 = ((gmem_BVALID == 1'b0) & (ap_predicate_op308_writeresp_state67 == 1'b1));
end

always @ (*) begin
    ap_block_state68_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op309_readreq_state68 == 1'b1));
end

assign ap_block_state68_pp0_stage66_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state69_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op311_readreq_state69 == 1'b1));
end

assign ap_block_state69_pp0_stage67_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state70_pp0_stage68_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state71_pp0_stage69_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state72_pp0_stage70_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state73_pp0_stage71_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state74_pp0_stage72_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state75_pp0_stage73_iter0 = ((ap_predicate_op322_read_state75 == 1'b1) & (gmem_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state76_pp0_stage74_iter0 = ((ap_predicate_op325_read_state76 == 1'b1) & (gmem_RVALID == 1'b0));
end

assign ap_block_state77_pp0_stage75_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state78_io = ((gmem_WREADY == 1'b0) & (ap_predicate_op330_write_state78 == 1'b1));
end

assign ap_block_state78_pp0_stage76_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state79_pp0_stage77_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state80_pp0_stage78_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state81_pp0_stage79_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state82_pp0_stage80_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state83_pp0_stage81_iter0 = ((gmem_BVALID == 1'b0) & (ap_predicate_op335_writeresp_state83 == 1'b1));
end

always @ (*) begin
    ap_block_state84_io = ((gmem_ARREADY == 1'b0) & (ap_predicate_op336_readreq_state84 == 1'b1));
end

assign ap_block_state84_pp0_stage82_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state85_io = ((ap_predicate_op340_readreq_state85 == 1'b1) & (gmem_ARREADY == 1'b0));
end

assign ap_block_state85_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state86_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state87_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state88_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state89_pp0_stage4_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage6_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state90_pp0_stage5_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state91_pp0_stage6_iter1 = ((ap_predicate_op351_read_state91 == 1'b1) & (gmem_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state92_pp0_stage7_iter1 = ((ap_predicate_op354_read_state92 == 1'b1) & (gmem_RVALID == 1'b0));
end

assign ap_block_state93_pp0_stage8_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state94_pp0_stage9_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state95_pp0_stage10_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state96_pp0_stage11_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state97_pp0_stage12_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state98_pp0_stage13_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state99_pp0_stage14_iter1 = (gmem_BVALID == 1'b0);
end

assign ap_block_state9_pp0_stage7_iter0 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_op164_writereq_state3 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op165_writereq_state3 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op170_writereq_state4 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op171_writereq_state4 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op174_writereq_state5 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op175_writereq_state5 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op194_write_state13 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op199_writeresp_state18 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op200_readreq_state19 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op202_readreq_state20 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op213_read_state26 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op216_read_state27 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op221_write_state29 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op226_writeresp_state34 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op227_readreq_state35 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op229_readreq_state36 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op240_read_state42 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op243_read_state43 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op248_write_state45 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op251_write_state46 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op258_writeresp_state50 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op260_readreq_state51 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op261_writeresp_state51 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op263_readreq_state52 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op264_readreq_state52 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op268_readreq_state53 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op285_read_state58 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op290_read_state59 = ((op_read_reg_640 == 1'd0) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op292_read_state59 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op298_read_state60 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op303_write_state62 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op308_writeresp_state67 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op309_readreq_state68 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op311_readreq_state69 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op322_read_state75 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op325_read_state76 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op330_write_state78 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op335_writeresp_state83 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op336_readreq_state84 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op340_readreq_state85 = ((op_read_reg_640 == 1'd1) & (icmp_ln1073_reg_676 == 1'd1));
end

always @ (*) begin
    ap_predicate_op351_read_state91 = ((icmp_ln1073_reg_676_pp0_iter1_reg == 1'd1) & (op_read_reg_640 == 1'd1));
end

always @ (*) begin
    ap_predicate_op354_read_state92 = ((icmp_ln1073_reg_676_pp0_iter1_reg == 1'd1) & (op_read_reg_640 == 1'd1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign i_V_fu_608_p2 = ($signed(i_V_2_reg_671) + $signed(32'd16));

assign icmp_ln1073_fu_364_p0 = rhs_V_fu_122;

assign icmp_ln1073_fu_364_p2 = ((icmp_ln1073_fu_364_p0 < size_read_reg_644) ? 1'b1 : 1'b0);

assign lhs_5_fu_348_p1 = src_addr2;

assign lhs_6_fu_352_p1 = dst_addr;

assign lhs_fu_344_p1 = src_addr1;

assign p_Result_10_fu_603_p1 = tmp_4_fu_596_p4;

assign p_Result_11_fu_515_p1 = sub_ln414_reg_731;

assign p_Result_12_fu_531_p1 = tmp_9_fu_525_p3;

assign p_Result_13_fu_549_p1 = tmp_12_fu_542_p4;

assign p_Result_4_fu_564_p5 = {{{{sub_ln414_3_fu_558_p2}, {sub_ln414_2_reg_754}}, {sub_ln414_1_reg_747}}, {sub_ln414_reg_731}};

assign p_Result_8_fu_554_p1 = add_ln414_1_reg_739;

assign p_Result_9_fu_585_p1 = tmp_fu_579_p3;

assign p_Result_s_fu_624_p5 = {{{{add_ln414_4_fu_618_p2}, {add_ln414_3_reg_772}}, {add_ln414_2_reg_765}}, {add_ln414_1_reg_739}};

assign ret_V_1_fu_378_p2 = ($signed(sext_ln232_fu_369_p1) + $signed(lhs_5_reg_661));

assign ret_V_2_fu_417_p2 = ($signed(sext_ln232_fu_369_p1) + $signed(lhs_6_reg_666));

assign ret_V_fu_373_p2 = ($signed(sext_ln232_fu_369_p1) + $signed(lhs_reg_656));

assign sext_ln232_fu_369_p0 = rhs_V_fu_122;

assign sext_ln232_fu_369_p1 = sext_ln232_fu_369_p0;

assign sext_ln357_1_fu_489_p1 = $signed(trunc_ln357_1_reg_685);

assign sext_ln357_2_fu_391_p1 = $signed(shl_ln_fu_383_p3);

assign sext_ln357_3_fu_408_p1 = $signed(shl_ln357_1_fu_400_p3);

assign sext_ln357_fu_469_p1 = $signed(trunc_ln_reg_680);

assign sext_ln414_1_fu_430_p1 = $signed(shl_ln1_fu_422_p3);

assign sext_ln414_fu_479_p1 = $signed(trunc_ln1_reg_690);

assign shl_ln1_fu_422_p3 = {{ret_V_2_fu_417_p2}, {4'd0}};

assign shl_ln357_1_fu_400_p3 = {{ret_V_1_fu_378_p2}, {4'd0}};

assign shl_ln_fu_383_p3 = {{ret_V_fu_373_p2}, {4'd0}};

assign sub_ln414_1_fu_519_p2 = (reg_320 - reg_324);

assign sub_ln414_2_fu_536_p2 = (reg_328 - reg_332);

assign sub_ln414_3_fu_558_p2 = (reg_336 - reg_340);

assign sub_ln414_fu_507_p2 = (trunc_ln357_reg_719 - trunc_ln357_2_reg_725);

assign tmp_12_fu_542_p4 = {{{sub_ln414_2_reg_754}, {sub_ln414_1_reg_747}}, {sub_ln414_reg_731}};

assign tmp_4_fu_596_p4 = {{{add_ln414_3_reg_772}, {add_ln414_2_reg_765}}, {add_ln414_1_reg_739}};

assign tmp_9_fu_525_p3 = {{sub_ln414_1_reg_747}, {sub_ln414_reg_731}};

assign tmp_fu_579_p3 = {{add_ln414_2_reg_765}, {add_ln414_1_reg_739}};

assign trunc_ln357_2_fu_503_p1 = gmem_RDATA[31:0];

assign trunc_ln357_fu_499_p1 = gmem_RDATA[31:0];

always @ (posedge ap_clk) begin
    lhs_reg_656[33:32] <= 2'b00;
    lhs_5_reg_661[33:32] <= 2'b00;
    lhs_6_reg_666[33:32] <= 2'b00;
end

endmodule //add_sub_mm
