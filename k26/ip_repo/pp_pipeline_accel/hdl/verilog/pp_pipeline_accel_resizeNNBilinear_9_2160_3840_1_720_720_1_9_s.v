// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        p_read,
        p_read1,
        rgb_mat_data83_dout,
        rgb_mat_data83_num_data_valid,
        rgb_mat_data83_fifo_cap,
        rgb_mat_data83_empty_n,
        rgb_mat_data83_read,
        p_read2,
        p_read3,
        resize_out_mat_data84_din,
        resize_out_mat_data84_num_data_valid,
        resize_out_mat_data84_fifo_cap,
        resize_out_mat_data84_full_n,
        resize_out_mat_data84_write
);

parameter    ap_ST_fsm_state1 = 18'd1;
parameter    ap_ST_fsm_state2 = 18'd2;
parameter    ap_ST_fsm_state3 = 18'd4;
parameter    ap_ST_fsm_state4 = 18'd8;
parameter    ap_ST_fsm_state5 = 18'd16;
parameter    ap_ST_fsm_state6 = 18'd32;
parameter    ap_ST_fsm_state7 = 18'd64;
parameter    ap_ST_fsm_state8 = 18'd128;
parameter    ap_ST_fsm_state9 = 18'd256;
parameter    ap_ST_fsm_state10 = 18'd512;
parameter    ap_ST_fsm_state11 = 18'd1024;
parameter    ap_ST_fsm_state12 = 18'd2048;
parameter    ap_ST_fsm_state13 = 18'd4096;
parameter    ap_ST_fsm_state14 = 18'd8192;
parameter    ap_ST_fsm_state15 = 18'd16384;
parameter    ap_ST_fsm_state16 = 18'd32768;
parameter    ap_ST_fsm_state17 = 18'd65536;
parameter    ap_ST_fsm_state18 = 18'd131072;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] p_read;
input  [31:0] p_read1;
input  [23:0] rgb_mat_data83_dout;
input  [1:0] rgb_mat_data83_num_data_valid;
input  [1:0] rgb_mat_data83_fifo_cap;
input   rgb_mat_data83_empty_n;
output   rgb_mat_data83_read;
input  [31:0] p_read2;
input  [31:0] p_read3;
output  [23:0] resize_out_mat_data84_din;
input  [1:0] resize_out_mat_data84_num_data_valid;
input  [1:0] resize_out_mat_data84_fifo_cap;
input   resize_out_mat_data84_full_n;
output   resize_out_mat_data84_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rgb_mat_data83_read;
reg resize_out_mat_data84_write;

(* fsm_encoding = "none" *) reg   [17:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] trunc_ln305_fu_251_p1;
reg   [15:0] trunc_ln305_reg_857;
wire   [15:0] trunc_ln306_fu_255_p1;
reg   [15:0] trunc_ln306_reg_862;
wire   [32:0] tmp_fu_289_p3;
reg   [32:0] tmp_reg_867;
wire    ap_CS_fsm_state2;
wire   [63:0] xnew_fu_297_p3;
reg   [63:0] xnew_reg_872;
wire   [47:0] trunc_ln859_fu_305_p1;
reg   [47:0] trunc_ln859_reg_877;
wire    ap_CS_fsm_state3;
wire   [63:0] ynew_fu_309_p3;
reg   [63:0] ynew_reg_882;
wire   [47:0] trunc_ln859_1_fu_317_p1;
reg   [47:0] trunc_ln859_1_reg_887;
wire    ap_CS_fsm_state4;
reg   [21:0] conv_i_i_i577_i_cast_reg_892;
reg   [37:0] conv_i_i13_i557_i2_reg_897;
wire   [31:0] loop_row_count_fu_345_p3;
reg   [31:0] loop_row_count_reg_902;
wire    ap_CS_fsm_state5;
wire   [31:0] loop_col_count_fu_355_p3;
reg   [31:0] loop_col_count_reg_907;
wire   [31:0] sub351_fu_361_p2;
reg   [31:0] sub351_reg_912;
wire   [31:0] tmp_V_fu_366_p2;
reg   [31:0] tmp_V_reg_917;
wire   [42:0] conv_i_i13_i557_i2_cast_fu_371_p1;
reg   [42:0] conv_i_i13_i557_i2_cast_reg_922;
wire   [53:0] shl_i_i_i_i417_i_fu_379_p3;
reg   [53:0] shl_i_i_i_i417_i_reg_927;
wire   [53:0] shl_i_i_i_i_i_fu_387_p3;
reg   [53:0] shl_i_i_i_i_i_reg_932;
wire   [41:0] indexx_pre_V_1_fu_399_p3;
reg   [41:0] indexx_pre_V_1_reg_937;
wire   [41:0] shl_i_i_i393_i_fu_411_p3;
reg   [41:0] shl_i_i_i393_i_reg_942;
wire   [21:0] sub_ln1049_fu_419_p2;
reg   [21:0] sub_ln1049_reg_947;
wire   [0:0] slt_fu_447_p2;
reg   [0:0] slt_reg_958;
wire    ap_CS_fsm_state7;
wire   [41:0] grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return;
reg  signed [41:0] indexy_pre_comp_V_reg_963;
wire    ap_CS_fsm_state13;
wire   [0:0] cmp_i_i419_i_fu_460_p2;
reg   [0:0] cmp_i_i419_i_reg_970;
wire   [0:0] icmp_ln1049_fu_465_p2;
reg   [0:0] icmp_ln1049_reg_975;
wire   [21:0] empty_88_fu_522_p1;
reg   [21:0] empty_88_reg_980;
wire    ap_CS_fsm_state14;
reg   [16:0] ret_V_17_cast_reg_985;
reg   [0:0] tmp_15_reg_991;
wire   [23:0] empty_89_fu_544_p1;
reg   [23:0] empty_89_reg_996;
wire   [16:0] ret_V_20_fu_555_p3;
reg   [16:0] ret_V_20_reg_1001;
wire   [0:0] cmp120_fu_566_p2;
reg   [0:0] cmp120_reg_1010;
wire    ap_CS_fsm_state15;
wire   [31:0] op2_assign_fu_571_p2;
reg   [31:0] op2_assign_reg_1018;
wire   [0:0] cmp357_fu_577_p2;
reg   [0:0] cmp357_reg_1025;
wire   [31:0] op2_assign_2_fu_582_p2;
reg   [31:0] op2_assign_2_reg_1031;
wire   [16:0] add_i_i_i_i_i368_i_fu_588_p2;
reg   [16:0] add_i_i_i_i_i368_i_reg_1037;
wire   [0:0] icmp_ln1077_1_fu_596_p2;
reg   [0:0] icmp_ln1077_1_reg_1042;
wire   [0:0] rev123_fu_614_p2;
reg   [0:0] rev123_reg_1056;
wire    ap_CS_fsm_state16;
wire   [0:0] xor_ln1077_fu_620_p2;
reg   [0:0] xor_ln1077_reg_1062;
wire   [31:0] first_row_index_fu_626_p2;
reg   [31:0] first_row_index_reg_1067;
wire    ap_CS_fsm_state17;
reg   [11:0] line_buffer_V_address0;
reg    line_buffer_V_ce0;
reg    line_buffer_V_we0;
reg   [23:0] line_buffer_V_d0;
wire   [23:0] line_buffer_V_q0;
reg    line_buffer_V_ce1;
wire   [23:0] line_buffer_V_q1;
reg   [11:0] line_buffer_V_1_address0;
reg    line_buffer_V_1_ce0;
reg    line_buffer_V_1_we0;
reg   [23:0] line_buffer_V_1_d0;
wire   [23:0] line_buffer_V_1_q0;
reg    line_buffer_V_1_ce1;
wire   [23:0] line_buffer_V_1_q1;
wire   [23:0] line_buffer_V_2_q0;
wire   [23:0] line_buffer_V_2_q1;
wire    grp_xfUDivResize_fu_174_ap_start;
wire    grp_xfUDivResize_fu_174_ap_done;
wire    grp_xfUDivResize_fu_174_ap_idle;
wire    grp_xfUDivResize_fu_174_ap_ready;
reg   [63:0] grp_xfUDivResize_fu_174_in_n;
reg   [15:0] grp_xfUDivResize_fu_174_in_d;
wire   [63:0] grp_xfUDivResize_fu_174_ap_return;
reg   [31:0] grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex;
reg   [47:0] grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale;
reg    grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
wire    ap_CS_fsm_state11;
wire    ap_CS_fsm_state12;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_done;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_idle;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_ready;
wire   [11:0] grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_address0;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_ce0;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_we0;
wire   [23:0] grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_d0;
wire   [11:0] grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_address0;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_ce0;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_we0;
wire   [23:0] grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_d0;
wire    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_rgb_mat_data83_read;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_idle;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_ready;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_rgb_mat_data83_read;
wire   [23:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_din;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_write;
wire   [11:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address0;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce0;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_we0;
wire   [23:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_d0;
wire   [11:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address1;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce1;
wire   [11:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address0;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce0;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_we0;
wire   [23:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_d0;
wire   [11:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address1;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce1;
wire   [11:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address0;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce0;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_we0;
wire   [23:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_d0;
wire   [11:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address1;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce1;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_p_Result_s;
wire   [16:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out_ap_vld;
wire   [16:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out_ap_vld;
wire   [31:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1;
wire   [47:0] grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2;
wire    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce;
reg    grp_xfUDivResize_fu_174_ap_start_reg;
reg    ap_block_state3_on_subcall_done;
reg    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg;
reg    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg;
reg   [31:0] read_rows_count_fu_106;
wire   [31:0] read_rows_count_2_fu_717_p3;
wire    ap_CS_fsm_state18;
reg   [31:0] output_rows_count_fu_110;
wire   [31:0] output_rows_count_1_fu_674_p3;
reg   [31:0] first_row_index_1_fu_114;
wire   [31:0] first_row_index_3_fu_735_p3;
reg   [31:0] i_fu_118;
wire   [31:0] i_2_fu_432_p2;
wire    ap_CS_fsm_state6;
wire   [0:0] icmp_ln387_fu_427_p2;
reg   [16:0] nextYScale_V_fu_122;
reg   [16:0] indexy_V_fu_126;
wire   [0:0] icmp_ln359_fu_341_p2;
wire   [0:0] icmp_ln361_fu_351_p2;
wire   [31:0] i_op_assign_fu_374_p2;
wire   [19:0] empty_86_fu_395_p1;
wire   [19:0] empty_87_fu_407_p1;
wire  signed [41:0] trunc_ln392_fu_452_p0;
wire  signed [41:0] conv_i_i443_i_fu_456_p0;
wire  signed [53:0] conv_i_i443_i_fu_456_p1;
wire   [21:0] trunc_ln392_fu_452_p1;
wire  signed [42:0] conv_i_i27_i541_i_fu_470_p1;
wire   [42:0] p_Val2_s_fu_473_p2;
wire   [16:0] ret_V_cast_fu_478_p4;
wire   [0:0] tmp_14_fu_496_p3;
wire   [41:0] spec_select77_fu_509_p3;
wire   [41:0] indexy_pre_V_fu_514_p3;
wire   [16:0] add_i_i_i_i_i499_i_fu_503_p2;
wire   [0:0] tmp_13_fu_488_p3;
wire   [16:0] select_ln1048_fu_548_p3;
wire   [31:0] zext_ln1077_1_fu_593_p1;
wire   [31:0] zext_ln1065_fu_637_p1;
wire   [0:0] icmp_ln1065_fu_641_p2;
wire   [0:0] and_ln514_fu_646_p2;
wire   [0:0] icmp_ln1065_1_fu_651_p2;
wire   [0:0] or_ln514_fu_656_p2;
wire   [31:0] add_ln516_fu_662_p2;
wire   [31:0] select_ln514_fu_667_p3;
wire   [31:0] zext_ln1077_fu_680_p1;
wire   [0:0] icmp_ln527_fu_689_p2;
wire   [31:0] read_rows_count_1_fu_701_p2;
wire   [0:0] icmp_ln1077_fu_684_p2;
wire   [0:0] and_ln1077_fu_712_p2;
wire   [31:0] sel_tmp1_fu_706_p3;
wire   [0:0] sel_tmp4_fu_724_p2;
wire   [0:0] or_ln1077_fu_729_p2;
wire   [31:0] first_row_index_2_fu_694_p3;
reg   [17:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
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
reg    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 18'd1;
#0 grp_xfUDivResize_fu_174_ap_start_reg = 1'b0;
#0 grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg = 1'b0;
#0 grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg = 1'b0;
end

pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_line_buffer_V_RAM_1WNR_AUTO_1R1W #(
    .DataWidth( 24 ),
    .AddressRange( 3840 ),
    .AddressWidth( 12 ))
line_buffer_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(line_buffer_V_address0),
    .ce0(line_buffer_V_ce0),
    .we0(line_buffer_V_we0),
    .d0(line_buffer_V_d0),
    .q0(line_buffer_V_q0),
    .address1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address1),
    .ce1(line_buffer_V_ce1),
    .q1(line_buffer_V_q1)
);

pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_line_buffer_V_RAM_1WNR_AUTO_1R1W #(
    .DataWidth( 24 ),
    .AddressRange( 3840 ),
    .AddressWidth( 12 ))
line_buffer_V_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(line_buffer_V_1_address0),
    .ce0(line_buffer_V_1_ce0),
    .we0(line_buffer_V_1_we0),
    .d0(line_buffer_V_1_d0),
    .q0(line_buffer_V_1_q0),
    .address1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address1),
    .ce1(line_buffer_V_1_ce1),
    .q1(line_buffer_V_1_q1)
);

pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_line_buffer_V_RAM_1WNR_AUTO_1R1W #(
    .DataWidth( 24 ),
    .AddressRange( 3840 ),
    .AddressWidth( 12 ))
line_buffer_V_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address0),
    .ce0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce0),
    .we0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_we0),
    .d0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_d0),
    .q0(line_buffer_V_2_q0),
    .address1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address1),
    .ce1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce1),
    .q1(line_buffer_V_2_q1)
);

pp_pipeline_accel_xfUDivResize grp_xfUDivResize_fu_174(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_xfUDivResize_fu_174_ap_start),
    .ap_done(grp_xfUDivResize_fu_174_ap_done),
    .ap_idle(grp_xfUDivResize_fu_174_ap_idle),
    .ap_ready(grp_xfUDivResize_fu_174_ap_ready),
    .in_n(grp_xfUDivResize_fu_174_in_n),
    .in_d(grp_xfUDivResize_fu_174_in_d),
    .ap_return(grp_xfUDivResize_fu_174_ap_return)
);

pp_pipeline_accel_scaleCompute_17_42_20_48_16_1_s grp_scaleCompute_17_42_20_48_16_1_s_fu_191(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .currindex(grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex),
    .inscale(grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale),
    .ap_return(grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return),
    .ap_ce(grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce)
);

pp_pipeline_accel_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2 grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start),
    .ap_done(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_done),
    .ap_idle(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_idle),
    .ap_ready(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_ready),
    .bound(tmp_reg_867),
    .p_read1(p_read1),
    .line_buffer_V_1_address0(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_address0),
    .line_buffer_V_1_ce0(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_ce0),
    .line_buffer_V_1_we0(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_we0),
    .line_buffer_V_1_d0(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_d0),
    .line_buffer_V_address0(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_address0),
    .line_buffer_V_ce0(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_ce0),
    .line_buffer_V_we0(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_we0),
    .line_buffer_V_d0(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_d0),
    .rgb_mat_data83_dout(rgb_mat_data83_dout),
    .rgb_mat_data83_num_data_valid(2'd0),
    .rgb_mat_data83_fifo_cap(2'd0),
    .rgb_mat_data83_empty_n(rgb_mat_data83_empty_n),
    .rgb_mat_data83_read(grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_rgb_mat_data83_read)
);

pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5 grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start),
    .ap_done(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done),
    .ap_idle(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_idle),
    .ap_ready(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_ready),
    .rgb_mat_data83_dout(rgb_mat_data83_dout),
    .rgb_mat_data83_num_data_valid(2'd0),
    .rgb_mat_data83_fifo_cap(2'd0),
    .rgb_mat_data83_empty_n(rgb_mat_data83_empty_n),
    .rgb_mat_data83_read(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_rgb_mat_data83_read),
    .resize_out_mat_data84_din(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_din),
    .resize_out_mat_data84_num_data_valid(2'd0),
    .resize_out_mat_data84_fifo_cap(2'd0),
    .resize_out_mat_data84_full_n(resize_out_mat_data84_full_n),
    .resize_out_mat_data84_write(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_write),
    .indexy_V(indexy_V_fu_126),
    .nextYScale_V(nextYScale_V_fu_122),
    .ret_V_20(ret_V_20_reg_1001),
    .loop_col_count(loop_col_count_reg_907),
    .cmp352(rev123_reg_1056),
    .line_buffer_V_address0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address0),
    .line_buffer_V_ce0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce0),
    .line_buffer_V_we0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_we0),
    .line_buffer_V_d0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_d0),
    .line_buffer_V_q0(line_buffer_V_q0),
    .line_buffer_V_address1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address1),
    .line_buffer_V_ce1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce1),
    .line_buffer_V_q1(line_buffer_V_q1),
    .line_buffer_V_1_address0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address0),
    .line_buffer_V_1_ce0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce0),
    .line_buffer_V_1_we0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_we0),
    .line_buffer_V_1_d0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_d0),
    .line_buffer_V_1_q0(line_buffer_V_1_q0),
    .line_buffer_V_1_address1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address1),
    .line_buffer_V_1_ce1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce1),
    .line_buffer_V_1_q1(line_buffer_V_1_q1),
    .tmp_V(tmp_V_reg_917),
    .first_row_index_4(first_row_index_1_fu_114),
    .line_buffer_V_2_address0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address0),
    .line_buffer_V_2_ce0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce0),
    .line_buffer_V_2_we0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_we0),
    .line_buffer_V_2_d0(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_d0),
    .line_buffer_V_2_q0(line_buffer_V_2_q0),
    .line_buffer_V_2_address1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address1),
    .line_buffer_V_2_ce1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce1),
    .line_buffer_V_2_q1(line_buffer_V_2_q1),
    .trunc_ln3(trunc_ln859_reg_877),
    .indexy_pre_V(empty_88_reg_980),
    .add_i_i_i_i_i368_i(add_i_i_i_i_i368_i_reg_1037),
    .ret_V_17_cast(ret_V_17_cast_reg_985),
    .p_Result_s(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_p_Result_s),
    .indexy_pre_V_cast(empty_89_reg_996),
    .shl_i_i_i_i_i(shl_i_i_i_i_i_reg_932),
    .indexx_pre_V_1(indexx_pre_V_1_reg_937),
    .cmp120(cmp120_reg_1010),
    .p_read1(p_read1),
    .icmp_ln1077_1(xor_ln1077_reg_1062),
    .op2_assign_2(op2_assign_2_reg_1031),
    .op2_assign(op2_assign_reg_1018),
    .cmp357(cmp357_reg_1025),
    .p_read3(p_read3),
    .indexy_V_1_out(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out),
    .indexy_V_1_out_ap_vld(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out_ap_vld),
    .nextYScale_V_1_out(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out),
    .nextYScale_V_1_out_ap_vld(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out_ap_vld),
    .grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1),
    .grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2),
    .grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0(grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return),
    .grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce)
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
        grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state16)) begin
            grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg <= 1'b1;
        end else if ((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_ready == 1'b1)) begin
            grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg <= 1'b1;
        end else if ((grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_ready == 1'b1)) begin
            grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_xfUDivResize_fu_174_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) | ((1'b0 == ap_block_state3_on_subcall_done) & (1'b1 == ap_CS_fsm_state3)))) begin
            grp_xfUDivResize_fu_174_ap_start_reg <= 1'b1;
        end else if ((grp_xfUDivResize_fu_174_ap_ready == 1'b1)) begin
            grp_xfUDivResize_fu_174_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        first_row_index_1_fu_114 <= 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state18)) begin
        first_row_index_1_fu_114 <= first_row_index_3_fu_735_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_118 <= 32'd0;
    end else if (((icmp_ln387_fu_427_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state6))) begin
        i_fu_118 <= i_2_fu_432_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        indexy_V_fu_126 <= 17'd0;
    end else if ((1'b1 == ap_CS_fsm_state18)) begin
        indexy_V_fu_126 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        nextYScale_V_fu_122 <= 17'd0;
    end else if ((1'b1 == ap_CS_fsm_state18)) begin
        nextYScale_V_fu_122 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        output_rows_count_fu_110 <= 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state18)) begin
        output_rows_count_fu_110 <= output_rows_count_1_fu_674_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        read_rows_count_fu_106 <= 32'd2;
    end else if ((1'b1 == ap_CS_fsm_state18)) begin
        read_rows_count_fu_106 <= read_rows_count_2_fu_717_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        add_i_i_i_i_i368_i_reg_1037 <= add_i_i_i_i_i368_i_fu_588_p2;
        cmp120_reg_1010 <= cmp120_fu_566_p2;
        cmp357_reg_1025 <= cmp357_fu_577_p2;
        icmp_ln1077_1_reg_1042 <= icmp_ln1077_1_fu_596_p2;
        op2_assign_2_reg_1031 <= op2_assign_2_fu_582_p2;
        op2_assign_reg_1018 <= op2_assign_fu_571_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        cmp_i_i419_i_reg_970 <= cmp_i_i419_i_fu_460_p2;
        icmp_ln1049_reg_975 <= icmp_ln1049_fu_465_p2;
        indexy_pre_comp_V_reg_963 <= grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        conv_i_i13_i557_i2_cast_reg_922[37 : 0] <= conv_i_i13_i557_i2_cast_fu_371_p1[37 : 0];
        indexx_pre_V_1_reg_937[41 : 22] <= indexx_pre_V_1_fu_399_p3[41 : 22];
        loop_col_count_reg_907 <= loop_col_count_fu_355_p3;
        loop_row_count_reg_902 <= loop_row_count_fu_345_p3;
        shl_i_i_i393_i_reg_942[41 : 22] <= shl_i_i_i393_i_fu_411_p3[41 : 22];
        shl_i_i_i_i417_i_reg_927[53 : 22] <= shl_i_i_i_i417_i_fu_379_p3[53 : 22];
        shl_i_i_i_i_i_reg_932[53 : 22] <= shl_i_i_i_i_i_fu_387_p3[53 : 22];
        sub351_reg_912 <= sub351_fu_361_p2;
        sub_ln1049_reg_947 <= sub_ln1049_fu_419_p2;
        tmp_V_reg_917 <= tmp_V_fu_366_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        conv_i_i13_i557_i2_reg_897 <= {{grp_xfUDivResize_fu_174_ap_return[47:10]}};
        conv_i_i_i577_i_cast_reg_892 <= {{grp_xfUDivResize_fu_174_ap_return[31:10]}};
        trunc_ln859_1_reg_887 <= trunc_ln859_1_fu_317_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        empty_88_reg_980 <= empty_88_fu_522_p1;
        empty_89_reg_996 <= empty_89_fu_544_p1;
        ret_V_17_cast_reg_985 <= {{indexy_pre_V_fu_514_p3[38:22]}};
        ret_V_20_reg_1001 <= ret_V_20_fu_555_p3;
        tmp_15_reg_991 <= indexy_pre_V_fu_514_p3[32'd41];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        first_row_index_reg_1067 <= first_row_index_fu_626_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        rev123_reg_1056 <= rev123_fu_614_p2;
        xor_ln1077_reg_1062 <= xor_ln1077_fu_620_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        slt_reg_958 <= slt_fu_447_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        tmp_reg_867[32 : 1] <= tmp_fu_289_p3[32 : 1];
        xnew_reg_872[63 : 32] <= xnew_fu_297_p3[63 : 32];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        trunc_ln305_reg_857 <= trunc_ln305_fu_251_p1;
        trunc_ln306_reg_862 <= trunc_ln306_fu_255_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        trunc_ln859_reg_877 <= trunc_ln859_fu_305_p1;
        ynew_reg_882[63 : 32] <= ynew_fu_309_p3[63 : 32];
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

always @ (*) begin
    if ((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done == 1'b0)) begin
        ap_ST_fsm_state17_blk = 1'b1;
    end else begin
        ap_ST_fsm_state17_blk = 1'b0;
    end
end

assign ap_ST_fsm_state18_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state3_on_subcall_done)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_xfUDivResize_fu_174_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((((icmp_ln387_fu_427_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if (((icmp_ln387_fu_427_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce;
    end else if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state7))) begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce = 1'b1;
    end else begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex = output_rows_count_fu_110;
    end else begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale = trunc_ln859_1_reg_887;
    end else begin
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_xfUDivResize_fu_174_in_d = trunc_ln306_reg_862;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_xfUDivResize_fu_174_in_d = trunc_ln305_reg_857;
    end else begin
        grp_xfUDivResize_fu_174_in_d = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_xfUDivResize_fu_174_in_n = ynew_reg_882;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_xfUDivResize_fu_174_in_n = xnew_reg_872;
    end else begin
        grp_xfUDivResize_fu_174_in_n = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_1_address0 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        line_buffer_V_1_address0 = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_address0;
    end else begin
        line_buffer_V_1_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_1_ce0 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        line_buffer_V_1_ce0 = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_ce0;
    end else begin
        line_buffer_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_1_ce1 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce1;
    end else begin
        line_buffer_V_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_1_d0 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_d0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        line_buffer_V_1_d0 = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_d0;
    end else begin
        line_buffer_V_1_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_1_we0 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_we0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        line_buffer_V_1_we0 = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_we0;
    end else begin
        line_buffer_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_address0 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        line_buffer_V_address0 = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_address0;
    end else begin
        line_buffer_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_ce0 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        line_buffer_V_ce0 = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_ce0;
    end else begin
        line_buffer_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_ce1 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce1;
    end else begin
        line_buffer_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_d0 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_d0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        line_buffer_V_d0 = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_d0;
    end else begin
        line_buffer_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        line_buffer_V_we0 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_we0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        line_buffer_V_we0 = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_we0;
    end else begin
        line_buffer_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        resize_out_mat_data84_write = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_write;
    end else begin
        resize_out_mat_data84_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        rgb_mat_data83_read = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_rgb_mat_data83_read;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        rgb_mat_data83_read = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_rgb_mat_data83_read;
    end else begin
        rgb_mat_data83_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((1'b0 == ap_block_state3_on_subcall_done) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((grp_xfUDivResize_fu_174_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((icmp_ln387_fu_427_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
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
            if (((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state17))) begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_i_i_i_i_i368_i_fu_588_p2 = (ret_V_17_cast_reg_985 + 17'd1);

assign add_i_i_i_i_i499_i_fu_503_p2 = (ret_V_cast_fu_478_p4 + 17'd1);

assign add_ln516_fu_662_p2 = (output_rows_count_fu_110 + 32'd1);

assign and_ln1077_fu_712_p2 = (icmp_ln1077_fu_684_p2 & cmp120_reg_1010);

assign and_ln514_fu_646_p2 = (icmp_ln1065_fu_641_p2 & cmp357_reg_1025);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state3_on_subcall_done = ((grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_done == 1'b0) | (grp_xfUDivResize_fu_174_ap_done == 1'b0));
end

assign cmp120_fu_566_p2 = ((read_rows_count_fu_106 != p_read) ? 1'b1 : 1'b0);

assign cmp357_fu_577_p2 = ((read_rows_count_fu_106 == p_read) ? 1'b1 : 1'b0);

assign cmp_i_i419_i_fu_460_p2 = (($signed(conv_i_i443_i_fu_456_p1) > $signed(shl_i_i_i_i417_i_reg_927)) ? 1'b1 : 1'b0);

assign conv_i_i13_i557_i2_cast_fu_371_p1 = conv_i_i13_i557_i2_reg_897;

assign conv_i_i27_i541_i_fu_470_p1 = indexy_pre_comp_V_reg_963;

assign conv_i_i443_i_fu_456_p0 = grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return;

assign conv_i_i443_i_fu_456_p1 = conv_i_i443_i_fu_456_p0;

assign empty_86_fu_395_p1 = tmp_V_fu_366_p2[19:0];

assign empty_87_fu_407_p1 = i_op_assign_fu_374_p2[19:0];

assign empty_88_fu_522_p1 = indexy_pre_V_fu_514_p3[21:0];

assign empty_89_fu_544_p1 = indexy_pre_V_fu_514_p3[23:0];

assign first_row_index_2_fu_694_p3 = ((icmp_ln527_fu_689_p2[0:0] == 1'b1) ? 32'd0 : first_row_index_reg_1067);

assign first_row_index_3_fu_735_p3 = ((or_ln1077_fu_729_p2[0:0] == 1'b1) ? first_row_index_1_fu_114 : first_row_index_2_fu_694_p3);

assign first_row_index_fu_626_p2 = (first_row_index_1_fu_114 + 32'd1);

assign grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg;

assign grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_p_Result_s = tmp_15_reg_991;

assign grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start = grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg;

assign grp_xfUDivResize_fu_174_ap_start = grp_xfUDivResize_fu_174_ap_start_reg;

assign i_2_fu_432_p2 = (i_fu_118 + 32'd1);

assign i_op_assign_fu_374_p2 = ($signed(p_read) + $signed(32'd4294967295));

assign icmp_ln1049_fu_465_p2 = ((trunc_ln392_fu_452_p1 != sub_ln1049_reg_947) ? 1'b1 : 1'b0);

assign icmp_ln1065_1_fu_651_p2 = ((zext_ln1065_fu_637_p1 == op2_assign_2_reg_1031) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_641_p2 = ((zext_ln1065_fu_637_p1 == op2_assign_reg_1018) ? 1'b1 : 1'b0);

assign icmp_ln1077_1_fu_596_p2 = (($signed(zext_ln1077_1_fu_593_p1) < $signed(op2_assign_fu_571_p2)) ? 1'b1 : 1'b0);

assign icmp_ln1077_fu_684_p2 = (($signed(zext_ln1077_fu_680_p1) < $signed(op2_assign_reg_1018)) ? 1'b1 : 1'b0);

assign icmp_ln359_fu_341_p2 = (($signed(p_read2) > $signed(p_read)) ? 1'b1 : 1'b0);

assign icmp_ln361_fu_351_p2 = (($signed(p_read3) > $signed(p_read1)) ? 1'b1 : 1'b0);

assign icmp_ln387_fu_427_p2 = (($signed(i_fu_118) < $signed(loop_row_count_reg_902)) ? 1'b1 : 1'b0);

assign icmp_ln527_fu_689_p2 = ((first_row_index_reg_1067 == 32'd3) ? 1'b1 : 1'b0);

assign indexx_pre_V_1_fu_399_p3 = {{empty_86_fu_395_p1}, {22'd0}};

assign indexy_pre_V_fu_514_p3 = ((tmp_14_fu_496_p3[0:0] == 1'b1) ? 42'd0 : spec_select77_fu_509_p3);

assign loop_col_count_fu_355_p3 = ((icmp_ln361_fu_351_p2[0:0] == 1'b1) ? p_read3 : p_read1);

assign loop_row_count_fu_345_p3 = ((icmp_ln359_fu_341_p2[0:0] == 1'b1) ? p_read2 : p_read);

assign op2_assign_2_fu_582_p2 = ($signed(read_rows_count_fu_106) + $signed(32'd4294967294));

assign op2_assign_fu_571_p2 = ($signed(read_rows_count_fu_106) + $signed(32'd4294967295));

assign or_ln1077_fu_729_p2 = (sel_tmp4_fu_724_p2 | icmp_ln1077_fu_684_p2);

assign or_ln514_fu_656_p2 = (icmp_ln1065_1_fu_651_p2 | and_ln514_fu_646_p2);

assign output_rows_count_1_fu_674_p3 = ((rev123_reg_1056[0:0] == 1'b1) ? select_ln514_fu_667_p3 : output_rows_count_fu_110);

assign p_Val2_s_fu_473_p2 = ($signed(conv_i_i27_i541_i_fu_470_p1) + $signed(conv_i_i13_i557_i2_cast_reg_922));

assign read_rows_count_1_fu_701_p2 = (read_rows_count_fu_106 + 32'd1);

assign read_rows_count_2_fu_717_p3 = ((and_ln1077_fu_712_p2[0:0] == 1'b1) ? read_rows_count_fu_106 : sel_tmp1_fu_706_p3);

assign resize_out_mat_data84_din = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_din;

assign ret_V_20_fu_555_p3 = ((tmp_13_fu_488_p3[0:0] == 1'b1) ? select_ln1048_fu_548_p3 : ret_V_cast_fu_478_p4);

assign ret_V_cast_fu_478_p4 = {{p_Val2_s_fu_473_p2[38:22]}};

assign rev123_fu_614_p2 = (slt_reg_958 ^ 1'd1);

assign sel_tmp1_fu_706_p3 = ((cmp120_reg_1010[0:0] == 1'b1) ? read_rows_count_1_fu_701_p2 : p_read);

assign sel_tmp4_fu_724_p2 = (cmp120_reg_1010 ^ 1'd1);

assign select_ln1048_fu_548_p3 = ((icmp_ln1049_reg_975[0:0] == 1'b1) ? add_i_i_i_i_i499_i_fu_503_p2 : ret_V_cast_fu_478_p4);

assign select_ln514_fu_667_p3 = ((or_ln514_fu_656_p2[0:0] == 1'b1) ? add_ln516_fu_662_p2 : output_rows_count_fu_110);

assign shl_i_i_i393_i_fu_411_p3 = {{empty_87_fu_407_p1}, {22'd0}};

assign shl_i_i_i_i417_i_fu_379_p3 = {{i_op_assign_fu_374_p2}, {22'd0}};

assign shl_i_i_i_i_i_fu_387_p3 = {{tmp_V_fu_366_p2}, {22'd0}};

assign slt_fu_447_p2 = (($signed(sub351_reg_912) < $signed(output_rows_count_fu_110)) ? 1'b1 : 1'b0);

assign spec_select77_fu_509_p3 = ((cmp_i_i419_i_reg_970[0:0] == 1'b1) ? shl_i_i_i393_i_reg_942 : indexy_pre_comp_V_reg_963);

assign sub351_fu_361_p2 = ($signed(p_read2) + $signed(32'd4294967295));

assign sub_ln1049_fu_419_p2 = (22'd0 - conv_i_i_i577_i_cast_reg_892);

assign tmp_13_fu_488_p3 = p_Val2_s_fu_473_p2[32'd42];

assign tmp_14_fu_496_p3 = indexy_pre_comp_V_reg_963[32'd41];

assign tmp_V_fu_366_p2 = ($signed(p_read1) + $signed(32'd4294967295));

assign tmp_fu_289_p3 = {{p_read1}, {1'd0}};

assign trunc_ln305_fu_251_p1 = p_read3[15:0];

assign trunc_ln306_fu_255_p1 = p_read2[15:0];

assign trunc_ln392_fu_452_p0 = grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return;

assign trunc_ln392_fu_452_p1 = trunc_ln392_fu_452_p0[21:0];

assign trunc_ln859_1_fu_317_p1 = grp_xfUDivResize_fu_174_ap_return[47:0];

assign trunc_ln859_fu_305_p1 = grp_xfUDivResize_fu_174_ap_return[47:0];

assign xnew_fu_297_p3 = {{p_read1}, {32'd0}};

assign xor_ln1077_fu_620_p2 = (icmp_ln1077_1_reg_1042 ^ 1'd1);

assign ynew_fu_309_p3 = {{p_read}, {32'd0}};

assign zext_ln1065_fu_637_p1 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out;

assign zext_ln1077_1_fu_593_p1 = ret_V_20_reg_1001;

assign zext_ln1077_fu_680_p1 = grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out;

always @ (posedge ap_clk) begin
    tmp_reg_867[0] <= 1'b0;
    xnew_reg_872[31:0] <= 32'b00000000000000000000000000000000;
    ynew_reg_882[31:0] <= 32'b00000000000000000000000000000000;
    conv_i_i13_i557_i2_cast_reg_922[42:38] <= 5'b00000;
    shl_i_i_i_i417_i_reg_927[21:0] <= 22'b0000000000000000000000;
    shl_i_i_i_i_i_reg_932[21:0] <= 22'b0000000000000000000000;
    indexx_pre_V_1_reg_937[21:0] <= 22'b0000000000000000000000;
    shl_i_i_i393_i_reg_942[21:0] <= 22'b0000000000000000000000;
end

endmodule //pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s
