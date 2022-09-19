-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (31 downto 0);
    p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
    rgb_mat_data83_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    rgb_mat_data83_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rgb_mat_data83_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rgb_mat_data83_empty_n : IN STD_LOGIC;
    rgb_mat_data83_read : OUT STD_LOGIC;
    p_read2 : IN STD_LOGIC_VECTOR (31 downto 0);
    p_read3 : IN STD_LOGIC_VECTOR (31 downto 0);
    resize_out_mat_data84_din : OUT STD_LOGIC_VECTOR (23 downto 0);
    resize_out_mat_data84_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    resize_out_mat_data84_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    resize_out_mat_data84_full_n : IN STD_LOGIC;
    resize_out_mat_data84_write : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (17 downto 0) := "000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (17 downto 0) := "000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (17 downto 0) := "000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (17 downto 0) := "000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (17 downto 0) := "000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (17 downto 0) := "000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (17 downto 0) := "000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (17 downto 0) := "000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (17 downto 0) := "000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (17 downto 0) := "001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (17 downto 0) := "010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (17 downto 0) := "100000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv17_0 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv22_0 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_26 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100110";
    constant ap_const_lv32_2A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101010";
    constant ap_const_lv32_29 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101001";
    constant ap_const_lv17_1 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000001";
    constant ap_const_lv42_0 : STD_LOGIC_VECTOR (41 downto 0) := "000000000000000000000000000000000000000000";
    constant ap_const_lv32_FFFFFFFE : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111110";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal trunc_ln305_fu_251_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln305_reg_857 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln306_fu_255_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln306_reg_862 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_fu_289_p3 : STD_LOGIC_VECTOR (32 downto 0);
    signal tmp_reg_867 : STD_LOGIC_VECTOR (32 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal xnew_fu_297_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal xnew_reg_872 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln859_fu_305_p1 : STD_LOGIC_VECTOR (47 downto 0);
    signal trunc_ln859_reg_877 : STD_LOGIC_VECTOR (47 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ynew_fu_309_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal ynew_reg_882 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln859_1_fu_317_p1 : STD_LOGIC_VECTOR (47 downto 0);
    signal trunc_ln859_1_reg_887 : STD_LOGIC_VECTOR (47 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal conv_i_i_i577_i_cast_reg_892 : STD_LOGIC_VECTOR (21 downto 0);
    signal conv_i_i13_i557_i2_reg_897 : STD_LOGIC_VECTOR (37 downto 0);
    signal loop_row_count_fu_345_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal loop_row_count_reg_902 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal loop_col_count_fu_355_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal loop_col_count_reg_907 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub351_fu_361_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub351_reg_912 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_V_fu_366_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_V_reg_917 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv_i_i13_i557_i2_cast_fu_371_p1 : STD_LOGIC_VECTOR (42 downto 0);
    signal conv_i_i13_i557_i2_cast_reg_922 : STD_LOGIC_VECTOR (42 downto 0);
    signal shl_i_i_i_i417_i_fu_379_p3 : STD_LOGIC_VECTOR (53 downto 0);
    signal shl_i_i_i_i417_i_reg_927 : STD_LOGIC_VECTOR (53 downto 0);
    signal shl_i_i_i_i_i_fu_387_p3 : STD_LOGIC_VECTOR (53 downto 0);
    signal shl_i_i_i_i_i_reg_932 : STD_LOGIC_VECTOR (53 downto 0);
    signal indexx_pre_V_1_fu_399_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal indexx_pre_V_1_reg_937 : STD_LOGIC_VECTOR (41 downto 0);
    signal shl_i_i_i393_i_fu_411_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal shl_i_i_i393_i_reg_942 : STD_LOGIC_VECTOR (41 downto 0);
    signal sub_ln1049_fu_419_p2 : STD_LOGIC_VECTOR (21 downto 0);
    signal sub_ln1049_reg_947 : STD_LOGIC_VECTOR (21 downto 0);
    signal slt_fu_447_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal slt_reg_958 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return : STD_LOGIC_VECTOR (41 downto 0);
    signal indexy_pre_comp_V_reg_963 : STD_LOGIC_VECTOR (41 downto 0);
    signal ap_CS_fsm_state13 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state13 : signal is "none";
    signal cmp_i_i419_i_fu_460_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp_i_i419_i_reg_970 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1049_fu_465_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1049_reg_975 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_88_fu_522_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal empty_88_reg_980 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_CS_fsm_state14 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state14 : signal is "none";
    signal ret_V_17_cast_reg_985 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_15_reg_991 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_89_fu_544_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal empty_89_reg_996 : STD_LOGIC_VECTOR (23 downto 0);
    signal ret_V_20_fu_555_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal ret_V_20_reg_1001 : STD_LOGIC_VECTOR (16 downto 0);
    signal cmp120_fu_566_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp120_reg_1010 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal op2_assign_fu_571_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal op2_assign_reg_1018 : STD_LOGIC_VECTOR (31 downto 0);
    signal cmp357_fu_577_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp357_reg_1025 : STD_LOGIC_VECTOR (0 downto 0);
    signal op2_assign_2_fu_582_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal op2_assign_2_reg_1031 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_i_i_i_i_i368_i_fu_588_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_i_i_i_i_i368_i_reg_1037 : STD_LOGIC_VECTOR (16 downto 0);
    signal icmp_ln1077_1_fu_596_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1077_1_reg_1042 : STD_LOGIC_VECTOR (0 downto 0);
    signal rev123_fu_614_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal rev123_reg_1056 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state16 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state16 : signal is "none";
    signal xor_ln1077_fu_620_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln1077_reg_1062 : STD_LOGIC_VECTOR (0 downto 0);
    signal first_row_index_fu_626_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal first_row_index_reg_1067 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state17 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state17 : signal is "none";
    signal line_buffer_V_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal line_buffer_V_ce0 : STD_LOGIC;
    signal line_buffer_V_we0 : STD_LOGIC;
    signal line_buffer_V_d0 : STD_LOGIC_VECTOR (23 downto 0);
    signal line_buffer_V_q0 : STD_LOGIC_VECTOR (23 downto 0);
    signal line_buffer_V_ce1 : STD_LOGIC;
    signal line_buffer_V_q1 : STD_LOGIC_VECTOR (23 downto 0);
    signal line_buffer_V_1_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal line_buffer_V_1_ce0 : STD_LOGIC;
    signal line_buffer_V_1_we0 : STD_LOGIC;
    signal line_buffer_V_1_d0 : STD_LOGIC_VECTOR (23 downto 0);
    signal line_buffer_V_1_q0 : STD_LOGIC_VECTOR (23 downto 0);
    signal line_buffer_V_1_ce1 : STD_LOGIC;
    signal line_buffer_V_1_q1 : STD_LOGIC_VECTOR (23 downto 0);
    signal line_buffer_V_2_q0 : STD_LOGIC_VECTOR (23 downto 0);
    signal line_buffer_V_2_q1 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_xfUDivResize_fu_174_ap_start : STD_LOGIC;
    signal grp_xfUDivResize_fu_174_ap_done : STD_LOGIC;
    signal grp_xfUDivResize_fu_174_ap_idle : STD_LOGIC;
    signal grp_xfUDivResize_fu_174_ap_ready : STD_LOGIC;
    signal grp_xfUDivResize_fu_174_in_n : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_xfUDivResize_fu_174_in_d : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_xfUDivResize_fu_174_ap_return : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale : STD_LOGIC_VECTOR (47 downto 0);
    signal grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce : STD_LOGIC;
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start : STD_LOGIC;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_done : STD_LOGIC;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_idle : STD_LOGIC;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_ready : STD_LOGIC;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_ce0 : STD_LOGIC;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_we0 : STD_LOGIC;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_d0 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_ce0 : STD_LOGIC;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_we0 : STD_LOGIC;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_d0 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_rgb_mat_data83_read : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_idle : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_ready : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_rgb_mat_data83_read : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_din : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_write : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce0 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_we0 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_d0 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address1 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce1 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce0 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_we0 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_d0 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address1 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce1 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce0 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_we0 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_d0 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address1 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce1 : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_p_Result_s : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out : STD_LOGIC_VECTOR (16 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out_ap_vld : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out : STD_LOGIC_VECTOR (16 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out_ap_vld : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2 : STD_LOGIC_VECTOR (47 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce : STD_LOGIC;
    signal grp_xfUDivResize_fu_174_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state3_on_subcall_done : BOOLEAN;
    signal grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg : STD_LOGIC := '0';
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg : STD_LOGIC := '0';
    signal read_rows_count_fu_106 : STD_LOGIC_VECTOR (31 downto 0);
    signal read_rows_count_2_fu_717_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state18 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state18 : signal is "none";
    signal output_rows_count_fu_110 : STD_LOGIC_VECTOR (31 downto 0);
    signal output_rows_count_1_fu_674_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal first_row_index_1_fu_114 : STD_LOGIC_VECTOR (31 downto 0);
    signal first_row_index_3_fu_735_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_118 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_2_fu_432_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal icmp_ln387_fu_427_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal nextYScale_V_fu_122 : STD_LOGIC_VECTOR (16 downto 0);
    signal indexy_V_fu_126 : STD_LOGIC_VECTOR (16 downto 0);
    signal icmp_ln359_fu_341_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln361_fu_351_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_op_assign_fu_374_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_86_fu_395_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal empty_87_fu_407_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal trunc_ln392_fu_452_p0 : STD_LOGIC_VECTOR (41 downto 0);
    signal conv_i_i443_i_fu_456_p0 : STD_LOGIC_VECTOR (41 downto 0);
    signal conv_i_i443_i_fu_456_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal trunc_ln392_fu_452_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal conv_i_i27_i541_i_fu_470_p1 : STD_LOGIC_VECTOR (42 downto 0);
    signal p_Val2_s_fu_473_p2 : STD_LOGIC_VECTOR (42 downto 0);
    signal ret_V_cast_fu_478_p4 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_14_fu_496_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal spec_select77_fu_509_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal indexy_pre_V_fu_514_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal add_i_i_i_i_i499_i_fu_503_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_13_fu_488_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln1048_fu_548_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln1077_1_fu_593_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln1065_fu_637_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln1065_fu_641_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln514_fu_646_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_1_fu_651_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln514_fu_656_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln516_fu_662_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln514_fu_667_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln1077_fu_680_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln527_fu_689_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal read_rows_count_1_fu_701_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln1077_fu_684_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln1077_fu_712_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp1_fu_706_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal sel_tmp4_fu_724_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln1077_fu_729_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal first_row_index_2_fu_694_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ST_fsm_state16_blk : STD_LOGIC;
    signal ap_ST_fsm_state17_blk : STD_LOGIC;
    signal ap_ST_fsm_state18_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_xfUDivResize IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        in_n : IN STD_LOGIC_VECTOR (63 downto 0);
        in_d : IN STD_LOGIC_VECTOR (15 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component pp_pipeline_accel_scaleCompute_17_42_20_48_16_1_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        currindex : IN STD_LOGIC_VECTOR (31 downto 0);
        inscale : IN STD_LOGIC_VECTOR (47 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (41 downto 0);
        ap_ce : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        bound : IN STD_LOGIC_VECTOR (32 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
        line_buffer_V_1_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
        line_buffer_V_1_ce0 : OUT STD_LOGIC;
        line_buffer_V_1_we0 : OUT STD_LOGIC;
        line_buffer_V_1_d0 : OUT STD_LOGIC_VECTOR (23 downto 0);
        line_buffer_V_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
        line_buffer_V_ce0 : OUT STD_LOGIC;
        line_buffer_V_we0 : OUT STD_LOGIC;
        line_buffer_V_d0 : OUT STD_LOGIC_VECTOR (23 downto 0);
        rgb_mat_data83_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        rgb_mat_data83_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_empty_n : IN STD_LOGIC;
        rgb_mat_data83_read : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        rgb_mat_data83_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        rgb_mat_data83_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_empty_n : IN STD_LOGIC;
        rgb_mat_data83_read : OUT STD_LOGIC;
        resize_out_mat_data84_din : OUT STD_LOGIC_VECTOR (23 downto 0);
        resize_out_mat_data84_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_data84_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_data84_full_n : IN STD_LOGIC;
        resize_out_mat_data84_write : OUT STD_LOGIC;
        indexy_V : IN STD_LOGIC_VECTOR (16 downto 0);
        nextYScale_V : IN STD_LOGIC_VECTOR (16 downto 0);
        ret_V_20 : IN STD_LOGIC_VECTOR (16 downto 0);
        loop_col_count : IN STD_LOGIC_VECTOR (31 downto 0);
        cmp352 : IN STD_LOGIC_VECTOR (0 downto 0);
        line_buffer_V_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
        line_buffer_V_ce0 : OUT STD_LOGIC;
        line_buffer_V_we0 : OUT STD_LOGIC;
        line_buffer_V_d0 : OUT STD_LOGIC_VECTOR (23 downto 0);
        line_buffer_V_q0 : IN STD_LOGIC_VECTOR (23 downto 0);
        line_buffer_V_address1 : OUT STD_LOGIC_VECTOR (11 downto 0);
        line_buffer_V_ce1 : OUT STD_LOGIC;
        line_buffer_V_q1 : IN STD_LOGIC_VECTOR (23 downto 0);
        line_buffer_V_1_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
        line_buffer_V_1_ce0 : OUT STD_LOGIC;
        line_buffer_V_1_we0 : OUT STD_LOGIC;
        line_buffer_V_1_d0 : OUT STD_LOGIC_VECTOR (23 downto 0);
        line_buffer_V_1_q0 : IN STD_LOGIC_VECTOR (23 downto 0);
        line_buffer_V_1_address1 : OUT STD_LOGIC_VECTOR (11 downto 0);
        line_buffer_V_1_ce1 : OUT STD_LOGIC;
        line_buffer_V_1_q1 : IN STD_LOGIC_VECTOR (23 downto 0);
        tmp_V : IN STD_LOGIC_VECTOR (31 downto 0);
        first_row_index_4 : IN STD_LOGIC_VECTOR (31 downto 0);
        line_buffer_V_2_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
        line_buffer_V_2_ce0 : OUT STD_LOGIC;
        line_buffer_V_2_we0 : OUT STD_LOGIC;
        line_buffer_V_2_d0 : OUT STD_LOGIC_VECTOR (23 downto 0);
        line_buffer_V_2_q0 : IN STD_LOGIC_VECTOR (23 downto 0);
        line_buffer_V_2_address1 : OUT STD_LOGIC_VECTOR (11 downto 0);
        line_buffer_V_2_ce1 : OUT STD_LOGIC;
        line_buffer_V_2_q1 : IN STD_LOGIC_VECTOR (23 downto 0);
        trunc_ln3 : IN STD_LOGIC_VECTOR (47 downto 0);
        indexy_pre_V : IN STD_LOGIC_VECTOR (21 downto 0);
        add_i_i_i_i_i368_i : IN STD_LOGIC_VECTOR (16 downto 0);
        ret_V_17_cast : IN STD_LOGIC_VECTOR (16 downto 0);
        p_Result_s : IN STD_LOGIC;
        indexy_pre_V_cast : IN STD_LOGIC_VECTOR (23 downto 0);
        shl_i_i_i_i_i : IN STD_LOGIC_VECTOR (53 downto 0);
        indexx_pre_V_1 : IN STD_LOGIC_VECTOR (41 downto 0);
        cmp120 : IN STD_LOGIC_VECTOR (0 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
        icmp_ln1077_1 : IN STD_LOGIC_VECTOR (0 downto 0);
        op2_assign_2 : IN STD_LOGIC_VECTOR (31 downto 0);
        op2_assign : IN STD_LOGIC_VECTOR (31 downto 0);
        cmp357 : IN STD_LOGIC_VECTOR (0 downto 0);
        p_read3 : IN STD_LOGIC_VECTOR (31 downto 0);
        indexy_V_1_out : OUT STD_LOGIC_VECTOR (16 downto 0);
        indexy_V_1_out_ap_vld : OUT STD_LOGIC;
        nextYScale_V_1_out : OUT STD_LOGIC_VECTOR (16 downto 0);
        nextYScale_V_1_out_ap_vld : OUT STD_LOGIC;
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2 : OUT STD_LOGIC_VECTOR (47 downto 0);
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0 : IN STD_LOGIC_VECTOR (41 downto 0);
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_line_buffer_V_RAM_1WNR_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (11 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (23 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (23 downto 0);
        address1 : IN STD_LOGIC_VECTOR (11 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (23 downto 0) );
    end component;



begin
    line_buffer_V_U : component pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_line_buffer_V_RAM_1WNR_AUTO_1R1W
    generic map (
        DataWidth => 24,
        AddressRange => 3840,
        AddressWidth => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => line_buffer_V_address0,
        ce0 => line_buffer_V_ce0,
        we0 => line_buffer_V_we0,
        d0 => line_buffer_V_d0,
        q0 => line_buffer_V_q0,
        address1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address1,
        ce1 => line_buffer_V_ce1,
        q1 => line_buffer_V_q1);

    line_buffer_V_1_U : component pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_line_buffer_V_RAM_1WNR_AUTO_1R1W
    generic map (
        DataWidth => 24,
        AddressRange => 3840,
        AddressWidth => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => line_buffer_V_1_address0,
        ce0 => line_buffer_V_1_ce0,
        we0 => line_buffer_V_1_we0,
        d0 => line_buffer_V_1_d0,
        q0 => line_buffer_V_1_q0,
        address1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address1,
        ce1 => line_buffer_V_1_ce1,
        q1 => line_buffer_V_1_q1);

    line_buffer_V_2_U : component pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_line_buffer_V_RAM_1WNR_AUTO_1R1W
    generic map (
        DataWidth => 24,
        AddressRange => 3840,
        AddressWidth => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address0,
        ce0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce0,
        we0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_we0,
        d0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_d0,
        q0 => line_buffer_V_2_q0,
        address1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address1,
        ce1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce1,
        q1 => line_buffer_V_2_q1);

    grp_xfUDivResize_fu_174 : component pp_pipeline_accel_xfUDivResize
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_xfUDivResize_fu_174_ap_start,
        ap_done => grp_xfUDivResize_fu_174_ap_done,
        ap_idle => grp_xfUDivResize_fu_174_ap_idle,
        ap_ready => grp_xfUDivResize_fu_174_ap_ready,
        in_n => grp_xfUDivResize_fu_174_in_n,
        in_d => grp_xfUDivResize_fu_174_in_d,
        ap_return => grp_xfUDivResize_fu_174_ap_return);

    grp_scaleCompute_17_42_20_48_16_1_s_fu_191 : component pp_pipeline_accel_scaleCompute_17_42_20_48_16_1_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        currindex => grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex,
        inscale => grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale,
        ap_return => grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return,
        ap_ce => grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce);

    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206 : component pp_pipeline_accel_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start,
        ap_done => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_done,
        ap_idle => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_idle,
        ap_ready => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_ready,
        bound => tmp_reg_867,
        p_read1 => p_read1,
        line_buffer_V_1_address0 => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_address0,
        line_buffer_V_1_ce0 => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_ce0,
        line_buffer_V_1_we0 => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_we0,
        line_buffer_V_1_d0 => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_d0,
        line_buffer_V_address0 => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_address0,
        line_buffer_V_ce0 => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_ce0,
        line_buffer_V_we0 => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_we0,
        line_buffer_V_d0 => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_d0,
        rgb_mat_data83_dout => rgb_mat_data83_dout,
        rgb_mat_data83_num_data_valid => ap_const_lv2_0,
        rgb_mat_data83_fifo_cap => ap_const_lv2_0,
        rgb_mat_data83_empty_n => rgb_mat_data83_empty_n,
        rgb_mat_data83_read => grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_rgb_mat_data83_read);

    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216 : component pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start,
        ap_done => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done,
        ap_idle => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_idle,
        ap_ready => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_ready,
        rgb_mat_data83_dout => rgb_mat_data83_dout,
        rgb_mat_data83_num_data_valid => ap_const_lv2_0,
        rgb_mat_data83_fifo_cap => ap_const_lv2_0,
        rgb_mat_data83_empty_n => rgb_mat_data83_empty_n,
        rgb_mat_data83_read => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_rgb_mat_data83_read,
        resize_out_mat_data84_din => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_din,
        resize_out_mat_data84_num_data_valid => ap_const_lv2_0,
        resize_out_mat_data84_fifo_cap => ap_const_lv2_0,
        resize_out_mat_data84_full_n => resize_out_mat_data84_full_n,
        resize_out_mat_data84_write => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_write,
        indexy_V => indexy_V_fu_126,
        nextYScale_V => nextYScale_V_fu_122,
        ret_V_20 => ret_V_20_reg_1001,
        loop_col_count => loop_col_count_reg_907,
        cmp352 => rev123_reg_1056,
        line_buffer_V_address0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address0,
        line_buffer_V_ce0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce0,
        line_buffer_V_we0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_we0,
        line_buffer_V_d0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_d0,
        line_buffer_V_q0 => line_buffer_V_q0,
        line_buffer_V_address1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address1,
        line_buffer_V_ce1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce1,
        line_buffer_V_q1 => line_buffer_V_q1,
        line_buffer_V_1_address0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address0,
        line_buffer_V_1_ce0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce0,
        line_buffer_V_1_we0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_we0,
        line_buffer_V_1_d0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_d0,
        line_buffer_V_1_q0 => line_buffer_V_1_q0,
        line_buffer_V_1_address1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address1,
        line_buffer_V_1_ce1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce1,
        line_buffer_V_1_q1 => line_buffer_V_1_q1,
        tmp_V => tmp_V_reg_917,
        first_row_index_4 => first_row_index_1_fu_114,
        line_buffer_V_2_address0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address0,
        line_buffer_V_2_ce0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce0,
        line_buffer_V_2_we0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_we0,
        line_buffer_V_2_d0 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_d0,
        line_buffer_V_2_q0 => line_buffer_V_2_q0,
        line_buffer_V_2_address1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_address1,
        line_buffer_V_2_ce1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_2_ce1,
        line_buffer_V_2_q1 => line_buffer_V_2_q1,
        trunc_ln3 => trunc_ln859_reg_877,
        indexy_pre_V => empty_88_reg_980,
        add_i_i_i_i_i368_i => add_i_i_i_i_i368_i_reg_1037,
        ret_V_17_cast => ret_V_17_cast_reg_985,
        p_Result_s => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_p_Result_s,
        indexy_pre_V_cast => empty_89_reg_996,
        shl_i_i_i_i_i => shl_i_i_i_i_i_reg_932,
        indexx_pre_V_1 => indexx_pre_V_1_reg_937,
        cmp120 => cmp120_reg_1010,
        p_read1 => p_read1,
        icmp_ln1077_1 => xor_ln1077_reg_1062,
        op2_assign_2 => op2_assign_2_reg_1031,
        op2_assign => op2_assign_reg_1018,
        cmp357 => cmp357_reg_1025,
        p_read3 => p_read3,
        indexy_V_1_out => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out,
        indexy_V_1_out_ap_vld => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out_ap_vld,
        nextYScale_V_1_out => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out,
        nextYScale_V_1_out_ap_vld => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out_ap_vld,
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1,
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2 => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2,
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0 => grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return,
        grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_ready = ap_const_logic_1)) then 
                    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_ready = ap_const_logic_1)) then 
                    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_xfUDivResize_fu_174_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_xfUDivResize_fu_174_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((ap_const_boolean_0 = ap_block_state3_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
                    grp_xfUDivResize_fu_174_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_xfUDivResize_fu_174_ap_ready = ap_const_logic_1)) then 
                    grp_xfUDivResize_fu_174_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    first_row_index_1_fu_114_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                first_row_index_1_fu_114 <= ap_const_lv32_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state18)) then 
                first_row_index_1_fu_114 <= first_row_index_3_fu_735_p3;
            end if; 
        end if;
    end process;

    i_fu_118_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_fu_118 <= ap_const_lv32_0;
            elsif (((icmp_ln387_fu_427_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
                i_fu_118 <= i_2_fu_432_p2;
            end if; 
        end if;
    end process;

    indexy_V_fu_126_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                indexy_V_fu_126 <= ap_const_lv17_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state18)) then 
                indexy_V_fu_126 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out;
            end if; 
        end if;
    end process;

    nextYScale_V_fu_122_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                nextYScale_V_fu_122 <= ap_const_lv17_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state18)) then 
                nextYScale_V_fu_122 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out;
            end if; 
        end if;
    end process;

    output_rows_count_fu_110_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                output_rows_count_fu_110 <= ap_const_lv32_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state18)) then 
                output_rows_count_fu_110 <= output_rows_count_1_fu_674_p3;
            end if; 
        end if;
    end process;

    read_rows_count_fu_106_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                read_rows_count_fu_106 <= ap_const_lv32_2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state18)) then 
                read_rows_count_fu_106 <= read_rows_count_2_fu_717_p3;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state15)) then
                add_i_i_i_i_i368_i_reg_1037 <= add_i_i_i_i_i368_i_fu_588_p2;
                cmp120_reg_1010 <= cmp120_fu_566_p2;
                cmp357_reg_1025 <= cmp357_fu_577_p2;
                icmp_ln1077_1_reg_1042 <= icmp_ln1077_1_fu_596_p2;
                op2_assign_2_reg_1031 <= op2_assign_2_fu_582_p2;
                op2_assign_reg_1018 <= op2_assign_fu_571_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state13)) then
                cmp_i_i419_i_reg_970 <= cmp_i_i419_i_fu_460_p2;
                icmp_ln1049_reg_975 <= icmp_ln1049_fu_465_p2;
                indexy_pre_comp_V_reg_963 <= grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                    conv_i_i13_i557_i2_cast_reg_922(37 downto 0) <= conv_i_i13_i557_i2_cast_fu_371_p1(37 downto 0);
                    indexx_pre_V_1_reg_937(41 downto 22) <= indexx_pre_V_1_fu_399_p3(41 downto 22);
                loop_col_count_reg_907 <= loop_col_count_fu_355_p3;
                loop_row_count_reg_902 <= loop_row_count_fu_345_p3;
                    shl_i_i_i393_i_reg_942(41 downto 22) <= shl_i_i_i393_i_fu_411_p3(41 downto 22);
                    shl_i_i_i_i417_i_reg_927(53 downto 22) <= shl_i_i_i_i417_i_fu_379_p3(53 downto 22);
                    shl_i_i_i_i_i_reg_932(53 downto 22) <= shl_i_i_i_i_i_fu_387_p3(53 downto 22);
                sub351_reg_912 <= sub351_fu_361_p2;
                sub_ln1049_reg_947 <= sub_ln1049_fu_419_p2;
                tmp_V_reg_917 <= tmp_V_fu_366_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                conv_i_i13_i557_i2_reg_897 <= grp_xfUDivResize_fu_174_ap_return(47 downto 10);
                conv_i_i_i577_i_cast_reg_892 <= grp_xfUDivResize_fu_174_ap_return(31 downto 10);
                trunc_ln859_1_reg_887 <= trunc_ln859_1_fu_317_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state14)) then
                empty_88_reg_980 <= empty_88_fu_522_p1;
                empty_89_reg_996 <= empty_89_fu_544_p1;
                ret_V_17_cast_reg_985 <= indexy_pre_V_fu_514_p3(38 downto 22);
                ret_V_20_reg_1001 <= ret_V_20_fu_555_p3;
                tmp_15_reg_991 <= indexy_pre_V_fu_514_p3(41 downto 41);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state17)) then
                first_row_index_reg_1067 <= first_row_index_fu_626_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state16)) then
                rev123_reg_1056 <= rev123_fu_614_p2;
                xor_ln1077_reg_1062 <= xor_ln1077_fu_620_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                slt_reg_958 <= slt_fu_447_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                    tmp_reg_867(32 downto 1) <= tmp_fu_289_p3(32 downto 1);
                    xnew_reg_872(63 downto 32) <= xnew_fu_297_p3(63 downto 32);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                trunc_ln305_reg_857 <= trunc_ln305_fu_251_p1;
                trunc_ln306_reg_862 <= trunc_ln306_fu_255_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                trunc_ln859_reg_877 <= trunc_ln859_fu_305_p1;
                    ynew_reg_882(63 downto 32) <= ynew_fu_309_p3(63 downto 32);
            end if;
        end if;
    end process;
    tmp_reg_867(0) <= '0';
    xnew_reg_872(31 downto 0) <= "00000000000000000000000000000000";
    ynew_reg_882(31 downto 0) <= "00000000000000000000000000000000";
    conv_i_i13_i557_i2_cast_reg_922(42 downto 38) <= "00000";
    shl_i_i_i_i417_i_reg_927(21 downto 0) <= "0000000000000000000000";
    shl_i_i_i_i_i_reg_932(21 downto 0) <= "0000000000000000000000";
    indexx_pre_V_1_reg_937(21 downto 0) <= "0000000000000000000000";
    shl_i_i_i393_i_reg_942(21 downto 0) <= "0000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state17, grp_xfUDivResize_fu_174_ap_done, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done, ap_block_state3_on_subcall_done, ap_CS_fsm_state6, icmp_ln387_fu_427_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((ap_const_boolean_0 = ap_block_state3_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if (((grp_xfUDivResize_fu_174_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                if (((icmp_ln387_fu_427_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                if (((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then
                    ap_NS_fsm <= ap_ST_fsm_state18;
                else
                    ap_NS_fsm <= ap_ST_fsm_state17;
                end if;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    add_i_i_i_i_i368_i_fu_588_p2 <= std_logic_vector(unsigned(ret_V_17_cast_reg_985) + unsigned(ap_const_lv17_1));
    add_i_i_i_i_i499_i_fu_503_p2 <= std_logic_vector(unsigned(ret_V_cast_fu_478_p4) + unsigned(ap_const_lv17_1));
    add_ln516_fu_662_p2 <= std_logic_vector(unsigned(output_rows_count_fu_110) + unsigned(ap_const_lv32_1));
    and_ln1077_fu_712_p2 <= (icmp_ln1077_fu_684_p2 and cmp120_reg_1010);
    and_ln514_fu_646_p2 <= (icmp_ln1065_fu_641_p2 and cmp357_reg_1025);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state12 <= ap_CS_fsm(11);
    ap_CS_fsm_state13 <= ap_CS_fsm(12);
    ap_CS_fsm_state14 <= ap_CS_fsm(13);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state16 <= ap_CS_fsm(15);
    ap_CS_fsm_state17 <= ap_CS_fsm(16);
    ap_CS_fsm_state18 <= ap_CS_fsm(17);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;
    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;
    ap_ST_fsm_state13_blk <= ap_const_logic_0;
    ap_ST_fsm_state14_blk <= ap_const_logic_0;
    ap_ST_fsm_state15_blk <= ap_const_logic_0;
    ap_ST_fsm_state16_blk <= ap_const_logic_0;

    ap_ST_fsm_state17_blk_assign_proc : process(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done)
    begin
        if ((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state17_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state17_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state18_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(ap_block_state3_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state3_on_subcall_done)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state4_blk_assign_proc : process(grp_xfUDivResize_fu_174_ap_done)
    begin
        if ((grp_xfUDivResize_fu_174_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state3_on_subcall_done_assign_proc : process(grp_xfUDivResize_fu_174_ap_done, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_done)
    begin
                ap_block_state3_on_subcall_done <= ((grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_done = ap_const_logic_0) or (grp_xfUDivResize_fu_174_ap_done = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state6, icmp_ln387_fu_427_p2)
    begin
        if ((((icmp_ln387_fu_427_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6)) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state6, icmp_ln387_fu_427_p2)
    begin
        if (((icmp_ln387_fu_427_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    cmp120_fu_566_p2 <= "0" when (read_rows_count_fu_106 = p_read) else "1";
    cmp357_fu_577_p2 <= "1" when (read_rows_count_fu_106 = p_read) else "0";
    cmp_i_i419_i_fu_460_p2 <= "1" when (signed(conv_i_i443_i_fu_456_p1) > signed(shl_i_i_i_i417_i_reg_927)) else "0";
    conv_i_i13_i557_i2_cast_fu_371_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(conv_i_i13_i557_i2_reg_897),43));
        conv_i_i27_i541_i_fu_470_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(indexy_pre_comp_V_reg_963),43));

    conv_i_i443_i_fu_456_p0 <= grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return;
        conv_i_i443_i_fu_456_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(conv_i_i443_i_fu_456_p0),54));

    empty_86_fu_395_p1 <= tmp_V_fu_366_p2(20 - 1 downto 0);
    empty_87_fu_407_p1 <= i_op_assign_fu_374_p2(20 - 1 downto 0);
    empty_88_fu_522_p1 <= indexy_pre_V_fu_514_p3(22 - 1 downto 0);
    empty_89_fu_544_p1 <= indexy_pre_V_fu_514_p3(24 - 1 downto 0);
    first_row_index_2_fu_694_p3 <= 
        ap_const_lv32_0 when (icmp_ln527_fu_689_p2(0) = '1') else 
        first_row_index_reg_1067;
    first_row_index_3_fu_735_p3 <= 
        first_row_index_1_fu_114 when (or_ln1077_fu_729_p2(0) = '1') else 
        first_row_index_2_fu_694_p3;
    first_row_index_fu_626_p2 <= std_logic_vector(unsigned(first_row_index_1_fu_114) + unsigned(ap_const_lv32_1));
    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_ap_start_reg;
    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_p_Result_s <= tmp_15_reg_991(0);
    grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_ap_start_reg;

    grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce_assign_proc : process(ap_CS_fsm_state7, ap_CS_fsm_state13, ap_CS_fsm_state17, ap_CS_fsm_state8, ap_CS_fsm_state9, ap_CS_fsm_state10, ap_CS_fsm_state11, ap_CS_fsm_state12, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state12) or (ap_const_logic_1 = ap_CS_fsm_state11) or (ap_const_logic_1 = ap_CS_fsm_state10) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state13) or (ap_const_logic_1 = ap_CS_fsm_state7))) then 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce <= ap_const_logic_1;
        else 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_ce <= ap_const_logic_0;
        end if; 
    end process;


    grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex_assign_proc : process(ap_CS_fsm_state7, ap_CS_fsm_state17, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1, output_rows_count_fu_110)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex <= output_rows_count_fu_110;
        else 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_currindex <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale_assign_proc : process(trunc_ln859_1_reg_887, ap_CS_fsm_state7, ap_CS_fsm_state17, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale <= trunc_ln859_1_reg_887;
        else 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_191_inscale <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_xfUDivResize_fu_174_ap_start <= grp_xfUDivResize_fu_174_ap_start_reg;

    grp_xfUDivResize_fu_174_in_d_assign_proc : process(trunc_ln305_reg_857, trunc_ln306_reg_862, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_xfUDivResize_fu_174_in_d <= trunc_ln306_reg_862;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_xfUDivResize_fu_174_in_d <= trunc_ln305_reg_857;
        else 
            grp_xfUDivResize_fu_174_in_d <= "XXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_xfUDivResize_fu_174_in_n_assign_proc : process(xnew_reg_872, ap_CS_fsm_state3, ynew_reg_882, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_xfUDivResize_fu_174_in_n <= ynew_reg_882;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_xfUDivResize_fu_174_in_n <= xnew_reg_872;
        else 
            grp_xfUDivResize_fu_174_in_n <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    i_2_fu_432_p2 <= std_logic_vector(unsigned(i_fu_118) + unsigned(ap_const_lv32_1));
    i_op_assign_fu_374_p2 <= std_logic_vector(unsigned(p_read) + unsigned(ap_const_lv32_FFFFFFFF));
    icmp_ln1049_fu_465_p2 <= "0" when (trunc_ln392_fu_452_p1 = sub_ln1049_reg_947) else "1";
    icmp_ln1065_1_fu_651_p2 <= "1" when (zext_ln1065_fu_637_p1 = op2_assign_2_reg_1031) else "0";
    icmp_ln1065_fu_641_p2 <= "1" when (zext_ln1065_fu_637_p1 = op2_assign_reg_1018) else "0";
    icmp_ln1077_1_fu_596_p2 <= "1" when (signed(zext_ln1077_1_fu_593_p1) < signed(op2_assign_fu_571_p2)) else "0";
    icmp_ln1077_fu_684_p2 <= "1" when (signed(zext_ln1077_fu_680_p1) < signed(op2_assign_reg_1018)) else "0";
    icmp_ln359_fu_341_p2 <= "1" when (signed(p_read2) > signed(p_read)) else "0";
    icmp_ln361_fu_351_p2 <= "1" when (signed(p_read3) > signed(p_read1)) else "0";
    icmp_ln387_fu_427_p2 <= "1" when (signed(i_fu_118) < signed(loop_row_count_reg_902)) else "0";
    icmp_ln527_fu_689_p2 <= "1" when (first_row_index_reg_1067 = ap_const_lv32_3) else "0";
    indexx_pre_V_1_fu_399_p3 <= (empty_86_fu_395_p1 & ap_const_lv22_0);
    indexy_pre_V_fu_514_p3 <= 
        ap_const_lv42_0 when (tmp_14_fu_496_p3(0) = '1') else 
        spec_select77_fu_509_p3;

    line_buffer_V_1_address0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_address0, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_1_address0 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            line_buffer_V_1_address0 <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_address0;
        else 
            line_buffer_V_1_address0 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_1_ce0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_ce0, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_1_ce0 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            line_buffer_V_1_ce0 <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_ce0;
        else 
            line_buffer_V_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    line_buffer_V_1_ce1_assign_proc : process(ap_CS_fsm_state17, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_1_ce1 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_ce1;
        else 
            line_buffer_V_1_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    line_buffer_V_1_d0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_d0, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_d0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_1_d0 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_d0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            line_buffer_V_1_d0 <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_d0;
        else 
            line_buffer_V_1_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_1_we0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_we0, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_we0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_1_we0 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_1_we0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            line_buffer_V_1_we0 <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_1_we0;
        else 
            line_buffer_V_1_we0 <= ap_const_logic_0;
        end if; 
    end process;


    line_buffer_V_address0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_address0, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_address0 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            line_buffer_V_address0 <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_address0;
        else 
            line_buffer_V_address0 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_ce0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_ce0, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_ce0 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            line_buffer_V_ce0 <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_ce0;
        else 
            line_buffer_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    line_buffer_V_ce1_assign_proc : process(ap_CS_fsm_state17, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_ce1 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_ce1;
        else 
            line_buffer_V_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    line_buffer_V_d0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_d0, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_d0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_d0 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_d0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            line_buffer_V_d0 <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_d0;
        else 
            line_buffer_V_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_we0_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_we0, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_we0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            line_buffer_V_we0 <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_line_buffer_V_we0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            line_buffer_V_we0 <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_line_buffer_V_we0;
        else 
            line_buffer_V_we0 <= ap_const_logic_0;
        end if; 
    end process;

    loop_col_count_fu_355_p3 <= 
        p_read3 when (icmp_ln361_fu_351_p2(0) = '1') else 
        p_read1;
    loop_row_count_fu_345_p3 <= 
        p_read2 when (icmp_ln359_fu_341_p2(0) = '1') else 
        p_read;
    op2_assign_2_fu_582_p2 <= std_logic_vector(unsigned(read_rows_count_fu_106) + unsigned(ap_const_lv32_FFFFFFFE));
    op2_assign_fu_571_p2 <= std_logic_vector(unsigned(read_rows_count_fu_106) + unsigned(ap_const_lv32_FFFFFFFF));
    or_ln1077_fu_729_p2 <= (sel_tmp4_fu_724_p2 or icmp_ln1077_fu_684_p2);
    or_ln514_fu_656_p2 <= (icmp_ln1065_1_fu_651_p2 or and_ln514_fu_646_p2);
    output_rows_count_1_fu_674_p3 <= 
        select_ln514_fu_667_p3 when (rev123_reg_1056(0) = '1') else 
        output_rows_count_fu_110;
    p_Val2_s_fu_473_p2 <= std_logic_vector(signed(conv_i_i27_i541_i_fu_470_p1) + signed(conv_i_i13_i557_i2_cast_reg_922));
    read_rows_count_1_fu_701_p2 <= std_logic_vector(unsigned(read_rows_count_fu_106) + unsigned(ap_const_lv32_1));
    read_rows_count_2_fu_717_p3 <= 
        read_rows_count_fu_106 when (and_ln1077_fu_712_p2(0) = '1') else 
        sel_tmp1_fu_706_p3;
    resize_out_mat_data84_din <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_din;

    resize_out_mat_data84_write_assign_proc : process(ap_CS_fsm_state17, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_write)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            resize_out_mat_data84_write <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_resize_out_mat_data84_write;
        else 
            resize_out_mat_data84_write <= ap_const_logic_0;
        end if; 
    end process;

    ret_V_20_fu_555_p3 <= 
        select_ln1048_fu_548_p3 when (tmp_13_fu_488_p3(0) = '1') else 
        ret_V_cast_fu_478_p4;
    ret_V_cast_fu_478_p4 <= p_Val2_s_fu_473_p2(38 downto 22);
    rev123_fu_614_p2 <= (slt_reg_958 xor ap_const_lv1_1);

    rgb_mat_data83_read_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state17, grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_rgb_mat_data83_read, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_rgb_mat_data83_read)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            rgb_mat_data83_read <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_rgb_mat_data83_read;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            rgb_mat_data83_read <= grp_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2_fu_206_rgb_mat_data83_read;
        else 
            rgb_mat_data83_read <= ap_const_logic_0;
        end if; 
    end process;

    sel_tmp1_fu_706_p3 <= 
        read_rows_count_1_fu_701_p2 when (cmp120_reg_1010(0) = '1') else 
        p_read;
    sel_tmp4_fu_724_p2 <= (cmp120_reg_1010 xor ap_const_lv1_1);
    select_ln1048_fu_548_p3 <= 
        add_i_i_i_i_i499_i_fu_503_p2 when (icmp_ln1049_reg_975(0) = '1') else 
        ret_V_cast_fu_478_p4;
    select_ln514_fu_667_p3 <= 
        add_ln516_fu_662_p2 when (or_ln514_fu_656_p2(0) = '1') else 
        output_rows_count_fu_110;
    shl_i_i_i393_i_fu_411_p3 <= (empty_87_fu_407_p1 & ap_const_lv22_0);
    shl_i_i_i_i417_i_fu_379_p3 <= (i_op_assign_fu_374_p2 & ap_const_lv22_0);
    shl_i_i_i_i_i_fu_387_p3 <= (tmp_V_fu_366_p2 & ap_const_lv22_0);
    slt_fu_447_p2 <= "1" when (signed(sub351_reg_912) < signed(output_rows_count_fu_110)) else "0";
    spec_select77_fu_509_p3 <= 
        shl_i_i_i393_i_reg_942 when (cmp_i_i419_i_reg_970(0) = '1') else 
        indexy_pre_comp_V_reg_963;
    sub351_fu_361_p2 <= std_logic_vector(unsigned(p_read2) + unsigned(ap_const_lv32_FFFFFFFF));
    sub_ln1049_fu_419_p2 <= std_logic_vector(unsigned(ap_const_lv22_0) - unsigned(conv_i_i_i577_i_cast_reg_892));
    tmp_13_fu_488_p3 <= p_Val2_s_fu_473_p2(42 downto 42);
    tmp_14_fu_496_p3 <= indexy_pre_comp_V_reg_963(41 downto 41);
    tmp_V_fu_366_p2 <= std_logic_vector(unsigned(p_read1) + unsigned(ap_const_lv32_FFFFFFFF));
    tmp_fu_289_p3 <= (p_read1 & ap_const_lv1_0);
    trunc_ln305_fu_251_p1 <= p_read3(16 - 1 downto 0);
    trunc_ln306_fu_255_p1 <= p_read2(16 - 1 downto 0);
    trunc_ln392_fu_452_p0 <= grp_scaleCompute_17_42_20_48_16_1_s_fu_191_ap_return;
    trunc_ln392_fu_452_p1 <= trunc_ln392_fu_452_p0(22 - 1 downto 0);
    trunc_ln859_1_fu_317_p1 <= grp_xfUDivResize_fu_174_ap_return(48 - 1 downto 0);
    trunc_ln859_fu_305_p1 <= grp_xfUDivResize_fu_174_ap_return(48 - 1 downto 0);
    xnew_fu_297_p3 <= (p_read1 & ap_const_lv32_0);
    xor_ln1077_fu_620_p2 <= (icmp_ln1077_1_reg_1042 xor ap_const_lv1_1);
    ynew_fu_309_p3 <= (p_read & ap_const_lv32_0);
    zext_ln1065_fu_637_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_indexy_V_1_out),32));
    zext_ln1077_1_fu_593_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_V_20_reg_1001),32));
    zext_ln1077_fu_680_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216_nextYScale_V_1_out),32));
end behav;
