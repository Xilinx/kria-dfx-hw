// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_Axi2AxiStream_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
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
        m_axi_gmem1_RFIFONUM,
        m_axi_gmem1_RUSER,
        m_axi_gmem1_RRESP,
        m_axi_gmem1_BVALID,
        m_axi_gmem1_BREADY,
        m_axi_gmem1_BRESP,
        m_axi_gmem1_BID,
        m_axi_gmem1_BUSER,
        din,
        ldata_din,
        ldata_num_data_valid,
        ldata_fifo_cap,
        ldata_full_n,
        ldata_write,
        p_read,
        p_read1,
        p_read2,
        stride
);

parameter    ap_ST_fsm_state1 = 80'd1;
parameter    ap_ST_fsm_state2 = 80'd2;
parameter    ap_ST_fsm_state3 = 80'd4;
parameter    ap_ST_fsm_state4 = 80'd8;
parameter    ap_ST_fsm_state5 = 80'd16;
parameter    ap_ST_fsm_state6 = 80'd32;
parameter    ap_ST_fsm_state7 = 80'd64;
parameter    ap_ST_fsm_state8 = 80'd128;
parameter    ap_ST_fsm_state9 = 80'd256;
parameter    ap_ST_fsm_state10 = 80'd512;
parameter    ap_ST_fsm_state11 = 80'd1024;
parameter    ap_ST_fsm_state12 = 80'd2048;
parameter    ap_ST_fsm_state13 = 80'd4096;
parameter    ap_ST_fsm_state14 = 80'd8192;
parameter    ap_ST_fsm_state15 = 80'd16384;
parameter    ap_ST_fsm_state16 = 80'd32768;
parameter    ap_ST_fsm_state17 = 80'd65536;
parameter    ap_ST_fsm_state18 = 80'd131072;
parameter    ap_ST_fsm_state19 = 80'd262144;
parameter    ap_ST_fsm_state20 = 80'd524288;
parameter    ap_ST_fsm_state21 = 80'd1048576;
parameter    ap_ST_fsm_state22 = 80'd2097152;
parameter    ap_ST_fsm_state23 = 80'd4194304;
parameter    ap_ST_fsm_state24 = 80'd8388608;
parameter    ap_ST_fsm_state25 = 80'd16777216;
parameter    ap_ST_fsm_state26 = 80'd33554432;
parameter    ap_ST_fsm_state27 = 80'd67108864;
parameter    ap_ST_fsm_state28 = 80'd134217728;
parameter    ap_ST_fsm_state29 = 80'd268435456;
parameter    ap_ST_fsm_state30 = 80'd536870912;
parameter    ap_ST_fsm_state31 = 80'd1073741824;
parameter    ap_ST_fsm_state32 = 80'd2147483648;
parameter    ap_ST_fsm_state33 = 80'd4294967296;
parameter    ap_ST_fsm_state34 = 80'd8589934592;
parameter    ap_ST_fsm_state35 = 80'd17179869184;
parameter    ap_ST_fsm_state36 = 80'd34359738368;
parameter    ap_ST_fsm_state37 = 80'd68719476736;
parameter    ap_ST_fsm_state38 = 80'd137438953472;
parameter    ap_ST_fsm_state39 = 80'd274877906944;
parameter    ap_ST_fsm_state40 = 80'd549755813888;
parameter    ap_ST_fsm_state41 = 80'd1099511627776;
parameter    ap_ST_fsm_state42 = 80'd2199023255552;
parameter    ap_ST_fsm_state43 = 80'd4398046511104;
parameter    ap_ST_fsm_state44 = 80'd8796093022208;
parameter    ap_ST_fsm_state45 = 80'd17592186044416;
parameter    ap_ST_fsm_state46 = 80'd35184372088832;
parameter    ap_ST_fsm_state47 = 80'd70368744177664;
parameter    ap_ST_fsm_state48 = 80'd140737488355328;
parameter    ap_ST_fsm_state49 = 80'd281474976710656;
parameter    ap_ST_fsm_state50 = 80'd562949953421312;
parameter    ap_ST_fsm_state51 = 80'd1125899906842624;
parameter    ap_ST_fsm_state52 = 80'd2251799813685248;
parameter    ap_ST_fsm_state53 = 80'd4503599627370496;
parameter    ap_ST_fsm_state54 = 80'd9007199254740992;
parameter    ap_ST_fsm_state55 = 80'd18014398509481984;
parameter    ap_ST_fsm_state56 = 80'd36028797018963968;
parameter    ap_ST_fsm_state57 = 80'd72057594037927936;
parameter    ap_ST_fsm_state58 = 80'd144115188075855872;
parameter    ap_ST_fsm_state59 = 80'd288230376151711744;
parameter    ap_ST_fsm_state60 = 80'd576460752303423488;
parameter    ap_ST_fsm_state61 = 80'd1152921504606846976;
parameter    ap_ST_fsm_state62 = 80'd2305843009213693952;
parameter    ap_ST_fsm_state63 = 80'd4611686018427387904;
parameter    ap_ST_fsm_state64 = 80'd9223372036854775808;
parameter    ap_ST_fsm_state65 = 80'd18446744073709551616;
parameter    ap_ST_fsm_state66 = 80'd36893488147419103232;
parameter    ap_ST_fsm_state67 = 80'd73786976294838206464;
parameter    ap_ST_fsm_state68 = 80'd147573952589676412928;
parameter    ap_ST_fsm_state69 = 80'd295147905179352825856;
parameter    ap_ST_fsm_state70 = 80'd590295810358705651712;
parameter    ap_ST_fsm_state71 = 80'd1180591620717411303424;
parameter    ap_ST_fsm_state72 = 80'd2361183241434822606848;
parameter    ap_ST_fsm_state73 = 80'd4722366482869645213696;
parameter    ap_ST_fsm_state74 = 80'd9444732965739290427392;
parameter    ap_ST_fsm_state75 = 80'd18889465931478580854784;
parameter    ap_ST_fsm_state76 = 80'd37778931862957161709568;
parameter    ap_ST_fsm_state77 = 80'd75557863725914323419136;
parameter    ap_ST_fsm_state78 = 80'd151115727451828646838272;
parameter    ap_ST_fsm_state79 = 80'd302231454903657293676544;
parameter    ap_ST_fsm_state80 = 80'd604462909807314587353088;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem1_AWVALID;
input   m_axi_gmem1_AWREADY;
output  [63:0] m_axi_gmem1_AWADDR;
output  [0:0] m_axi_gmem1_AWID;
output  [31:0] m_axi_gmem1_AWLEN;
output  [2:0] m_axi_gmem1_AWSIZE;
output  [1:0] m_axi_gmem1_AWBURST;
output  [1:0] m_axi_gmem1_AWLOCK;
output  [3:0] m_axi_gmem1_AWCACHE;
output  [2:0] m_axi_gmem1_AWPROT;
output  [3:0] m_axi_gmem1_AWQOS;
output  [3:0] m_axi_gmem1_AWREGION;
output  [0:0] m_axi_gmem1_AWUSER;
output   m_axi_gmem1_WVALID;
input   m_axi_gmem1_WREADY;
output  [63:0] m_axi_gmem1_WDATA;
output  [7:0] m_axi_gmem1_WSTRB;
output   m_axi_gmem1_WLAST;
output  [0:0] m_axi_gmem1_WID;
output  [0:0] m_axi_gmem1_WUSER;
output   m_axi_gmem1_ARVALID;
input   m_axi_gmem1_ARREADY;
output  [63:0] m_axi_gmem1_ARADDR;
output  [0:0] m_axi_gmem1_ARID;
output  [31:0] m_axi_gmem1_ARLEN;
output  [2:0] m_axi_gmem1_ARSIZE;
output  [1:0] m_axi_gmem1_ARBURST;
output  [1:0] m_axi_gmem1_ARLOCK;
output  [3:0] m_axi_gmem1_ARCACHE;
output  [2:0] m_axi_gmem1_ARPROT;
output  [3:0] m_axi_gmem1_ARQOS;
output  [3:0] m_axi_gmem1_ARREGION;
output  [0:0] m_axi_gmem1_ARUSER;
input   m_axi_gmem1_RVALID;
output   m_axi_gmem1_RREADY;
input  [63:0] m_axi_gmem1_RDATA;
input   m_axi_gmem1_RLAST;
input  [0:0] m_axi_gmem1_RID;
input  [8:0] m_axi_gmem1_RFIFONUM;
input  [0:0] m_axi_gmem1_RUSER;
input  [1:0] m_axi_gmem1_RRESP;
input   m_axi_gmem1_BVALID;
output   m_axi_gmem1_BREADY;
input  [1:0] m_axi_gmem1_BRESP;
input  [0:0] m_axi_gmem1_BID;
input  [0:0] m_axi_gmem1_BUSER;
input  [63:0] din;
output  [63:0] ldata_din;
input  [1:0] ldata_num_data_valid;
input  [1:0] ldata_fifo_cap;
input   ldata_full_n;
output   ldata_write;
input  [15:0] p_read;
input  [31:0] p_read1;
input  [15:0] p_read2;
input  [31:0] stride;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_gmem1_ARVALID;
reg[63:0] m_axi_gmem1_ARADDR;
reg[0:0] m_axi_gmem1_ARID;
reg[31:0] m_axi_gmem1_ARLEN;
reg[2:0] m_axi_gmem1_ARSIZE;
reg[1:0] m_axi_gmem1_ARBURST;
reg[1:0] m_axi_gmem1_ARLOCK;
reg[3:0] m_axi_gmem1_ARCACHE;
reg[2:0] m_axi_gmem1_ARPROT;
reg[3:0] m_axi_gmem1_ARQOS;
reg[3:0] m_axi_gmem1_ARREGION;
reg[0:0] m_axi_gmem1_ARUSER;
reg m_axi_gmem1_RREADY;
reg ldata_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [79:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    gmem1_blk_n_AR;
wire    ap_CS_fsm_state9;
wire   [15:0] cols_int16_fu_152_p1;
reg   [15:0] cols_int16_reg_347;
wire   [0:0] icmp_ln1021_fu_156_p2;
reg   [0:0] icmp_ln1021_reg_352;
wire   [31:0] zext_ln232_fu_167_p1;
wire    ap_CS_fsm_state2;
wire   [23:0] trunc_ln1540_fu_176_p1;
reg   [23:0] trunc_ln1540_reg_373;
wire    ap_CS_fsm_state4;
wire   [23:0] trunc_ln1540_2_fu_179_p1;
reg   [23:0] trunc_ln1540_2_reg_378;
wire    ap_CS_fsm_state5;
wire   [20:0] cols_addrbound_fu_195_p4;
reg   [20:0] cols_addrbound_reg_393;
wire   [0:0] cmp_i82_i_fu_235_p2;
reg   [0:0] cmp_i82_i_reg_398;
wire   [51:0] zext_ln1028_fu_241_p1;
reg   [51:0] zext_ln1028_reg_402;
wire   [31:0] zext_ln1028_1_fu_245_p1;
reg   [31:0] zext_ln1028_1_reg_407;
wire   [30:0] r_2_fu_261_p2;
reg   [30:0] r_2_reg_415;
wire    ap_CS_fsm_state6;
wire   [0:0] icmp_ln1024_fu_256_p2;
wire   [51:0] grp_fu_271_p2;
reg   [51:0] empty_reg_425;
wire    ap_CS_fsm_state7;
reg   [60:0] trunc_ln_reg_430;
wire    ap_CS_fsm_state8;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_done;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_idle;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_ready;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWVALID;
wire   [63:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWADDR;
wire   [0:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWID;
wire   [31:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWLEN;
wire   [2:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWSIZE;
wire   [1:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWBURST;
wire   [1:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWLOCK;
wire   [3:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWCACHE;
wire   [2:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWPROT;
wire   [3:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWQOS;
wire   [3:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWREGION;
wire   [0:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWUSER;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WVALID;
wire   [63:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WDATA;
wire   [7:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WSTRB;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WLAST;
wire   [0:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WID;
wire   [0:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WUSER;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARVALID;
wire   [63:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARADDR;
wire   [0:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARID;
wire   [31:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLEN;
wire   [2:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARSIZE;
wire   [1:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARBURST;
wire   [1:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLOCK;
wire   [3:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARCACHE;
wire   [2:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARPROT;
wire   [3:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARQOS;
wire   [3:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARREGION;
wire   [0:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARUSER;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_RREADY;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_BREADY;
wire   [63:0] grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_din;
wire    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_write;
reg    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg;
wire    ap_CS_fsm_state79;
wire    ap_CS_fsm_state80;
wire  signed [63:0] sext_ln1028_fu_302_p1;
reg   [30:0] r_fu_102;
reg    ap_block_state80_on_subcall_done;
reg    ap_block_state1;
wire   [31:0] trunc_ln1540_fu_176_p0;
wire  signed [31:0] grp_fu_316_p2;
wire   [31:0] trunc_ln1540_2_fu_179_p0;
wire  signed [31:0] grp_fu_323_p2;
wire   [26:0] ret_V_fu_182_p3;
wire   [26:0] add_ln587_fu_189_p2;
wire   [26:0] ret_V_31_fu_205_p3;
wire   [26:0] add_ln587_1_fu_212_p2;
wire   [20:0] stride_addrbound_fu_218_p4;
wire   [20:0] addrbound_V_fu_228_p3;
wire   [31:0] zext_ln1024_fu_252_p1;
wire   [30:0] grp_fu_271_p0;
wire   [20:0] grp_fu_271_p1;
wire   [54:0] tmp_s_fu_276_p3;
wire   [63:0] p_cast1_i_fu_283_p1;
wire   [63:0] empty_226_fu_287_p2;
wire   [15:0] grp_fu_316_p0;
wire   [15:0] grp_fu_316_p1;
wire   [15:0] grp_fu_323_p0;
wire   [15:0] grp_fu_323_p1;
reg   [79:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
reg    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_ST_fsm_state22_blk;
wire    ap_ST_fsm_state23_blk;
wire    ap_ST_fsm_state24_blk;
wire    ap_ST_fsm_state25_blk;
wire    ap_ST_fsm_state26_blk;
wire    ap_ST_fsm_state27_blk;
wire    ap_ST_fsm_state28_blk;
wire    ap_ST_fsm_state29_blk;
wire    ap_ST_fsm_state30_blk;
wire    ap_ST_fsm_state31_blk;
wire    ap_ST_fsm_state32_blk;
wire    ap_ST_fsm_state33_blk;
wire    ap_ST_fsm_state34_blk;
wire    ap_ST_fsm_state35_blk;
wire    ap_ST_fsm_state36_blk;
wire    ap_ST_fsm_state37_blk;
wire    ap_ST_fsm_state38_blk;
wire    ap_ST_fsm_state39_blk;
wire    ap_ST_fsm_state40_blk;
wire    ap_ST_fsm_state41_blk;
wire    ap_ST_fsm_state42_blk;
wire    ap_ST_fsm_state43_blk;
wire    ap_ST_fsm_state44_blk;
wire    ap_ST_fsm_state45_blk;
wire    ap_ST_fsm_state46_blk;
wire    ap_ST_fsm_state47_blk;
wire    ap_ST_fsm_state48_blk;
wire    ap_ST_fsm_state49_blk;
wire    ap_ST_fsm_state50_blk;
wire    ap_ST_fsm_state51_blk;
wire    ap_ST_fsm_state52_blk;
wire    ap_ST_fsm_state53_blk;
wire    ap_ST_fsm_state54_blk;
wire    ap_ST_fsm_state55_blk;
wire    ap_ST_fsm_state56_blk;
wire    ap_ST_fsm_state57_blk;
wire    ap_ST_fsm_state58_blk;
wire    ap_ST_fsm_state59_blk;
wire    ap_ST_fsm_state60_blk;
wire    ap_ST_fsm_state61_blk;
wire    ap_ST_fsm_state62_blk;
wire    ap_ST_fsm_state63_blk;
wire    ap_ST_fsm_state64_blk;
wire    ap_ST_fsm_state65_blk;
wire    ap_ST_fsm_state66_blk;
wire    ap_ST_fsm_state67_blk;
wire    ap_ST_fsm_state68_blk;
wire    ap_ST_fsm_state69_blk;
wire    ap_ST_fsm_state70_blk;
wire    ap_ST_fsm_state71_blk;
wire    ap_ST_fsm_state72_blk;
wire    ap_ST_fsm_state73_blk;
wire    ap_ST_fsm_state74_blk;
wire    ap_ST_fsm_state75_blk;
wire    ap_ST_fsm_state76_blk;
wire    ap_ST_fsm_state77_blk;
wire    ap_ST_fsm_state78_blk;
wire    ap_ST_fsm_state79_blk;
reg    ap_ST_fsm_state80_blk;
wire   [51:0] grp_fu_271_p00;
wire   [31:0] grp_fu_316_p00;
wire   [31:0] grp_fu_323_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 80'd1;
#0 grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg = 1'b0;
end

pp_pipeline_accel_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1 grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start),
    .ap_done(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_done),
    .ap_idle(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_idle),
    .ap_ready(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_ready),
    .m_axi_gmem1_AWVALID(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWVALID),
    .m_axi_gmem1_AWREADY(1'b0),
    .m_axi_gmem1_AWADDR(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWADDR),
    .m_axi_gmem1_AWID(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWID),
    .m_axi_gmem1_AWLEN(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWLEN),
    .m_axi_gmem1_AWSIZE(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWSIZE),
    .m_axi_gmem1_AWBURST(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWBURST),
    .m_axi_gmem1_AWLOCK(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWLOCK),
    .m_axi_gmem1_AWCACHE(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWCACHE),
    .m_axi_gmem1_AWPROT(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWPROT),
    .m_axi_gmem1_AWQOS(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWQOS),
    .m_axi_gmem1_AWREGION(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWREGION),
    .m_axi_gmem1_AWUSER(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWUSER),
    .m_axi_gmem1_WVALID(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WVALID),
    .m_axi_gmem1_WREADY(1'b0),
    .m_axi_gmem1_WDATA(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WDATA),
    .m_axi_gmem1_WSTRB(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WSTRB),
    .m_axi_gmem1_WLAST(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WLAST),
    .m_axi_gmem1_WID(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WID),
    .m_axi_gmem1_WUSER(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WUSER),
    .m_axi_gmem1_ARVALID(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARVALID),
    .m_axi_gmem1_ARREADY(m_axi_gmem1_ARREADY),
    .m_axi_gmem1_ARADDR(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARADDR),
    .m_axi_gmem1_ARID(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARID),
    .m_axi_gmem1_ARLEN(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLEN),
    .m_axi_gmem1_ARSIZE(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARSIZE),
    .m_axi_gmem1_ARBURST(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARBURST),
    .m_axi_gmem1_ARLOCK(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLOCK),
    .m_axi_gmem1_ARCACHE(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARCACHE),
    .m_axi_gmem1_ARPROT(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARPROT),
    .m_axi_gmem1_ARQOS(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARQOS),
    .m_axi_gmem1_ARREGION(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARREGION),
    .m_axi_gmem1_ARUSER(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARUSER),
    .m_axi_gmem1_RVALID(m_axi_gmem1_RVALID),
    .m_axi_gmem1_RREADY(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_RREADY),
    .m_axi_gmem1_RDATA(m_axi_gmem1_RDATA),
    .m_axi_gmem1_RLAST(m_axi_gmem1_RLAST),
    .m_axi_gmem1_RID(m_axi_gmem1_RID),
    .m_axi_gmem1_RFIFONUM(m_axi_gmem1_RFIFONUM),
    .m_axi_gmem1_RUSER(m_axi_gmem1_RUSER),
    .m_axi_gmem1_RRESP(m_axi_gmem1_RRESP),
    .m_axi_gmem1_BVALID(1'b0),
    .m_axi_gmem1_BREADY(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_BREADY),
    .m_axi_gmem1_BRESP(2'd0),
    .m_axi_gmem1_BID(1'd0),
    .m_axi_gmem1_BUSER(1'd0),
    .ldata_din(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_din),
    .ldata_num_data_valid(2'd0),
    .ldata_fifo_cap(2'd0),
    .ldata_full_n(ldata_full_n),
    .ldata_write(grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_write),
    .sext_ln1028(trunc_ln_reg_430),
    .cols_addrbound(cols_addrbound_reg_393)
);

pp_pipeline_accel_mul_31ns_21ns_52_2_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 31 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 52 ))
mul_31ns_21ns_52_2_1_U18(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_271_p0),
    .din1(grp_fu_271_p1),
    .ce(1'b1),
    .dout(grp_fu_271_p2)
);

pp_pipeline_accel_mul_mul_16ns_16ns_32_3_1 #(
    .ID( 1 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_mul_16ns_16ns_32_3_1_U19(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_316_p0),
    .din1(grp_fu_316_p1),
    .ce(1'b1),
    .dout(grp_fu_316_p2)
);

pp_pipeline_accel_mul_mul_16ns_16ns_32_3_1 #(
    .ID( 1 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_mul_16ns_16ns_32_3_1_U20(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_323_p0),
    .din1(grp_fu_323_p1),
    .ce(1'b1),
    .dout(grp_fu_323_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((icmp_ln1024_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state79)) begin
            grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg <= 1'b1;
        end else if ((grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_ready == 1'b1)) begin
            grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        r_fu_102 <= 31'd0;
    end else if (((1'b0 == ap_block_state80_on_subcall_done) & (1'b1 == ap_CS_fsm_state80))) begin
        r_fu_102 <= r_2_reg_415;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        cmp_i82_i_reg_398 <= cmp_i82_i_fu_235_p2;
        cols_addrbound_reg_393 <= {{add_ln587_fu_189_p2[26:6]}};
        zext_ln1028_1_reg_407[20 : 0] <= zext_ln1028_1_fu_245_p1[20 : 0];
        zext_ln1028_reg_402[20 : 0] <= zext_ln1028_fu_241_p1[20 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        cols_int16_reg_347 <= cols_int16_fu_152_p1;
        icmp_ln1021_reg_352 <= icmp_ln1021_fu_156_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        empty_reg_425 <= grp_fu_271_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        r_2_reg_415 <= r_2_fu_261_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln1021_reg_352 == 1'd0))) begin
        trunc_ln1540_2_reg_378 <= trunc_ln1540_2_fu_179_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        trunc_ln1540_reg_373 <= trunc_ln1540_fu_176_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        trunc_ln_reg_430 <= {{empty_226_fu_287_p2[63:3]}};
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

assign ap_ST_fsm_state21_blk = 1'b0;

assign ap_ST_fsm_state22_blk = 1'b0;

assign ap_ST_fsm_state23_blk = 1'b0;

assign ap_ST_fsm_state24_blk = 1'b0;

assign ap_ST_fsm_state25_blk = 1'b0;

assign ap_ST_fsm_state26_blk = 1'b0;

assign ap_ST_fsm_state27_blk = 1'b0;

assign ap_ST_fsm_state28_blk = 1'b0;

assign ap_ST_fsm_state29_blk = 1'b0;

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state30_blk = 1'b0;

assign ap_ST_fsm_state31_blk = 1'b0;

assign ap_ST_fsm_state32_blk = 1'b0;

assign ap_ST_fsm_state33_blk = 1'b0;

assign ap_ST_fsm_state34_blk = 1'b0;

assign ap_ST_fsm_state35_blk = 1'b0;

assign ap_ST_fsm_state36_blk = 1'b0;

assign ap_ST_fsm_state37_blk = 1'b0;

assign ap_ST_fsm_state38_blk = 1'b0;

assign ap_ST_fsm_state39_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state40_blk = 1'b0;

assign ap_ST_fsm_state41_blk = 1'b0;

assign ap_ST_fsm_state42_blk = 1'b0;

assign ap_ST_fsm_state43_blk = 1'b0;

assign ap_ST_fsm_state44_blk = 1'b0;

assign ap_ST_fsm_state45_blk = 1'b0;

assign ap_ST_fsm_state46_blk = 1'b0;

assign ap_ST_fsm_state47_blk = 1'b0;

assign ap_ST_fsm_state48_blk = 1'b0;

assign ap_ST_fsm_state49_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state50_blk = 1'b0;

assign ap_ST_fsm_state51_blk = 1'b0;

assign ap_ST_fsm_state52_blk = 1'b0;

assign ap_ST_fsm_state53_blk = 1'b0;

assign ap_ST_fsm_state54_blk = 1'b0;

assign ap_ST_fsm_state55_blk = 1'b0;

assign ap_ST_fsm_state56_blk = 1'b0;

assign ap_ST_fsm_state57_blk = 1'b0;

assign ap_ST_fsm_state58_blk = 1'b0;

assign ap_ST_fsm_state59_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state60_blk = 1'b0;

assign ap_ST_fsm_state61_blk = 1'b0;

assign ap_ST_fsm_state62_blk = 1'b0;

assign ap_ST_fsm_state63_blk = 1'b0;

assign ap_ST_fsm_state64_blk = 1'b0;

assign ap_ST_fsm_state65_blk = 1'b0;

assign ap_ST_fsm_state66_blk = 1'b0;

assign ap_ST_fsm_state67_blk = 1'b0;

assign ap_ST_fsm_state68_blk = 1'b0;

assign ap_ST_fsm_state69_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state70_blk = 1'b0;

assign ap_ST_fsm_state71_blk = 1'b0;

assign ap_ST_fsm_state72_blk = 1'b0;

assign ap_ST_fsm_state73_blk = 1'b0;

assign ap_ST_fsm_state74_blk = 1'b0;

assign ap_ST_fsm_state75_blk = 1'b0;

assign ap_ST_fsm_state76_blk = 1'b0;

assign ap_ST_fsm_state77_blk = 1'b0;

assign ap_ST_fsm_state78_blk = 1'b0;

assign ap_ST_fsm_state79_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state80_on_subcall_done)) begin
        ap_ST_fsm_state80_blk = 1'b1;
    end else begin
        ap_ST_fsm_state80_blk = 1'b0;
    end
end

assign ap_ST_fsm_state8_blk = 1'b0;

always @ (*) begin
    if ((m_axi_gmem1_ARREADY == 1'b0)) begin
        ap_ST_fsm_state9_blk = 1'b1;
    end else begin
        ap_ST_fsm_state9_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1024_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if (((icmp_ln1024_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        gmem1_blk_n_AR = m_axi_gmem1_ARREADY;
    end else begin
        gmem1_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80))) begin
        ldata_write = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_write;
    end else begin
        ldata_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state9) & (m_axi_gmem1_ARREADY == 1'b1))) begin
        m_axi_gmem1_ARADDR = sext_ln1028_fu_302_p1;
    end else if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARADDR = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARADDR;
    end else begin
        m_axi_gmem1_ARADDR = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARBURST = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARBURST;
    end else begin
        m_axi_gmem1_ARBURST = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARCACHE = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARCACHE;
    end else begin
        m_axi_gmem1_ARCACHE = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARID = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARID;
    end else begin
        m_axi_gmem1_ARID = 1'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state9) & (m_axi_gmem1_ARREADY == 1'b1))) begin
        m_axi_gmem1_ARLEN = zext_ln1028_1_reg_407;
    end else if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARLEN = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLEN;
    end else begin
        m_axi_gmem1_ARLEN = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARLOCK = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLOCK;
    end else begin
        m_axi_gmem1_ARLOCK = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARPROT = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARPROT;
    end else begin
        m_axi_gmem1_ARPROT = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARQOS = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARQOS;
    end else begin
        m_axi_gmem1_ARQOS = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARREGION = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARREGION;
    end else begin
        m_axi_gmem1_ARREGION = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARSIZE = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARSIZE;
    end else begin
        m_axi_gmem1_ARSIZE = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARUSER = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARUSER;
    end else begin
        m_axi_gmem1_ARUSER = 1'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state9) & (m_axi_gmem1_ARREADY == 1'b1))) begin
        m_axi_gmem1_ARVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_ARVALID = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARVALID;
    end else begin
        m_axi_gmem1_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state79) | ((cmp_i82_i_reg_398 == 1'd0) & (1'b1 == ap_CS_fsm_state80)))) begin
        m_axi_gmem1_RREADY = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_RREADY;
    end else begin
        m_axi_gmem1_RREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((icmp_ln1024_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if (((cmp_i82_i_reg_398 == 1'd1) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state80;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((1'b1 == ap_CS_fsm_state9) & (m_axi_gmem1_ARREADY == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state35;
        end
        ap_ST_fsm_state35 : begin
            ap_NS_fsm = ap_ST_fsm_state36;
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            ap_NS_fsm = ap_ST_fsm_state38;
        end
        ap_ST_fsm_state38 : begin
            ap_NS_fsm = ap_ST_fsm_state39;
        end
        ap_ST_fsm_state39 : begin
            ap_NS_fsm = ap_ST_fsm_state40;
        end
        ap_ST_fsm_state40 : begin
            ap_NS_fsm = ap_ST_fsm_state41;
        end
        ap_ST_fsm_state41 : begin
            ap_NS_fsm = ap_ST_fsm_state42;
        end
        ap_ST_fsm_state42 : begin
            ap_NS_fsm = ap_ST_fsm_state43;
        end
        ap_ST_fsm_state43 : begin
            ap_NS_fsm = ap_ST_fsm_state44;
        end
        ap_ST_fsm_state44 : begin
            ap_NS_fsm = ap_ST_fsm_state45;
        end
        ap_ST_fsm_state45 : begin
            ap_NS_fsm = ap_ST_fsm_state46;
        end
        ap_ST_fsm_state46 : begin
            ap_NS_fsm = ap_ST_fsm_state47;
        end
        ap_ST_fsm_state47 : begin
            ap_NS_fsm = ap_ST_fsm_state48;
        end
        ap_ST_fsm_state48 : begin
            ap_NS_fsm = ap_ST_fsm_state49;
        end
        ap_ST_fsm_state49 : begin
            ap_NS_fsm = ap_ST_fsm_state50;
        end
        ap_ST_fsm_state50 : begin
            ap_NS_fsm = ap_ST_fsm_state51;
        end
        ap_ST_fsm_state51 : begin
            ap_NS_fsm = ap_ST_fsm_state52;
        end
        ap_ST_fsm_state52 : begin
            ap_NS_fsm = ap_ST_fsm_state53;
        end
        ap_ST_fsm_state53 : begin
            ap_NS_fsm = ap_ST_fsm_state54;
        end
        ap_ST_fsm_state54 : begin
            ap_NS_fsm = ap_ST_fsm_state55;
        end
        ap_ST_fsm_state55 : begin
            ap_NS_fsm = ap_ST_fsm_state56;
        end
        ap_ST_fsm_state56 : begin
            ap_NS_fsm = ap_ST_fsm_state57;
        end
        ap_ST_fsm_state57 : begin
            ap_NS_fsm = ap_ST_fsm_state58;
        end
        ap_ST_fsm_state58 : begin
            ap_NS_fsm = ap_ST_fsm_state59;
        end
        ap_ST_fsm_state59 : begin
            ap_NS_fsm = ap_ST_fsm_state60;
        end
        ap_ST_fsm_state60 : begin
            ap_NS_fsm = ap_ST_fsm_state61;
        end
        ap_ST_fsm_state61 : begin
            ap_NS_fsm = ap_ST_fsm_state62;
        end
        ap_ST_fsm_state62 : begin
            ap_NS_fsm = ap_ST_fsm_state63;
        end
        ap_ST_fsm_state63 : begin
            ap_NS_fsm = ap_ST_fsm_state64;
        end
        ap_ST_fsm_state64 : begin
            ap_NS_fsm = ap_ST_fsm_state65;
        end
        ap_ST_fsm_state65 : begin
            ap_NS_fsm = ap_ST_fsm_state66;
        end
        ap_ST_fsm_state66 : begin
            ap_NS_fsm = ap_ST_fsm_state67;
        end
        ap_ST_fsm_state67 : begin
            ap_NS_fsm = ap_ST_fsm_state68;
        end
        ap_ST_fsm_state68 : begin
            ap_NS_fsm = ap_ST_fsm_state69;
        end
        ap_ST_fsm_state69 : begin
            ap_NS_fsm = ap_ST_fsm_state70;
        end
        ap_ST_fsm_state70 : begin
            ap_NS_fsm = ap_ST_fsm_state71;
        end
        ap_ST_fsm_state71 : begin
            ap_NS_fsm = ap_ST_fsm_state72;
        end
        ap_ST_fsm_state72 : begin
            ap_NS_fsm = ap_ST_fsm_state73;
        end
        ap_ST_fsm_state73 : begin
            ap_NS_fsm = ap_ST_fsm_state74;
        end
        ap_ST_fsm_state74 : begin
            ap_NS_fsm = ap_ST_fsm_state75;
        end
        ap_ST_fsm_state75 : begin
            ap_NS_fsm = ap_ST_fsm_state76;
        end
        ap_ST_fsm_state76 : begin
            ap_NS_fsm = ap_ST_fsm_state77;
        end
        ap_ST_fsm_state77 : begin
            ap_NS_fsm = ap_ST_fsm_state78;
        end
        ap_ST_fsm_state78 : begin
            ap_NS_fsm = ap_ST_fsm_state79;
        end
        ap_ST_fsm_state79 : begin
            ap_NS_fsm = ap_ST_fsm_state80;
        end
        ap_ST_fsm_state80 : begin
            if (((1'b0 == ap_block_state80_on_subcall_done) & (1'b1 == ap_CS_fsm_state80))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state80;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln587_1_fu_212_p2 = (ret_V_31_fu_205_p3 + 27'd63);

assign add_ln587_fu_189_p2 = (ret_V_fu_182_p3 + 27'd63);

assign addrbound_V_fu_228_p3 = ((icmp_ln1021_reg_352[0:0] == 1'b1) ? cols_addrbound_fu_195_p4 : stride_addrbound_fu_218_p4);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state79 = ap_CS_fsm[32'd78];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state80 = ap_CS_fsm[32'd79];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state80_on_subcall_done = ((grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_done == 1'b0) & (cmp_i82_i_reg_398 == 1'd0));
end

assign cmp_i82_i_fu_235_p2 = ((cols_addrbound_fu_195_p4 == 21'd0) ? 1'b1 : 1'b0);

assign cols_addrbound_fu_195_p4 = {{add_ln587_fu_189_p2[26:6]}};

assign cols_int16_fu_152_p1 = stride[15:0];

assign empty_226_fu_287_p2 = (p_cast1_i_fu_283_p1 + din);

assign grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg;

assign grp_fu_271_p0 = grp_fu_271_p00;

assign grp_fu_271_p00 = r_fu_102;

assign grp_fu_271_p1 = zext_ln1028_reg_402;

assign grp_fu_316_p0 = grp_fu_316_p00;

assign grp_fu_316_p00 = p_read2;

assign grp_fu_316_p1 = zext_ln232_fu_167_p1;

assign grp_fu_323_p0 = grp_fu_323_p00;

assign grp_fu_323_p00 = cols_int16_reg_347;

assign grp_fu_323_p1 = zext_ln232_fu_167_p1;

assign icmp_ln1021_fu_156_p2 = ((stride == 32'd4294967295) ? 1'b1 : 1'b0);

assign icmp_ln1024_fu_256_p2 = (($signed(zext_ln1024_fu_252_p1) < $signed(p_read1)) ? 1'b1 : 1'b0);

assign ldata_din = grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_din;

assign m_axi_gmem1_AWADDR = 64'd0;

assign m_axi_gmem1_AWBURST = 2'd0;

assign m_axi_gmem1_AWCACHE = 4'd0;

assign m_axi_gmem1_AWID = 1'd0;

assign m_axi_gmem1_AWLEN = 32'd0;

assign m_axi_gmem1_AWLOCK = 2'd0;

assign m_axi_gmem1_AWPROT = 3'd0;

assign m_axi_gmem1_AWQOS = 4'd0;

assign m_axi_gmem1_AWREGION = 4'd0;

assign m_axi_gmem1_AWSIZE = 3'd0;

assign m_axi_gmem1_AWUSER = 1'd0;

assign m_axi_gmem1_AWVALID = 1'b0;

assign m_axi_gmem1_BREADY = 1'b0;

assign m_axi_gmem1_WDATA = 64'd0;

assign m_axi_gmem1_WID = 1'd0;

assign m_axi_gmem1_WLAST = 1'b0;

assign m_axi_gmem1_WSTRB = 8'd0;

assign m_axi_gmem1_WUSER = 1'd0;

assign m_axi_gmem1_WVALID = 1'b0;

assign p_cast1_i_fu_283_p1 = tmp_s_fu_276_p3;

assign r_2_fu_261_p2 = (r_fu_102 + 31'd1);

assign ret_V_31_fu_205_p3 = {{trunc_ln1540_2_reg_378}, {3'd0}};

assign ret_V_fu_182_p3 = {{trunc_ln1540_reg_373}, {3'd0}};

assign sext_ln1028_fu_302_p1 = $signed(trunc_ln_reg_430);

assign stride_addrbound_fu_218_p4 = {{add_ln587_1_fu_212_p2[26:6]}};

assign tmp_s_fu_276_p3 = {{empty_reg_425}, {3'd0}};

assign trunc_ln1540_2_fu_179_p0 = grp_fu_323_p2;

assign trunc_ln1540_2_fu_179_p1 = trunc_ln1540_2_fu_179_p0[23:0];

assign trunc_ln1540_fu_176_p0 = grp_fu_316_p2;

assign trunc_ln1540_fu_176_p1 = trunc_ln1540_fu_176_p0[23:0];

assign zext_ln1024_fu_252_p1 = r_fu_102;

assign zext_ln1028_1_fu_245_p1 = cols_addrbound_fu_195_p4;

assign zext_ln1028_fu_241_p1 = addrbound_V_fu_228_p3;

assign zext_ln232_fu_167_p1 = p_read;

always @ (posedge ap_clk) begin
    zext_ln1028_reg_402[51:21] <= 31'b0000000000000000000000000000000;
    zext_ln1028_1_reg_407[31:21] <= 11'b00000000000;
end

endmodule //pp_pipeline_accel_Axi2AxiStream_1
