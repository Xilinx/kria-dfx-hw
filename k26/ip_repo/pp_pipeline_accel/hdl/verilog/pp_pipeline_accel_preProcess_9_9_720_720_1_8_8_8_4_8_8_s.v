// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        in_mat_rows_dout,
        in_mat_rows_num_data_valid,
        in_mat_rows_fifo_cap,
        in_mat_rows_empty_n,
        in_mat_rows_read,
        in_mat_cols_dout,
        in_mat_cols_num_data_valid,
        in_mat_cols_fifo_cap,
        in_mat_cols_empty_n,
        in_mat_cols_read,
        resize_out_mat_data84_dout,
        resize_out_mat_data84_num_data_valid,
        resize_out_mat_data84_fifo_cap,
        resize_out_mat_data84_empty_n,
        resize_out_mat_data84_read,
        out_mat_data85_din,
        out_mat_data85_num_data_valid,
        out_mat_data85_fifo_cap,
        out_mat_data85_full_n,
        out_mat_data85_write,
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
        m_axi_gmem4_RFIFONUM,
        m_axi_gmem4_RUSER,
        m_axi_gmem4_RRESP,
        m_axi_gmem4_BVALID,
        m_axi_gmem4_BREADY,
        m_axi_gmem4_BRESP,
        m_axi_gmem4_BID,
        m_axi_gmem4_BUSER,
        params
);

parameter    ap_ST_fsm_state1 = 74'd1;
parameter    ap_ST_fsm_state2 = 74'd2;
parameter    ap_ST_fsm_state3 = 74'd4;
parameter    ap_ST_fsm_state4 = 74'd8;
parameter    ap_ST_fsm_state5 = 74'd16;
parameter    ap_ST_fsm_state6 = 74'd32;
parameter    ap_ST_fsm_state7 = 74'd64;
parameter    ap_ST_fsm_state8 = 74'd128;
parameter    ap_ST_fsm_state9 = 74'd256;
parameter    ap_ST_fsm_state10 = 74'd512;
parameter    ap_ST_fsm_state11 = 74'd1024;
parameter    ap_ST_fsm_state12 = 74'd2048;
parameter    ap_ST_fsm_state13 = 74'd4096;
parameter    ap_ST_fsm_state14 = 74'd8192;
parameter    ap_ST_fsm_state15 = 74'd16384;
parameter    ap_ST_fsm_state16 = 74'd32768;
parameter    ap_ST_fsm_state17 = 74'd65536;
parameter    ap_ST_fsm_state18 = 74'd131072;
parameter    ap_ST_fsm_state19 = 74'd262144;
parameter    ap_ST_fsm_state20 = 74'd524288;
parameter    ap_ST_fsm_state21 = 74'd1048576;
parameter    ap_ST_fsm_state22 = 74'd2097152;
parameter    ap_ST_fsm_state23 = 74'd4194304;
parameter    ap_ST_fsm_state24 = 74'd8388608;
parameter    ap_ST_fsm_state25 = 74'd16777216;
parameter    ap_ST_fsm_state26 = 74'd33554432;
parameter    ap_ST_fsm_state27 = 74'd67108864;
parameter    ap_ST_fsm_state28 = 74'd134217728;
parameter    ap_ST_fsm_state29 = 74'd268435456;
parameter    ap_ST_fsm_state30 = 74'd536870912;
parameter    ap_ST_fsm_state31 = 74'd1073741824;
parameter    ap_ST_fsm_state32 = 74'd2147483648;
parameter    ap_ST_fsm_state33 = 74'd4294967296;
parameter    ap_ST_fsm_state34 = 74'd8589934592;
parameter    ap_ST_fsm_state35 = 74'd17179869184;
parameter    ap_ST_fsm_state36 = 74'd34359738368;
parameter    ap_ST_fsm_state37 = 74'd68719476736;
parameter    ap_ST_fsm_state38 = 74'd137438953472;
parameter    ap_ST_fsm_state39 = 74'd274877906944;
parameter    ap_ST_fsm_state40 = 74'd549755813888;
parameter    ap_ST_fsm_state41 = 74'd1099511627776;
parameter    ap_ST_fsm_state42 = 74'd2199023255552;
parameter    ap_ST_fsm_state43 = 74'd4398046511104;
parameter    ap_ST_fsm_state44 = 74'd8796093022208;
parameter    ap_ST_fsm_state45 = 74'd17592186044416;
parameter    ap_ST_fsm_state46 = 74'd35184372088832;
parameter    ap_ST_fsm_state47 = 74'd70368744177664;
parameter    ap_ST_fsm_state48 = 74'd140737488355328;
parameter    ap_ST_fsm_state49 = 74'd281474976710656;
parameter    ap_ST_fsm_state50 = 74'd562949953421312;
parameter    ap_ST_fsm_state51 = 74'd1125899906842624;
parameter    ap_ST_fsm_state52 = 74'd2251799813685248;
parameter    ap_ST_fsm_state53 = 74'd4503599627370496;
parameter    ap_ST_fsm_state54 = 74'd9007199254740992;
parameter    ap_ST_fsm_state55 = 74'd18014398509481984;
parameter    ap_ST_fsm_state56 = 74'd36028797018963968;
parameter    ap_ST_fsm_state57 = 74'd72057594037927936;
parameter    ap_ST_fsm_state58 = 74'd144115188075855872;
parameter    ap_ST_fsm_state59 = 74'd288230376151711744;
parameter    ap_ST_fsm_state60 = 74'd576460752303423488;
parameter    ap_ST_fsm_state61 = 74'd1152921504606846976;
parameter    ap_ST_fsm_state62 = 74'd2305843009213693952;
parameter    ap_ST_fsm_state63 = 74'd4611686018427387904;
parameter    ap_ST_fsm_state64 = 74'd9223372036854775808;
parameter    ap_ST_fsm_state65 = 74'd18446744073709551616;
parameter    ap_ST_fsm_state66 = 74'd36893488147419103232;
parameter    ap_ST_fsm_state67 = 74'd73786976294838206464;
parameter    ap_ST_fsm_state68 = 74'd147573952589676412928;
parameter    ap_ST_fsm_state69 = 74'd295147905179352825856;
parameter    ap_ST_fsm_state70 = 74'd590295810358705651712;
parameter    ap_ST_fsm_state71 = 74'd1180591620717411303424;
parameter    ap_ST_fsm_state72 = 74'd2361183241434822606848;
parameter    ap_ST_fsm_state73 = 74'd4722366482869645213696;
parameter    ap_ST_fsm_state74 = 74'd9444732965739290427392;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] in_mat_rows_dout;
input  [1:0] in_mat_rows_num_data_valid;
input  [1:0] in_mat_rows_fifo_cap;
input   in_mat_rows_empty_n;
output   in_mat_rows_read;
input  [31:0] in_mat_cols_dout;
input  [1:0] in_mat_cols_num_data_valid;
input  [1:0] in_mat_cols_fifo_cap;
input   in_mat_cols_empty_n;
output   in_mat_cols_read;
input  [23:0] resize_out_mat_data84_dout;
input  [1:0] resize_out_mat_data84_num_data_valid;
input  [1:0] resize_out_mat_data84_fifo_cap;
input   resize_out_mat_data84_empty_n;
output   resize_out_mat_data84_read;
output  [23:0] out_mat_data85_din;
input  [1:0] out_mat_data85_num_data_valid;
input  [1:0] out_mat_data85_fifo_cap;
input   out_mat_data85_full_n;
output   out_mat_data85_write;
output   m_axi_gmem4_AWVALID;
input   m_axi_gmem4_AWREADY;
output  [63:0] m_axi_gmem4_AWADDR;
output  [0:0] m_axi_gmem4_AWID;
output  [31:0] m_axi_gmem4_AWLEN;
output  [2:0] m_axi_gmem4_AWSIZE;
output  [1:0] m_axi_gmem4_AWBURST;
output  [1:0] m_axi_gmem4_AWLOCK;
output  [3:0] m_axi_gmem4_AWCACHE;
output  [2:0] m_axi_gmem4_AWPROT;
output  [3:0] m_axi_gmem4_AWQOS;
output  [3:0] m_axi_gmem4_AWREGION;
output  [0:0] m_axi_gmem4_AWUSER;
output   m_axi_gmem4_WVALID;
input   m_axi_gmem4_WREADY;
output  [63:0] m_axi_gmem4_WDATA;
output  [7:0] m_axi_gmem4_WSTRB;
output   m_axi_gmem4_WLAST;
output  [0:0] m_axi_gmem4_WID;
output  [0:0] m_axi_gmem4_WUSER;
output   m_axi_gmem4_ARVALID;
input   m_axi_gmem4_ARREADY;
output  [63:0] m_axi_gmem4_ARADDR;
output  [0:0] m_axi_gmem4_ARID;
output  [31:0] m_axi_gmem4_ARLEN;
output  [2:0] m_axi_gmem4_ARSIZE;
output  [1:0] m_axi_gmem4_ARBURST;
output  [1:0] m_axi_gmem4_ARLOCK;
output  [3:0] m_axi_gmem4_ARCACHE;
output  [2:0] m_axi_gmem4_ARPROT;
output  [3:0] m_axi_gmem4_ARQOS;
output  [3:0] m_axi_gmem4_ARREGION;
output  [0:0] m_axi_gmem4_ARUSER;
input   m_axi_gmem4_RVALID;
output   m_axi_gmem4_RREADY;
input  [63:0] m_axi_gmem4_RDATA;
input   m_axi_gmem4_RLAST;
input  [0:0] m_axi_gmem4_RID;
input  [8:0] m_axi_gmem4_RFIFONUM;
input  [0:0] m_axi_gmem4_RUSER;
input  [1:0] m_axi_gmem4_RRESP;
input   m_axi_gmem4_BVALID;
output   m_axi_gmem4_BREADY;
input  [1:0] m_axi_gmem4_BRESP;
input  [0:0] m_axi_gmem4_BID;
input  [0:0] m_axi_gmem4_BUSER;
input  [63:0] params;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_mat_rows_read;
reg in_mat_cols_read;
reg resize_out_mat_data84_read;
reg out_mat_data85_write;
reg m_axi_gmem4_ARVALID;
reg[63:0] m_axi_gmem4_ARADDR;
reg[0:0] m_axi_gmem4_ARID;
reg[31:0] m_axi_gmem4_ARLEN;
reg[2:0] m_axi_gmem4_ARSIZE;
reg[1:0] m_axi_gmem4_ARBURST;
reg[1:0] m_axi_gmem4_ARLOCK;
reg[3:0] m_axi_gmem4_ARCACHE;
reg[2:0] m_axi_gmem4_ARPROT;
reg[3:0] m_axi_gmem4_ARQOS;
reg[3:0] m_axi_gmem4_ARREGION;
reg[0:0] m_axi_gmem4_ARUSER;
reg m_axi_gmem4_RREADY;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [73:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    in_mat_rows_blk_n;
wire    ap_CS_fsm_state69;
reg    in_mat_cols_blk_n;
reg    gmem4_blk_n_AR;
wire  signed [60:0] trunc_ln_fu_137_p4;
reg   [60:0] trunc_ln_reg_240;
wire  signed [31:0] grp_fu_198_p2;
reg   [31:0] loop_count_reg_260;
wire    ap_CS_fsm_state72;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_idle;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_ready;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWVALID;
wire   [63:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWADDR;
wire   [0:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWID;
wire   [31:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWLEN;
wire   [2:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWSIZE;
wire   [1:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWBURST;
wire   [1:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWLOCK;
wire   [3:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWCACHE;
wire   [2:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWPROT;
wire   [3:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWQOS;
wire   [3:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWREGION;
wire   [0:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWUSER;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WVALID;
wire   [63:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WDATA;
wire   [7:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WSTRB;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WLAST;
wire   [0:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WID;
wire   [0:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WUSER;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARVALID;
wire   [63:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARADDR;
wire   [0:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARID;
wire   [31:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLEN;
wire   [2:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARSIZE;
wire   [1:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARBURST;
wire   [1:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLOCK;
wire   [3:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARCACHE;
wire   [2:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARPROT;
wire   [3:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARQOS;
wire   [3:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARREGION;
wire   [0:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARUSER;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_RREADY;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_BREADY;
wire   [7:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out_ap_vld;
wire   [7:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out_ap_vld;
wire   [7:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out_ap_vld;
wire   [7:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out_ap_vld;
wire   [7:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out_ap_vld;
wire   [7:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out_ap_vld;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_idle;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_ready;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_resize_out_mat_data84_read;
wire   [23:0] grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_din;
wire    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_write;
reg    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg;
wire    ap_CS_fsm_state71;
reg    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg;
wire    ap_CS_fsm_state73;
wire    ap_CS_fsm_state74;
wire  signed [63:0] sext_ln115_fu_147_p1;
reg    ap_block_state1;
reg    ap_block_state69;
wire   [15:0] width_fu_158_p1;
wire   [15:0] height_fu_162_p1;
wire   [15:0] grp_fu_198_p0;
wire   [15:0] grp_fu_198_p1;
reg    grp_fu_198_ce;
wire    ap_CS_fsm_state70;
reg   [73:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
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
reg    ap_ST_fsm_state69_blk;
wire    ap_ST_fsm_state70_blk;
wire    ap_ST_fsm_state71_blk;
reg    ap_ST_fsm_state72_blk;
wire    ap_ST_fsm_state73_blk;
reg    ap_ST_fsm_state74_blk;
wire   [31:0] grp_fu_198_p00;
wire   [31:0] grp_fu_198_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 74'd1;
#0 grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg = 1'b0;
#0 grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg = 1'b0;
end

pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1 grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start),
    .ap_done(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done),
    .ap_idle(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_idle),
    .ap_ready(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_ready),
    .m_axi_gmem4_AWVALID(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWVALID),
    .m_axi_gmem4_AWREADY(1'b0),
    .m_axi_gmem4_AWADDR(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWADDR),
    .m_axi_gmem4_AWID(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWID),
    .m_axi_gmem4_AWLEN(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWLEN),
    .m_axi_gmem4_AWSIZE(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWSIZE),
    .m_axi_gmem4_AWBURST(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWBURST),
    .m_axi_gmem4_AWLOCK(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWLOCK),
    .m_axi_gmem4_AWCACHE(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWCACHE),
    .m_axi_gmem4_AWPROT(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWPROT),
    .m_axi_gmem4_AWQOS(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWQOS),
    .m_axi_gmem4_AWREGION(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWREGION),
    .m_axi_gmem4_AWUSER(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWUSER),
    .m_axi_gmem4_WVALID(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WVALID),
    .m_axi_gmem4_WREADY(1'b0),
    .m_axi_gmem4_WDATA(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WDATA),
    .m_axi_gmem4_WSTRB(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WSTRB),
    .m_axi_gmem4_WLAST(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WLAST),
    .m_axi_gmem4_WID(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WID),
    .m_axi_gmem4_WUSER(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WUSER),
    .m_axi_gmem4_ARVALID(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARVALID),
    .m_axi_gmem4_ARREADY(m_axi_gmem4_ARREADY),
    .m_axi_gmem4_ARADDR(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARADDR),
    .m_axi_gmem4_ARID(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARID),
    .m_axi_gmem4_ARLEN(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLEN),
    .m_axi_gmem4_ARSIZE(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARSIZE),
    .m_axi_gmem4_ARBURST(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARBURST),
    .m_axi_gmem4_ARLOCK(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLOCK),
    .m_axi_gmem4_ARCACHE(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARCACHE),
    .m_axi_gmem4_ARPROT(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARPROT),
    .m_axi_gmem4_ARQOS(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARQOS),
    .m_axi_gmem4_ARREGION(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARREGION),
    .m_axi_gmem4_ARUSER(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARUSER),
    .m_axi_gmem4_RVALID(m_axi_gmem4_RVALID),
    .m_axi_gmem4_RREADY(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_RREADY),
    .m_axi_gmem4_RDATA(m_axi_gmem4_RDATA),
    .m_axi_gmem4_RLAST(m_axi_gmem4_RLAST),
    .m_axi_gmem4_RID(m_axi_gmem4_RID),
    .m_axi_gmem4_RFIFONUM(m_axi_gmem4_RFIFONUM),
    .m_axi_gmem4_RUSER(m_axi_gmem4_RUSER),
    .m_axi_gmem4_RRESP(m_axi_gmem4_RRESP),
    .m_axi_gmem4_BVALID(1'b0),
    .m_axi_gmem4_BREADY(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_BREADY),
    .m_axi_gmem4_BRESP(2'd0),
    .m_axi_gmem4_BID(1'd0),
    .m_axi_gmem4_BUSER(1'd0),
    .sext_ln115(trunc_ln_reg_240),
    .beta_reg_V_2_out(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out),
    .beta_reg_V_2_out_ap_vld(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out_ap_vld),
    .beta_reg_V_1_out(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out),
    .beta_reg_V_1_out_ap_vld(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out_ap_vld),
    .beta_reg_V_out(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out),
    .beta_reg_V_out_ap_vld(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out_ap_vld),
    .alpha_reg_V_9_out(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out),
    .alpha_reg_V_9_out_ap_vld(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out_ap_vld),
    .alpha_reg_V_8_out(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out),
    .alpha_reg_V_8_out_ap_vld(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out_ap_vld),
    .alpha_reg_V_7_out(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out),
    .alpha_reg_V_7_out_ap_vld(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out_ap_vld)
);

pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1 grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start),
    .ap_done(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done),
    .ap_idle(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_idle),
    .ap_ready(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_ready),
    .resize_out_mat_data84_dout(resize_out_mat_data84_dout),
    .resize_out_mat_data84_num_data_valid(2'd0),
    .resize_out_mat_data84_fifo_cap(2'd0),
    .resize_out_mat_data84_empty_n(resize_out_mat_data84_empty_n),
    .resize_out_mat_data84_read(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_resize_out_mat_data84_read),
    .out_mat_data85_din(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_din),
    .out_mat_data85_num_data_valid(2'd0),
    .out_mat_data85_fifo_cap(2'd0),
    .out_mat_data85_full_n(out_mat_data85_full_n),
    .out_mat_data85_write(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_write),
    .loop_count(loop_count_reg_260),
    .rhs(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out),
    .sext_ln1319(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out),
    .rhs_1(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out),
    .sext_ln1319_1(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out),
    .rhs_2(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out),
    .sext_ln1319_2(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out)
);

pp_pipeline_accel_mul_mul_16ns_16ns_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_mul_16ns_16ns_32_4_1_U272(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_198_p0),
    .din1(grp_fu_198_p1),
    .ce(grp_fu_198_ce),
    .dout(grp_fu_198_p2)
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
        end else if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state74))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state71)) begin
            grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg <= 1'b1;
        end else if ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_ready == 1'b1)) begin
            grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state73)) begin
            grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg <= 1'b1;
        end else if ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_ready == 1'b1)) begin
            grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state72)) begin
        loop_count_reg_260 <= grp_fu_198_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        trunc_ln_reg_240 <= {{params[63:3]}};
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
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem4_ARREADY == 1'b0))) begin
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

always @ (*) begin
    if (((in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0))) begin
        ap_ST_fsm_state69_blk = 1'b1;
    end else begin
        ap_ST_fsm_state69_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state70_blk = 1'b0;

assign ap_ST_fsm_state71_blk = 1'b0;

always @ (*) begin
    if ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done == 1'b0)) begin
        ap_ST_fsm_state72_blk = 1'b1;
    end else begin
        ap_ST_fsm_state72_blk = 1'b0;
    end
end

assign ap_ST_fsm_state73_blk = 1'b0;

always @ (*) begin
    if ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done == 1'b0)) begin
        ap_ST_fsm_state74_blk = 1'b1;
    end else begin
        ap_ST_fsm_state74_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state74))) begin
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
    if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state74))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        gmem4_blk_n_AR = m_axi_gmem4_ARREADY;
    end else begin
        gmem4_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state70) | (1'b1 == ap_CS_fsm_state71) | ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state72)) | (~((in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state69)))) begin
        grp_fu_198_ce = 1'b1;
    end else begin
        grp_fu_198_ce = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state69)) begin
        in_mat_cols_blk_n = in_mat_cols_empty_n;
    end else begin
        in_mat_cols_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state69))) begin
        in_mat_cols_read = 1'b1;
    end else begin
        in_mat_cols_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state69)) begin
        in_mat_rows_blk_n = in_mat_rows_empty_n;
    end else begin
        in_mat_rows_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state69))) begin
        in_mat_rows_read = 1'b1;
    end else begin
        in_mat_rows_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem4_ARREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axi_gmem4_ARADDR = sext_ln115_fu_147_p1;
    end else if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARADDR = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARADDR;
    end else begin
        m_axi_gmem4_ARADDR = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARBURST = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARBURST;
    end else begin
        m_axi_gmem4_ARBURST = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARCACHE = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARCACHE;
    end else begin
        m_axi_gmem4_ARCACHE = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARID = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARID;
    end else begin
        m_axi_gmem4_ARID = 1'd0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem4_ARREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axi_gmem4_ARLEN = 32'd3;
    end else if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARLEN = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLEN;
    end else begin
        m_axi_gmem4_ARLEN = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARLOCK = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLOCK;
    end else begin
        m_axi_gmem4_ARLOCK = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARPROT = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARPROT;
    end else begin
        m_axi_gmem4_ARPROT = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARQOS = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARQOS;
    end else begin
        m_axi_gmem4_ARQOS = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARREGION = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARREGION;
    end else begin
        m_axi_gmem4_ARREGION = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARSIZE = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARSIZE;
    end else begin
        m_axi_gmem4_ARSIZE = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARUSER = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARUSER;
    end else begin
        m_axi_gmem4_ARUSER = 1'd0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem4_ARREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axi_gmem4_ARVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_ARVALID = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARVALID;
    end else begin
        m_axi_gmem4_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state71) | (1'b1 == ap_CS_fsm_state72))) begin
        m_axi_gmem4_RREADY = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_RREADY;
    end else begin
        m_axi_gmem4_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state74)) begin
        out_mat_data85_write = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_write;
    end else begin
        out_mat_data85_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state74)) begin
        resize_out_mat_data84_read = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_resize_out_mat_data84_read;
    end else begin
        resize_out_mat_data84_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (m_axi_gmem4_ARREADY == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
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
            if ((~((in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state69))) begin
                ap_NS_fsm = ap_ST_fsm_state70;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state69;
            end
        end
        ap_ST_fsm_state70 : begin
            ap_NS_fsm = ap_ST_fsm_state71;
        end
        ap_ST_fsm_state71 : begin
            ap_NS_fsm = ap_ST_fsm_state72;
        end
        ap_ST_fsm_state72 : begin
            if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state72))) begin
                ap_NS_fsm = ap_ST_fsm_state73;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state72;
            end
        end
        ap_ST_fsm_state73 : begin
            ap_NS_fsm = ap_ST_fsm_state74;
        end
        ap_ST_fsm_state74 : begin
            if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state74))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state74;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state69 = ap_CS_fsm[32'd68];

assign ap_CS_fsm_state70 = ap_CS_fsm[32'd69];

assign ap_CS_fsm_state71 = ap_CS_fsm[32'd70];

assign ap_CS_fsm_state72 = ap_CS_fsm[32'd71];

assign ap_CS_fsm_state73 = ap_CS_fsm[32'd72];

assign ap_CS_fsm_state74 = ap_CS_fsm[32'd73];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state69 = ((in_mat_cols_empty_n == 1'b0) | (in_mat_rows_empty_n == 1'b0));
end

assign grp_fu_198_p0 = grp_fu_198_p00;

assign grp_fu_198_p00 = height_fu_162_p1;

assign grp_fu_198_p1 = grp_fu_198_p10;

assign grp_fu_198_p10 = width_fu_158_p1;

assign grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg;

assign grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg;

assign height_fu_162_p1 = in_mat_rows_dout[15:0];

assign m_axi_gmem4_AWADDR = 64'd0;

assign m_axi_gmem4_AWBURST = 2'd0;

assign m_axi_gmem4_AWCACHE = 4'd0;

assign m_axi_gmem4_AWID = 1'd0;

assign m_axi_gmem4_AWLEN = 32'd0;

assign m_axi_gmem4_AWLOCK = 2'd0;

assign m_axi_gmem4_AWPROT = 3'd0;

assign m_axi_gmem4_AWQOS = 4'd0;

assign m_axi_gmem4_AWREGION = 4'd0;

assign m_axi_gmem4_AWSIZE = 3'd0;

assign m_axi_gmem4_AWUSER = 1'd0;

assign m_axi_gmem4_AWVALID = 1'b0;

assign m_axi_gmem4_BREADY = 1'b0;

assign m_axi_gmem4_WDATA = 64'd0;

assign m_axi_gmem4_WID = 1'd0;

assign m_axi_gmem4_WLAST = 1'b0;

assign m_axi_gmem4_WSTRB = 8'd0;

assign m_axi_gmem4_WUSER = 1'd0;

assign m_axi_gmem4_WVALID = 1'b0;

assign out_mat_data85_din = grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_din;

assign sext_ln115_fu_147_p1 = trunc_ln_fu_137_p4;

assign trunc_ln_fu_137_p4 = {{params[63:3]}};

assign width_fu_158_p1 = in_mat_cols_dout[15:0];

endmodule //pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_s
