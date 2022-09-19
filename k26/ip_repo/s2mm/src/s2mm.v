// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2020.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="s2mm,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu7ev-ffvc1156-2-e,HLS_INPUT_CLOCK=3.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.625000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=34,HLS_SYN_DSP=0,HLS_SYN_FF=1055,HLS_SYN_LUT=1223,HLS_VERSION=2020_1}" *)

module s2mm (
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
        axis_in_TDATA,
        axis_in_TVALID,
        axis_in_TREADY,
        axis_in_TKEEP,
        axis_in_TSTRB,
        axis_in_TUSER,
        axis_in_TLAST,
        axis_in_TID,
        axis_in_TDEST,
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
        ap_done_o,
        interrupt
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_pp0_stage0 = 8'd4;
parameter    ap_ST_fsm_state5 = 8'd8;
parameter    ap_ST_fsm_state6 = 8'd16;
parameter    ap_ST_fsm_state7 = 8'd32;
parameter    ap_ST_fsm_state8 = 8'd64;
parameter    ap_ST_fsm_state9 = 8'd128;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM_DATA_WIDTH = 128;
parameter    C_M_AXI_GMEM_AWUSER_WIDTH = 32;
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
input  [127:0] axis_in_TDATA;
input   axis_in_TVALID;
output   axis_in_TREADY;
input  [15:0] axis_in_TKEEP;
input  [15:0] axis_in_TSTRB;
input  [7:0] axis_in_TUSER;
input  [0:0] axis_in_TLAST;
input  [7:0] axis_in_TID;
input  [7:0] axis_in_TDEST;
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
output ap_done_o;
output   interrupt;

reg axis_in_TREADY;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [63:0] mem_V;
wire   [31:0] size_V;
reg    tid_V_ap_vld;
wire   [7:0] tdest_V;
reg    gmem_blk_n_AW;
wire    ap_CS_fsm_state2;
reg    gmem_blk_n_W;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg    gmem_blk_n_B;
wire    ap_CS_fsm_state9;
reg    axis_in_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln887_fu_177_p2;
reg    gmem_AWVALID;
wire    gmem_AWREADY;
reg    gmem_WVALID;
wire    gmem_WREADY;
wire    gmem_ARREADY;
wire    gmem_RVALID;
wire   [127:0] gmem_RDATA;
wire    gmem_RLAST;
wire   [0:0] gmem_RID;
wire   [0:0] gmem_RUSER;
wire   [1:0] gmem_RRESP;
wire    gmem_BVALID;
reg    gmem_BREADY;
wire   [1:0] gmem_BRESP;
wire   [0:0] gmem_BID;
wire   [0:0] gmem_BUSER;
reg   [30:0] t_V_reg_142;
reg   [31:0] size_V_read_reg_200;
reg   [59:0] mem_V1_reg_206;
reg    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [30:0] i_V_fu_182_p2;
reg   [127:0] tmp_data_V_reg_226;
reg   [0:0] tmp_last_V_reg_231;
reg   [7:0] tmp_id_V_reg_235;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
wire   [63:0] empty_fu_163_p1;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] zext_ln887_fu_173_p1;
reg   [7:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_axis_in_V_data_V_U_apdone_blk;
wire   [127:0] axis_in_TDATA_int;
wire    axis_in_TVALID_int;
reg    axis_in_TREADY_int;
wire    regslice_both_axis_in_V_data_V_U_ack_in;
wire    regslice_both_axis_in_V_keep_V_U_apdone_blk;
wire   [15:0] axis_in_TKEEP_int;
wire    regslice_both_axis_in_V_keep_V_U_vld_out;
wire    regslice_both_axis_in_V_keep_V_U_ack_in;
wire    regslice_both_axis_in_V_strb_V_U_apdone_blk;
wire   [15:0] axis_in_TSTRB_int;
wire    regslice_both_axis_in_V_strb_V_U_vld_out;
wire    regslice_both_axis_in_V_strb_V_U_ack_in;
wire    regslice_both_axis_in_V_user_V_U_apdone_blk;
wire   [7:0] axis_in_TUSER_int;
wire    regslice_both_axis_in_V_user_V_U_vld_out;
wire    regslice_both_axis_in_V_user_V_U_ack_in;
wire    regslice_both_axis_in_V_last_V_U_apdone_blk;
wire   [0:0] axis_in_TLAST_int;
wire    regslice_both_axis_in_V_last_V_U_vld_out;
wire    regslice_both_axis_in_V_last_V_U_ack_in;
wire    regslice_both_axis_in_V_id_V_U_apdone_blk;
wire   [7:0] axis_in_TID_int;
wire    regslice_both_axis_in_V_id_V_U_vld_out;
wire    regslice_both_axis_in_V_id_V_U_ack_in;
wire    regslice_both_axis_in_V_dest_V_U_apdone_blk;
wire   [7:0] axis_in_TDEST_int;
wire    regslice_both_axis_in_V_dest_V_U_vld_out;
wire    regslice_both_axis_in_V_dest_V_U_ack_in;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

assign ap_done_o = ap_done;

s2mm_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
s2mm_control_s_axi_U(
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
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .mem_V(mem_V),
    .size_V(size_V),
    .tid_V(tmp_id_V_reg_235),
    .tid_V_ap_vld(tid_V_ap_vld),
    .tdest_V(tdest_V)
);

s2mm_gmem_m_axi #(
    .CONSERVATIVE( 0 ),
    .USER_DW( 128 ),
    .USER_AW( 64 ),
    .USER_MAXREQS( 5 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 256 ),
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
    .C_CACHE_VALUE( C_M_AXI_GMEM_CACHE_VALUE ))
s2mm_gmem_m_axi_U(
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
    .AWUSER(), //m_axi_gmem_AWUSER),
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
    .I_ARVALID(1'b0),
    .I_ARREADY(gmem_ARREADY),
    .I_ARADDR(64'd0),
    .I_ARID(1'd0),
    .I_ARLEN(32'd0),
    .I_ARSIZE(3'd0),
    .I_ARLOCK(2'd0),
    .I_ARCACHE(4'd0),
    .I_ARQOS(4'd0),
    .I_ARPROT(3'd0),
    .I_ARUSER(1'd0),
    .I_ARBURST(2'd0),
    .I_ARREGION(4'd0),
    .I_RVALID(gmem_RVALID),
    .I_RREADY(1'b0),
    .I_RDATA(gmem_RDATA),
    .I_RID(gmem_RID),
    .I_RUSER(gmem_RUSER),
    .I_RRESP(gmem_RRESP),
    .I_RLAST(gmem_RLAST),
    .I_AWVALID(gmem_AWVALID),
    .I_AWREADY(gmem_AWREADY),
    .I_AWADDR(empty_fu_163_p1),
    .I_AWID(1'd0),
    .I_AWLEN(size_V_read_reg_200),
    .I_AWSIZE(3'd0),
    .I_AWLOCK(2'd0),
    .I_AWCACHE(4'd0),
    .I_AWQOS(4'd0),
    .I_AWPROT(3'd0),
    .I_AWUSER(1'd0),
    .I_AWBURST(2'd0),
    .I_AWREGION(4'd0),
    .I_WVALID(gmem_WVALID),
    .I_WREADY(gmem_WREADY),
    .I_WDATA(tmp_data_V_reg_226),
    .I_WID(1'd0),
    .I_WUSER(1'd0),
    .I_WLAST(1'b0),
    .I_WSTRB(16'd65535),
    .I_BVALID(gmem_BVALID),
    .I_BREADY(gmem_BREADY),
    .I_BRESP(gmem_BRESP),
    .I_BID(gmem_BID),
    .I_BUSER(gmem_BUSER)
);

regslice_both #(
    .DataWidth( 128 ))
regslice_both_axis_in_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TDATA),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_data_V_U_ack_in),
    .data_out(axis_in_TDATA_int),
    .vld_out(axis_in_TVALID_int),
    .ack_out(axis_in_TREADY_int),
    .apdone_blk(regslice_both_axis_in_V_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 16 ))
regslice_both_axis_in_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TKEEP),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_keep_V_U_ack_in),
    .data_out(axis_in_TKEEP_int),
    .vld_out(regslice_both_axis_in_V_keep_V_U_vld_out),
    .ack_out(axis_in_TREADY_int),
    .apdone_blk(regslice_both_axis_in_V_keep_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 16 ))
regslice_both_axis_in_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TSTRB),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_strb_V_U_ack_in),
    .data_out(axis_in_TSTRB_int),
    .vld_out(regslice_both_axis_in_V_strb_V_U_vld_out),
    .ack_out(axis_in_TREADY_int),
    .apdone_blk(regslice_both_axis_in_V_strb_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 8 ))
regslice_both_axis_in_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TUSER),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_user_V_U_ack_in),
    .data_out(axis_in_TUSER_int),
    .vld_out(regslice_both_axis_in_V_user_V_U_vld_out),
    .ack_out(axis_in_TREADY_int),
    .apdone_blk(regslice_both_axis_in_V_user_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_axis_in_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TLAST),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_last_V_U_ack_in),
    .data_out(axis_in_TLAST_int),
    .vld_out(regslice_both_axis_in_V_last_V_U_vld_out),
    .ack_out(axis_in_TREADY_int),
    .apdone_blk(regslice_both_axis_in_V_last_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 8 ))
regslice_both_axis_in_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TID),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_id_V_U_ack_in),
    .data_out(axis_in_TID_int),
    .vld_out(regslice_both_axis_in_V_id_V_U_vld_out),
    .ack_out(axis_in_TREADY_int),
    .apdone_blk(regslice_both_axis_in_V_id_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 8 ))
regslice_both_axis_in_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TDEST),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_dest_V_U_ack_in),
    .data_out(axis_in_TDEST_int),
    .vld_out(regslice_both_axis_in_V_dest_V_U_vld_out),
    .ack_out(axis_in_TREADY_int),
    .apdone_blk(regslice_both_axis_in_V_dest_V_U_apdone_blk)
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state2) & (gmem_AWREADY == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state3))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state2) & (gmem_AWREADY == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln887_fu_177_p2 == 1'd1))) begin
        t_V_reg_142 <= i_V_fu_182_p2;
    end else if (((1'b1 == ap_CS_fsm_state2) & (gmem_AWREADY == 1'b1))) begin
        t_V_reg_142 <= 31'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        mem_V1_reg_206 <= {{mem_V[63:4]}};
        size_V_read_reg_200 <= size_V;
    end
end

reg [31:0] m_axi_gmem_AWUSER_int;
always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        m_axi_gmem_AWUSER_int <= size_V;
    end
//    if (m_axi_gmem_AWVALID && m_axi_gmem_AWREADY)
//        m_axi_gmem_AWUSER_int <= 32'h0;
end
assign m_axi_gmem_AWUSER = m_axi_gmem_AWUSER_int;


always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln887_fu_177_p2 == 1'd1))) begin
        tmp_data_V_reg_226 <= axis_in_TDATA_int;
        tmp_id_V_reg_235 <= axis_in_TID_int;
        tmp_last_V_reg_231 <= axis_in_TLAST_int;
    end
end

always @ (*) begin
    if ((icmp_ln887_fu_177_p2 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((gmem_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((gmem_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln887_fu_177_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0))) begin
        axis_in_TDATA_blk_n = axis_in_TVALID_int;
    end else begin
        axis_in_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((axis_in_TVALID == 1'b1) & (regslice_both_axis_in_V_data_V_U_ack_in == 1'b1))) begin
        axis_in_TREADY = 1'b1;
    end else begin
        axis_in_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln887_fu_177_p2 == 1'd1))) begin
        axis_in_TREADY_int = 1'b1;
    end else begin
        axis_in_TREADY_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (gmem_AWREADY == 1'b1))) begin
        gmem_AWVALID = 1'b1;
    end else begin
        gmem_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((gmem_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
        gmem_BREADY = 1'b1;
    end else begin
        gmem_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        gmem_WVALID = 1'b1;
    end else begin
        gmem_WVALID = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        gmem_blk_n_AW = m_axi_gmem_AWREADY;
    end else begin
        gmem_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        gmem_blk_n_B = m_axi_gmem_BVALID;
    end else begin
        gmem_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        gmem_blk_n_W = m_axi_gmem_WREADY;
    end else begin
        gmem_blk_n_W = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_last_V_reg_231 == 1'd1))) begin
        tid_V_ap_vld = 1'b1;
    end else begin
        tid_V_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (gmem_AWREADY == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln887_fu_177_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln887_fu_177_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
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
            if (((gmem_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd7];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((axis_in_TVALID_int == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln887_fu_177_p2 == 1'd1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((axis_in_TVALID_int == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln887_fu_177_p2 == 1'd1)) | ((gmem_WREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((axis_in_TVALID_int == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln887_fu_177_p2 == 1'd1)) | ((gmem_WREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter0 = ((axis_in_TVALID_int == 1'b0) & (icmp_ln887_fu_177_p2 == 1'd1));
end

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign empty_fu_163_p1 = mem_V1_reg_206;

assign i_V_fu_182_p2 = (t_V_reg_142 + 31'd1);

assign icmp_ln887_fu_177_p2 = (($signed(zext_ln887_fu_173_p1) < $signed(size_V_read_reg_200)) ? 1'b1 : 1'b0);

assign zext_ln887_fu_173_p1 = t_V_reg_142;

endmodule //s2mm
