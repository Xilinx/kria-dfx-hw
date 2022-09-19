// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        rgb_mat_data83_dout,
        rgb_mat_data83_num_data_valid,
        rgb_mat_data83_fifo_cap,
        rgb_mat_data83_empty_n,
        rgb_mat_data83_read,
        resize_out_mat_data84_din,
        resize_out_mat_data84_num_data_valid,
        resize_out_mat_data84_fifo_cap,
        resize_out_mat_data84_full_n,
        resize_out_mat_data84_write,
        indexy_V,
        nextYScale_V,
        ret_V_20,
        loop_col_count,
        cmp352,
        line_buffer_V_address0,
        line_buffer_V_ce0,
        line_buffer_V_we0,
        line_buffer_V_d0,
        line_buffer_V_q0,
        line_buffer_V_address1,
        line_buffer_V_ce1,
        line_buffer_V_q1,
        line_buffer_V_1_address0,
        line_buffer_V_1_ce0,
        line_buffer_V_1_we0,
        line_buffer_V_1_d0,
        line_buffer_V_1_q0,
        line_buffer_V_1_address1,
        line_buffer_V_1_ce1,
        line_buffer_V_1_q1,
        tmp_V,
        first_row_index_4,
        line_buffer_V_2_address0,
        line_buffer_V_2_ce0,
        line_buffer_V_2_we0,
        line_buffer_V_2_d0,
        line_buffer_V_2_q0,
        line_buffer_V_2_address1,
        line_buffer_V_2_ce1,
        line_buffer_V_2_q1,
        trunc_ln3,
        indexy_pre_V,
        add_i_i_i_i_i368_i,
        ret_V_17_cast,
        p_Result_s,
        indexy_pre_V_cast,
        shl_i_i_i_i_i,
        indexx_pre_V_1,
        cmp120,
        p_read1,
        icmp_ln1077_1,
        op2_assign_2,
        op2_assign,
        cmp357,
        p_read3,
        indexy_V_1_out,
        indexy_V_1_out_ap_vld,
        nextYScale_V_1_out,
        nextYScale_V_1_out_ap_vld,
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1,
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2,
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0,
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [23:0] rgb_mat_data83_dout;
input  [1:0] rgb_mat_data83_num_data_valid;
input  [1:0] rgb_mat_data83_fifo_cap;
input   rgb_mat_data83_empty_n;
output   rgb_mat_data83_read;
output  [23:0] resize_out_mat_data84_din;
input  [1:0] resize_out_mat_data84_num_data_valid;
input  [1:0] resize_out_mat_data84_fifo_cap;
input   resize_out_mat_data84_full_n;
output   resize_out_mat_data84_write;
input  [16:0] indexy_V;
input  [16:0] nextYScale_V;
input  [16:0] ret_V_20;
input  [31:0] loop_col_count;
input  [0:0] cmp352;
output  [11:0] line_buffer_V_address0;
output   line_buffer_V_ce0;
output   line_buffer_V_we0;
output  [23:0] line_buffer_V_d0;
input  [23:0] line_buffer_V_q0;
output  [11:0] line_buffer_V_address1;
output   line_buffer_V_ce1;
input  [23:0] line_buffer_V_q1;
output  [11:0] line_buffer_V_1_address0;
output   line_buffer_V_1_ce0;
output   line_buffer_V_1_we0;
output  [23:0] line_buffer_V_1_d0;
input  [23:0] line_buffer_V_1_q0;
output  [11:0] line_buffer_V_1_address1;
output   line_buffer_V_1_ce1;
input  [23:0] line_buffer_V_1_q1;
input  [31:0] tmp_V;
input  [31:0] first_row_index_4;
output  [11:0] line_buffer_V_2_address0;
output   line_buffer_V_2_ce0;
output   line_buffer_V_2_we0;
output  [23:0] line_buffer_V_2_d0;
input  [23:0] line_buffer_V_2_q0;
output  [11:0] line_buffer_V_2_address1;
output   line_buffer_V_2_ce1;
input  [23:0] line_buffer_V_2_q1;
input  [47:0] trunc_ln3;
input  [21:0] indexy_pre_V;
input  [16:0] add_i_i_i_i_i368_i;
input  [16:0] ret_V_17_cast;
input   p_Result_s;
input  [23:0] indexy_pre_V_cast;
input  [53:0] shl_i_i_i_i_i;
input  [41:0] indexx_pre_V_1;
input  [0:0] cmp120;
input  [31:0] p_read1;
input  [0:0] icmp_ln1077_1;
input  [31:0] op2_assign_2;
input  [31:0] op2_assign;
input  [0:0] cmp357;
input  [31:0] p_read3;
output  [16:0] indexy_V_1_out;
output   indexy_V_1_out_ap_vld;
output  [16:0] nextYScale_V_1_out;
output   nextYScale_V_1_out_ap_vld;
output  [31:0] grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1;
output  [47:0] grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2;
input  [41:0] grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0;
output   grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce;

reg ap_idle;
reg rgb_mat_data83_read;
reg resize_out_mat_data84_write;
reg[11:0] line_buffer_V_address0;
reg line_buffer_V_ce0;
reg line_buffer_V_we0;
reg[11:0] line_buffer_V_address1;
reg line_buffer_V_ce1;
reg[11:0] line_buffer_V_1_address0;
reg line_buffer_V_1_ce0;
reg line_buffer_V_1_we0;
reg[11:0] line_buffer_V_1_address1;
reg line_buffer_V_1_ce1;
reg[11:0] line_buffer_V_2_address0;
reg line_buffer_V_2_ce0;
reg line_buffer_V_2_we0;
reg[11:0] line_buffer_V_2_address1;
reg line_buffer_V_2_ce1;
reg indexy_V_1_out_ap_vld;
reg nextYScale_V_1_out_ap_vld;

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
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_enable_reg_pp0_iter15;
reg    ap_enable_reg_pp0_iter16;
reg    ap_enable_reg_pp0_iter17;
reg    ap_enable_reg_pp0_iter18;
reg    ap_enable_reg_pp0_iter19;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
reg   [0:0] icmp_ln394_reg_1667;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter7_reg;
reg   [0:0] and_ln411_reg_1676;
reg   [0:0] and_ln411_reg_1676_pp0_iter7_reg;
reg    ap_predicate_op105_read_state9;
reg    ap_block_state9_pp0_stage0_iter8;
wire    ap_block_state10_pp0_stage0_iter9;
wire    ap_block_state11_pp0_stage0_iter10;
wire    ap_block_state12_pp0_stage0_iter11;
wire    ap_block_state13_pp0_stage0_iter12;
wire    ap_block_state14_pp0_stage0_iter13;
wire    ap_block_state15_pp0_stage0_iter14;
wire    ap_block_state16_pp0_stage0_iter15;
wire    ap_block_state17_pp0_stage0_iter16;
wire    ap_block_state18_pp0_stage0_iter17;
wire    ap_block_state19_pp0_stage0_iter18;
reg   [0:0] and_ln492_reg_1701;
reg   [0:0] and_ln492_reg_1701_pp0_iter18_reg;
reg   [0:0] icmp_ln494_reg_1680;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter18_reg;
reg   [0:0] and_ln491_reg_1705;
reg   [0:0] and_ln491_reg_1705_pp0_iter18_reg;
reg    ap_predicate_op337_write_state20;
reg    ap_block_state20_pp0_stage0_iter19;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln394_fu_627_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    rgb_mat_data83_blk_n;
wire    ap_block_pp0_stage0;
reg    resize_out_mat_data84_blk_n;
reg   [23:0] reg_569;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter9_reg;
wire   [31:0] first_row_index_4_read_reg_1648;
reg   [0:0] icmp_ln1065_reg_1695;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter9_reg;
reg   [23:0] reg_575;
reg   [23:0] reg_581;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter10_reg;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter10_reg;
wire   [0:0] cmp120_read_read_fu_216_p2;
wire   [0:0] p_Result_read_read_fu_240_p2;
wire   [0:0] cmp352_read_read_fu_282_p2;
reg   [30:0] j_1_reg_1661;
reg   [30:0] j_1_reg_1661_pp0_iter1_reg;
reg   [30:0] j_1_reg_1661_pp0_iter2_reg;
reg   [30:0] j_1_reg_1661_pp0_iter3_reg;
reg   [30:0] j_1_reg_1661_pp0_iter4_reg;
reg   [30:0] j_1_reg_1661_pp0_iter5_reg;
reg   [30:0] j_1_reg_1661_pp0_iter6_reg;
reg   [30:0] j_1_reg_1661_pp0_iter7_reg;
reg   [30:0] j_1_reg_1661_pp0_iter8_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter1_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter2_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter3_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter4_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter5_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter6_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter8_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter11_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter12_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter13_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter14_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter15_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter16_reg;
reg   [0:0] icmp_ln394_reg_1667_pp0_iter17_reg;
wire   [0:0] icmp_ln1049_fu_639_p2;
reg   [0:0] icmp_ln1049_reg_1671;
wire   [0:0] and_ln411_fu_651_p2;
reg   [0:0] and_ln411_reg_1676_pp0_iter1_reg;
reg   [0:0] and_ln411_reg_1676_pp0_iter2_reg;
reg   [0:0] and_ln411_reg_1676_pp0_iter3_reg;
reg   [0:0] and_ln411_reg_1676_pp0_iter4_reg;
reg   [0:0] and_ln411_reg_1676_pp0_iter5_reg;
reg   [0:0] and_ln411_reg_1676_pp0_iter6_reg;
wire   [0:0] icmp_ln494_fu_657_p2;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter1_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter2_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter3_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter4_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter5_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter6_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter7_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter8_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter9_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter10_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter11_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter12_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter13_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter14_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter15_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter16_reg;
reg   [0:0] icmp_ln494_reg_1680_pp0_iter17_reg;
wire   [31:0] zext_ln400_fu_676_p1;
wire   [1:0] trunc_ln884_fu_692_p1;
reg   [1:0] trunc_ln884_reg_1690;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter2_reg;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter3_reg;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter4_reg;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter5_reg;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter6_reg;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter7_reg;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter8_reg;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter9_reg;
reg   [1:0] trunc_ln884_reg_1690_pp0_iter10_reg;
wire   [0:0] icmp_ln1065_fu_700_p2;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter2_reg;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter3_reg;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter4_reg;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter5_reg;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter6_reg;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter7_reg;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter8_reg;
reg   [0:0] icmp_ln1065_reg_1695_pp0_iter11_reg;
wire   [0:0] and_ln492_fu_705_p2;
reg   [0:0] and_ln492_reg_1701_pp0_iter2_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter3_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter4_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter5_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter6_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter7_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter8_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter9_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter10_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter11_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter12_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter13_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter14_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter15_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter16_reg;
reg   [0:0] and_ln492_reg_1701_pp0_iter17_reg;
wire   [0:0] and_ln491_fu_715_p2;
reg   [0:0] and_ln491_reg_1705_pp0_iter2_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter3_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter4_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter5_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter6_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter7_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter8_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter9_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter10_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter11_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter12_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter13_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter14_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter15_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter16_reg;
reg   [0:0] and_ln491_reg_1705_pp0_iter17_reg;
reg  signed [41:0] indexx_pre_comp_V_reg_1709;
wire   [0:0] icmp_ln1695_fu_729_p2;
reg   [0:0] icmp_ln1695_reg_1715;
wire   [16:0] idx_2_fu_796_p3;
reg   [16:0] idx_2_reg_1720;
wire   [1:0] trunc_ln884_1_fu_804_p1;
reg   [1:0] trunc_ln884_1_reg_1727;
wire   [23:0] trunc_ln859_fu_808_p1;
reg   [23:0] trunc_ln859_reg_1732;
wire   [11:0] idx_nxt_fu_845_p2;
reg   [11:0] idx_nxt_reg_1742;
wire   [11:0] line_buffer_V_1_addr_gep_fu_386_p3;
wire   [11:0] line_buffer_V_2_addr_gep_fu_402_p3;
wire   [11:0] line_buffer_V_addr_gep_fu_410_p3;
reg   [11:0] Wx_V_reg_1777;
reg   [11:0] Wx_V_reg_1777_pp0_iter10_reg;
reg   [11:0] Wx_V_reg_1777_pp0_iter11_reg;
reg   [11:0] Wx_V_reg_1777_pp0_iter12_reg;
wire   [11:0] line_buffer_V_1_addr_1_gep_fu_462_p3;
wire   [11:0] line_buffer_V_2_addr_1_gep_fu_470_p3;
wire   [11:0] line_buffer_V_addr_1_gep_fu_478_p3;
wire   [11:0] Wy_V_fu_891_p4;
reg   [11:0] Wy_V_reg_1813;
wire   [7:0] trunc_ln674_fu_922_p1;
reg   [7:0] trunc_ln674_reg_1828;
reg   [7:0] trunc_ln674_reg_1828_pp0_iter13_reg;
reg   [7:0] trunc_ln674_reg_1828_pp0_iter14_reg;
reg   [7:0] trunc_ln674_reg_1828_pp0_iter15_reg;
reg   [7:0] trunc_ln674_reg_1828_pp0_iter16_reg;
reg   [7:0] trunc_ln674_reg_1828_pp0_iter17_reg;
wire   [9:0] val0_V_fu_974_p2;
reg   [9:0] val0_V_reg_1833;
reg  signed [9:0] val0_V_reg_1833_pp0_iter13_reg;
wire   [8:0] val2_V_fu_986_p2;
reg  signed [8:0] val2_V_reg_1838;
wire   [20:0] zext_ln1319_fu_996_p1;
wire   [9:0] val0_V_1_fu_1075_p2;
reg   [9:0] val0_V_1_reg_1855;
reg  signed [9:0] val0_V_1_reg_1855_pp0_iter13_reg;
wire   [8:0] val2_V_1_fu_1087_p2;
reg  signed [8:0] val2_V_1_reg_1860;
reg   [7:0] tmp_6_reg_1870;
reg   [7:0] tmp_6_reg_1870_pp0_iter13_reg;
reg   [7:0] tmp_6_reg_1870_pp0_iter14_reg;
reg   [7:0] tmp_6_reg_1870_pp0_iter15_reg;
reg   [7:0] tmp_6_reg_1870_pp0_iter16_reg;
reg   [7:0] tmp_6_reg_1870_pp0_iter17_reg;
wire   [9:0] val0_V_2_fu_1183_p2;
reg   [9:0] val0_V_2_reg_1875;
reg  signed [9:0] val0_V_2_reg_1875_pp0_iter13_reg;
wire   [8:0] val2_V_2_fu_1195_p2;
reg  signed [8:0] val2_V_2_reg_1880;
reg   [7:0] tmp_11_reg_1890;
reg   [7:0] tmp_11_reg_1890_pp0_iter13_reg;
reg   [7:0] tmp_11_reg_1890_pp0_iter14_reg;
reg   [7:0] tmp_11_reg_1890_pp0_iter15_reg;
reg   [7:0] tmp_11_reg_1890_pp0_iter16_reg;
reg   [7:0] tmp_11_reg_1890_pp0_iter17_reg;
wire   [20:0] zext_ln1319_1_fu_1218_p1;
wire   [21:0] zext_ln864_1_fu_1236_p1;
wire  signed [22:0] grp_fu_1548_p3;
reg  signed [22:0] ret_V_21_reg_1969;
wire  signed [22:0] grp_fu_1556_p3;
reg  signed [22:0] ret_V_22_reg_1974;
wire  signed [22:0] grp_fu_1564_p3;
reg  signed [22:0] ret_V_23_reg_1979;
wire   [7:0] ret_V_10_fu_1329_p3;
reg   [7:0] ret_V_10_reg_1984;
wire   [7:0] ret_V_14_fu_1399_p3;
reg   [7:0] ret_V_14_reg_1989;
wire   [7:0] ret_V_18_fu_1469_p3;
reg   [7:0] ret_V_18_reg_1994;
reg    grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce;
wire    ap_block_state1_pp0_stage0_iter0_ignore_call6;
wire    ap_block_state2_pp0_stage0_iter1_ignore_call6;
wire    ap_block_state3_pp0_stage0_iter2_ignore_call6;
wire    ap_block_state4_pp0_stage0_iter3_ignore_call6;
wire    ap_block_state5_pp0_stage0_iter4_ignore_call6;
wire    ap_block_state6_pp0_stage0_iter5_ignore_call6;
wire    ap_block_state7_pp0_stage0_iter6_ignore_call6;
wire    ap_block_state8_pp0_stage0_iter7_ignore_call6;
reg    ap_block_state9_pp0_stage0_iter8_ignore_call6;
wire    ap_block_state10_pp0_stage0_iter9_ignore_call6;
wire    ap_block_state11_pp0_stage0_iter10_ignore_call6;
wire    ap_block_state12_pp0_stage0_iter11_ignore_call6;
wire    ap_block_state13_pp0_stage0_iter12_ignore_call6;
wire    ap_block_state14_pp0_stage0_iter13_ignore_call6;
wire    ap_block_state15_pp0_stage0_iter14_ignore_call6;
wire    ap_block_state16_pp0_stage0_iter15_ignore_call6;
wire    ap_block_state17_pp0_stage0_iter16_ignore_call6;
wire    ap_block_state18_pp0_stage0_iter17_ignore_call6;
wire    ap_block_state19_pp0_stage0_iter18_ignore_call6;
reg    ap_block_state20_pp0_stage0_iter19_ignore_call6;
reg    ap_block_pp0_stage0_11001_ignoreCallOp71;
wire   [23:0] ap_phi_reg_pp0_iter0_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter1_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter2_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter3_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter4_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter5_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter6_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter7_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter8_read_pixel_1_reg_486;
reg   [23:0] ap_phi_reg_pp0_iter9_read_pixel_1_reg_486;
wire   [0:0] ap_phi_mux_flag_write_phi_fu_508_p6;
wire   [0:0] ap_phi_reg_pp0_iter0_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter1_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter2_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter3_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter4_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter5_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter6_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter7_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter8_flag_write_reg_503;
reg   [0:0] ap_phi_reg_pp0_iter9_flag_write_reg_503;
wire   [23:0] ap_phi_reg_pp0_iter0_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter1_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter2_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter3_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter4_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter5_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter6_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter7_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter8_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter9_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter10_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter11_P0Buf_V_7_reg_519;
reg   [23:0] ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519;
wire   [23:0] ap_phi_reg_pp0_iter0_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter1_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter2_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter3_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter4_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter5_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter6_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter7_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter8_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter9_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter10_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter11_P0Buf_V_6_reg_530;
reg   [23:0] ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530;
wire   [23:0] ap_phi_reg_pp0_iter0_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter1_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter2_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter3_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter4_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter5_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter6_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter7_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter8_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter9_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter10_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter11_P1Buf_V_9_reg_541;
reg   [23:0] ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541;
wire   [23:0] ap_phi_reg_pp0_iter0_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter1_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter2_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter3_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter4_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter5_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter6_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter7_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter8_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter9_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter10_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter11_P1Buf_V_8_reg_552;
reg   [23:0] ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552;
wire   [63:0] zext_ln435_fu_851_p1;
wire   [63:0] zext_ln394_fu_812_p1;
wire   [63:0] zext_ln436_fu_870_p1;
reg   [16:0] nextYScale_V_1_fu_168;
wire    ap_loop_init;
reg   [16:0] tmp_fu_172;
wire   [16:0] ret_V_19_fu_686_p3;
reg   [30:0] j_fu_176;
wire   [30:0] add_ln394_fu_633_p2;
reg   [30:0] ap_sig_allocacmp_j_1;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] zext_ln394_1_fu_623_p1;
wire   [0:0] icmp_ln413_fu_645_p2;
wire   [19:0] trunc_ln400_fu_673_p1;
wire   [0:0] ret_V_19_fu_686_p0;
wire   [16:0] select_ln1048_fu_681_p3;
wire   [31:0] zext_ln1065_fu_696_p1;
wire   [0:0] icmp_ln1065_1_fu_710_p2;
wire  signed [41:0] sext_ln1696_fu_725_p0;
wire  signed [53:0] sext_ln1696_fu_725_p1;
wire   [0:0] tmp_2_fu_734_p3;
wire   [41:0] indexx_pre_V_3_fu_741_p3;
wire   [41:0] indexx_pre_V_fu_746_p3;
wire   [21:0] trunc_ln1049_fu_772_p1;
wire   [16:0] trunc_ln_fu_754_p4;
wire   [0:0] icmp_ln1049_1_fu_776_p2;
wire   [16:0] ret_V_4_fu_782_p2;
wire   [0:0] p_Result_1_fu_764_p3;
wire   [16:0] select_ln1048_1_fu_788_p3;
wire   [23:0] rhs_1_fu_818_p3;
wire   [31:0] idx_fu_830_p1;
wire   [0:0] not_cmp_i_i176_fu_836_p2;
wire   [11:0] empty_fu_833_p1;
wire   [11:0] zext_ln433_fu_841_p1;
wire   [23:0] ret_V_6_fu_825_p2;
wire   [23:0] rhs_fu_879_p3;
wire   [23:0] ret_V_fu_886_p2;
wire   [23:0] P0Buf_V_10_fu_915_p3;
wire   [23:0] P0Buf_V_11_fu_908_p3;
wire   [7:0] trunc_ln674_3_fu_934_p1;
wire   [7:0] trunc_ln674_1_fu_926_p1;
wire   [7:0] trunc_ln674_2_fu_930_p1;
wire   [8:0] zext_ln1541_fu_938_p1;
wire   [8:0] zext_ln1541_2_fu_946_p1;
wire   [8:0] sub_ln75_fu_958_p2;
wire  signed [9:0] sext_ln75_fu_964_p1;
wire   [9:0] zext_ln1541_3_fu_950_p1;
wire   [9:0] sub_ln75_1_fu_968_p2;
wire   [9:0] zext_ln1541_1_fu_942_p1;
wire   [8:0] zext_ln75_fu_954_p1;
wire  signed [8:0] val1_V_fu_980_p2;
wire   [7:0] tmp_s_fu_999_p4;
wire   [7:0] tmp_5_fu_1029_p4;
wire   [7:0] tmp_3_fu_1009_p4;
wire   [7:0] tmp_4_fu_1019_p4;
wire   [8:0] zext_ln1541_4_fu_1039_p1;
wire   [8:0] zext_ln1541_6_fu_1047_p1;
wire   [8:0] sub_ln75_4_fu_1059_p2;
wire  signed [9:0] sext_ln75_1_fu_1065_p1;
wire   [9:0] zext_ln1541_7_fu_1051_p1;
wire   [9:0] sub_ln75_5_fu_1069_p2;
wire   [9:0] zext_ln1541_5_fu_1043_p1;
wire   [8:0] zext_ln75_1_fu_1055_p1;
wire  signed [8:0] val1_V_1_fu_1081_p2;
wire   [7:0] tmp_7_fu_1107_p4;
wire   [7:0] tmp_10_fu_1137_p4;
wire   [7:0] tmp_8_fu_1117_p4;
wire   [7:0] tmp_9_fu_1127_p4;
wire   [8:0] zext_ln1541_8_fu_1147_p1;
wire   [8:0] zext_ln1541_10_fu_1155_p1;
wire   [8:0] sub_ln75_8_fu_1167_p2;
wire  signed [9:0] sext_ln75_2_fu_1173_p1;
wire   [9:0] zext_ln1541_11_fu_1159_p1;
wire   [9:0] sub_ln75_9_fu_1177_p2;
wire   [9:0] zext_ln1541_9_fu_1151_p1;
wire   [8:0] zext_ln75_2_fu_1163_p1;
wire  signed [8:0] val1_V_2_fu_1189_p2;
wire   [23:0] Wxy_V_fu_1227_p1;
wire  signed [23:0] grp_fu_1493_p2;
wire   [11:0] Wxy_V_fu_1227_p4;
wire  signed [20:0] grp_fu_1500_p2;
wire  signed [20:0] grp_fu_1507_p2;
wire  signed [20:0] grp_fu_1514_p2;
wire  signed [21:0] grp_fu_1521_p3;
wire  signed [21:0] grp_fu_1530_p3;
wire  signed [21:0] grp_fu_1539_p3;
wire   [17:0] P4_V_fu_1267_p3;
wire  signed [23:0] sext_ln1393_1_fu_1274_p1;
wire   [23:0] zext_ln1393_fu_1277_p1;
wire   [23:0] ret_V_8_fu_1281_p2;
wire   [9:0] trunc_ln1049_1_fu_1305_p1;
wire   [7:0] trunc_ln1029_1_fu_1287_p4;
wire   [0:0] icmp_ln1049_2_fu_1309_p2;
wire   [7:0] ret_V_9_fu_1315_p2;
wire   [0:0] p_Result_6_fu_1297_p3;
wire   [7:0] select_ln1048_3_fu_1321_p3;
wire   [17:0] P4_V_1_fu_1337_p3;
wire  signed [23:0] sext_ln1393_4_fu_1344_p1;
wire   [23:0] zext_ln1393_1_fu_1347_p1;
wire   [23:0] ret_V_12_fu_1351_p2;
wire   [9:0] trunc_ln1049_2_fu_1375_p1;
wire   [7:0] trunc_ln1029_2_fu_1357_p4;
wire   [0:0] icmp_ln1049_3_fu_1379_p2;
wire   [7:0] ret_V_13_fu_1385_p2;
wire   [0:0] p_Result_7_fu_1367_p3;
wire   [7:0] select_ln1048_4_fu_1391_p3;
wire   [17:0] P4_V_2_fu_1407_p3;
wire  signed [23:0] sext_ln1393_7_fu_1414_p1;
wire   [23:0] zext_ln1393_2_fu_1417_p1;
wire   [23:0] ret_V_16_fu_1421_p2;
wire   [9:0] trunc_ln1049_3_fu_1445_p1;
wire   [7:0] trunc_ln1029_3_fu_1427_p4;
wire   [0:0] icmp_ln1049_4_fu_1449_p2;
wire   [7:0] ret_V_17_fu_1455_p2;
wire   [0:0] p_Result_8_fu_1437_p3;
wire   [7:0] select_ln1048_5_fu_1461_p3;
wire   [11:0] grp_fu_1493_p0;
wire   [11:0] grp_fu_1493_p1;
wire   [11:0] grp_fu_1500_p0;
wire   [11:0] grp_fu_1507_p0;
wire   [11:0] grp_fu_1514_p0;
wire   [11:0] grp_fu_1521_p0;
wire   [11:0] grp_fu_1530_p0;
wire   [11:0] grp_fu_1539_p0;
wire   [11:0] grp_fu_1548_p0;
wire   [11:0] grp_fu_1556_p0;
wire   [11:0] grp_fu_1564_p0;
reg    grp_fu_1493_ce;
reg    grp_fu_1500_ce;
reg    grp_fu_1507_ce;
reg    grp_fu_1514_ce;
reg    grp_fu_1521_ce;
reg    grp_fu_1530_ce;
reg    grp_fu_1539_ce;
reg    grp_fu_1548_ce;
reg    grp_fu_1556_ce;
reg    grp_fu_1564_ce;
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
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg    ap_loop_exit_ready_pp0_iter10_reg;
reg    ap_loop_exit_ready_pp0_iter11_reg;
reg    ap_loop_exit_ready_pp0_iter12_reg;
reg    ap_loop_exit_ready_pp0_iter13_reg;
reg    ap_loop_exit_ready_pp0_iter14_reg;
reg    ap_loop_exit_ready_pp0_iter15_reg;
reg    ap_loop_exit_ready_pp0_iter16_reg;
reg    ap_loop_exit_ready_pp0_iter17_reg;
reg    ap_loop_exit_ready_pp0_iter18_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire   [23:0] grp_fu_1493_p00;
wire   [23:0] grp_fu_1493_p10;
reg    ap_condition_346;
reg    ap_condition_108;
reg    ap_condition_691;
reg    ap_condition_1094;
reg    ap_condition_1999;
reg    ap_condition_708;
reg    ap_condition_2006;
reg    ap_condition_699;
reg    ap_condition_707;
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
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_enable_reg_pp0_iter15 = 1'b0;
#0 ap_enable_reg_pp0_iter16 = 1'b0;
#0 ap_enable_reg_pp0_iter17 = 1'b0;
#0 ap_enable_reg_pp0_iter18 = 1'b0;
#0 ap_enable_reg_pp0_iter19 = 1'b0;
#0 ap_done_reg = 1'b0;
end

pp_pipeline_accel_mul_mul_12ns_12ns_24_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 12 ),
    .dout_WIDTH( 24 ))
mul_mul_12ns_12ns_24_4_1_U191(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1493_p0),
    .din1(grp_fu_1493_p1),
    .ce(grp_fu_1493_ce),
    .dout(grp_fu_1493_p2)
);

pp_pipeline_accel_mul_mul_12ns_9s_21_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 21 ))
mul_mul_12ns_9s_21_4_1_U192(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1500_p0),
    .din1(val1_V_fu_980_p2),
    .ce(grp_fu_1500_ce),
    .dout(grp_fu_1500_p2)
);

pp_pipeline_accel_mul_mul_12ns_9s_21_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 21 ))
mul_mul_12ns_9s_21_4_1_U193(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1507_p0),
    .din1(val1_V_1_fu_1081_p2),
    .ce(grp_fu_1507_ce),
    .dout(grp_fu_1507_p2)
);

pp_pipeline_accel_mul_mul_12ns_9s_21_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 21 ))
mul_mul_12ns_9s_21_4_1_U194(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1514_p0),
    .din1(val1_V_2_fu_1189_p2),
    .ce(grp_fu_1514_ce),
    .dout(grp_fu_1514_p2)
);

pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 9 ),
    .din2_WIDTH( 21 ),
    .dout_WIDTH( 22 ))
mac_muladd_12ns_9s_21s_22_4_1_U195(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1521_p0),
    .din1(val2_V_reg_1838),
    .din2(grp_fu_1500_p2),
    .ce(grp_fu_1521_ce),
    .dout(grp_fu_1521_p3)
);

pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 9 ),
    .din2_WIDTH( 21 ),
    .dout_WIDTH( 22 ))
mac_muladd_12ns_9s_21s_22_4_1_U196(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1530_p0),
    .din1(val2_V_1_reg_1860),
    .din2(grp_fu_1507_p2),
    .ce(grp_fu_1530_ce),
    .dout(grp_fu_1530_p3)
);

pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 9 ),
    .din2_WIDTH( 21 ),
    .dout_WIDTH( 22 ))
mac_muladd_12ns_9s_21s_22_4_1_U197(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1539_p0),
    .din1(val2_V_2_reg_1880),
    .din2(grp_fu_1514_p2),
    .ce(grp_fu_1539_ce),
    .dout(grp_fu_1539_p3)
);

pp_pipeline_accel_mac_muladd_12ns_10s_22s_23_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 10 ),
    .din2_WIDTH( 22 ),
    .dout_WIDTH( 23 ))
mac_muladd_12ns_10s_22s_23_4_1_U198(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1548_p0),
    .din1(val0_V_reg_1833_pp0_iter13_reg),
    .din2(grp_fu_1521_p3),
    .ce(grp_fu_1548_ce),
    .dout(grp_fu_1548_p3)
);

pp_pipeline_accel_mac_muladd_12ns_10s_22s_23_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 10 ),
    .din2_WIDTH( 22 ),
    .dout_WIDTH( 23 ))
mac_muladd_12ns_10s_22s_23_4_1_U199(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1556_p0),
    .din1(val0_V_1_reg_1855_pp0_iter13_reg),
    .din2(grp_fu_1530_p3),
    .ce(grp_fu_1556_ce),
    .dout(grp_fu_1556_p3)
);

pp_pipeline_accel_mac_muladd_12ns_10s_22s_23_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 10 ),
    .din2_WIDTH( 22 ),
    .dout_WIDTH( 23 ))
mac_muladd_12ns_10s_22s_23_4_1_U200(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_1564_p0),
    .din1(val0_V_2_reg_1875_pp0_iter13_reg),
    .din2(grp_fu_1539_p3),
    .ce(grp_fu_1564_ce),
    .dout(grp_fu_1564_p3)
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
        end else if (((ap_loop_exit_ready_pp0_iter18_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter15 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter16 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter16 <= ap_enable_reg_pp0_iter15;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter17 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter17 <= ap_enable_reg_pp0_iter16;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter18 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter18 <= ap_enable_reg_pp0_iter17;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter19 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter19 <= ap_enable_reg_pp0_iter18;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter11 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd1))) begin
            ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 <= reg_569;
        end else if ((1'b1 == ap_condition_346)) begin
            ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 <= reg_575;
        end else if (((icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd0))) begin
            ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 <= reg_581;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter11_P0Buf_V_6_reg_530;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter11 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd1))) begin
            ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 <= line_buffer_V_1_q1;
        end else if ((1'b1 == ap_condition_346)) begin
            ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 <= line_buffer_V_2_q1;
        end else if (((icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd0))) begin
            ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 <= line_buffer_V_q1;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter11_P0Buf_V_7_reg_519;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter11 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd1))) begin
            ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 <= line_buffer_V_2_q1;
        end else if ((1'b1 == ap_condition_346)) begin
            ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 <= line_buffer_V_q1;
        end else if (((icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd0))) begin
            ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 <= line_buffer_V_1_q1;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter11_P1Buf_V_8_reg_552;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter11 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd1))) begin
            ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 <= reg_575;
        end else if ((1'b1 == ap_condition_346)) begin
            ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 <= reg_581;
        end else if (((icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd0))) begin
            ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 <= reg_569;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter11_P1Buf_V_9_reg_541;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((((cmp120_read_read_fu_216_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln394_fu_627_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'd0 == and_ln411_fu_651_p2)) | ((cmp120_read_read_fu_216_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln394_fu_627_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ap_phi_reg_pp0_iter1_flag_write_reg_503 <= 1'd0;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter1_flag_write_reg_503 <= ap_phi_reg_pp0_iter0_flag_write_reg_503;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((1'b1 == ap_condition_108)) begin
            ap_phi_reg_pp0_iter9_flag_write_reg_503 <= 1'd1;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter9_flag_write_reg_503 <= ap_phi_reg_pp0_iter8_flag_write_reg_503;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((1'b1 == ap_condition_108)) begin
            ap_phi_reg_pp0_iter9_read_pixel_1_reg_486 <= rgb_mat_data83_dout;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter9_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter8_read_pixel_1_reg_486;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln394_fu_627_p2 == 1'd1))) begin
            j_fu_176 <= add_ln394_fu_633_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_176 <= 31'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln394_fu_627_p2 == 1'd1))) begin
            nextYScale_V_1_fu_168 <= ret_V_20;
        end else if ((ap_loop_init == 1'b1)) begin
            nextYScale_V_1_fu_168 <= nextYScale_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            tmp_fu_172 <= indexy_V;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            tmp_fu_172 <= ret_V_19_fu_686_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (((1'd0 == and_ln492_reg_1701_pp0_iter8_reg) & (cmp352 == 1'd1) & (1'd1 == and_ln491_reg_1705_pp0_iter8_reg)) | ((icmp_ln494_reg_1680_pp0_iter8_reg == 1'd1) & (cmp352 == 1'd1) & (1'd1 == and_ln492_reg_1701_pp0_iter8_reg))))) begin
        Wx_V_reg_1777 <= {{ret_V_6_fu_825_p2[23:12]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        Wx_V_reg_1777_pp0_iter10_reg <= Wx_V_reg_1777;
        Wx_V_reg_1777_pp0_iter11_reg <= Wx_V_reg_1777_pp0_iter10_reg;
        Wx_V_reg_1777_pp0_iter12_reg <= Wx_V_reg_1777_pp0_iter11_reg;
        and_ln411_reg_1676_pp0_iter2_reg <= and_ln411_reg_1676_pp0_iter1_reg;
        and_ln411_reg_1676_pp0_iter3_reg <= and_ln411_reg_1676_pp0_iter2_reg;
        and_ln411_reg_1676_pp0_iter4_reg <= and_ln411_reg_1676_pp0_iter3_reg;
        and_ln411_reg_1676_pp0_iter5_reg <= and_ln411_reg_1676_pp0_iter4_reg;
        and_ln411_reg_1676_pp0_iter6_reg <= and_ln411_reg_1676_pp0_iter5_reg;
        and_ln411_reg_1676_pp0_iter7_reg <= and_ln411_reg_1676_pp0_iter6_reg;
        and_ln491_reg_1705_pp0_iter10_reg <= and_ln491_reg_1705_pp0_iter9_reg;
        and_ln491_reg_1705_pp0_iter11_reg <= and_ln491_reg_1705_pp0_iter10_reg;
        and_ln491_reg_1705_pp0_iter12_reg <= and_ln491_reg_1705_pp0_iter11_reg;
        and_ln491_reg_1705_pp0_iter13_reg <= and_ln491_reg_1705_pp0_iter12_reg;
        and_ln491_reg_1705_pp0_iter14_reg <= and_ln491_reg_1705_pp0_iter13_reg;
        and_ln491_reg_1705_pp0_iter15_reg <= and_ln491_reg_1705_pp0_iter14_reg;
        and_ln491_reg_1705_pp0_iter16_reg <= and_ln491_reg_1705_pp0_iter15_reg;
        and_ln491_reg_1705_pp0_iter17_reg <= and_ln491_reg_1705_pp0_iter16_reg;
        and_ln491_reg_1705_pp0_iter18_reg <= and_ln491_reg_1705_pp0_iter17_reg;
        and_ln491_reg_1705_pp0_iter2_reg <= and_ln491_reg_1705;
        and_ln491_reg_1705_pp0_iter3_reg <= and_ln491_reg_1705_pp0_iter2_reg;
        and_ln491_reg_1705_pp0_iter4_reg <= and_ln491_reg_1705_pp0_iter3_reg;
        and_ln491_reg_1705_pp0_iter5_reg <= and_ln491_reg_1705_pp0_iter4_reg;
        and_ln491_reg_1705_pp0_iter6_reg <= and_ln491_reg_1705_pp0_iter5_reg;
        and_ln491_reg_1705_pp0_iter7_reg <= and_ln491_reg_1705_pp0_iter6_reg;
        and_ln491_reg_1705_pp0_iter8_reg <= and_ln491_reg_1705_pp0_iter7_reg;
        and_ln491_reg_1705_pp0_iter9_reg <= and_ln491_reg_1705_pp0_iter8_reg;
        and_ln492_reg_1701_pp0_iter10_reg <= and_ln492_reg_1701_pp0_iter9_reg;
        and_ln492_reg_1701_pp0_iter11_reg <= and_ln492_reg_1701_pp0_iter10_reg;
        and_ln492_reg_1701_pp0_iter12_reg <= and_ln492_reg_1701_pp0_iter11_reg;
        and_ln492_reg_1701_pp0_iter13_reg <= and_ln492_reg_1701_pp0_iter12_reg;
        and_ln492_reg_1701_pp0_iter14_reg <= and_ln492_reg_1701_pp0_iter13_reg;
        and_ln492_reg_1701_pp0_iter15_reg <= and_ln492_reg_1701_pp0_iter14_reg;
        and_ln492_reg_1701_pp0_iter16_reg <= and_ln492_reg_1701_pp0_iter15_reg;
        and_ln492_reg_1701_pp0_iter17_reg <= and_ln492_reg_1701_pp0_iter16_reg;
        and_ln492_reg_1701_pp0_iter18_reg <= and_ln492_reg_1701_pp0_iter17_reg;
        and_ln492_reg_1701_pp0_iter2_reg <= and_ln492_reg_1701;
        and_ln492_reg_1701_pp0_iter3_reg <= and_ln492_reg_1701_pp0_iter2_reg;
        and_ln492_reg_1701_pp0_iter4_reg <= and_ln492_reg_1701_pp0_iter3_reg;
        and_ln492_reg_1701_pp0_iter5_reg <= and_ln492_reg_1701_pp0_iter4_reg;
        and_ln492_reg_1701_pp0_iter6_reg <= and_ln492_reg_1701_pp0_iter5_reg;
        and_ln492_reg_1701_pp0_iter7_reg <= and_ln492_reg_1701_pp0_iter6_reg;
        and_ln492_reg_1701_pp0_iter8_reg <= and_ln492_reg_1701_pp0_iter7_reg;
        and_ln492_reg_1701_pp0_iter9_reg <= and_ln492_reg_1701_pp0_iter8_reg;
        ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
        ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
        ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
        ap_loop_exit_ready_pp0_iter13_reg <= ap_loop_exit_ready_pp0_iter12_reg;
        ap_loop_exit_ready_pp0_iter14_reg <= ap_loop_exit_ready_pp0_iter13_reg;
        ap_loop_exit_ready_pp0_iter15_reg <= ap_loop_exit_ready_pp0_iter14_reg;
        ap_loop_exit_ready_pp0_iter16_reg <= ap_loop_exit_ready_pp0_iter15_reg;
        ap_loop_exit_ready_pp0_iter17_reg <= ap_loop_exit_ready_pp0_iter16_reg;
        ap_loop_exit_ready_pp0_iter18_reg <= ap_loop_exit_ready_pp0_iter17_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
        icmp_ln1065_reg_1695_pp0_iter10_reg <= icmp_ln1065_reg_1695_pp0_iter9_reg;
        icmp_ln1065_reg_1695_pp0_iter11_reg <= icmp_ln1065_reg_1695_pp0_iter10_reg;
        icmp_ln1065_reg_1695_pp0_iter2_reg <= icmp_ln1065_reg_1695;
        icmp_ln1065_reg_1695_pp0_iter3_reg <= icmp_ln1065_reg_1695_pp0_iter2_reg;
        icmp_ln1065_reg_1695_pp0_iter4_reg <= icmp_ln1065_reg_1695_pp0_iter3_reg;
        icmp_ln1065_reg_1695_pp0_iter5_reg <= icmp_ln1065_reg_1695_pp0_iter4_reg;
        icmp_ln1065_reg_1695_pp0_iter6_reg <= icmp_ln1065_reg_1695_pp0_iter5_reg;
        icmp_ln1065_reg_1695_pp0_iter7_reg <= icmp_ln1065_reg_1695_pp0_iter6_reg;
        icmp_ln1065_reg_1695_pp0_iter8_reg <= icmp_ln1065_reg_1695_pp0_iter7_reg;
        icmp_ln1065_reg_1695_pp0_iter9_reg <= icmp_ln1065_reg_1695_pp0_iter8_reg;
        icmp_ln394_reg_1667_pp0_iter10_reg <= icmp_ln394_reg_1667_pp0_iter9_reg;
        icmp_ln394_reg_1667_pp0_iter11_reg <= icmp_ln394_reg_1667_pp0_iter10_reg;
        icmp_ln394_reg_1667_pp0_iter12_reg <= icmp_ln394_reg_1667_pp0_iter11_reg;
        icmp_ln394_reg_1667_pp0_iter13_reg <= icmp_ln394_reg_1667_pp0_iter12_reg;
        icmp_ln394_reg_1667_pp0_iter14_reg <= icmp_ln394_reg_1667_pp0_iter13_reg;
        icmp_ln394_reg_1667_pp0_iter15_reg <= icmp_ln394_reg_1667_pp0_iter14_reg;
        icmp_ln394_reg_1667_pp0_iter16_reg <= icmp_ln394_reg_1667_pp0_iter15_reg;
        icmp_ln394_reg_1667_pp0_iter17_reg <= icmp_ln394_reg_1667_pp0_iter16_reg;
        icmp_ln394_reg_1667_pp0_iter2_reg <= icmp_ln394_reg_1667_pp0_iter1_reg;
        icmp_ln394_reg_1667_pp0_iter3_reg <= icmp_ln394_reg_1667_pp0_iter2_reg;
        icmp_ln394_reg_1667_pp0_iter4_reg <= icmp_ln394_reg_1667_pp0_iter3_reg;
        icmp_ln394_reg_1667_pp0_iter5_reg <= icmp_ln394_reg_1667_pp0_iter4_reg;
        icmp_ln394_reg_1667_pp0_iter6_reg <= icmp_ln394_reg_1667_pp0_iter5_reg;
        icmp_ln394_reg_1667_pp0_iter7_reg <= icmp_ln394_reg_1667_pp0_iter6_reg;
        icmp_ln394_reg_1667_pp0_iter8_reg <= icmp_ln394_reg_1667_pp0_iter7_reg;
        icmp_ln394_reg_1667_pp0_iter9_reg <= icmp_ln394_reg_1667_pp0_iter8_reg;
        icmp_ln494_reg_1680_pp0_iter10_reg <= icmp_ln494_reg_1680_pp0_iter9_reg;
        icmp_ln494_reg_1680_pp0_iter11_reg <= icmp_ln494_reg_1680_pp0_iter10_reg;
        icmp_ln494_reg_1680_pp0_iter12_reg <= icmp_ln494_reg_1680_pp0_iter11_reg;
        icmp_ln494_reg_1680_pp0_iter13_reg <= icmp_ln494_reg_1680_pp0_iter12_reg;
        icmp_ln494_reg_1680_pp0_iter14_reg <= icmp_ln494_reg_1680_pp0_iter13_reg;
        icmp_ln494_reg_1680_pp0_iter15_reg <= icmp_ln494_reg_1680_pp0_iter14_reg;
        icmp_ln494_reg_1680_pp0_iter16_reg <= icmp_ln494_reg_1680_pp0_iter15_reg;
        icmp_ln494_reg_1680_pp0_iter17_reg <= icmp_ln494_reg_1680_pp0_iter16_reg;
        icmp_ln494_reg_1680_pp0_iter18_reg <= icmp_ln494_reg_1680_pp0_iter17_reg;
        icmp_ln494_reg_1680_pp0_iter2_reg <= icmp_ln494_reg_1680_pp0_iter1_reg;
        icmp_ln494_reg_1680_pp0_iter3_reg <= icmp_ln494_reg_1680_pp0_iter2_reg;
        icmp_ln494_reg_1680_pp0_iter4_reg <= icmp_ln494_reg_1680_pp0_iter3_reg;
        icmp_ln494_reg_1680_pp0_iter5_reg <= icmp_ln494_reg_1680_pp0_iter4_reg;
        icmp_ln494_reg_1680_pp0_iter6_reg <= icmp_ln494_reg_1680_pp0_iter5_reg;
        icmp_ln494_reg_1680_pp0_iter7_reg <= icmp_ln494_reg_1680_pp0_iter6_reg;
        icmp_ln494_reg_1680_pp0_iter8_reg <= icmp_ln494_reg_1680_pp0_iter7_reg;
        icmp_ln494_reg_1680_pp0_iter9_reg <= icmp_ln494_reg_1680_pp0_iter8_reg;
        j_1_reg_1661_pp0_iter2_reg <= j_1_reg_1661_pp0_iter1_reg;
        j_1_reg_1661_pp0_iter3_reg <= j_1_reg_1661_pp0_iter2_reg;
        j_1_reg_1661_pp0_iter4_reg <= j_1_reg_1661_pp0_iter3_reg;
        j_1_reg_1661_pp0_iter5_reg <= j_1_reg_1661_pp0_iter4_reg;
        j_1_reg_1661_pp0_iter6_reg <= j_1_reg_1661_pp0_iter5_reg;
        j_1_reg_1661_pp0_iter7_reg <= j_1_reg_1661_pp0_iter6_reg;
        j_1_reg_1661_pp0_iter8_reg <= j_1_reg_1661_pp0_iter7_reg;
        tmp_11_reg_1890_pp0_iter13_reg <= tmp_11_reg_1890;
        tmp_11_reg_1890_pp0_iter14_reg <= tmp_11_reg_1890_pp0_iter13_reg;
        tmp_11_reg_1890_pp0_iter15_reg <= tmp_11_reg_1890_pp0_iter14_reg;
        tmp_11_reg_1890_pp0_iter16_reg <= tmp_11_reg_1890_pp0_iter15_reg;
        tmp_11_reg_1890_pp0_iter17_reg <= tmp_11_reg_1890_pp0_iter16_reg;
        tmp_6_reg_1870_pp0_iter13_reg <= tmp_6_reg_1870;
        tmp_6_reg_1870_pp0_iter14_reg <= tmp_6_reg_1870_pp0_iter13_reg;
        tmp_6_reg_1870_pp0_iter15_reg <= tmp_6_reg_1870_pp0_iter14_reg;
        tmp_6_reg_1870_pp0_iter16_reg <= tmp_6_reg_1870_pp0_iter15_reg;
        tmp_6_reg_1870_pp0_iter17_reg <= tmp_6_reg_1870_pp0_iter16_reg;
        trunc_ln674_reg_1828_pp0_iter13_reg <= trunc_ln674_reg_1828;
        trunc_ln674_reg_1828_pp0_iter14_reg <= trunc_ln674_reg_1828_pp0_iter13_reg;
        trunc_ln674_reg_1828_pp0_iter15_reg <= trunc_ln674_reg_1828_pp0_iter14_reg;
        trunc_ln674_reg_1828_pp0_iter16_reg <= trunc_ln674_reg_1828_pp0_iter15_reg;
        trunc_ln674_reg_1828_pp0_iter17_reg <= trunc_ln674_reg_1828_pp0_iter16_reg;
        trunc_ln884_reg_1690_pp0_iter10_reg <= trunc_ln884_reg_1690_pp0_iter9_reg;
        trunc_ln884_reg_1690_pp0_iter2_reg <= trunc_ln884_reg_1690;
        trunc_ln884_reg_1690_pp0_iter3_reg <= trunc_ln884_reg_1690_pp0_iter2_reg;
        trunc_ln884_reg_1690_pp0_iter4_reg <= trunc_ln884_reg_1690_pp0_iter3_reg;
        trunc_ln884_reg_1690_pp0_iter5_reg <= trunc_ln884_reg_1690_pp0_iter4_reg;
        trunc_ln884_reg_1690_pp0_iter6_reg <= trunc_ln884_reg_1690_pp0_iter5_reg;
        trunc_ln884_reg_1690_pp0_iter7_reg <= trunc_ln884_reg_1690_pp0_iter6_reg;
        trunc_ln884_reg_1690_pp0_iter8_reg <= trunc_ln884_reg_1690_pp0_iter7_reg;
        trunc_ln884_reg_1690_pp0_iter9_reg <= trunc_ln884_reg_1690_pp0_iter8_reg;
        val0_V_1_reg_1855_pp0_iter13_reg <= val0_V_1_reg_1855;
        val0_V_2_reg_1875_pp0_iter13_reg <= val0_V_2_reg_1875;
        val0_V_reg_1833_pp0_iter13_reg <= val0_V_reg_1833;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (((1'd0 == and_ln492_reg_1701_pp0_iter10_reg) & (cmp352 == 1'd1) & (1'd1 == and_ln491_reg_1705_pp0_iter10_reg)) | ((icmp_ln494_reg_1680_pp0_iter10_reg == 1'd1) & (cmp352 == 1'd1) & (1'd1 == and_ln492_reg_1701_pp0_iter10_reg))))) begin
        Wy_V_reg_1813 <= {{ret_V_fu_886_p2[23:12]}};
    end
end

always @ (posedge ap_clk) begin
    if (((cmp120_read_read_fu_216_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln394_fu_627_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln411_reg_1676 <= and_ln411_fu_651_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln411_reg_1676_pp0_iter1_reg <= and_ln411_reg_1676;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln394_reg_1667 <= icmp_ln394_fu_627_p2;
        icmp_ln394_reg_1667_pp0_iter1_reg <= icmp_ln394_reg_1667;
        icmp_ln494_reg_1680_pp0_iter1_reg <= icmp_ln494_reg_1680;
        j_1_reg_1661 <= ap_sig_allocacmp_j_1;
        j_1_reg_1661_pp0_iter1_reg <= j_1_reg_1661;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'd0 == and_ln492_fu_705_p2) & (cmp352 == 1'd1))) begin
        and_ln491_reg_1705 <= and_ln491_fu_715_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (cmp352 == 1'd1))) begin
        and_ln492_reg_1701 <= and_ln492_fu_705_p2;
        icmp_ln1065_reg_1695 <= icmp_ln1065_fu_700_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter10_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter9_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter10_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter9_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter10_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter9_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter10_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter9_P1Buf_V_9_reg_541;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter10 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter11_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter10_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter11_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter10_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter11_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter10_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter11_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter10_P1Buf_V_9_reg_541;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter1_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter0_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter1_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter0_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter1_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter0_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter1_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter0_P1Buf_V_9_reg_541;
        ap_phi_reg_pp0_iter1_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter0_read_pixel_1_reg_486;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter2_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter1_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter2_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter1_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter2_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter1_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter2_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter1_P1Buf_V_9_reg_541;
        ap_phi_reg_pp0_iter2_flag_write_reg_503 <= ap_phi_reg_pp0_iter1_flag_write_reg_503;
        ap_phi_reg_pp0_iter2_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter1_read_pixel_1_reg_486;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter3_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter2_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter3_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter2_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter3_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter2_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter3_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter2_P1Buf_V_9_reg_541;
        ap_phi_reg_pp0_iter3_flag_write_reg_503 <= ap_phi_reg_pp0_iter2_flag_write_reg_503;
        ap_phi_reg_pp0_iter3_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter2_read_pixel_1_reg_486;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter4_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter3_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter4_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter3_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter4_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter3_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter4_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter3_P1Buf_V_9_reg_541;
        ap_phi_reg_pp0_iter4_flag_write_reg_503 <= ap_phi_reg_pp0_iter3_flag_write_reg_503;
        ap_phi_reg_pp0_iter4_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter3_read_pixel_1_reg_486;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter5_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter4_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter5_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter4_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter5_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter4_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter5_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter4_P1Buf_V_9_reg_541;
        ap_phi_reg_pp0_iter5_flag_write_reg_503 <= ap_phi_reg_pp0_iter4_flag_write_reg_503;
        ap_phi_reg_pp0_iter5_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter4_read_pixel_1_reg_486;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter5 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter6_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter5_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter6_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter5_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter6_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter5_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter6_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter5_P1Buf_V_9_reg_541;
        ap_phi_reg_pp0_iter6_flag_write_reg_503 <= ap_phi_reg_pp0_iter5_flag_write_reg_503;
        ap_phi_reg_pp0_iter6_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter5_read_pixel_1_reg_486;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter6 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter7_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter6_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter7_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter6_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter7_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter6_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter7_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter6_P1Buf_V_9_reg_541;
        ap_phi_reg_pp0_iter7_flag_write_reg_503 <= ap_phi_reg_pp0_iter6_flag_write_reg_503;
        ap_phi_reg_pp0_iter7_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter6_read_pixel_1_reg_486;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter8_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter7_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter8_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter7_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter8_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter7_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter8_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter7_P1Buf_V_9_reg_541;
        ap_phi_reg_pp0_iter8_flag_write_reg_503 <= ap_phi_reg_pp0_iter7_flag_write_reg_503;
        ap_phi_reg_pp0_iter8_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter7_read_pixel_1_reg_486;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter9_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter8_P0Buf_V_6_reg_530;
        ap_phi_reg_pp0_iter9_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter8_P0Buf_V_7_reg_519;
        ap_phi_reg_pp0_iter9_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter8_P1Buf_V_8_reg_552;
        ap_phi_reg_pp0_iter9_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter8_P1Buf_V_9_reg_541;
    end
end

always @ (posedge ap_clk) begin
    if (((p_Result_read_read_fu_240_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln394_fu_627_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1049_reg_1671 <= icmp_ln1049_fu_639_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln394_reg_1667_pp0_iter6_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1695_reg_1715 <= icmp_ln1695_fu_729_p2;
        indexx_pre_comp_V_reg_1709 <= grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((cmp352_read_read_fu_282_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln394_fu_627_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln494_reg_1680 <= icmp_ln494_fu_657_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln394_reg_1667_pp0_iter7_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        idx_2_reg_1720 <= idx_2_fu_796_p3;
        trunc_ln859_reg_1732 <= trunc_ln859_fu_808_p1;
        trunc_ln884_1_reg_1727 <= trunc_ln884_1_fu_804_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        idx_nxt_reg_1742 <= idx_nxt_fu_845_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((((ap_enable_reg_pp0_iter10 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd0) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0) & (first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        reg_569 <= line_buffer_V_1_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter10 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        reg_575 <= line_buffer_V_2_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0) & (first_row_index_4_read_reg_1648 == 32'd0) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        reg_581 <= line_buffer_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (((1'd0 == and_ln492_reg_1701_pp0_iter17_reg) & (cmp352 == 1'd1) & (1'd1 == and_ln491_reg_1705_pp0_iter17_reg)) | ((icmp_ln494_reg_1680_pp0_iter17_reg == 1'd1) & (cmp352 == 1'd1) & (1'd1 == and_ln492_reg_1701_pp0_iter17_reg))))) begin
        ret_V_10_reg_1984 <= ret_V_10_fu_1329_p3;
        ret_V_14_reg_1989 <= ret_V_14_fu_1399_p3;
        ret_V_18_reg_1994 <= ret_V_18_fu_1469_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter17 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (((1'd0 == and_ln492_reg_1701_pp0_iter16_reg) & (cmp352 == 1'd1) & (1'd1 == and_ln491_reg_1705_pp0_iter16_reg)) | ((icmp_ln494_reg_1680_pp0_iter16_reg == 1'd1) & (cmp352 == 1'd1) & (1'd1 == and_ln492_reg_1701_pp0_iter16_reg))))) begin
        ret_V_21_reg_1969 <= grp_fu_1548_p3;
        ret_V_22_reg_1974 <= grp_fu_1556_p3;
        ret_V_23_reg_1979 <= grp_fu_1564_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (((1'd0 == and_ln492_reg_1701_pp0_iter11_reg) & (cmp352 == 1'd1) & (1'd1 == and_ln491_reg_1705_pp0_iter11_reg)) | ((icmp_ln494_reg_1680_pp0_iter11_reg == 1'd1) & (cmp352 == 1'd1) & (1'd1 == and_ln492_reg_1701_pp0_iter11_reg))))) begin
        tmp_11_reg_1890 <= {{P0Buf_V_10_fu_915_p3[23:16]}};
        tmp_6_reg_1870 <= {{P0Buf_V_10_fu_915_p3[15:8]}};
        trunc_ln674_reg_1828 <= trunc_ln674_fu_922_p1;
        val0_V_1_reg_1855 <= val0_V_1_fu_1075_p2;
        val0_V_2_reg_1875 <= val0_V_2_fu_1183_p2;
        val0_V_reg_1833 <= val0_V_fu_974_p2;
        val2_V_1_reg_1860 <= val2_V_1_fu_1087_p2;
        val2_V_2_reg_1880 <= val2_V_2_fu_1195_p2;
        val2_V_reg_1838 <= val2_V_fu_986_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln394_reg_1667 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln884_reg_1690 <= trunc_ln884_fu_692_p1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln394_fu_627_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter18_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter19 == 1'b0) & (ap_enable_reg_pp0_iter18 == 1'b0) & (ap_enable_reg_pp0_iter17 == 1'b0) & (ap_enable_reg_pp0_iter16 == 1'b0) & (ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_j_1 = 31'd0;
    end else begin
        ap_sig_allocacmp_j_1 = j_fu_176;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1493_ce = 1'b1;
    end else begin
        grp_fu_1493_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1500_ce = 1'b1;
    end else begin
        grp_fu_1500_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1507_ce = 1'b1;
    end else begin
        grp_fu_1507_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1514_ce = 1'b1;
    end else begin
        grp_fu_1514_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1521_ce = 1'b1;
    end else begin
        grp_fu_1521_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1530_ce = 1'b1;
    end else begin
        grp_fu_1530_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1539_ce = 1'b1;
    end else begin
        grp_fu_1539_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1548_ce = 1'b1;
    end else begin
        grp_fu_1548_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1556_ce = 1'b1;
    end else begin
        grp_fu_1556_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_1564_ce = 1'b1;
    end else begin
        grp_fu_1564_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001_ignoreCallOp71))) begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce = 1'b1;
    end else begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln394_reg_1667_pp0_iter17_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indexy_V_1_out_ap_vld = 1'b1;
    end else begin
        indexy_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        if ((1'b1 == ap_condition_1094)) begin
            line_buffer_V_1_address0 = zext_ln394_fu_812_p1;
        end else if (((icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd0))) begin
            line_buffer_V_1_address0 = line_buffer_V_1_addr_gep_fu_386_p3;
        end else if ((1'b1 == ap_condition_691)) begin
            line_buffer_V_1_address0 = zext_ln435_fu_851_p1;
        end else begin
            line_buffer_V_1_address0 = 'bx;
        end
    end else begin
        line_buffer_V_1_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_1999)) begin
        if ((first_row_index_4_read_reg_1648 == 32'd0)) begin
            line_buffer_V_1_address1 = line_buffer_V_1_addr_1_gep_fu_462_p3;
        end else if (((icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0) & (first_row_index_4_read_reg_1648 == 32'd1))) begin
            line_buffer_V_1_address1 = zext_ln436_fu_870_p1;
        end else begin
            line_buffer_V_1_address1 = 'bx;
        end
    end else begin
        line_buffer_V_1_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln1065_reg_1695_pp0_iter8_reg == 1'd0) & (icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd0) & (1'b0 == ap_block_pp0_stage0_11001)) | (~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        line_buffer_V_1_ce0 = 1'b1;
    end else begin
        line_buffer_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter10 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd0) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0) & (first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        line_buffer_V_1_ce1 = 1'b1;
    end else begin
        line_buffer_V_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        line_buffer_V_1_we0 = 1'b1;
    end else begin
        line_buffer_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        if ((1'b1 == ap_condition_708)) begin
            line_buffer_V_2_address0 = line_buffer_V_2_addr_gep_fu_402_p3;
        end else if (((ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd0))) begin
            line_buffer_V_2_address0 = zext_ln394_fu_812_p1;
        end else if (((icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd1))) begin
            line_buffer_V_2_address0 = zext_ln435_fu_851_p1;
        end else begin
            line_buffer_V_2_address0 = 'bx;
        end
    end else begin
        line_buffer_V_2_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_1999)) begin
        if ((1'b1 == ap_condition_2006)) begin
            line_buffer_V_2_address1 = line_buffer_V_2_addr_1_gep_fu_470_p3;
        end else if ((first_row_index_4_read_reg_1648 == 32'd1)) begin
            line_buffer_V_2_address1 = zext_ln436_fu_870_p1;
        end else begin
            line_buffer_V_2_address1 = 'bx;
        end
    end else begin
        line_buffer_V_2_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | (~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln1065_reg_1695_pp0_iter8_reg == 1'd0) & (icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        line_buffer_V_2_ce0 = 1'b1;
    end else begin
        line_buffer_V_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter10 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        line_buffer_V_2_ce1 = 1'b1;
    end else begin
        line_buffer_V_2_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        line_buffer_V_2_we0 = 1'b1;
    end else begin
        line_buffer_V_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        if ((1'b1 == ap_condition_707)) begin
            line_buffer_V_address0 = line_buffer_V_addr_gep_fu_410_p3;
        end else if ((1'b1 == ap_condition_699)) begin
            line_buffer_V_address0 = zext_ln435_fu_851_p1;
        end else if (((ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd1))) begin
            line_buffer_V_address0 = zext_ln394_fu_812_p1;
        end else begin
            line_buffer_V_address0 = 'bx;
        end
    end else begin
        line_buffer_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_1999)) begin
        if ((~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1))) begin
            line_buffer_V_address1 = line_buffer_V_addr_1_gep_fu_478_p3;
        end else if (((icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0) & (first_row_index_4_read_reg_1648 == 32'd0))) begin
            line_buffer_V_address1 = zext_ln436_fu_870_p1;
        end else begin
            line_buffer_V_address1 = 'bx;
        end
    end else begin
        line_buffer_V_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln1065_reg_1695_pp0_iter8_reg == 1'd0) & (icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd0) & (1'b0 == ap_block_pp0_stage0_11001)) | (~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        line_buffer_V_ce0 = 1'b1;
    end else begin
        line_buffer_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0) & (first_row_index_4_read_reg_1648 == 32'd0) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        line_buffer_V_ce1 = 1'b1;
    end else begin
        line_buffer_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1) & (ap_enable_reg_pp0_iter9 == 1'b1) & (first_row_index_4_read_reg_1648 == 32'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        line_buffer_V_we0 = 1'b1;
    end else begin
        line_buffer_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln394_reg_1667_pp0_iter17_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        nextYScale_V_1_out_ap_vld = 1'b1;
    end else begin
        nextYScale_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter19 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op337_write_state20 == 1'b1))) begin
        resize_out_mat_data84_blk_n = resize_out_mat_data84_full_n;
    end else begin
        resize_out_mat_data84_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter19 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op337_write_state20 == 1'b1))) begin
        resize_out_mat_data84_write = 1'b1;
    end else begin
        resize_out_mat_data84_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op105_read_state9 == 1'b1))) begin
        rgb_mat_data83_blk_n = rgb_mat_data83_empty_n;
    end else begin
        rgb_mat_data83_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op105_read_state9 == 1'b1))) begin
        rgb_mat_data83_read = 1'b1;
    end else begin
        rgb_mat_data83_read = 1'b0;
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

assign P0Buf_V_10_fu_915_p3 = ((icmp_ln1065_reg_1695_pp0_iter11_reg[0:0] == 1'b1) ? ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 : ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530);

assign P0Buf_V_11_fu_908_p3 = ((icmp_ln1065_reg_1695_pp0_iter11_reg[0:0] == 1'b1) ? ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 : ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519);

assign P4_V_1_fu_1337_p3 = {{tmp_6_reg_1870_pp0_iter17_reg}, {10'd0}};

assign P4_V_2_fu_1407_p3 = {{tmp_11_reg_1890_pp0_iter17_reg}, {10'd0}};

assign P4_V_fu_1267_p3 = {{trunc_ln674_reg_1828_pp0_iter17_reg}, {10'd0}};

assign Wxy_V_fu_1227_p1 = grp_fu_1493_p2;

assign Wxy_V_fu_1227_p4 = {{Wxy_V_fu_1227_p1[21:10]}};

assign Wy_V_fu_891_p4 = {{ret_V_fu_886_p2[23:12]}};

assign add_ln394_fu_633_p2 = (ap_sig_allocacmp_j_1 + 31'd1);

assign and_ln411_fu_651_p2 = (icmp_ln413_fu_645_p2 & icmp_ln1077_1);

assign and_ln491_fu_715_p2 = (icmp_ln494_reg_1680 & icmp_ln1065_1_fu_710_p2);

assign and_ln492_fu_705_p2 = (icmp_ln1065_fu_700_p2 & cmp357);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((rgb_mat_data83_empty_n == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b1) & (ap_predicate_op105_read_state9 == 1'b1)) | ((ap_enable_reg_pp0_iter19 == 1'b1) & (ap_predicate_op337_write_state20 == 1'b1) & (resize_out_mat_data84_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((rgb_mat_data83_empty_n == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b1) & (ap_predicate_op105_read_state9 == 1'b1)) | ((ap_enable_reg_pp0_iter19 == 1'b1) & (ap_predicate_op337_write_state20 == 1'b1) & (resize_out_mat_data84_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001_ignoreCallOp71 = (((rgb_mat_data83_empty_n == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b1) & (ap_predicate_op105_read_state9 == 1'b1)) | ((ap_enable_reg_pp0_iter19 == 1'b1) & (ap_predicate_op337_write_state20 == 1'b1) & (resize_out_mat_data84_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((rgb_mat_data83_empty_n == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b1) & (ap_predicate_op105_read_state9 == 1'b1)) | ((ap_enable_reg_pp0_iter19 == 1'b1) & (ap_predicate_op337_write_state20 == 1'b1) & (resize_out_mat_data84_full_n == 1'b0)));
end

assign ap_block_state10_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage0_iter9_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter10_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter11 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter11_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter12 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter12_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter13 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter13_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter14 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter14_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter15 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter15_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage0_iter16 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage0_iter16_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage0_iter17 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage0_iter17_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage0_iter18 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage0_iter18_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0_ignore_call6 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state20_pp0_stage0_iter19 = ((ap_predicate_op337_write_state20 == 1'b1) & (resize_out_mat_data84_full_n == 1'b0));
end

always @ (*) begin
    ap_block_state20_pp0_stage0_iter19_ignore_call6 = ((ap_predicate_op337_write_state20 == 1'b1) & (resize_out_mat_data84_full_n == 1'b0));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7_ignore_call6 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state9_pp0_stage0_iter8 = ((rgb_mat_data83_empty_n == 1'b0) & (ap_predicate_op105_read_state9 == 1'b1));
end

always @ (*) begin
    ap_block_state9_pp0_stage0_iter8_ignore_call6 = ((rgb_mat_data83_empty_n == 1'b0) & (ap_predicate_op105_read_state9 == 1'b1));
end

always @ (*) begin
    ap_condition_108 = ((icmp_ln394_reg_1667_pp0_iter7_reg == 1'd1) & (cmp120 == 1'd1) & (1'd1 == and_ln411_reg_1676_pp0_iter7_reg));
end

always @ (*) begin
    ap_condition_1094 = (~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (ap_phi_mux_flag_write_phi_fu_508_p6 == 1'd1));
end

always @ (*) begin
    ap_condition_1999 = ((ap_enable_reg_pp0_iter10 == 1'b1) & (icmp_ln394_reg_1667_pp0_iter9_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0));
end

always @ (*) begin
    ap_condition_2006 = (~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln1065_reg_1695_pp0_iter9_reg == 1'd0));
end

always @ (*) begin
    ap_condition_346 = (~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln394_reg_1667_pp0_iter10_reg == 1'd1));
end

always @ (*) begin
    ap_condition_691 = ((icmp_ln1065_reg_1695_pp0_iter8_reg == 1'd0) & (icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd1));
end

always @ (*) begin
    ap_condition_699 = ((icmp_ln1065_reg_1695_pp0_iter8_reg == 1'd0) & (icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1) & (first_row_index_4_read_reg_1648 == 32'd0));
end

always @ (*) begin
    ap_condition_707 = (~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1));
end

always @ (*) begin
    ap_condition_708 = (~(first_row_index_4_read_reg_1648 == 32'd0) & ~(first_row_index_4_read_reg_1648 == 32'd1) & (icmp_ln1065_reg_1695_pp0_iter8_reg == 1'd0) & (icmp_ln394_reg_1667_pp0_iter8_reg == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_phi_mux_flag_write_phi_fu_508_p6 = ap_phi_reg_pp0_iter9_flag_write_reg_503;

assign ap_phi_reg_pp0_iter0_P0Buf_V_6_reg_530 = 'bx;

assign ap_phi_reg_pp0_iter0_P0Buf_V_7_reg_519 = 'bx;

assign ap_phi_reg_pp0_iter0_P1Buf_V_8_reg_552 = 'bx;

assign ap_phi_reg_pp0_iter0_P1Buf_V_9_reg_541 = 'bx;

assign ap_phi_reg_pp0_iter0_flag_write_reg_503 = 'bx;

assign ap_phi_reg_pp0_iter0_read_pixel_1_reg_486 = 'bx;

always @ (*) begin
    ap_predicate_op105_read_state9 = ((icmp_ln394_reg_1667_pp0_iter7_reg == 1'd1) & (cmp120 == 1'd1) & (1'd1 == and_ln411_reg_1676_pp0_iter7_reg));
end

always @ (*) begin
    ap_predicate_op337_write_state20 = (((1'd0 == and_ln492_reg_1701_pp0_iter18_reg) & (cmp352 == 1'd1) & (1'd1 == and_ln491_reg_1705_pp0_iter18_reg)) | ((icmp_ln494_reg_1680_pp0_iter18_reg == 1'd1) & (cmp352 == 1'd1) & (1'd1 == and_ln492_reg_1701_pp0_iter18_reg)));
end

assign cmp120_read_read_fu_216_p2 = cmp120;

assign cmp352_read_read_fu_282_p2 = cmp352;

assign empty_fu_833_p1 = idx_2_reg_1720[11:0];

assign first_row_index_4_read_reg_1648 = first_row_index_4;

assign grp_fu_1493_p0 = grp_fu_1493_p00;

assign grp_fu_1493_p00 = Wx_V_reg_1777_pp0_iter10_reg;

assign grp_fu_1493_p1 = grp_fu_1493_p10;

assign grp_fu_1493_p10 = Wy_V_fu_891_p4;

assign grp_fu_1500_p0 = zext_ln1319_fu_996_p1;

assign grp_fu_1507_p0 = zext_ln1319_fu_996_p1;

assign grp_fu_1514_p0 = zext_ln1319_fu_996_p1;

assign grp_fu_1521_p0 = zext_ln1319_1_fu_1218_p1;

assign grp_fu_1530_p0 = zext_ln1319_1_fu_1218_p1;

assign grp_fu_1539_p0 = zext_ln1319_1_fu_1218_p1;

assign grp_fu_1548_p0 = zext_ln864_1_fu_1236_p1;

assign grp_fu_1556_p0 = zext_ln864_1_fu_1236_p1;

assign grp_fu_1564_p0 = zext_ln864_1_fu_1236_p1;

assign grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce = grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce;

assign grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1 = zext_ln400_fu_676_p1;

assign grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2 = trunc_ln3;

assign icmp_ln1049_1_fu_776_p2 = ((trunc_ln1049_fu_772_p1 == 22'd0) ? 1'b1 : 1'b0);

assign icmp_ln1049_2_fu_1309_p2 = ((trunc_ln1049_1_fu_1305_p1 == 10'd0) ? 1'b1 : 1'b0);

assign icmp_ln1049_3_fu_1379_p2 = ((trunc_ln1049_2_fu_1375_p1 == 10'd0) ? 1'b1 : 1'b0);

assign icmp_ln1049_4_fu_1449_p2 = ((trunc_ln1049_3_fu_1445_p1 == 10'd0) ? 1'b1 : 1'b0);

assign icmp_ln1049_fu_639_p2 = ((indexy_pre_V != 22'd0) ? 1'b1 : 1'b0);

assign icmp_ln1065_1_fu_710_p2 = ((zext_ln1065_fu_696_p1 == op2_assign_2) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_700_p2 = ((op2_assign == zext_ln1065_fu_696_p1) ? 1'b1 : 1'b0);

assign icmp_ln1695_fu_729_p2 = (($signed(sext_ln1696_fu_725_p1) > $signed(shl_i_i_i_i_i)) ? 1'b1 : 1'b0);

assign icmp_ln394_fu_627_p2 = (($signed(zext_ln394_1_fu_623_p1) < $signed(loop_col_count)) ? 1'b1 : 1'b0);

assign icmp_ln413_fu_645_p2 = (($signed(zext_ln394_1_fu_623_p1) < $signed(p_read1)) ? 1'b1 : 1'b0);

assign icmp_ln494_fu_657_p2 = (($signed(zext_ln394_1_fu_623_p1) < $signed(p_read3)) ? 1'b1 : 1'b0);

assign idx_2_fu_796_p3 = ((p_Result_1_fu_764_p3[0:0] == 1'b1) ? select_ln1048_1_fu_788_p3 : trunc_ln_fu_754_p4);

assign idx_fu_830_p1 = idx_2_reg_1720;

assign idx_nxt_fu_845_p2 = (empty_fu_833_p1 + zext_ln433_fu_841_p1);

assign indexx_pre_V_3_fu_741_p3 = ((icmp_ln1695_reg_1715[0:0] == 1'b1) ? indexx_pre_V_1 : indexx_pre_comp_V_reg_1709);

assign indexx_pre_V_fu_746_p3 = ((tmp_2_fu_734_p3[0:0] == 1'b1) ? 42'd0 : indexx_pre_V_3_fu_741_p3);

assign indexy_V_1_out = tmp_fu_172;

assign line_buffer_V_1_addr_1_gep_fu_462_p3 = zext_ln436_fu_870_p1;

assign line_buffer_V_1_addr_gep_fu_386_p3 = zext_ln435_fu_851_p1;

assign line_buffer_V_1_d0 = ap_phi_reg_pp0_iter9_read_pixel_1_reg_486;

assign line_buffer_V_2_addr_1_gep_fu_470_p3 = zext_ln436_fu_870_p1;

assign line_buffer_V_2_addr_gep_fu_402_p3 = zext_ln435_fu_851_p1;

assign line_buffer_V_2_d0 = ap_phi_reg_pp0_iter9_read_pixel_1_reg_486;

assign line_buffer_V_addr_1_gep_fu_478_p3 = zext_ln436_fu_870_p1;

assign line_buffer_V_addr_gep_fu_410_p3 = zext_ln435_fu_851_p1;

assign line_buffer_V_d0 = ap_phi_reg_pp0_iter9_read_pixel_1_reg_486;

assign nextYScale_V_1_out = nextYScale_V_1_fu_168;

assign not_cmp_i_i176_fu_836_p2 = ((idx_fu_830_p1 != tmp_V) ? 1'b1 : 1'b0);

assign p_Result_1_fu_764_p3 = indexx_pre_V_fu_746_p3[32'd41];

assign p_Result_6_fu_1297_p3 = ret_V_8_fu_1281_p2[32'd23];

assign p_Result_7_fu_1367_p3 = ret_V_12_fu_1351_p2[32'd23];

assign p_Result_8_fu_1437_p3 = ret_V_16_fu_1421_p2[32'd23];

assign p_Result_read_read_fu_240_p2 = p_Result_s;

assign resize_out_mat_data84_din = {{{ret_V_18_reg_1994}, {ret_V_14_reg_1989}}, {ret_V_10_reg_1984}};

assign ret_V_10_fu_1329_p3 = ((p_Result_6_fu_1297_p3[0:0] == 1'b1) ? select_ln1048_3_fu_1321_p3 : trunc_ln1029_1_fu_1287_p4);

assign ret_V_12_fu_1351_p2 = ($signed(sext_ln1393_4_fu_1344_p1) + $signed(zext_ln1393_1_fu_1347_p1));

assign ret_V_13_fu_1385_p2 = (trunc_ln1029_2_fu_1357_p4 + 8'd1);

assign ret_V_14_fu_1399_p3 = ((p_Result_7_fu_1367_p3[0:0] == 1'b1) ? select_ln1048_4_fu_1391_p3 : trunc_ln1029_2_fu_1357_p4);

assign ret_V_16_fu_1421_p2 = ($signed(sext_ln1393_7_fu_1414_p1) + $signed(zext_ln1393_2_fu_1417_p1));

assign ret_V_17_fu_1455_p2 = (trunc_ln1029_3_fu_1427_p4 + 8'd1);

assign ret_V_18_fu_1469_p3 = ((p_Result_8_fu_1437_p3[0:0] == 1'b1) ? select_ln1048_5_fu_1461_p3 : trunc_ln1029_3_fu_1427_p4);

assign ret_V_19_fu_686_p0 = p_Result_s;

assign ret_V_19_fu_686_p3 = ((ret_V_19_fu_686_p0[0:0] == 1'b1) ? select_ln1048_fu_681_p3 : ret_V_17_cast);

assign ret_V_4_fu_782_p2 = (trunc_ln_fu_754_p4 + 17'd1);

assign ret_V_6_fu_825_p2 = (trunc_ln859_reg_1732 - rhs_1_fu_818_p3);

assign ret_V_8_fu_1281_p2 = ($signed(sext_ln1393_1_fu_1274_p1) + $signed(zext_ln1393_fu_1277_p1));

assign ret_V_9_fu_1315_p2 = (trunc_ln1029_1_fu_1287_p4 + 8'd1);

assign ret_V_fu_886_p2 = (indexy_pre_V_cast - rhs_fu_879_p3);

assign rhs_1_fu_818_p3 = {{trunc_ln884_1_reg_1727}, {22'd0}};

assign rhs_fu_879_p3 = {{trunc_ln884_reg_1690_pp0_iter10_reg}, {22'd0}};

assign select_ln1048_1_fu_788_p3 = ((icmp_ln1049_1_fu_776_p2[0:0] == 1'b1) ? trunc_ln_fu_754_p4 : ret_V_4_fu_782_p2);

assign select_ln1048_3_fu_1321_p3 = ((icmp_ln1049_2_fu_1309_p2[0:0] == 1'b1) ? trunc_ln1029_1_fu_1287_p4 : ret_V_9_fu_1315_p2);

assign select_ln1048_4_fu_1391_p3 = ((icmp_ln1049_3_fu_1379_p2[0:0] == 1'b1) ? trunc_ln1029_2_fu_1357_p4 : ret_V_13_fu_1385_p2);

assign select_ln1048_5_fu_1461_p3 = ((icmp_ln1049_4_fu_1449_p2[0:0] == 1'b1) ? trunc_ln1029_3_fu_1427_p4 : ret_V_17_fu_1455_p2);

assign select_ln1048_fu_681_p3 = ((icmp_ln1049_reg_1671[0:0] == 1'b1) ? add_i_i_i_i_i368_i : ret_V_17_cast);

assign sext_ln1393_1_fu_1274_p1 = ret_V_21_reg_1969;

assign sext_ln1393_4_fu_1344_p1 = ret_V_22_reg_1974;

assign sext_ln1393_7_fu_1414_p1 = ret_V_23_reg_1979;

assign sext_ln1696_fu_725_p0 = grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0;

assign sext_ln1696_fu_725_p1 = sext_ln1696_fu_725_p0;

assign sext_ln75_1_fu_1065_p1 = $signed(sub_ln75_4_fu_1059_p2);

assign sext_ln75_2_fu_1173_p1 = $signed(sub_ln75_8_fu_1167_p2);

assign sext_ln75_fu_964_p1 = $signed(sub_ln75_fu_958_p2);

assign sub_ln75_1_fu_968_p2 = ($signed(sext_ln75_fu_964_p1) - $signed(zext_ln1541_3_fu_950_p1));

assign sub_ln75_4_fu_1059_p2 = (zext_ln1541_4_fu_1039_p1 - zext_ln1541_6_fu_1047_p1);

assign sub_ln75_5_fu_1069_p2 = ($signed(sext_ln75_1_fu_1065_p1) - $signed(zext_ln1541_7_fu_1051_p1));

assign sub_ln75_8_fu_1167_p2 = (zext_ln1541_8_fu_1147_p1 - zext_ln1541_10_fu_1155_p1);

assign sub_ln75_9_fu_1177_p2 = ($signed(sext_ln75_2_fu_1173_p1) - $signed(zext_ln1541_11_fu_1159_p1));

assign sub_ln75_fu_958_p2 = (zext_ln1541_fu_938_p1 - zext_ln1541_2_fu_946_p1);

assign tmp_10_fu_1137_p4 = {{ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552[23:16]}};

assign tmp_2_fu_734_p3 = indexx_pre_comp_V_reg_1709[32'd41];

assign tmp_3_fu_1009_p4 = {{ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541[15:8]}};

assign tmp_4_fu_1019_p4 = {{P0Buf_V_11_fu_908_p3[15:8]}};

assign tmp_5_fu_1029_p4 = {{ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552[15:8]}};

assign tmp_7_fu_1107_p4 = {{P0Buf_V_10_fu_915_p3[23:16]}};

assign tmp_8_fu_1117_p4 = {{ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541[23:16]}};

assign tmp_9_fu_1127_p4 = {{P0Buf_V_11_fu_908_p3[23:16]}};

assign tmp_s_fu_999_p4 = {{P0Buf_V_10_fu_915_p3[15:8]}};

assign trunc_ln1029_1_fu_1287_p4 = {{ret_V_8_fu_1281_p2[17:10]}};

assign trunc_ln1029_2_fu_1357_p4 = {{ret_V_12_fu_1351_p2[17:10]}};

assign trunc_ln1029_3_fu_1427_p4 = {{ret_V_16_fu_1421_p2[17:10]}};

assign trunc_ln1049_1_fu_1305_p1 = ret_V_8_fu_1281_p2[9:0];

assign trunc_ln1049_2_fu_1375_p1 = ret_V_12_fu_1351_p2[9:0];

assign trunc_ln1049_3_fu_1445_p1 = ret_V_16_fu_1421_p2[9:0];

assign trunc_ln1049_fu_772_p1 = indexx_pre_V_fu_746_p3[21:0];

assign trunc_ln400_fu_673_p1 = j_1_reg_1661[19:0];

assign trunc_ln674_1_fu_926_p1 = ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541[7:0];

assign trunc_ln674_2_fu_930_p1 = P0Buf_V_11_fu_908_p3[7:0];

assign trunc_ln674_3_fu_934_p1 = ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552[7:0];

assign trunc_ln674_fu_922_p1 = P0Buf_V_10_fu_915_p3[7:0];

assign trunc_ln859_fu_808_p1 = indexx_pre_V_fu_746_p3[23:0];

assign trunc_ln884_1_fu_804_p1 = idx_2_fu_796_p3[1:0];

assign trunc_ln884_fu_692_p1 = ret_V_19_fu_686_p3[1:0];

assign trunc_ln_fu_754_p4 = {{indexx_pre_V_fu_746_p3[38:22]}};

assign val0_V_1_fu_1075_p2 = (sub_ln75_5_fu_1069_p2 + zext_ln1541_5_fu_1043_p1);

assign val0_V_2_fu_1183_p2 = (sub_ln75_9_fu_1177_p2 + zext_ln1541_9_fu_1151_p1);

assign val0_V_fu_974_p2 = (sub_ln75_1_fu_968_p2 + zext_ln1541_1_fu_942_p1);

assign val1_V_1_fu_1081_p2 = (zext_ln1541_6_fu_1047_p1 - zext_ln1541_4_fu_1039_p1);

assign val1_V_2_fu_1189_p2 = (zext_ln1541_10_fu_1155_p1 - zext_ln1541_8_fu_1147_p1);

assign val1_V_fu_980_p2 = (zext_ln1541_2_fu_946_p1 - zext_ln1541_fu_938_p1);

assign val2_V_1_fu_1087_p2 = (zext_ln75_1_fu_1055_p1 - zext_ln1541_4_fu_1039_p1);

assign val2_V_2_fu_1195_p2 = (zext_ln75_2_fu_1163_p1 - zext_ln1541_8_fu_1147_p1);

assign val2_V_fu_986_p2 = (zext_ln75_fu_954_p1 - zext_ln1541_fu_938_p1);

assign zext_ln1065_fu_696_p1 = ret_V_19_fu_686_p3;

assign zext_ln1319_1_fu_1218_p1 = Wx_V_reg_1777_pp0_iter12_reg;

assign zext_ln1319_fu_996_p1 = Wy_V_reg_1813;

assign zext_ln1393_1_fu_1347_p1 = P4_V_1_fu_1337_p3;

assign zext_ln1393_2_fu_1417_p1 = P4_V_2_fu_1407_p3;

assign zext_ln1393_fu_1277_p1 = P4_V_fu_1267_p3;

assign zext_ln1541_10_fu_1155_p1 = tmp_8_fu_1117_p4;

assign zext_ln1541_11_fu_1159_p1 = tmp_9_fu_1127_p4;

assign zext_ln1541_1_fu_942_p1 = trunc_ln674_3_fu_934_p1;

assign zext_ln1541_2_fu_946_p1 = trunc_ln674_1_fu_926_p1;

assign zext_ln1541_3_fu_950_p1 = trunc_ln674_2_fu_930_p1;

assign zext_ln1541_4_fu_1039_p1 = tmp_s_fu_999_p4;

assign zext_ln1541_5_fu_1043_p1 = tmp_5_fu_1029_p4;

assign zext_ln1541_6_fu_1047_p1 = tmp_3_fu_1009_p4;

assign zext_ln1541_7_fu_1051_p1 = tmp_4_fu_1019_p4;

assign zext_ln1541_8_fu_1147_p1 = tmp_7_fu_1107_p4;

assign zext_ln1541_9_fu_1151_p1 = tmp_10_fu_1137_p4;

assign zext_ln1541_fu_938_p1 = trunc_ln674_fu_922_p1;

assign zext_ln394_1_fu_623_p1 = ap_sig_allocacmp_j_1;

assign zext_ln394_fu_812_p1 = j_1_reg_1661_pp0_iter8_reg;

assign zext_ln400_fu_676_p1 = trunc_ln400_fu_673_p1;

assign zext_ln433_fu_841_p1 = not_cmp_i_i176_fu_836_p2;

assign zext_ln435_fu_851_p1 = idx_2_reg_1720;

assign zext_ln436_fu_870_p1 = idx_nxt_reg_1742;

assign zext_ln75_1_fu_1055_p1 = tmp_4_fu_1019_p4;

assign zext_ln75_2_fu_1163_p1 = tmp_9_fu_1127_p4;

assign zext_ln75_fu_954_p1 = trunc_ln674_2_fu_930_p1;

assign zext_ln864_1_fu_1236_p1 = Wxy_V_fu_1227_p4;

endmodule //pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5
