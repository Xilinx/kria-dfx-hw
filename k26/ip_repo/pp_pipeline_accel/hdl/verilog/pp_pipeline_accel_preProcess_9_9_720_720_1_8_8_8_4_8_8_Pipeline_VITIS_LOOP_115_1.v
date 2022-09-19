// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
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
        sext_ln115,
        beta_reg_V_2_out,
        beta_reg_V_2_out_ap_vld,
        beta_reg_V_1_out,
        beta_reg_V_1_out_ap_vld,
        beta_reg_V_out,
        beta_reg_V_out_ap_vld,
        alpha_reg_V_9_out,
        alpha_reg_V_9_out_ap_vld,
        alpha_reg_V_8_out,
        alpha_reg_V_8_out_ap_vld,
        alpha_reg_V_7_out,
        alpha_reg_V_7_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
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
input  [60:0] sext_ln115;
output  [7:0] beta_reg_V_2_out;
output   beta_reg_V_2_out_ap_vld;
output  [7:0] beta_reg_V_1_out;
output   beta_reg_V_1_out_ap_vld;
output  [7:0] beta_reg_V_out;
output   beta_reg_V_out_ap_vld;
output  [7:0] alpha_reg_V_9_out;
output   alpha_reg_V_9_out_ap_vld;
output  [7:0] alpha_reg_V_8_out;
output   alpha_reg_V_8_out_ap_vld;
output  [7:0] alpha_reg_V_7_out;
output   alpha_reg_V_7_out_ap_vld;

reg ap_idle;
reg m_axi_gmem4_RREADY;
reg beta_reg_V_2_out_ap_vld;
reg beta_reg_V_1_out_ap_vld;
reg beta_reg_V_out_ap_vld;
reg alpha_reg_V_9_out_ap_vld;
reg alpha_reg_V_8_out_ap_vld;
reg alpha_reg_V_7_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln115_reg_979;
reg   [0:0] trunc_ln115_reg_983;
reg    ap_predicate_op34_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
wire    ap_block_state9_pp0_stage0_iter8;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln115_fu_232_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    gmem4_blk_n_R;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
reg   [2:0] i_3_reg_973;
reg   [2:0] i_3_reg_973_pp0_iter1_reg;
reg   [2:0] i_3_reg_973_pp0_iter2_reg;
reg   [2:0] i_3_reg_973_pp0_iter3_reg;
reg   [2:0] i_3_reg_973_pp0_iter4_reg;
reg   [2:0] i_3_reg_973_pp0_iter5_reg;
reg   [2:0] i_3_reg_973_pp0_iter6_reg;
reg   [2:0] i_3_reg_973_pp0_iter7_reg;
reg   [0:0] icmp_ln115_reg_979_pp0_iter1_reg;
reg   [0:0] icmp_ln115_reg_979_pp0_iter2_reg;
reg   [0:0] icmp_ln115_reg_979_pp0_iter3_reg;
reg   [0:0] icmp_ln115_reg_979_pp0_iter4_reg;
reg   [0:0] icmp_ln115_reg_979_pp0_iter5_reg;
reg   [0:0] icmp_ln115_reg_979_pp0_iter6_reg;
wire   [0:0] trunc_ln115_fu_244_p1;
reg   [0:0] trunc_ln115_reg_983_pp0_iter1_reg;
reg   [63:0] gmem4_addr_read_reg_987;
wire   [31:0] trunc_ln120_fu_267_p1;
reg   [31:0] trunc_ln120_reg_992;
reg   [0:0] tmp_reg_997;
reg   [0:0] tmp_reg_997_pp0_iter3_reg;
reg   [0:0] tmp_reg_997_pp0_iter4_reg;
reg   [0:0] tmp_reg_997_pp0_iter5_reg;
wire   [62:0] trunc_ln592_fu_302_p1;
reg   [62:0] trunc_ln592_reg_1007;
reg   [0:0] isneg_reg_1012;
reg   [0:0] isneg_reg_1012_pp0_iter5_reg;
reg   [0:0] isneg_reg_1012_pp0_iter6_reg;
reg   [10:0] exp_tmp_reg_1019;
wire   [51:0] trunc_ln600_fu_324_p1;
reg   [51:0] trunc_ln600_reg_1025;
reg   [51:0] trunc_ln600_reg_1025_pp0_iter5_reg;
wire   [0:0] icmp_ln606_fu_328_p2;
reg   [0:0] icmp_ln606_reg_1030;
reg   [0:0] icmp_ln606_reg_1030_pp0_iter6_reg;
reg   [0:0] icmp_ln606_reg_1030_pp0_iter7_reg;
wire   [11:0] F2_fu_336_p2;
reg   [11:0] F2_reg_1039;
wire   [5:0] trunc_ln610_fu_342_p1;
reg   [5:0] trunc_ln610_reg_1051;
reg   [5:0] trunc_ln610_reg_1051_pp0_iter6_reg;
wire   [0:0] icmp_ln617_fu_346_p2;
reg   [0:0] icmp_ln617_reg_1056;
reg   [0:0] icmp_ln617_reg_1056_pp0_iter6_reg;
reg   [0:0] icmp_ln617_reg_1056_pp0_iter7_reg;
wire   [10:0] trunc_ln610_1_fu_351_p1;
reg   [10:0] trunc_ln610_1_reg_1062;
reg   [10:0] trunc_ln610_1_reg_1062_pp0_iter6_reg;
wire   [53:0] man_V_3_fu_372_p3;
reg   [53:0] man_V_3_reg_1067;
wire   [0:0] icmp_ln616_fu_379_p2;
reg   [0:0] icmp_ln616_reg_1075;
reg   [0:0] icmp_ln616_reg_1075_pp0_iter7_reg;
wire  signed [11:0] sh_amt_fu_389_p3;
reg  signed [11:0] sh_amt_reg_1080;
wire   [0:0] icmp_ln616_1_fu_396_p2;
reg   [0:0] icmp_ln616_1_reg_1086;
reg   [0:0] icmp_ln616_1_reg_1086_pp0_iter7_reg;
wire  signed [11:0] sh_amt_1_fu_411_p3;
reg  signed [11:0] sh_amt_1_reg_1091;
wire   [0:0] icmp_ln617_1_fu_419_p2;
reg   [0:0] icmp_ln617_1_reg_1096;
reg   [0:0] icmp_ln617_1_reg_1096_pp0_iter7_reg;
wire   [7:0] trunc_ln618_fu_424_p1;
reg   [7:0] trunc_ln618_reg_1102;
wire   [0:0] icmp_ln620_fu_428_p2;
reg   [0:0] icmp_ln620_reg_1110;
wire   [7:0] select_ln623_fu_434_p3;
reg   [7:0] select_ln623_reg_1115;
wire   [0:0] icmp_ln626_fu_441_p2;
reg   [0:0] icmp_ln626_reg_1121;
wire   [0:0] icmp_ln638_fu_456_p2;
reg   [0:0] icmp_ln638_reg_1126;
wire   [0:0] icmp_ln620_1_fu_462_p2;
reg   [0:0] icmp_ln620_1_reg_1131;
wire   [0:0] icmp_ln626_1_fu_468_p2;
reg   [0:0] icmp_ln626_1_reg_1136;
wire   [0:0] icmp_ln638_1_fu_484_p2;
reg   [0:0] icmp_ln638_1_reg_1141;
wire   [7:0] add_ln423_fu_611_p2;
reg   [7:0] add_ln423_reg_1146;
wire   [7:0] add_ln423_1_fu_627_p2;
reg   [7:0] add_ln423_1_reg_1151;
wire   [7:0] select_ln617_fu_643_p3;
reg   [7:0] select_ln617_reg_1156;
wire   [7:0] select_ln617_1_fu_655_p3;
reg   [7:0] select_ln617_1_reg_1161;
reg    ap_condition_exit_pp0_iter1_stage0;
reg   [63:0] ap_phi_mux_empty_phi_fu_206_p4;
wire   [63:0] ap_phi_reg_pp0_iter2_empty_reg_203;
wire   [63:0] zext_ln115_fu_262_p1;
reg   [31:0] shiftreg_fu_118;
wire    ap_loop_init;
reg   [2:0] i_fu_122;
wire   [2:0] add_ln115_fu_238_p2;
reg   [2:0] ap_sig_allocacmp_i_3;
reg   [7:0] alpha_reg_V_1_fu_126;
wire   [7:0] alpha_reg_V_6_fu_850_p3;
reg   [7:0] alpha_reg_V_2_fu_130;
wire   [7:0] alpha_reg_V_5_fu_836_p3;
reg   [7:0] alpha_reg_V_3_fu_134;
wire   [7:0] alpha_reg_V_4_fu_822_p3;
reg   [7:0] beta_reg_V_fu_138;
wire   [7:0] beta_reg_V_6_fu_802_p3;
reg   [7:0] beta_reg_V_1_fu_142;
wire   [7:0] beta_reg_V_5_fu_782_p3;
reg   [7:0] beta_reg_V_2_fu_146;
wire   [7:0] beta_reg_V_4_fu_762_p3;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] grp_fu_212_p0;
wire   [63:0] grp_fu_212_p1;
wire   [63:0] ireg_fu_298_p1;
wire   [11:0] zext_ln501_fu_333_p1;
wire   [52:0] man_V_fu_355_p3;
wire   [53:0] zext_ln604_fu_362_p1;
wire   [53:0] man_V_1_fu_366_p2;
wire   [11:0] sub_ln616_fu_384_p2;
wire   [11:0] add_ln616_fu_401_p2;
wire   [11:0] sub_ln616_1_fu_406_p2;
wire   [8:0] tmp_18_fu_446_p4;
wire   [8:0] tmp_19_fu_474_p4;
wire   [10:0] trunc_ln621_fu_496_p1;
wire   [53:0] zext_ln621_fu_499_p1;
wire   [53:0] ashr_ln621_fu_503_p2;
wire   [7:0] trunc_ln621_1_fu_508_p1;
wire  signed [31:0] sext_ln616_fu_490_p1;
wire   [7:0] sext_ln616cast_fu_518_p1;
wire   [7:0] shl_ln639_fu_522_p2;
wire  signed [31:0] sext_ln616_1_fu_493_p1;
wire   [53:0] zext_ln621_1_fu_534_p1;
wire   [53:0] ashr_ln621_1_fu_538_p2;
wire   [7:0] trunc_ln621_2_fu_543_p1;
wire   [7:0] sext_ln616_1cast_fu_553_p1;
wire   [7:0] shl_ln639_1_fu_557_p2;
wire   [5:0] add_ln626_fu_569_p2;
wire   [31:0] zext_ln626_fu_574_p1;
wire   [10:0] add_ln626_1_fu_585_p2;
wire   [31:0] zext_ln626_1_fu_590_p1;
wire   [0:0] p_Result_s_fu_578_p3;
wire   [0:0] qb_fu_601_p3;
wire   [7:0] select_ln620_fu_512_p3;
wire   [7:0] zext_ln423_fu_607_p1;
wire   [0:0] p_Result_1_fu_594_p3;
wire   [0:0] qb_1_fu_617_p3;
wire   [7:0] select_ln620_1_fu_547_p3;
wire   [7:0] zext_ln423_1_fu_623_p1;
wire   [0:0] xor_ln606_fu_633_p2;
wire   [0:0] and_ln617_fu_638_p2;
wire   [7:0] select_ln638_fu_527_p3;
wire   [0:0] and_ln617_1_fu_650_p2;
wire   [7:0] select_ln638_1_fu_562_p3;
wire   [0:0] or_ln617_fu_685_p2;
wire   [0:0] xor_ln617_fu_689_p2;
wire   [0:0] and_ln616_fu_695_p2;
wire   [7:0] select_ln616_fu_700_p3;
wire   [0:0] or_ln617_1_fu_716_p2;
wire   [0:0] xor_ln617_1_fu_720_p2;
wire   [0:0] and_ln616_1_fu_726_p2;
wire   [7:0] select_ln616_1_fu_731_p3;
wire   [1:0] trunc_ln122_fu_713_p1;
wire   [0:0] icmp_ln121_fu_680_p2;
wire   [0:0] icmp_ln124_fu_744_p2;
wire   [0:0] xor_ln121_fu_750_p2;
wire   [0:0] and_ln124_fu_756_p2;
wire   [7:0] beta_reg_V_3_fu_737_p3;
wire   [0:0] icmp_ln124_1_fu_770_p2;
wire   [0:0] and_ln124_1_fu_776_p2;
wire   [0:0] or_ln124_fu_790_p2;
wire   [0:0] or_ln124_1_fu_796_p2;
wire   [0:0] or_ln122_fu_810_p2;
wire   [0:0] or_ln122_1_fu_816_p2;
wire   [7:0] alpha_reg_V_fu_706_p3;
wire   [0:0] and_ln122_fu_830_p2;
wire   [0:0] and_ln122_1_fu_844_p2;
reg    grp_fu_212_ce;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_done_reg = 1'b0;
end

pp_pipeline_accel_fpext_32ns_64_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
fpext_32ns_64_2_no_dsp_1_U249(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_212_p0),
    .ce(grp_fu_212_ce),
    .dout(grp_fu_212_p1)
);

pp_pipeline_accel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready_pp0_iter7_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln115_fu_232_p2 == 1'd0))) begin
            i_fu_122 <= add_ln115_fu_238_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_122 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            shiftreg_fu_118 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            shiftreg_fu_118 <= {{ap_phi_mux_empty_phi_fu_206_p4[63:32]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        F2_reg_1039 <= F2_fu_336_p2;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        exp_tmp_reg_1019 <= {{ireg_fu_298_p1[62:52]}};
        i_3_reg_973_pp0_iter2_reg <= i_3_reg_973_pp0_iter1_reg;
        i_3_reg_973_pp0_iter3_reg <= i_3_reg_973_pp0_iter2_reg;
        i_3_reg_973_pp0_iter4_reg <= i_3_reg_973_pp0_iter3_reg;
        i_3_reg_973_pp0_iter5_reg <= i_3_reg_973_pp0_iter4_reg;
        i_3_reg_973_pp0_iter6_reg <= i_3_reg_973_pp0_iter5_reg;
        i_3_reg_973_pp0_iter7_reg <= i_3_reg_973_pp0_iter6_reg;
        icmp_ln115_reg_979_pp0_iter2_reg <= icmp_ln115_reg_979_pp0_iter1_reg;
        icmp_ln115_reg_979_pp0_iter3_reg <= icmp_ln115_reg_979_pp0_iter2_reg;
        icmp_ln115_reg_979_pp0_iter4_reg <= icmp_ln115_reg_979_pp0_iter3_reg;
        icmp_ln115_reg_979_pp0_iter5_reg <= icmp_ln115_reg_979_pp0_iter4_reg;
        icmp_ln115_reg_979_pp0_iter6_reg <= icmp_ln115_reg_979_pp0_iter5_reg;
        icmp_ln606_reg_1030 <= icmp_ln606_fu_328_p2;
        icmp_ln606_reg_1030_pp0_iter6_reg <= icmp_ln606_reg_1030;
        icmp_ln606_reg_1030_pp0_iter7_reg <= icmp_ln606_reg_1030_pp0_iter6_reg;
        icmp_ln616_1_reg_1086_pp0_iter7_reg <= icmp_ln616_1_reg_1086;
        icmp_ln616_reg_1075_pp0_iter7_reg <= icmp_ln616_reg_1075;
        icmp_ln617_1_reg_1096_pp0_iter7_reg <= icmp_ln617_1_reg_1096;
        icmp_ln617_reg_1056 <= icmp_ln617_fu_346_p2;
        icmp_ln617_reg_1056_pp0_iter6_reg <= icmp_ln617_reg_1056;
        icmp_ln617_reg_1056_pp0_iter7_reg <= icmp_ln617_reg_1056_pp0_iter6_reg;
        isneg_reg_1012 <= ireg_fu_298_p1[32'd63];
        isneg_reg_1012_pp0_iter5_reg <= isneg_reg_1012;
        isneg_reg_1012_pp0_iter6_reg <= isneg_reg_1012_pp0_iter5_reg;
        man_V_3_reg_1067 <= man_V_3_fu_372_p3;
        select_ln623_reg_1115 <= select_ln623_fu_434_p3;
        tmp_reg_997 <= ap_phi_mux_empty_phi_fu_206_p4[32'd31];
        tmp_reg_997_pp0_iter3_reg <= tmp_reg_997;
        tmp_reg_997_pp0_iter4_reg <= tmp_reg_997_pp0_iter3_reg;
        tmp_reg_997_pp0_iter5_reg <= tmp_reg_997_pp0_iter4_reg;
        trunc_ln120_reg_992 <= trunc_ln120_fu_267_p1;
        trunc_ln592_reg_1007 <= trunc_ln592_fu_302_p1;
        trunc_ln600_reg_1025 <= trunc_ln600_fu_324_p1;
        trunc_ln600_reg_1025_pp0_iter5_reg <= trunc_ln600_reg_1025;
        trunc_ln610_1_reg_1062 <= trunc_ln610_1_fu_351_p1;
        trunc_ln610_1_reg_1062_pp0_iter6_reg <= trunc_ln610_1_reg_1062;
        trunc_ln610_reg_1051 <= trunc_ln610_fu_342_p1;
        trunc_ln610_reg_1051_pp0_iter6_reg <= trunc_ln610_reg_1051;
        trunc_ln618_reg_1102 <= trunc_ln618_fu_424_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln606_reg_1030_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln423_1_reg_1151 <= add_ln423_1_fu_627_p2;
        add_ln423_reg_1146 <= add_ln423_fu_611_p2;
        select_ln617_1_reg_1161 <= select_ln617_1_fu_655_p3;
        select_ln617_reg_1156 <= select_ln617_fu_643_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        alpha_reg_V_1_fu_126 <= alpha_reg_V_6_fu_850_p3;
        alpha_reg_V_2_fu_130 <= alpha_reg_V_5_fu_836_p3;
        alpha_reg_V_3_fu_134 <= alpha_reg_V_4_fu_822_p3;
        beta_reg_V_1_fu_142 <= beta_reg_V_5_fu_782_p3;
        beta_reg_V_2_fu_146 <= beta_reg_V_4_fu_762_p3;
        beta_reg_V_fu_138 <= beta_reg_V_6_fu_802_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        i_3_reg_973 <= ap_sig_allocacmp_i_3;
        i_3_reg_973_pp0_iter1_reg <= i_3_reg_973;
        icmp_ln115_reg_979 <= icmp_ln115_fu_232_p2;
        icmp_ln115_reg_979_pp0_iter1_reg <= icmp_ln115_reg_979;
        trunc_ln115_reg_983_pp0_iter1_reg <= trunc_ln115_reg_983;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op34_read_state2 == 1'b1))) begin
        gmem4_addr_read_reg_987 <= m_axi_gmem4_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln606_reg_1030 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln616_1_reg_1086 <= icmp_ln616_1_fu_396_p2;
        icmp_ln616_reg_1075 <= icmp_ln616_fu_379_p2;
        icmp_ln617_1_reg_1096 <= icmp_ln617_1_fu_419_p2;
        icmp_ln620_1_reg_1131 <= icmp_ln620_1_fu_462_p2;
        icmp_ln620_reg_1110 <= icmp_ln620_fu_428_p2;
        icmp_ln626_1_reg_1136 <= icmp_ln626_1_fu_468_p2;
        icmp_ln626_reg_1121 <= icmp_ln626_fu_441_p2;
        icmp_ln638_1_reg_1141 <= icmp_ln638_1_fu_484_p2;
        icmp_ln638_reg_1126 <= icmp_ln638_fu_456_p2;
        sh_amt_1_reg_1091 <= sh_amt_1_fu_411_p3;
        sh_amt_reg_1080 <= sh_amt_fu_389_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln115_fu_232_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln115_reg_983 <= trunc_ln115_fu_244_p1;
    end
end

always @ (*) begin
    if (((icmp_ln115_reg_979_pp0_iter6_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        alpha_reg_V_7_out_ap_vld = 1'b1;
    end else begin
        alpha_reg_V_7_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln115_reg_979_pp0_iter6_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        alpha_reg_V_8_out_ap_vld = 1'b1;
    end else begin
        alpha_reg_V_8_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln115_reg_979_pp0_iter6_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        alpha_reg_V_9_out_ap_vld = 1'b1;
    end else begin
        alpha_reg_V_9_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln115_fu_232_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln115_reg_979 == 1'd1))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter7_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln115_reg_979_pp0_iter1_reg == 1'd0)) begin
        if ((trunc_ln115_reg_983_pp0_iter1_reg == 1'd1)) begin
            ap_phi_mux_empty_phi_fu_206_p4 = zext_ln115_fu_262_p1;
        end else if ((trunc_ln115_reg_983_pp0_iter1_reg == 1'd0)) begin
            ap_phi_mux_empty_phi_fu_206_p4 = gmem4_addr_read_reg_987;
        end else begin
            ap_phi_mux_empty_phi_fu_206_p4 = ap_phi_reg_pp0_iter2_empty_reg_203;
        end
    end else begin
        ap_phi_mux_empty_phi_fu_206_p4 = ap_phi_reg_pp0_iter2_empty_reg_203;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_i_3 = 3'd0;
    end else begin
        ap_sig_allocacmp_i_3 = i_fu_122;
    end
end

always @ (*) begin
    if (((icmp_ln115_reg_979_pp0_iter6_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        beta_reg_V_1_out_ap_vld = 1'b1;
    end else begin
        beta_reg_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln115_reg_979_pp0_iter6_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        beta_reg_V_2_out_ap_vld = 1'b1;
    end else begin
        beta_reg_V_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln115_reg_979_pp0_iter6_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        beta_reg_V_out_ap_vld = 1'b1;
    end else begin
        beta_reg_V_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op34_read_state2 == 1'b1))) begin
        gmem4_blk_n_R = m_axi_gmem4_RVALID;
    end else begin
        gmem4_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_212_ce = 1'b1;
    end else begin
        grp_fu_212_ce = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op34_read_state2 == 1'b1))) begin
        m_axi_gmem4_RREADY = 1'b1;
    end else begin
        m_axi_gmem4_RREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign F2_fu_336_p2 = (12'd1075 - zext_ln501_fu_333_p1);

assign add_ln115_fu_238_p2 = (ap_sig_allocacmp_i_3 + 3'd1);

assign add_ln423_1_fu_627_p2 = (select_ln620_1_fu_547_p3 + zext_ln423_1_fu_623_p1);

assign add_ln423_fu_611_p2 = (select_ln620_fu_512_p3 + zext_ln423_fu_607_p1);

assign add_ln616_fu_401_p2 = ($signed(F2_reg_1039) + $signed(12'd4092));

assign add_ln626_1_fu_585_p2 = ($signed(trunc_ln610_1_reg_1062_pp0_iter6_reg) + $signed(11'd2043));

assign add_ln626_fu_569_p2 = ($signed(trunc_ln610_reg_1051_pp0_iter6_reg) + $signed(6'd63));

assign alpha_reg_V_4_fu_822_p3 = ((or_ln122_1_fu_816_p2[0:0] == 1'b1) ? alpha_reg_V_3_fu_134 : alpha_reg_V_fu_706_p3);

assign alpha_reg_V_5_fu_836_p3 = ((and_ln122_fu_830_p2[0:0] == 1'b1) ? alpha_reg_V_fu_706_p3 : alpha_reg_V_2_fu_130);

assign alpha_reg_V_6_fu_850_p3 = ((and_ln122_1_fu_844_p2[0:0] == 1'b1) ? alpha_reg_V_fu_706_p3 : alpha_reg_V_1_fu_126);

assign alpha_reg_V_7_out = alpha_reg_V_1_fu_126;

assign alpha_reg_V_8_out = alpha_reg_V_2_fu_130;

assign alpha_reg_V_9_out = alpha_reg_V_3_fu_134;

assign alpha_reg_V_fu_706_p3 = ((icmp_ln606_reg_1030_pp0_iter7_reg[0:0] == 1'b1) ? 8'd0 : select_ln616_fu_700_p3);

assign and_ln122_1_fu_844_p2 = (icmp_ln124_1_fu_770_p2 & icmp_ln121_fu_680_p2);

assign and_ln122_fu_830_p2 = (icmp_ln124_fu_744_p2 & icmp_ln121_fu_680_p2);

assign and_ln124_1_fu_776_p2 = (xor_ln121_fu_750_p2 & icmp_ln124_1_fu_770_p2);

assign and_ln124_fu_756_p2 = (xor_ln121_fu_750_p2 & icmp_ln124_fu_744_p2);

assign and_ln616_1_fu_726_p2 = (xor_ln617_1_fu_720_p2 & icmp_ln616_1_reg_1086_pp0_iter7_reg);

assign and_ln616_fu_695_p2 = (xor_ln617_fu_689_p2 & icmp_ln616_reg_1075_pp0_iter7_reg);

assign and_ln617_1_fu_650_p2 = (xor_ln606_fu_633_p2 & icmp_ln617_1_reg_1096);

assign and_ln617_fu_638_p2 = (xor_ln606_fu_633_p2 & icmp_ln617_reg_1056_pp0_iter6_reg);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((m_axi_gmem4_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op34_read_state2 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((m_axi_gmem4_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op34_read_state2 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((m_axi_gmem4_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (ap_predicate_op34_read_state2 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((m_axi_gmem4_RVALID == 1'b0) & (ap_predicate_op34_read_state2 == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_phi_reg_pp0_iter2_empty_reg_203 = 'bx;

always @ (*) begin
    ap_predicate_op34_read_state2 = ((trunc_ln115_reg_983 == 1'd0) & (icmp_ln115_reg_979 == 1'd0));
end

assign ashr_ln621_1_fu_538_p2 = $signed(man_V_3_reg_1067) >>> zext_ln621_1_fu_534_p1;

assign ashr_ln621_fu_503_p2 = $signed(man_V_3_reg_1067) >>> zext_ln621_fu_499_p1;

assign beta_reg_V_1_out = beta_reg_V_1_fu_142;

assign beta_reg_V_2_out = beta_reg_V_2_fu_146;

assign beta_reg_V_3_fu_737_p3 = ((icmp_ln606_reg_1030_pp0_iter7_reg[0:0] == 1'b1) ? 8'd0 : select_ln616_1_fu_731_p3);

assign beta_reg_V_4_fu_762_p3 = ((and_ln124_fu_756_p2[0:0] == 1'b1) ? beta_reg_V_3_fu_737_p3 : beta_reg_V_2_fu_146);

assign beta_reg_V_5_fu_782_p3 = ((and_ln124_1_fu_776_p2[0:0] == 1'b1) ? beta_reg_V_3_fu_737_p3 : beta_reg_V_1_fu_142);

assign beta_reg_V_6_fu_802_p3 = ((or_ln124_1_fu_796_p2[0:0] == 1'b1) ? beta_reg_V_fu_138 : beta_reg_V_3_fu_737_p3);

assign beta_reg_V_out = beta_reg_V_fu_138;

assign grp_fu_212_p0 = trunc_ln120_reg_992;

assign icmp_ln115_fu_232_p2 = ((ap_sig_allocacmp_i_3 == 3'd6) ? 1'b1 : 1'b0);

assign icmp_ln121_fu_680_p2 = ((i_3_reg_973_pp0_iter7_reg < 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln124_1_fu_770_p2 = ((trunc_ln122_fu_713_p1 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln124_fu_744_p2 = ((trunc_ln122_fu_713_p1 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln606_fu_328_p2 = ((trunc_ln592_reg_1007 == 63'd0) ? 1'b1 : 1'b0);

assign icmp_ln616_1_fu_396_p2 = (($signed(F2_reg_1039) > $signed(12'd4)) ? 1'b1 : 1'b0);

assign icmp_ln616_fu_379_p2 = (($signed(F2_reg_1039) > $signed(12'd0)) ? 1'b1 : 1'b0);

assign icmp_ln617_1_fu_419_p2 = ((F2_reg_1039 == 12'd4) ? 1'b1 : 1'b0);

assign icmp_ln617_fu_346_p2 = ((exp_tmp_reg_1019 == 11'd1075) ? 1'b1 : 1'b0);

assign icmp_ln620_1_fu_462_p2 = ((sh_amt_1_fu_411_p3 < 12'd54) ? 1'b1 : 1'b0);

assign icmp_ln620_fu_428_p2 = ((sh_amt_fu_389_p3 < 12'd54) ? 1'b1 : 1'b0);

assign icmp_ln626_1_fu_468_p2 = (($signed(add_ln616_fu_401_p2) > $signed(12'd54)) ? 1'b1 : 1'b0);

assign icmp_ln626_fu_441_p2 = (($signed(F2_reg_1039) > $signed(12'd54)) ? 1'b1 : 1'b0);

assign icmp_ln638_1_fu_484_p2 = ((tmp_19_fu_474_p4 == 9'd0) ? 1'b1 : 1'b0);

assign icmp_ln638_fu_456_p2 = ((tmp_18_fu_446_p4 == 9'd0) ? 1'b1 : 1'b0);

assign ireg_fu_298_p1 = grp_fu_212_p1;

assign m_axi_gmem4_ARADDR = 64'd0;

assign m_axi_gmem4_ARBURST = 2'd0;

assign m_axi_gmem4_ARCACHE = 4'd0;

assign m_axi_gmem4_ARID = 1'd0;

assign m_axi_gmem4_ARLEN = 32'd0;

assign m_axi_gmem4_ARLOCK = 2'd0;

assign m_axi_gmem4_ARPROT = 3'd0;

assign m_axi_gmem4_ARQOS = 4'd0;

assign m_axi_gmem4_ARREGION = 4'd0;

assign m_axi_gmem4_ARSIZE = 3'd0;

assign m_axi_gmem4_ARUSER = 1'd0;

assign m_axi_gmem4_ARVALID = 1'b0;

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

assign man_V_1_fu_366_p2 = (54'd0 - zext_ln604_fu_362_p1);

assign man_V_3_fu_372_p3 = ((isneg_reg_1012_pp0_iter5_reg[0:0] == 1'b1) ? man_V_1_fu_366_p2 : zext_ln604_fu_362_p1);

assign man_V_fu_355_p3 = {{1'd1}, {trunc_ln600_reg_1025_pp0_iter5_reg}};

assign or_ln122_1_fu_816_p2 = (or_ln122_fu_810_p2 | icmp_ln124_1_fu_770_p2);

assign or_ln122_fu_810_p2 = (xor_ln121_fu_750_p2 | icmp_ln124_fu_744_p2);

assign or_ln124_1_fu_796_p2 = (or_ln124_fu_790_p2 | icmp_ln121_fu_680_p2);

assign or_ln124_fu_790_p2 = (icmp_ln124_fu_744_p2 | icmp_ln124_1_fu_770_p2);

assign or_ln617_1_fu_716_p2 = (icmp_ln617_1_reg_1096_pp0_iter7_reg | icmp_ln606_reg_1030_pp0_iter7_reg);

assign or_ln617_fu_685_p2 = (icmp_ln617_reg_1056_pp0_iter7_reg | icmp_ln606_reg_1030_pp0_iter7_reg);

assign p_Result_1_fu_594_p3 = man_V_3_reg_1067[zext_ln626_1_fu_590_p1];

assign p_Result_s_fu_578_p3 = man_V_3_reg_1067[zext_ln626_fu_574_p1];

assign qb_1_fu_617_p3 = ((icmp_ln626_1_reg_1136[0:0] == 1'b1) ? isneg_reg_1012_pp0_iter6_reg : p_Result_1_fu_594_p3);

assign qb_fu_601_p3 = ((icmp_ln626_reg_1121[0:0] == 1'b1) ? isneg_reg_1012_pp0_iter6_reg : p_Result_s_fu_578_p3);

assign select_ln616_1_fu_731_p3 = ((and_ln616_1_fu_726_p2[0:0] == 1'b1) ? add_ln423_1_reg_1151 : select_ln617_1_reg_1161);

assign select_ln616_fu_700_p3 = ((and_ln616_fu_695_p2[0:0] == 1'b1) ? add_ln423_reg_1146 : select_ln617_reg_1156);

assign select_ln617_1_fu_655_p3 = ((and_ln617_1_fu_650_p2[0:0] == 1'b1) ? trunc_ln618_reg_1102 : select_ln638_1_fu_562_p3);

assign select_ln617_fu_643_p3 = ((and_ln617_fu_638_p2[0:0] == 1'b1) ? trunc_ln618_reg_1102 : select_ln638_fu_527_p3);

assign select_ln620_1_fu_547_p3 = ((icmp_ln620_1_reg_1131[0:0] == 1'b1) ? trunc_ln621_2_fu_543_p1 : select_ln623_reg_1115);

assign select_ln620_fu_512_p3 = ((icmp_ln620_reg_1110[0:0] == 1'b1) ? trunc_ln621_1_fu_508_p1 : select_ln623_reg_1115);

assign select_ln623_fu_434_p3 = ((tmp_reg_997_pp0_iter5_reg[0:0] == 1'b1) ? 8'd255 : 8'd0);

assign select_ln638_1_fu_562_p3 = ((icmp_ln638_1_reg_1141[0:0] == 1'b1) ? shl_ln639_1_fu_557_p2 : 8'd0);

assign select_ln638_fu_527_p3 = ((icmp_ln638_reg_1126[0:0] == 1'b1) ? shl_ln639_fu_522_p2 : 8'd0);

assign sext_ln616_1_fu_493_p1 = sh_amt_1_reg_1091;

assign sext_ln616_1cast_fu_553_p1 = sext_ln616_1_fu_493_p1[7:0];

assign sext_ln616_fu_490_p1 = sh_amt_reg_1080;

assign sext_ln616cast_fu_518_p1 = sext_ln616_fu_490_p1[7:0];

assign sh_amt_1_fu_411_p3 = ((icmp_ln616_1_fu_396_p2[0:0] == 1'b1) ? add_ln616_fu_401_p2 : sub_ln616_1_fu_406_p2);

assign sh_amt_fu_389_p3 = ((icmp_ln616_fu_379_p2[0:0] == 1'b1) ? F2_reg_1039 : sub_ln616_fu_384_p2);

assign shl_ln639_1_fu_557_p2 = trunc_ln618_reg_1102 << sext_ln616_1cast_fu_553_p1;

assign shl_ln639_fu_522_p2 = trunc_ln618_reg_1102 << sext_ln616cast_fu_518_p1;

assign sub_ln616_1_fu_406_p2 = (12'd4 - F2_reg_1039);

assign sub_ln616_fu_384_p2 = (12'd0 - F2_reg_1039);

assign tmp_18_fu_446_p4 = {{sh_amt_fu_389_p3[11:3]}};

assign tmp_19_fu_474_p4 = {{sh_amt_1_fu_411_p3[11:3]}};

assign trunc_ln115_fu_244_p1 = ap_sig_allocacmp_i_3[0:0];

assign trunc_ln120_fu_267_p1 = ap_phi_mux_empty_phi_fu_206_p4[31:0];

assign trunc_ln122_fu_713_p1 = i_3_reg_973_pp0_iter7_reg[1:0];

assign trunc_ln592_fu_302_p1 = ireg_fu_298_p1[62:0];

assign trunc_ln600_fu_324_p1 = ireg_fu_298_p1[51:0];

assign trunc_ln610_1_fu_351_p1 = F2_fu_336_p2[10:0];

assign trunc_ln610_fu_342_p1 = F2_fu_336_p2[5:0];

assign trunc_ln618_fu_424_p1 = man_V_3_fu_372_p3[7:0];

assign trunc_ln621_1_fu_508_p1 = ashr_ln621_fu_503_p2[7:0];

assign trunc_ln621_2_fu_543_p1 = ashr_ln621_1_fu_538_p2[7:0];

assign trunc_ln621_fu_496_p1 = sh_amt_reg_1080[10:0];

assign xor_ln121_fu_750_p2 = (icmp_ln121_fu_680_p2 ^ 1'd1);

assign xor_ln606_fu_633_p2 = (icmp_ln606_reg_1030_pp0_iter6_reg ^ 1'd1);

assign xor_ln617_1_fu_720_p2 = (or_ln617_1_fu_716_p2 ^ 1'd1);

assign xor_ln617_fu_689_p2 = (or_ln617_fu_685_p2 ^ 1'd1);

assign zext_ln115_fu_262_p1 = shiftreg_fu_118;

assign zext_ln423_1_fu_623_p1 = qb_1_fu_617_p3;

assign zext_ln423_fu_607_p1 = qb_fu_601_p3;

assign zext_ln501_fu_333_p1 = exp_tmp_reg_1019;

assign zext_ln604_fu_362_p1 = man_V_fu_355_p3;

assign zext_ln621_1_fu_534_p1 = $unsigned(sext_ln616_1_fu_493_p1);

assign zext_ln621_fu_499_p1 = trunc_ln621_fu_496_p1;

assign zext_ln626_1_fu_590_p1 = add_ln626_1_fu_585_p2;

assign zext_ln626_fu_574_p1 = add_ln626_fu_569_p2;

endmodule //pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1
