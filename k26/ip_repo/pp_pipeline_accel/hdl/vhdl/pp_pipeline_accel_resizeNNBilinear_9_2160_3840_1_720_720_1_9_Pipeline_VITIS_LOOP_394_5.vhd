-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5 is
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
end;


architecture behav of pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    constant ap_const_lv22_0 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    constant ap_const_lv32_29 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101001";
    constant ap_const_lv42_0 : STD_LOGIC_VECTOR (41 downto 0) := "000000000000000000000000000000000000000000";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_26 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100110";
    constant ap_const_lv17_1 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000001";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_15 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010101";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter8 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter9 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter10 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter11 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter12 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter13 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter14 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter15 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter16 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter17 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter18 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter19 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal icmp_ln394_reg_1667 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_reg_1676 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_reg_1676_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op105_read_state9 : BOOLEAN;
    signal ap_block_state9_pp0_stage0_iter8 : BOOLEAN;
    signal ap_block_state10_pp0_stage0_iter9 : BOOLEAN;
    signal ap_block_state11_pp0_stage0_iter10 : BOOLEAN;
    signal ap_block_state12_pp0_stage0_iter11 : BOOLEAN;
    signal ap_block_state13_pp0_stage0_iter12 : BOOLEAN;
    signal ap_block_state14_pp0_stage0_iter13 : BOOLEAN;
    signal ap_block_state15_pp0_stage0_iter14 : BOOLEAN;
    signal ap_block_state16_pp0_stage0_iter15 : BOOLEAN;
    signal ap_block_state17_pp0_stage0_iter16 : BOOLEAN;
    signal ap_block_state18_pp0_stage0_iter17 : BOOLEAN;
    signal ap_block_state19_pp0_stage0_iter18 : BOOLEAN;
    signal and_ln492_reg_1701 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter18_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter18_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter18_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op337_write_state20 : BOOLEAN;
    signal ap_block_state20_pp0_stage0_iter19 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln394_fu_627_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal rgb_mat_data83_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal resize_out_mat_data84_blk_n : STD_LOGIC;
    signal reg_569 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln394_reg_1667_pp0_iter9_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal first_row_index_4_read_reg_1648 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln1065_reg_1695 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter9_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal reg_575 : STD_LOGIC_VECTOR (23 downto 0);
    signal reg_581 : STD_LOGIC_VECTOR (23 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter10_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter10_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp120_read_read_fu_216_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_read_read_fu_240_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp352_read_read_fu_282_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_1_reg_1661 : STD_LOGIC_VECTOR (30 downto 0);
    signal j_1_reg_1661_pp0_iter1_reg : STD_LOGIC_VECTOR (30 downto 0);
    signal j_1_reg_1661_pp0_iter2_reg : STD_LOGIC_VECTOR (30 downto 0);
    signal j_1_reg_1661_pp0_iter3_reg : STD_LOGIC_VECTOR (30 downto 0);
    signal j_1_reg_1661_pp0_iter4_reg : STD_LOGIC_VECTOR (30 downto 0);
    signal j_1_reg_1661_pp0_iter5_reg : STD_LOGIC_VECTOR (30 downto 0);
    signal j_1_reg_1661_pp0_iter6_reg : STD_LOGIC_VECTOR (30 downto 0);
    signal j_1_reg_1661_pp0_iter7_reg : STD_LOGIC_VECTOR (30 downto 0);
    signal j_1_reg_1661_pp0_iter8_reg : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter8_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter11_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter12_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter13_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter14_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter15_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter16_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln394_reg_1667_pp0_iter17_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1049_fu_639_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1049_reg_1671 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_fu_651_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_reg_1676_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_reg_1676_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_reg_1676_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_reg_1676_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_reg_1676_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln411_reg_1676_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_fu_657_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter8_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter9_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter10_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter11_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter12_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter13_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter14_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter15_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter16_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln494_reg_1680_pp0_iter17_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln400_fu_676_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln884_fu_692_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter2_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter3_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter4_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter5_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter6_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter7_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter8_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter9_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_reg_1690_pp0_iter10_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln1065_fu_700_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter8_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_1695_pp0_iter11_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_fu_705_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter8_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter9_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter10_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter11_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter12_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter13_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter14_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter15_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter16_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln492_reg_1701_pp0_iter17_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_fu_715_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter8_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter9_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter10_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter11_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter12_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter13_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter14_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter15_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter16_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln491_reg_1705_pp0_iter17_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal indexx_pre_comp_V_reg_1709 : STD_LOGIC_VECTOR (41 downto 0);
    signal icmp_ln1695_fu_729_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1695_reg_1715 : STD_LOGIC_VECTOR (0 downto 0);
    signal idx_2_fu_796_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal idx_2_reg_1720 : STD_LOGIC_VECTOR (16 downto 0);
    signal trunc_ln884_1_fu_804_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln884_1_reg_1727 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln859_fu_808_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal trunc_ln859_reg_1732 : STD_LOGIC_VECTOR (23 downto 0);
    signal idx_nxt_fu_845_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal idx_nxt_reg_1742 : STD_LOGIC_VECTOR (11 downto 0);
    signal line_buffer_V_1_addr_gep_fu_386_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal line_buffer_V_2_addr_gep_fu_402_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal line_buffer_V_addr_gep_fu_410_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal Wx_V_reg_1777 : STD_LOGIC_VECTOR (11 downto 0);
    signal Wx_V_reg_1777_pp0_iter10_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal Wx_V_reg_1777_pp0_iter11_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal Wx_V_reg_1777_pp0_iter12_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal line_buffer_V_1_addr_1_gep_fu_462_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal line_buffer_V_2_addr_1_gep_fu_470_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal line_buffer_V_addr_1_gep_fu_478_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal Wy_V_fu_891_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal Wy_V_reg_1813 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln674_fu_922_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_1828 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_1828_pp0_iter13_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_1828_pp0_iter14_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_1828_pp0_iter15_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_1828_pp0_iter16_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_reg_1828_pp0_iter17_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal val0_V_fu_974_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal val0_V_reg_1833 : STD_LOGIC_VECTOR (9 downto 0);
    signal val0_V_reg_1833_pp0_iter13_reg : STD_LOGIC_VECTOR (9 downto 0);
    signal val2_V_fu_986_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal val2_V_reg_1838 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln1319_fu_996_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal val0_V_1_fu_1075_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal val0_V_1_reg_1855 : STD_LOGIC_VECTOR (9 downto 0);
    signal val0_V_1_reg_1855_pp0_iter13_reg : STD_LOGIC_VECTOR (9 downto 0);
    signal val2_V_1_fu_1087_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal val2_V_1_reg_1860 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_6_reg_1870 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_6_reg_1870_pp0_iter13_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_6_reg_1870_pp0_iter14_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_6_reg_1870_pp0_iter15_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_6_reg_1870_pp0_iter16_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_6_reg_1870_pp0_iter17_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal val0_V_2_fu_1183_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal val0_V_2_reg_1875 : STD_LOGIC_VECTOR (9 downto 0);
    signal val0_V_2_reg_1875_pp0_iter13_reg : STD_LOGIC_VECTOR (9 downto 0);
    signal val2_V_2_fu_1195_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal val2_V_2_reg_1880 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_11_reg_1890 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_11_reg_1890_pp0_iter13_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_11_reg_1890_pp0_iter14_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_11_reg_1890_pp0_iter15_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_11_reg_1890_pp0_iter16_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_11_reg_1890_pp0_iter17_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1319_1_fu_1218_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal zext_ln864_1_fu_1236_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal grp_fu_1548_p3 : STD_LOGIC_VECTOR (22 downto 0);
    signal ret_V_21_reg_1969 : STD_LOGIC_VECTOR (22 downto 0);
    signal grp_fu_1556_p3 : STD_LOGIC_VECTOR (22 downto 0);
    signal ret_V_22_reg_1974 : STD_LOGIC_VECTOR (22 downto 0);
    signal grp_fu_1564_p3 : STD_LOGIC_VECTOR (22 downto 0);
    signal ret_V_23_reg_1979 : STD_LOGIC_VECTOR (22 downto 0);
    signal ret_V_10_fu_1329_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ret_V_10_reg_1984 : STD_LOGIC_VECTOR (7 downto 0);
    signal ret_V_14_fu_1399_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ret_V_14_reg_1989 : STD_LOGIC_VECTOR (7 downto 0);
    signal ret_V_18_fu_1469_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ret_V_18_reg_1994 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0_ignore_call6 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1_ignore_call6 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2_ignore_call6 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3_ignore_call6 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4_ignore_call6 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5_ignore_call6 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6_ignore_call6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7_ignore_call6 : BOOLEAN;
    signal ap_block_state9_pp0_stage0_iter8_ignore_call6 : BOOLEAN;
    signal ap_block_state10_pp0_stage0_iter9_ignore_call6 : BOOLEAN;
    signal ap_block_state11_pp0_stage0_iter10_ignore_call6 : BOOLEAN;
    signal ap_block_state12_pp0_stage0_iter11_ignore_call6 : BOOLEAN;
    signal ap_block_state13_pp0_stage0_iter12_ignore_call6 : BOOLEAN;
    signal ap_block_state14_pp0_stage0_iter13_ignore_call6 : BOOLEAN;
    signal ap_block_state15_pp0_stage0_iter14_ignore_call6 : BOOLEAN;
    signal ap_block_state16_pp0_stage0_iter15_ignore_call6 : BOOLEAN;
    signal ap_block_state17_pp0_stage0_iter16_ignore_call6 : BOOLEAN;
    signal ap_block_state18_pp0_stage0_iter17_ignore_call6 : BOOLEAN;
    signal ap_block_state19_pp0_stage0_iter18_ignore_call6 : BOOLEAN;
    signal ap_block_state20_pp0_stage0_iter19_ignore_call6 : BOOLEAN;
    signal ap_block_pp0_stage0_11001_ignoreCallOp71 : BOOLEAN;
    signal ap_phi_reg_pp0_iter0_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter1_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter2_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter3_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter4_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter5_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter6_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter7_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter8_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter9_read_pixel_1_reg_486 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_mux_flag_write_phi_fu_508_p6 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter1_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter2_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter3_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter4_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter5_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter6_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter7_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter8_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter9_flag_write_reg_503 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter1_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter2_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter3_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter4_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter5_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter6_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter7_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter8_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter9_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter10_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter11_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter0_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter1_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter2_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter3_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter4_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter5_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter6_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter7_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter8_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter9_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter10_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter11_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter0_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter1_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter2_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter3_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter4_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter5_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter6_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter7_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter8_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter9_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter10_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter11_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter0_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter1_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter2_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter3_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter4_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter5_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter6_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter7_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter8_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter9_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter10_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter11_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 : STD_LOGIC_VECTOR (23 downto 0);
    signal zext_ln435_fu_851_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln394_fu_812_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln436_fu_870_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal nextYScale_V_1_fu_168 : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal tmp_fu_172 : STD_LOGIC_VECTOR (16 downto 0);
    signal ret_V_19_fu_686_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal j_fu_176 : STD_LOGIC_VECTOR (30 downto 0);
    signal add_ln394_fu_633_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_sig_allocacmp_j_1 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln394_1_fu_623_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln413_fu_645_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln400_fu_673_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal ret_V_19_fu_686_p0 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln1048_fu_681_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln1065_fu_696_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln1065_1_fu_710_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sext_ln1696_fu_725_p0 : STD_LOGIC_VECTOR (41 downto 0);
    signal sext_ln1696_fu_725_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal tmp_2_fu_734_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal indexx_pre_V_3_fu_741_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal indexx_pre_V_fu_746_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal trunc_ln1049_fu_772_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal trunc_ln_fu_754_p4 : STD_LOGIC_VECTOR (16 downto 0);
    signal icmp_ln1049_1_fu_776_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ret_V_4_fu_782_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal p_Result_1_fu_764_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln1048_1_fu_788_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal rhs_1_fu_818_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal idx_fu_830_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal not_cmp_i_i176_fu_836_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_fu_833_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln433_fu_841_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal ret_V_6_fu_825_p2 : STD_LOGIC_VECTOR (23 downto 0);
    signal rhs_fu_879_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal ret_V_fu_886_p2 : STD_LOGIC_VECTOR (23 downto 0);
    signal P0Buf_V_10_fu_915_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal P0Buf_V_11_fu_908_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal trunc_ln674_3_fu_934_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_1_fu_926_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_2_fu_930_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1541_fu_938_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln1541_2_fu_946_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal sub_ln75_fu_958_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal sext_ln75_fu_964_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln1541_3_fu_950_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal sub_ln75_1_fu_968_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln1541_1_fu_942_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln75_fu_954_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal val1_V_fu_980_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_s_fu_999_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_5_fu_1029_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_3_fu_1009_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_4_fu_1019_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1541_4_fu_1039_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln1541_6_fu_1047_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal sub_ln75_4_fu_1059_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal sext_ln75_1_fu_1065_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln1541_7_fu_1051_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal sub_ln75_5_fu_1069_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln1541_5_fu_1043_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln75_1_fu_1055_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal val1_V_1_fu_1081_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_7_fu_1107_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_10_fu_1137_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_8_fu_1117_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_9_fu_1127_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1541_8_fu_1147_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln1541_10_fu_1155_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal sub_ln75_8_fu_1167_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal sext_ln75_2_fu_1173_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln1541_11_fu_1159_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal sub_ln75_9_fu_1177_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln1541_9_fu_1151_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln75_2_fu_1163_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal val1_V_2_fu_1189_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal Wxy_V_fu_1227_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_fu_1493_p2 : STD_LOGIC_VECTOR (23 downto 0);
    signal Wxy_V_fu_1227_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1500_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_fu_1507_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_fu_1514_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_fu_1521_p3 : STD_LOGIC_VECTOR (21 downto 0);
    signal grp_fu_1530_p3 : STD_LOGIC_VECTOR (21 downto 0);
    signal grp_fu_1539_p3 : STD_LOGIC_VECTOR (21 downto 0);
    signal P4_V_fu_1267_p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal sext_ln1393_1_fu_1274_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal zext_ln1393_fu_1277_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal ret_V_8_fu_1281_p2 : STD_LOGIC_VECTOR (23 downto 0);
    signal trunc_ln1049_1_fu_1305_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal trunc_ln1029_1_fu_1287_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln1049_2_fu_1309_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ret_V_9_fu_1315_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_6_fu_1297_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln1048_3_fu_1321_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal P4_V_1_fu_1337_p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal sext_ln1393_4_fu_1344_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal zext_ln1393_1_fu_1347_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal ret_V_12_fu_1351_p2 : STD_LOGIC_VECTOR (23 downto 0);
    signal trunc_ln1049_2_fu_1375_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal trunc_ln1029_2_fu_1357_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln1049_3_fu_1379_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ret_V_13_fu_1385_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_7_fu_1367_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln1048_4_fu_1391_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal P4_V_2_fu_1407_p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal sext_ln1393_7_fu_1414_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal zext_ln1393_2_fu_1417_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal ret_V_16_fu_1421_p2 : STD_LOGIC_VECTOR (23 downto 0);
    signal trunc_ln1049_3_fu_1445_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal trunc_ln1029_3_fu_1427_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln1049_4_fu_1449_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ret_V_17_fu_1455_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_8_fu_1437_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln1048_5_fu_1461_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_1493_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1493_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1500_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1507_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1514_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1521_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1530_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1539_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1548_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1556_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1564_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_1493_ce : STD_LOGIC;
    signal grp_fu_1500_ce : STD_LOGIC;
    signal grp_fu_1507_ce : STD_LOGIC;
    signal grp_fu_1514_ce : STD_LOGIC;
    signal grp_fu_1521_ce : STD_LOGIC;
    signal grp_fu_1530_ce : STD_LOGIC;
    signal grp_fu_1539_ce : STD_LOGIC;
    signal grp_fu_1548_ce : STD_LOGIC;
    signal grp_fu_1556_ce : STD_LOGIC;
    signal grp_fu_1564_ce : STD_LOGIC;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter6_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter7_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter8_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter9_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter10_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter11_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter12_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter13_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter14_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter15_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter16_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter17_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter18_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal grp_fu_1493_p00 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_fu_1493_p10 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_condition_346 : BOOLEAN;
    signal ap_condition_108 : BOOLEAN;
    signal ap_condition_691 : BOOLEAN;
    signal ap_condition_1094 : BOOLEAN;
    signal ap_condition_1999 : BOOLEAN;
    signal ap_condition_708 : BOOLEAN;
    signal ap_condition_2006 : BOOLEAN;
    signal ap_condition_699 : BOOLEAN;
    signal ap_condition_707 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_scaleCompute_17_42_20_48_16_1_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        currindex : IN STD_LOGIC_VECTOR (31 downto 0);
        inscale : IN STD_LOGIC_VECTOR (47 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (41 downto 0);
        ap_ce : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_mul_mul_12ns_12ns_24_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (11 downto 0);
        din1 : IN STD_LOGIC_VECTOR (11 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (23 downto 0) );
    end component;


    component pp_pipeline_accel_mul_mul_12ns_9s_21_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (11 downto 0);
        din1 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (20 downto 0) );
    end component;


    component pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (11 downto 0);
        din1 : IN STD_LOGIC_VECTOR (8 downto 0);
        din2 : IN STD_LOGIC_VECTOR (20 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (21 downto 0) );
    end component;


    component pp_pipeline_accel_mac_muladd_12ns_10s_22s_23_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (11 downto 0);
        din1 : IN STD_LOGIC_VECTOR (9 downto 0);
        din2 : IN STD_LOGIC_VECTOR (21 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (22 downto 0) );
    end component;


    component pp_pipeline_accel_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    mul_mul_12ns_12ns_24_4_1_U191 : component pp_pipeline_accel_mul_mul_12ns_12ns_24_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 12,
        dout_WIDTH => 24)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1493_p0,
        din1 => grp_fu_1493_p1,
        ce => grp_fu_1493_ce,
        dout => grp_fu_1493_p2);

    mul_mul_12ns_9s_21_4_1_U192 : component pp_pipeline_accel_mul_mul_12ns_9s_21_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 9,
        dout_WIDTH => 21)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1500_p0,
        din1 => val1_V_fu_980_p2,
        ce => grp_fu_1500_ce,
        dout => grp_fu_1500_p2);

    mul_mul_12ns_9s_21_4_1_U193 : component pp_pipeline_accel_mul_mul_12ns_9s_21_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 9,
        dout_WIDTH => 21)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1507_p0,
        din1 => val1_V_1_fu_1081_p2,
        ce => grp_fu_1507_ce,
        dout => grp_fu_1507_p2);

    mul_mul_12ns_9s_21_4_1_U194 : component pp_pipeline_accel_mul_mul_12ns_9s_21_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 9,
        dout_WIDTH => 21)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1514_p0,
        din1 => val1_V_2_fu_1189_p2,
        ce => grp_fu_1514_ce,
        dout => grp_fu_1514_p2);

    mac_muladd_12ns_9s_21s_22_4_1_U195 : component pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 9,
        din2_WIDTH => 21,
        dout_WIDTH => 22)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1521_p0,
        din1 => val2_V_reg_1838,
        din2 => grp_fu_1500_p2,
        ce => grp_fu_1521_ce,
        dout => grp_fu_1521_p3);

    mac_muladd_12ns_9s_21s_22_4_1_U196 : component pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 9,
        din2_WIDTH => 21,
        dout_WIDTH => 22)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1530_p0,
        din1 => val2_V_1_reg_1860,
        din2 => grp_fu_1507_p2,
        ce => grp_fu_1530_ce,
        dout => grp_fu_1530_p3);

    mac_muladd_12ns_9s_21s_22_4_1_U197 : component pp_pipeline_accel_mac_muladd_12ns_9s_21s_22_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 9,
        din2_WIDTH => 21,
        dout_WIDTH => 22)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1539_p0,
        din1 => val2_V_2_reg_1880,
        din2 => grp_fu_1514_p2,
        ce => grp_fu_1539_ce,
        dout => grp_fu_1539_p3);

    mac_muladd_12ns_10s_22s_23_4_1_U198 : component pp_pipeline_accel_mac_muladd_12ns_10s_22s_23_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 10,
        din2_WIDTH => 22,
        dout_WIDTH => 23)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1548_p0,
        din1 => val0_V_reg_1833_pp0_iter13_reg,
        din2 => grp_fu_1521_p3,
        ce => grp_fu_1548_ce,
        dout => grp_fu_1548_p3);

    mac_muladd_12ns_10s_22s_23_4_1_U199 : component pp_pipeline_accel_mac_muladd_12ns_10s_22s_23_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 10,
        din2_WIDTH => 22,
        dout_WIDTH => 23)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1556_p0,
        din1 => val0_V_1_reg_1855_pp0_iter13_reg,
        din2 => grp_fu_1530_p3,
        ce => grp_fu_1556_ce,
        dout => grp_fu_1556_p3);

    mac_muladd_12ns_10s_22s_23_4_1_U200 : component pp_pipeline_accel_mac_muladd_12ns_10s_22s_23_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 12,
        din1_WIDTH => 10,
        din2_WIDTH => 22,
        dout_WIDTH => 23)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_1564_p0,
        din1 => val0_V_2_reg_1875_pp0_iter13_reg,
        din2 => grp_fu_1539_p3,
        ce => grp_fu_1564_ce,
        dout => grp_fu_1564_p3);

    flow_control_loop_pipe_sequential_init_U : component pp_pipeline_accel_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready_pp0_iter18_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter10_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter10 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter11_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter11 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter12_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter12 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter13_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter13 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter14_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter14 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter15_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter15 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter16_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter16 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter16 <= ap_enable_reg_pp0_iter15;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter17_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter17 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter17 <= ap_enable_reg_pp0_iter16;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter18_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter18 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter18 <= ap_enable_reg_pp0_iter17;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter19_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter19 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter19 <= ap_enable_reg_pp0_iter18;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter8_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter8 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter9_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter9 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
                end if; 
            end if;
        end if;
    end process;


    ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter11 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1))) then 
                    ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 <= reg_569;
                elsif ((ap_const_boolean_1 = ap_condition_346)) then 
                    ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 <= reg_575;
                elsif (((icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0))) then 
                    ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 <= reg_581;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter11_P0Buf_V_6_reg_530;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter11 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1))) then 
                    ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 <= line_buffer_V_1_q1;
                elsif ((ap_const_boolean_1 = ap_condition_346)) then 
                    ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 <= line_buffer_V_2_q1;
                elsif (((icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0))) then 
                    ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 <= line_buffer_V_q1;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter11_P0Buf_V_7_reg_519;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter11 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1))) then 
                    ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 <= line_buffer_V_2_q1;
                elsif ((ap_const_boolean_1 = ap_condition_346)) then 
                    ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 <= line_buffer_V_q1;
                elsif (((icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0))) then 
                    ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 <= line_buffer_V_1_q1;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter11_P1Buf_V_8_reg_552;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter11 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1))) then 
                    ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 <= reg_575;
                elsif ((ap_const_boolean_1 = ap_condition_346)) then 
                    ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 <= reg_581;
                elsif (((icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0))) then 
                    ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 <= reg_569;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter11_P1Buf_V_9_reg_541;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter1_flag_write_reg_503_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((cmp120_read_read_fu_216_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln394_fu_627_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_lv1_0 = and_ln411_fu_651_p2)) or ((cmp120_read_read_fu_216_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln394_fu_627_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
                ap_phi_reg_pp0_iter1_flag_write_reg_503 <= ap_const_lv1_0;
            elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                ap_phi_reg_pp0_iter1_flag_write_reg_503 <= ap_phi_reg_pp0_iter0_flag_write_reg_503;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter9_flag_write_reg_503_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if ((ap_const_boolean_1 = ap_condition_108)) then 
                    ap_phi_reg_pp0_iter9_flag_write_reg_503 <= ap_const_lv1_1;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter9_flag_write_reg_503 <= ap_phi_reg_pp0_iter8_flag_write_reg_503;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter9_read_pixel_1_reg_486_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if ((ap_const_boolean_1 = ap_condition_108)) then 
                    ap_phi_reg_pp0_iter9_read_pixel_1_reg_486 <= rgb_mat_data83_dout;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter9_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter8_read_pixel_1_reg_486;
                end if;
            end if; 
        end if;
    end process;

    j_fu_176_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln394_fu_627_p2 = ap_const_lv1_1))) then 
                    j_fu_176 <= add_ln394_fu_633_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_176 <= ap_const_lv31_0;
                end if;
            end if; 
        end if;
    end process;

    nextYScale_V_1_fu_168_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln394_fu_627_p2 = ap_const_lv1_1))) then 
                    nextYScale_V_1_fu_168 <= ret_V_20;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    nextYScale_V_1_fu_168 <= nextYScale_V;
                end if;
            end if; 
        end if;
    end process;

    tmp_fu_172_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    tmp_fu_172 <= indexy_V;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    tmp_fu_172 <= ret_V_19_fu_686_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (((ap_const_lv1_0 = and_ln492_reg_1701_pp0_iter8_reg) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln491_reg_1705_pp0_iter8_reg)) or ((icmp_ln494_reg_1680_pp0_iter8_reg = ap_const_lv1_1) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln492_reg_1701_pp0_iter8_reg))))) then
                Wx_V_reg_1777 <= ret_V_6_fu_825_p2(23 downto 12);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
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
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (((ap_const_lv1_0 = and_ln492_reg_1701_pp0_iter10_reg) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln491_reg_1705_pp0_iter10_reg)) or ((icmp_ln494_reg_1680_pp0_iter10_reg = ap_const_lv1_1) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln492_reg_1701_pp0_iter10_reg))))) then
                Wy_V_reg_1813 <= ret_V_fu_886_p2(23 downto 12);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((cmp120_read_read_fu_216_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln394_fu_627_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                and_ln411_reg_1676 <= and_ln411_fu_651_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                and_ln411_reg_1676_pp0_iter1_reg <= and_ln411_reg_1676;
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                icmp_ln394_reg_1667 <= icmp_ln394_fu_627_p2;
                icmp_ln394_reg_1667_pp0_iter1_reg <= icmp_ln394_reg_1667;
                icmp_ln494_reg_1680_pp0_iter1_reg <= icmp_ln494_reg_1680;
                j_1_reg_1661 <= ap_sig_allocacmp_j_1;
                j_1_reg_1661_pp0_iter1_reg <= j_1_reg_1661;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_lv1_0 = and_ln492_fu_705_p2) and (cmp352 = ap_const_lv1_1))) then
                and_ln491_reg_1705 <= and_ln491_fu_715_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (cmp352 = ap_const_lv1_1))) then
                and_ln492_reg_1701 <= and_ln492_fu_705_p2;
                icmp_ln1065_reg_1695 <= icmp_ln1065_fu_700_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter10_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter9_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter10_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter9_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter10_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter9_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter10_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter9_P1Buf_V_9_reg_541;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter11_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter10_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter11_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter10_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter11_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter10_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter11_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter10_P1Buf_V_9_reg_541;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter1_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter0_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter1_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter0_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter1_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter0_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter1_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter0_P1Buf_V_9_reg_541;
                ap_phi_reg_pp0_iter1_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter0_read_pixel_1_reg_486;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter2_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter1_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter2_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter1_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter2_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter1_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter2_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter1_P1Buf_V_9_reg_541;
                ap_phi_reg_pp0_iter2_flag_write_reg_503 <= ap_phi_reg_pp0_iter1_flag_write_reg_503;
                ap_phi_reg_pp0_iter2_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter1_read_pixel_1_reg_486;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter3_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter2_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter3_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter2_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter3_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter2_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter3_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter2_P1Buf_V_9_reg_541;
                ap_phi_reg_pp0_iter3_flag_write_reg_503 <= ap_phi_reg_pp0_iter2_flag_write_reg_503;
                ap_phi_reg_pp0_iter3_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter2_read_pixel_1_reg_486;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter4_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter3_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter4_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter3_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter4_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter3_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter4_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter3_P1Buf_V_9_reg_541;
                ap_phi_reg_pp0_iter4_flag_write_reg_503 <= ap_phi_reg_pp0_iter3_flag_write_reg_503;
                ap_phi_reg_pp0_iter4_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter3_read_pixel_1_reg_486;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter5_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter4_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter5_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter4_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter5_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter4_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter5_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter4_P1Buf_V_9_reg_541;
                ap_phi_reg_pp0_iter5_flag_write_reg_503 <= ap_phi_reg_pp0_iter4_flag_write_reg_503;
                ap_phi_reg_pp0_iter5_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter4_read_pixel_1_reg_486;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter5 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter6_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter5_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter6_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter5_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter6_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter5_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter6_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter5_P1Buf_V_9_reg_541;
                ap_phi_reg_pp0_iter6_flag_write_reg_503 <= ap_phi_reg_pp0_iter5_flag_write_reg_503;
                ap_phi_reg_pp0_iter6_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter5_read_pixel_1_reg_486;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter6 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter7_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter6_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter7_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter6_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter7_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter6_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter7_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter6_P1Buf_V_9_reg_541;
                ap_phi_reg_pp0_iter7_flag_write_reg_503 <= ap_phi_reg_pp0_iter6_flag_write_reg_503;
                ap_phi_reg_pp0_iter7_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter6_read_pixel_1_reg_486;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter8_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter7_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter8_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter7_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter8_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter7_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter8_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter7_P1Buf_V_9_reg_541;
                ap_phi_reg_pp0_iter8_flag_write_reg_503 <= ap_phi_reg_pp0_iter7_flag_write_reg_503;
                ap_phi_reg_pp0_iter8_read_pixel_1_reg_486 <= ap_phi_reg_pp0_iter7_read_pixel_1_reg_486;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter9_P0Buf_V_6_reg_530 <= ap_phi_reg_pp0_iter8_P0Buf_V_6_reg_530;
                ap_phi_reg_pp0_iter9_P0Buf_V_7_reg_519 <= ap_phi_reg_pp0_iter8_P0Buf_V_7_reg_519;
                ap_phi_reg_pp0_iter9_P1Buf_V_8_reg_552 <= ap_phi_reg_pp0_iter8_P1Buf_V_8_reg_552;
                ap_phi_reg_pp0_iter9_P1Buf_V_9_reg_541 <= ap_phi_reg_pp0_iter8_P1Buf_V_9_reg_541;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((p_Result_read_read_fu_240_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln394_fu_627_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln1049_reg_1671 <= icmp_ln1049_fu_639_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln394_reg_1667_pp0_iter6_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln1695_reg_1715 <= icmp_ln1695_fu_729_p2;
                indexx_pre_comp_V_reg_1709 <= grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((cmp352_read_read_fu_282_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln394_fu_627_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln494_reg_1680 <= icmp_ln494_fu_657_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln394_reg_1667_pp0_iter7_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                idx_2_reg_1720 <= idx_2_fu_796_p3;
                trunc_ln859_reg_1732 <= trunc_ln859_fu_808_p1;
                trunc_ln884_1_reg_1727 <= trunc_ln884_1_fu_804_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                idx_nxt_reg_1742 <= idx_nxt_fu_845_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then
                reg_569 <= line_buffer_V_1_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then
                reg_575 <= line_buffer_V_2_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then
                reg_581 <= line_buffer_V_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (((ap_const_lv1_0 = and_ln492_reg_1701_pp0_iter17_reg) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln491_reg_1705_pp0_iter17_reg)) or ((icmp_ln494_reg_1680_pp0_iter17_reg = ap_const_lv1_1) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln492_reg_1701_pp0_iter17_reg))))) then
                ret_V_10_reg_1984 <= ret_V_10_fu_1329_p3;
                ret_V_14_reg_1989 <= ret_V_14_fu_1399_p3;
                ret_V_18_reg_1994 <= ret_V_18_fu_1469_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter17 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (((ap_const_lv1_0 = and_ln492_reg_1701_pp0_iter16_reg) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln491_reg_1705_pp0_iter16_reg)) or ((icmp_ln494_reg_1680_pp0_iter16_reg = ap_const_lv1_1) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln492_reg_1701_pp0_iter16_reg))))) then
                ret_V_21_reg_1969 <= grp_fu_1548_p3;
                ret_V_22_reg_1974 <= grp_fu_1556_p3;
                ret_V_23_reg_1979 <= grp_fu_1564_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (((ap_const_lv1_0 = and_ln492_reg_1701_pp0_iter11_reg) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln491_reg_1705_pp0_iter11_reg)) or ((icmp_ln494_reg_1680_pp0_iter11_reg = ap_const_lv1_1) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln492_reg_1701_pp0_iter11_reg))))) then
                tmp_11_reg_1890 <= P0Buf_V_10_fu_915_p3(23 downto 16);
                tmp_6_reg_1870 <= P0Buf_V_10_fu_915_p3(15 downto 8);
                trunc_ln674_reg_1828 <= trunc_ln674_fu_922_p1;
                val0_V_1_reg_1855 <= val0_V_1_fu_1075_p2;
                val0_V_2_reg_1875 <= val0_V_2_fu_1183_p2;
                val0_V_reg_1833 <= val0_V_fu_974_p2;
                val2_V_1_reg_1860 <= val2_V_1_fu_1087_p2;
                val2_V_2_reg_1880 <= val2_V_2_fu_1195_p2;
                val2_V_reg_1838 <= val2_V_fu_986_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln394_reg_1667 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                trunc_ln884_reg_1690 <= trunc_ln884_fu_692_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    P0Buf_V_10_fu_915_p3 <= 
        ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541 when (icmp_ln1065_reg_1695_pp0_iter11_reg(0) = '1') else 
        ap_phi_reg_pp0_iter12_P0Buf_V_6_reg_530;
    P0Buf_V_11_fu_908_p3 <= 
        ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552 when (icmp_ln1065_reg_1695_pp0_iter11_reg(0) = '1') else 
        ap_phi_reg_pp0_iter12_P0Buf_V_7_reg_519;
    P4_V_1_fu_1337_p3 <= (tmp_6_reg_1870_pp0_iter17_reg & ap_const_lv10_0);
    P4_V_2_fu_1407_p3 <= (tmp_11_reg_1890_pp0_iter17_reg & ap_const_lv10_0);
    P4_V_fu_1267_p3 <= (trunc_ln674_reg_1828_pp0_iter17_reg & ap_const_lv10_0);
    Wxy_V_fu_1227_p1 <= grp_fu_1493_p2;
    Wxy_V_fu_1227_p4 <= Wxy_V_fu_1227_p1(21 downto 10);
    Wy_V_fu_891_p4 <= ret_V_fu_886_p2(23 downto 12);
    add_ln394_fu_633_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_j_1) + unsigned(ap_const_lv31_1));
    and_ln411_fu_651_p2 <= (icmp_ln413_fu_645_p2 and icmp_ln1077_1);
    and_ln491_fu_715_p2 <= (icmp_ln494_reg_1680 and icmp_ln1065_1_fu_710_p2);
    and_ln492_fu_705_p2 <= (icmp_ln1065_fu_700_p2 and cmp357);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter8, ap_enable_reg_pp0_iter19, rgb_mat_data83_empty_n, ap_predicate_op105_read_state9, resize_out_mat_data84_full_n, ap_predicate_op337_write_state20)
    begin
                ap_block_pp0_stage0_01001 <= (((rgb_mat_data83_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_predicate_op105_read_state9 = ap_const_boolean_1)) or ((ap_enable_reg_pp0_iter19 = ap_const_logic_1) and (ap_predicate_op337_write_state20 = ap_const_boolean_1) and (resize_out_mat_data84_full_n = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter8, ap_enable_reg_pp0_iter19, rgb_mat_data83_empty_n, ap_predicate_op105_read_state9, resize_out_mat_data84_full_n, ap_predicate_op337_write_state20)
    begin
                ap_block_pp0_stage0_11001 <= (((rgb_mat_data83_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_predicate_op105_read_state9 = ap_const_boolean_1)) or ((ap_enable_reg_pp0_iter19 = ap_const_logic_1) and (ap_predicate_op337_write_state20 = ap_const_boolean_1) and (resize_out_mat_data84_full_n = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_ignoreCallOp71_assign_proc : process(ap_enable_reg_pp0_iter8, ap_enable_reg_pp0_iter19, rgb_mat_data83_empty_n, ap_predicate_op105_read_state9, resize_out_mat_data84_full_n, ap_predicate_op337_write_state20)
    begin
                ap_block_pp0_stage0_11001_ignoreCallOp71 <= (((rgb_mat_data83_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_predicate_op105_read_state9 = ap_const_boolean_1)) or ((ap_enable_reg_pp0_iter19 = ap_const_logic_1) and (ap_predicate_op337_write_state20 = ap_const_boolean_1) and (resize_out_mat_data84_full_n = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter8, ap_enable_reg_pp0_iter19, rgb_mat_data83_empty_n, ap_predicate_op105_read_state9, resize_out_mat_data84_full_n, ap_predicate_op337_write_state20)
    begin
                ap_block_pp0_stage0_subdone <= (((rgb_mat_data83_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_predicate_op105_read_state9 = ap_const_boolean_1)) or ((ap_enable_reg_pp0_iter19 = ap_const_logic_1) and (ap_predicate_op337_write_state20 = ap_const_boolean_1) and (resize_out_mat_data84_full_n = ap_const_logic_0)));
    end process;

        ap_block_state10_pp0_stage0_iter9 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state10_pp0_stage0_iter9_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state11_pp0_stage0_iter10 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state11_pp0_stage0_iter10_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state12_pp0_stage0_iter11 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state12_pp0_stage0_iter11_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state13_pp0_stage0_iter12 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state13_pp0_stage0_iter12_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state14_pp0_stage0_iter13 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state14_pp0_stage0_iter13_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state15_pp0_stage0_iter14 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state15_pp0_stage0_iter14_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state16_pp0_stage0_iter15 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state16_pp0_stage0_iter15_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state17_pp0_stage0_iter16 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state17_pp0_stage0_iter16_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state18_pp0_stage0_iter17 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state18_pp0_stage0_iter17_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state19_pp0_stage0_iter18 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state19_pp0_stage0_iter18_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state20_pp0_stage0_iter19_assign_proc : process(resize_out_mat_data84_full_n, ap_predicate_op337_write_state20)
    begin
                ap_block_state20_pp0_stage0_iter19 <= ((ap_predicate_op337_write_state20 = ap_const_boolean_1) and (resize_out_mat_data84_full_n = ap_const_logic_0));
    end process;


    ap_block_state20_pp0_stage0_iter19_ignore_call6_assign_proc : process(resize_out_mat_data84_full_n, ap_predicate_op337_write_state20)
    begin
                ap_block_state20_pp0_stage0_iter19_ignore_call6 <= ((ap_predicate_op337_write_state20 = ap_const_boolean_1) and (resize_out_mat_data84_full_n = ap_const_logic_0));
    end process;

        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage0_iter7 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage0_iter7_ignore_call6 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state9_pp0_stage0_iter8_assign_proc : process(rgb_mat_data83_empty_n, ap_predicate_op105_read_state9)
    begin
                ap_block_state9_pp0_stage0_iter8 <= ((rgb_mat_data83_empty_n = ap_const_logic_0) and (ap_predicate_op105_read_state9 = ap_const_boolean_1));
    end process;


    ap_block_state9_pp0_stage0_iter8_ignore_call6_assign_proc : process(rgb_mat_data83_empty_n, ap_predicate_op105_read_state9)
    begin
                ap_block_state9_pp0_stage0_iter8_ignore_call6 <= ((rgb_mat_data83_empty_n = ap_const_logic_0) and (ap_predicate_op105_read_state9 = ap_const_boolean_1));
    end process;


    ap_condition_108_assign_proc : process(icmp_ln394_reg_1667_pp0_iter7_reg, and_ln411_reg_1676_pp0_iter7_reg, cmp120)
    begin
                ap_condition_108 <= ((icmp_ln394_reg_1667_pp0_iter7_reg = ap_const_lv1_1) and (cmp120 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln411_reg_1676_pp0_iter7_reg));
    end process;


    ap_condition_1094_assign_proc : process(first_row_index_4_read_reg_1648, ap_phi_mux_flag_write_phi_fu_508_p6)
    begin
                ap_condition_1094 <= (not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1));
    end process;


    ap_condition_1999_assign_proc : process(ap_enable_reg_pp0_iter10, ap_block_pp0_stage0, icmp_ln394_reg_1667_pp0_iter9_reg)
    begin
                ap_condition_1999 <= ((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0));
    end process;


    ap_condition_2006_assign_proc : process(first_row_index_4_read_reg_1648, icmp_ln1065_reg_1695_pp0_iter9_reg)
    begin
                ap_condition_2006 <= (not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0));
    end process;


    ap_condition_346_assign_proc : process(first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter10_reg)
    begin
                ap_condition_346 <= (not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (icmp_ln394_reg_1667_pp0_iter10_reg = ap_const_lv1_1));
    end process;


    ap_condition_691_assign_proc : process(first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg, icmp_ln1065_reg_1695_pp0_iter8_reg)
    begin
                ap_condition_691 <= ((icmp_ln1065_reg_1695_pp0_iter8_reg = ap_const_lv1_0) and (icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1));
    end process;


    ap_condition_699_assign_proc : process(first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg, icmp_ln1065_reg_1695_pp0_iter8_reg)
    begin
                ap_condition_699 <= ((icmp_ln1065_reg_1695_pp0_iter8_reg = ap_const_lv1_0) and (icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0));
    end process;


    ap_condition_707_assign_proc : process(first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg)
    begin
                ap_condition_707 <= (not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1));
    end process;


    ap_condition_708_assign_proc : process(first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg, icmp_ln1065_reg_1695_pp0_iter8_reg)
    begin
                ap_condition_708 <= (not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (icmp_ln1065_reg_1695_pp0_iter8_reg = ap_const_lv1_0) and (icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln394_fu_627_p2)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln394_fu_627_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter18_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter18_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7, ap_enable_reg_pp0_iter8, ap_enable_reg_pp0_iter9, ap_enable_reg_pp0_iter10, ap_enable_reg_pp0_iter11, ap_enable_reg_pp0_iter12, ap_enable_reg_pp0_iter13, ap_enable_reg_pp0_iter14, ap_enable_reg_pp0_iter15, ap_enable_reg_pp0_iter16, ap_enable_reg_pp0_iter17, ap_enable_reg_pp0_iter18, ap_enable_reg_pp0_iter19)
    begin
        if (((ap_enable_reg_pp0_iter19 = ap_const_logic_0) and (ap_enable_reg_pp0_iter18 = ap_const_logic_0) and (ap_enable_reg_pp0_iter17 = ap_const_logic_0) and (ap_enable_reg_pp0_iter16 = ap_const_logic_0) and (ap_enable_reg_pp0_iter15 = ap_const_logic_0) and (ap_enable_reg_pp0_iter14 = ap_const_logic_0) and (ap_enable_reg_pp0_iter13 = ap_const_logic_0) and (ap_enable_reg_pp0_iter12 = ap_const_logic_0) and (ap_enable_reg_pp0_iter11 = ap_const_logic_0) and (ap_enable_reg_pp0_iter10 = ap_const_logic_0) and (ap_enable_reg_pp0_iter9 = ap_const_logic_0) and (ap_enable_reg_pp0_iter8 = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;
    ap_phi_mux_flag_write_phi_fu_508_p6 <= ap_phi_reg_pp0_iter9_flag_write_reg_503;
    ap_phi_reg_pp0_iter0_P0Buf_V_6_reg_530 <= "XXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter0_P0Buf_V_7_reg_519 <= "XXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter0_P1Buf_V_8_reg_552 <= "XXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter0_P1Buf_V_9_reg_541 <= "XXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter0_flag_write_reg_503 <= "X";
    ap_phi_reg_pp0_iter0_read_pixel_1_reg_486 <= "XXXXXXXXXXXXXXXXXXXXXXXX";

    ap_predicate_op105_read_state9_assign_proc : process(icmp_ln394_reg_1667_pp0_iter7_reg, and_ln411_reg_1676_pp0_iter7_reg, cmp120)
    begin
                ap_predicate_op105_read_state9 <= ((icmp_ln394_reg_1667_pp0_iter7_reg = ap_const_lv1_1) and (cmp120 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln411_reg_1676_pp0_iter7_reg));
    end process;


    ap_predicate_op337_write_state20_assign_proc : process(and_ln492_reg_1701_pp0_iter18_reg, icmp_ln494_reg_1680_pp0_iter18_reg, and_ln491_reg_1705_pp0_iter18_reg, cmp352)
    begin
                ap_predicate_op337_write_state20 <= (((ap_const_lv1_0 = and_ln492_reg_1701_pp0_iter18_reg) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln491_reg_1705_pp0_iter18_reg)) or ((icmp_ln494_reg_1680_pp0_iter18_reg = ap_const_lv1_1) and (cmp352 = ap_const_lv1_1) and (ap_const_lv1_1 = and_ln492_reg_1701_pp0_iter18_reg)));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_j_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, j_fu_176)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_j_1 <= ap_const_lv31_0;
        else 
            ap_sig_allocacmp_j_1 <= j_fu_176;
        end if; 
    end process;

    cmp120_read_read_fu_216_p2 <= cmp120;
    cmp352_read_read_fu_282_p2 <= cmp352;
    empty_fu_833_p1 <= idx_2_reg_1720(12 - 1 downto 0);
    first_row_index_4_read_reg_1648 <= first_row_index_4;

    grp_fu_1493_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1493_ce <= ap_const_logic_1;
        else 
            grp_fu_1493_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1493_p0 <= grp_fu_1493_p00(12 - 1 downto 0);
    grp_fu_1493_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Wx_V_reg_1777_pp0_iter10_reg),24));
    grp_fu_1493_p1 <= grp_fu_1493_p10(12 - 1 downto 0);
    grp_fu_1493_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Wy_V_fu_891_p4),24));

    grp_fu_1500_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1500_ce <= ap_const_logic_1;
        else 
            grp_fu_1500_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1500_p0 <= zext_ln1319_fu_996_p1(12 - 1 downto 0);

    grp_fu_1507_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1507_ce <= ap_const_logic_1;
        else 
            grp_fu_1507_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1507_p0 <= zext_ln1319_fu_996_p1(12 - 1 downto 0);

    grp_fu_1514_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1514_ce <= ap_const_logic_1;
        else 
            grp_fu_1514_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1514_p0 <= zext_ln1319_fu_996_p1(12 - 1 downto 0);

    grp_fu_1521_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1521_ce <= ap_const_logic_1;
        else 
            grp_fu_1521_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1521_p0 <= zext_ln1319_1_fu_1218_p1(12 - 1 downto 0);

    grp_fu_1530_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1530_ce <= ap_const_logic_1;
        else 
            grp_fu_1530_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1530_p0 <= zext_ln1319_1_fu_1218_p1(12 - 1 downto 0);

    grp_fu_1539_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1539_ce <= ap_const_logic_1;
        else 
            grp_fu_1539_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1539_p0 <= zext_ln1319_1_fu_1218_p1(12 - 1 downto 0);

    grp_fu_1548_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1548_ce <= ap_const_logic_1;
        else 
            grp_fu_1548_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1548_p0 <= zext_ln864_1_fu_1236_p1(12 - 1 downto 0);

    grp_fu_1556_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1556_ce <= ap_const_logic_1;
        else 
            grp_fu_1556_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1556_p0 <= zext_ln864_1_fu_1236_p1(12 - 1 downto 0);

    grp_fu_1564_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_1564_ce <= ap_const_logic_1;
        else 
            grp_fu_1564_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_1564_p0 <= zext_ln864_1_fu_1236_p1(12 - 1 downto 0);
    grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_ce <= grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce;
    grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din1 <= zext_ln400_fu_676_p1;
    grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_din2 <= trunc_ln3;

    grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001_ignoreCallOp71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001_ignoreCallOp71))) then 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce <= ap_const_logic_1;
        else 
            grp_scaleCompute_17_42_20_48_16_1_s_fu_563_ap_ce <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln1049_1_fu_776_p2 <= "1" when (trunc_ln1049_fu_772_p1 = ap_const_lv22_0) else "0";
    icmp_ln1049_2_fu_1309_p2 <= "1" when (trunc_ln1049_1_fu_1305_p1 = ap_const_lv10_0) else "0";
    icmp_ln1049_3_fu_1379_p2 <= "1" when (trunc_ln1049_2_fu_1375_p1 = ap_const_lv10_0) else "0";
    icmp_ln1049_4_fu_1449_p2 <= "1" when (trunc_ln1049_3_fu_1445_p1 = ap_const_lv10_0) else "0";
    icmp_ln1049_fu_639_p2 <= "0" when (indexy_pre_V = ap_const_lv22_0) else "1";
    icmp_ln1065_1_fu_710_p2 <= "1" when (zext_ln1065_fu_696_p1 = op2_assign_2) else "0";
    icmp_ln1065_fu_700_p2 <= "1" when (op2_assign = zext_ln1065_fu_696_p1) else "0";
    icmp_ln1695_fu_729_p2 <= "1" when (signed(sext_ln1696_fu_725_p1) > signed(shl_i_i_i_i_i)) else "0";
    icmp_ln394_fu_627_p2 <= "1" when (signed(zext_ln394_1_fu_623_p1) < signed(loop_col_count)) else "0";
    icmp_ln413_fu_645_p2 <= "1" when (signed(zext_ln394_1_fu_623_p1) < signed(p_read1)) else "0";
    icmp_ln494_fu_657_p2 <= "1" when (signed(zext_ln394_1_fu_623_p1) < signed(p_read3)) else "0";
    idx_2_fu_796_p3 <= 
        select_ln1048_1_fu_788_p3 when (p_Result_1_fu_764_p3(0) = '1') else 
        trunc_ln_fu_754_p4;
    idx_fu_830_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(idx_2_reg_1720),32));
    idx_nxt_fu_845_p2 <= std_logic_vector(unsigned(empty_fu_833_p1) + unsigned(zext_ln433_fu_841_p1));
    indexx_pre_V_3_fu_741_p3 <= 
        indexx_pre_V_1 when (icmp_ln1695_reg_1715(0) = '1') else 
        indexx_pre_comp_V_reg_1709;
    indexx_pre_V_fu_746_p3 <= 
        ap_const_lv42_0 when (tmp_2_fu_734_p3(0) = '1') else 
        indexx_pre_V_3_fu_741_p3;
    indexy_V_1_out <= tmp_fu_172;

    indexy_V_1_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln394_reg_1667_pp0_iter17_reg)
    begin
        if (((icmp_ln394_reg_1667_pp0_iter17_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            indexy_V_1_out_ap_vld <= ap_const_logic_1;
        else 
            indexy_V_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    line_buffer_V_1_addr_1_gep_fu_462_p3 <= zext_ln436_fu_870_p1(12 - 1 downto 0);
    line_buffer_V_1_addr_gep_fu_386_p3 <= zext_ln435_fu_851_p1(12 - 1 downto 0);

    line_buffer_V_1_address0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0, first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg, line_buffer_V_1_addr_gep_fu_386_p3, zext_ln435_fu_851_p1, zext_ln394_fu_812_p1, ap_condition_691, ap_condition_1094)
    begin
        if (((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then
            if ((ap_const_boolean_1 = ap_condition_1094)) then 
                line_buffer_V_1_address0 <= zext_ln394_fu_812_p1(12 - 1 downto 0);
            elsif (((icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0))) then 
                line_buffer_V_1_address0 <= line_buffer_V_1_addr_gep_fu_386_p3;
            elsif ((ap_const_boolean_1 = ap_condition_691)) then 
                line_buffer_V_1_address0 <= zext_ln435_fu_851_p1(12 - 1 downto 0);
            else 
                line_buffer_V_1_address0 <= "XXXXXXXXXXXX";
            end if;
        else 
            line_buffer_V_1_address0 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_1_address1_assign_proc : process(first_row_index_4_read_reg_1648, icmp_ln1065_reg_1695_pp0_iter9_reg, line_buffer_V_1_addr_1_gep_fu_462_p3, zext_ln436_fu_870_p1, ap_condition_1999)
    begin
        if ((ap_const_boolean_1 = ap_condition_1999)) then
            if ((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) then 
                line_buffer_V_1_address1 <= line_buffer_V_1_addr_1_gep_fu_462_p3;
            elsif (((icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1))) then 
                line_buffer_V_1_address1 <= zext_ln436_fu_870_p1(12 - 1 downto 0);
            else 
                line_buffer_V_1_address1 <= "XXXXXXXXXXXX";
            end if;
        else 
            line_buffer_V_1_address1 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_1_ce0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0_11001, first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg, icmp_ln1065_reg_1695_pp0_iter8_reg, ap_phi_mux_flag_write_phi_fu_508_p6)
    begin
        if ((((icmp_ln1065_reg_1695_pp0_iter8_reg = ap_const_lv1_0) and (icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or (not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            line_buffer_V_1_ce0 <= ap_const_logic_1;
        else 
            line_buffer_V_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    line_buffer_V_1_ce1_assign_proc : process(ap_enable_reg_pp0_iter10, ap_block_pp0_stage0_11001, icmp_ln394_reg_1667_pp0_iter9_reg, first_row_index_4_read_reg_1648, icmp_ln1065_reg_1695_pp0_iter9_reg)
    begin
        if ((((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            line_buffer_V_1_ce1 <= ap_const_logic_1;
        else 
            line_buffer_V_1_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    line_buffer_V_1_d0 <= ap_phi_reg_pp0_iter9_read_pixel_1_reg_486;

    line_buffer_V_1_we0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0_11001, first_row_index_4_read_reg_1648, ap_phi_mux_flag_write_phi_fu_508_p6)
    begin
        if ((not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            line_buffer_V_1_we0 <= ap_const_logic_1;
        else 
            line_buffer_V_1_we0 <= ap_const_logic_0;
        end if; 
    end process;

    line_buffer_V_2_addr_1_gep_fu_470_p3 <= zext_ln436_fu_870_p1(12 - 1 downto 0);
    line_buffer_V_2_addr_gep_fu_402_p3 <= zext_ln435_fu_851_p1(12 - 1 downto 0);

    line_buffer_V_2_address0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0, first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg, line_buffer_V_2_addr_gep_fu_402_p3, ap_phi_mux_flag_write_phi_fu_508_p6, zext_ln435_fu_851_p1, zext_ln394_fu_812_p1, ap_condition_708)
    begin
        if (((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then
            if ((ap_const_boolean_1 = ap_condition_708)) then 
                line_buffer_V_2_address0 <= line_buffer_V_2_addr_gep_fu_402_p3;
            elsif (((ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0))) then 
                line_buffer_V_2_address0 <= zext_ln394_fu_812_p1(12 - 1 downto 0);
            elsif (((icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1))) then 
                line_buffer_V_2_address0 <= zext_ln435_fu_851_p1(12 - 1 downto 0);
            else 
                line_buffer_V_2_address0 <= "XXXXXXXXXXXX";
            end if;
        else 
            line_buffer_V_2_address0 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_2_address1_assign_proc : process(first_row_index_4_read_reg_1648, line_buffer_V_2_addr_1_gep_fu_470_p3, zext_ln436_fu_870_p1, ap_condition_1999, ap_condition_2006)
    begin
        if ((ap_const_boolean_1 = ap_condition_1999)) then
            if ((ap_const_boolean_1 = ap_condition_2006)) then 
                line_buffer_V_2_address1 <= line_buffer_V_2_addr_1_gep_fu_470_p3;
            elsif ((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) then 
                line_buffer_V_2_address1 <= zext_ln436_fu_870_p1(12 - 1 downto 0);
            else 
                line_buffer_V_2_address1 <= "XXXXXXXXXXXX";
            end if;
        else 
            line_buffer_V_2_address1 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_2_ce0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0_11001, first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg, icmp_ln1065_reg_1695_pp0_iter8_reg, ap_phi_mux_flag_write_phi_fu_508_p6)
    begin
        if ((((icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or (not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (icmp_ln1065_reg_1695_pp0_iter8_reg = ap_const_lv1_0) and (icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            line_buffer_V_2_ce0 <= ap_const_logic_1;
        else 
            line_buffer_V_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    line_buffer_V_2_ce1_assign_proc : process(ap_enable_reg_pp0_iter10, ap_block_pp0_stage0_11001, icmp_ln394_reg_1667_pp0_iter9_reg, first_row_index_4_read_reg_1648, icmp_ln1065_reg_1695_pp0_iter9_reg)
    begin
        if (((not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            line_buffer_V_2_ce1 <= ap_const_logic_1;
        else 
            line_buffer_V_2_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    line_buffer_V_2_d0 <= ap_phi_reg_pp0_iter9_read_pixel_1_reg_486;

    line_buffer_V_2_we0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0_11001, first_row_index_4_read_reg_1648, ap_phi_mux_flag_write_phi_fu_508_p6)
    begin
        if (((ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            line_buffer_V_2_we0 <= ap_const_logic_1;
        else 
            line_buffer_V_2_we0 <= ap_const_logic_0;
        end if; 
    end process;

    line_buffer_V_addr_1_gep_fu_478_p3 <= zext_ln436_fu_870_p1(12 - 1 downto 0);
    line_buffer_V_addr_gep_fu_410_p3 <= zext_ln435_fu_851_p1(12 - 1 downto 0);

    line_buffer_V_address0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0, first_row_index_4_read_reg_1648, line_buffer_V_addr_gep_fu_410_p3, ap_phi_mux_flag_write_phi_fu_508_p6, zext_ln435_fu_851_p1, zext_ln394_fu_812_p1, ap_condition_699, ap_condition_707)
    begin
        if (((ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then
            if ((ap_const_boolean_1 = ap_condition_707)) then 
                line_buffer_V_address0 <= line_buffer_V_addr_gep_fu_410_p3;
            elsif ((ap_const_boolean_1 = ap_condition_699)) then 
                line_buffer_V_address0 <= zext_ln435_fu_851_p1(12 - 1 downto 0);
            elsif (((ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1))) then 
                line_buffer_V_address0 <= zext_ln394_fu_812_p1(12 - 1 downto 0);
            else 
                line_buffer_V_address0 <= "XXXXXXXXXXXX";
            end if;
        else 
            line_buffer_V_address0 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_address1_assign_proc : process(first_row_index_4_read_reg_1648, icmp_ln1065_reg_1695_pp0_iter9_reg, line_buffer_V_addr_1_gep_fu_478_p3, zext_ln436_fu_870_p1, ap_condition_1999)
    begin
        if ((ap_const_boolean_1 = ap_condition_1999)) then
            if ((not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)))) then 
                line_buffer_V_address1 <= line_buffer_V_addr_1_gep_fu_478_p3;
            elsif (((icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0))) then 
                line_buffer_V_address1 <= zext_ln436_fu_870_p1(12 - 1 downto 0);
            else 
                line_buffer_V_address1 <= "XXXXXXXXXXXX";
            end if;
        else 
            line_buffer_V_address1 <= "XXXXXXXXXXXX";
        end if; 
    end process;


    line_buffer_V_ce0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0_11001, first_row_index_4_read_reg_1648, icmp_ln394_reg_1667_pp0_iter8_reg, icmp_ln1065_reg_1695_pp0_iter8_reg, ap_phi_mux_flag_write_phi_fu_508_p6)
    begin
        if ((((icmp_ln1065_reg_1695_pp0_iter8_reg = ap_const_lv1_0) and (icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or (not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (icmp_ln394_reg_1667_pp0_iter8_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            line_buffer_V_ce0 <= ap_const_logic_1;
        else 
            line_buffer_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    line_buffer_V_ce1_assign_proc : process(ap_enable_reg_pp0_iter10, ap_block_pp0_stage0_11001, icmp_ln394_reg_1667_pp0_iter9_reg, first_row_index_4_read_reg_1648, icmp_ln1065_reg_1695_pp0_iter9_reg)
    begin
        if (((not((first_row_index_4_read_reg_1648 = ap_const_lv32_0)) and not((first_row_index_4_read_reg_1648 = ap_const_lv32_1)) and (ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter10 = ap_const_logic_1) and (icmp_ln1065_reg_1695_pp0_iter9_reg = ap_const_lv1_0) and (first_row_index_4_read_reg_1648 = ap_const_lv32_0) and (icmp_ln394_reg_1667_pp0_iter9_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            line_buffer_V_ce1 <= ap_const_logic_1;
        else 
            line_buffer_V_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    line_buffer_V_d0 <= ap_phi_reg_pp0_iter9_read_pixel_1_reg_486;

    line_buffer_V_we0_assign_proc : process(ap_enable_reg_pp0_iter9, ap_block_pp0_stage0_11001, first_row_index_4_read_reg_1648, ap_phi_mux_flag_write_phi_fu_508_p6)
    begin
        if (((ap_phi_mux_flag_write_phi_fu_508_p6 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter9 = ap_const_logic_1) and (first_row_index_4_read_reg_1648 = ap_const_lv32_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            line_buffer_V_we0 <= ap_const_logic_1;
        else 
            line_buffer_V_we0 <= ap_const_logic_0;
        end if; 
    end process;

    nextYScale_V_1_out <= nextYScale_V_1_fu_168;

    nextYScale_V_1_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln394_reg_1667_pp0_iter17_reg)
    begin
        if (((icmp_ln394_reg_1667_pp0_iter17_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            nextYScale_V_1_out_ap_vld <= ap_const_logic_1;
        else 
            nextYScale_V_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    not_cmp_i_i176_fu_836_p2 <= "0" when (idx_fu_830_p1 = tmp_V) else "1";
    p_Result_1_fu_764_p3 <= indexx_pre_V_fu_746_p3(41 downto 41);
    p_Result_6_fu_1297_p3 <= ret_V_8_fu_1281_p2(23 downto 23);
    p_Result_7_fu_1367_p3 <= ret_V_12_fu_1351_p2(23 downto 23);
    p_Result_8_fu_1437_p3 <= ret_V_16_fu_1421_p2(23 downto 23);
    p_Result_read_read_fu_240_p2 <= (0=>p_Result_s, others=>'-');

    resize_out_mat_data84_blk_n_assign_proc : process(ap_enable_reg_pp0_iter19, resize_out_mat_data84_full_n, ap_predicate_op337_write_state20, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter19 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op337_write_state20 = ap_const_boolean_1))) then 
            resize_out_mat_data84_blk_n <= resize_out_mat_data84_full_n;
        else 
            resize_out_mat_data84_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    resize_out_mat_data84_din <= ((ret_V_18_reg_1994 & ret_V_14_reg_1989) & ret_V_10_reg_1984);

    resize_out_mat_data84_write_assign_proc : process(ap_enable_reg_pp0_iter19, ap_predicate_op337_write_state20, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter19 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op337_write_state20 = ap_const_boolean_1))) then 
            resize_out_mat_data84_write <= ap_const_logic_1;
        else 
            resize_out_mat_data84_write <= ap_const_logic_0;
        end if; 
    end process;

    ret_V_10_fu_1329_p3 <= 
        select_ln1048_3_fu_1321_p3 when (p_Result_6_fu_1297_p3(0) = '1') else 
        trunc_ln1029_1_fu_1287_p4;
    ret_V_12_fu_1351_p2 <= std_logic_vector(signed(sext_ln1393_4_fu_1344_p1) + signed(zext_ln1393_1_fu_1347_p1));
    ret_V_13_fu_1385_p2 <= std_logic_vector(unsigned(trunc_ln1029_2_fu_1357_p4) + unsigned(ap_const_lv8_1));
    ret_V_14_fu_1399_p3 <= 
        select_ln1048_4_fu_1391_p3 when (p_Result_7_fu_1367_p3(0) = '1') else 
        trunc_ln1029_2_fu_1357_p4;
    ret_V_16_fu_1421_p2 <= std_logic_vector(signed(sext_ln1393_7_fu_1414_p1) + signed(zext_ln1393_2_fu_1417_p1));
    ret_V_17_fu_1455_p2 <= std_logic_vector(unsigned(trunc_ln1029_3_fu_1427_p4) + unsigned(ap_const_lv8_1));
    ret_V_18_fu_1469_p3 <= 
        select_ln1048_5_fu_1461_p3 when (p_Result_8_fu_1437_p3(0) = '1') else 
        trunc_ln1029_3_fu_1427_p4;
    ret_V_19_fu_686_p0 <= (0=>p_Result_s, others=>'-');
    ret_V_19_fu_686_p3 <= 
        select_ln1048_fu_681_p3 when (ret_V_19_fu_686_p0(0) = '1') else 
        ret_V_17_cast;
    ret_V_4_fu_782_p2 <= std_logic_vector(unsigned(trunc_ln_fu_754_p4) + unsigned(ap_const_lv17_1));
    ret_V_6_fu_825_p2 <= std_logic_vector(unsigned(trunc_ln859_reg_1732) - unsigned(rhs_1_fu_818_p3));
    ret_V_8_fu_1281_p2 <= std_logic_vector(signed(sext_ln1393_1_fu_1274_p1) + signed(zext_ln1393_fu_1277_p1));
    ret_V_9_fu_1315_p2 <= std_logic_vector(unsigned(trunc_ln1029_1_fu_1287_p4) + unsigned(ap_const_lv8_1));
    ret_V_fu_886_p2 <= std_logic_vector(unsigned(indexy_pre_V_cast) - unsigned(rhs_fu_879_p3));

    rgb_mat_data83_blk_n_assign_proc : process(ap_enable_reg_pp0_iter8, rgb_mat_data83_empty_n, ap_predicate_op105_read_state9, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op105_read_state9 = ap_const_boolean_1))) then 
            rgb_mat_data83_blk_n <= rgb_mat_data83_empty_n;
        else 
            rgb_mat_data83_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rgb_mat_data83_read_assign_proc : process(ap_enable_reg_pp0_iter8, ap_predicate_op105_read_state9, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op105_read_state9 = ap_const_boolean_1))) then 
            rgb_mat_data83_read <= ap_const_logic_1;
        else 
            rgb_mat_data83_read <= ap_const_logic_0;
        end if; 
    end process;

    rhs_1_fu_818_p3 <= (trunc_ln884_1_reg_1727 & ap_const_lv22_0);
    rhs_fu_879_p3 <= (trunc_ln884_reg_1690_pp0_iter10_reg & ap_const_lv22_0);
    select_ln1048_1_fu_788_p3 <= 
        trunc_ln_fu_754_p4 when (icmp_ln1049_1_fu_776_p2(0) = '1') else 
        ret_V_4_fu_782_p2;
    select_ln1048_3_fu_1321_p3 <= 
        trunc_ln1029_1_fu_1287_p4 when (icmp_ln1049_2_fu_1309_p2(0) = '1') else 
        ret_V_9_fu_1315_p2;
    select_ln1048_4_fu_1391_p3 <= 
        trunc_ln1029_2_fu_1357_p4 when (icmp_ln1049_3_fu_1379_p2(0) = '1') else 
        ret_V_13_fu_1385_p2;
    select_ln1048_5_fu_1461_p3 <= 
        trunc_ln1029_3_fu_1427_p4 when (icmp_ln1049_4_fu_1449_p2(0) = '1') else 
        ret_V_17_fu_1455_p2;
    select_ln1048_fu_681_p3 <= 
        add_i_i_i_i_i368_i when (icmp_ln1049_reg_1671(0) = '1') else 
        ret_V_17_cast;
        sext_ln1393_1_fu_1274_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ret_V_21_reg_1969),24));

        sext_ln1393_4_fu_1344_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ret_V_22_reg_1974),24));

        sext_ln1393_7_fu_1414_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ret_V_23_reg_1979),24));

    sext_ln1696_fu_725_p0 <= grp_scaleCompute_17_42_20_48_16_1_s_fu_191_p_dout0;
        sext_ln1696_fu_725_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln1696_fu_725_p0),54));

        sext_ln75_1_fu_1065_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_ln75_4_fu_1059_p2),10));

        sext_ln75_2_fu_1173_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_ln75_8_fu_1167_p2),10));

        sext_ln75_fu_964_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_ln75_fu_958_p2),10));

    sub_ln75_1_fu_968_p2 <= std_logic_vector(signed(sext_ln75_fu_964_p1) - signed(zext_ln1541_3_fu_950_p1));
    sub_ln75_4_fu_1059_p2 <= std_logic_vector(unsigned(zext_ln1541_4_fu_1039_p1) - unsigned(zext_ln1541_6_fu_1047_p1));
    sub_ln75_5_fu_1069_p2 <= std_logic_vector(signed(sext_ln75_1_fu_1065_p1) - signed(zext_ln1541_7_fu_1051_p1));
    sub_ln75_8_fu_1167_p2 <= std_logic_vector(unsigned(zext_ln1541_8_fu_1147_p1) - unsigned(zext_ln1541_10_fu_1155_p1));
    sub_ln75_9_fu_1177_p2 <= std_logic_vector(signed(sext_ln75_2_fu_1173_p1) - signed(zext_ln1541_11_fu_1159_p1));
    sub_ln75_fu_958_p2 <= std_logic_vector(unsigned(zext_ln1541_fu_938_p1) - unsigned(zext_ln1541_2_fu_946_p1));
    tmp_10_fu_1137_p4 <= ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552(23 downto 16);
    tmp_2_fu_734_p3 <= indexx_pre_comp_V_reg_1709(41 downto 41);
    tmp_3_fu_1009_p4 <= ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541(15 downto 8);
    tmp_4_fu_1019_p4 <= P0Buf_V_11_fu_908_p3(15 downto 8);
    tmp_5_fu_1029_p4 <= ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552(15 downto 8);
    tmp_7_fu_1107_p4 <= P0Buf_V_10_fu_915_p3(23 downto 16);
    tmp_8_fu_1117_p4 <= ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541(23 downto 16);
    tmp_9_fu_1127_p4 <= P0Buf_V_11_fu_908_p3(23 downto 16);
    tmp_s_fu_999_p4 <= P0Buf_V_10_fu_915_p3(15 downto 8);
    trunc_ln1029_1_fu_1287_p4 <= ret_V_8_fu_1281_p2(17 downto 10);
    trunc_ln1029_2_fu_1357_p4 <= ret_V_12_fu_1351_p2(17 downto 10);
    trunc_ln1029_3_fu_1427_p4 <= ret_V_16_fu_1421_p2(17 downto 10);
    trunc_ln1049_1_fu_1305_p1 <= ret_V_8_fu_1281_p2(10 - 1 downto 0);
    trunc_ln1049_2_fu_1375_p1 <= ret_V_12_fu_1351_p2(10 - 1 downto 0);
    trunc_ln1049_3_fu_1445_p1 <= ret_V_16_fu_1421_p2(10 - 1 downto 0);
    trunc_ln1049_fu_772_p1 <= indexx_pre_V_fu_746_p3(22 - 1 downto 0);
    trunc_ln400_fu_673_p1 <= j_1_reg_1661(20 - 1 downto 0);
    trunc_ln674_1_fu_926_p1 <= ap_phi_reg_pp0_iter12_P1Buf_V_9_reg_541(8 - 1 downto 0);
    trunc_ln674_2_fu_930_p1 <= P0Buf_V_11_fu_908_p3(8 - 1 downto 0);
    trunc_ln674_3_fu_934_p1 <= ap_phi_reg_pp0_iter12_P1Buf_V_8_reg_552(8 - 1 downto 0);
    trunc_ln674_fu_922_p1 <= P0Buf_V_10_fu_915_p3(8 - 1 downto 0);
    trunc_ln859_fu_808_p1 <= indexx_pre_V_fu_746_p3(24 - 1 downto 0);
    trunc_ln884_1_fu_804_p1 <= idx_2_fu_796_p3(2 - 1 downto 0);
    trunc_ln884_fu_692_p1 <= ret_V_19_fu_686_p3(2 - 1 downto 0);
    trunc_ln_fu_754_p4 <= indexx_pre_V_fu_746_p3(38 downto 22);
    val0_V_1_fu_1075_p2 <= std_logic_vector(unsigned(sub_ln75_5_fu_1069_p2) + unsigned(zext_ln1541_5_fu_1043_p1));
    val0_V_2_fu_1183_p2 <= std_logic_vector(unsigned(sub_ln75_9_fu_1177_p2) + unsigned(zext_ln1541_9_fu_1151_p1));
    val0_V_fu_974_p2 <= std_logic_vector(unsigned(sub_ln75_1_fu_968_p2) + unsigned(zext_ln1541_1_fu_942_p1));
    val1_V_1_fu_1081_p2 <= std_logic_vector(unsigned(zext_ln1541_6_fu_1047_p1) - unsigned(zext_ln1541_4_fu_1039_p1));
    val1_V_2_fu_1189_p2 <= std_logic_vector(unsigned(zext_ln1541_10_fu_1155_p1) - unsigned(zext_ln1541_8_fu_1147_p1));
    val1_V_fu_980_p2 <= std_logic_vector(unsigned(zext_ln1541_2_fu_946_p1) - unsigned(zext_ln1541_fu_938_p1));
    val2_V_1_fu_1087_p2 <= std_logic_vector(unsigned(zext_ln75_1_fu_1055_p1) - unsigned(zext_ln1541_4_fu_1039_p1));
    val2_V_2_fu_1195_p2 <= std_logic_vector(unsigned(zext_ln75_2_fu_1163_p1) - unsigned(zext_ln1541_8_fu_1147_p1));
    val2_V_fu_986_p2 <= std_logic_vector(unsigned(zext_ln75_fu_954_p1) - unsigned(zext_ln1541_fu_938_p1));
    zext_ln1065_fu_696_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_V_19_fu_686_p3),32));
    zext_ln1319_1_fu_1218_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Wx_V_reg_1777_pp0_iter12_reg),21));
    zext_ln1319_fu_996_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Wy_V_reg_1813),21));
    zext_ln1393_1_fu_1347_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(P4_V_1_fu_1337_p3),24));
    zext_ln1393_2_fu_1417_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(P4_V_2_fu_1407_p3),24));
    zext_ln1393_fu_1277_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(P4_V_fu_1267_p3),24));
    zext_ln1541_10_fu_1155_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_8_fu_1117_p4),9));
    zext_ln1541_11_fu_1159_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_9_fu_1127_p4),10));
    zext_ln1541_1_fu_942_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln674_3_fu_934_p1),10));
    zext_ln1541_2_fu_946_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln674_1_fu_926_p1),9));
    zext_ln1541_3_fu_950_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln674_2_fu_930_p1),10));
    zext_ln1541_4_fu_1039_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_s_fu_999_p4),9));
    zext_ln1541_5_fu_1043_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_5_fu_1029_p4),10));
    zext_ln1541_6_fu_1047_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_3_fu_1009_p4),9));
    zext_ln1541_7_fu_1051_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_4_fu_1019_p4),10));
    zext_ln1541_8_fu_1147_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_7_fu_1107_p4),9));
    zext_ln1541_9_fu_1151_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_10_fu_1137_p4),10));
    zext_ln1541_fu_938_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln674_fu_922_p1),9));
    zext_ln394_1_fu_623_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_j_1),32));
    zext_ln394_fu_812_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_1_reg_1661_pp0_iter8_reg),64));
    zext_ln400_fu_676_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln400_fu_673_p1),32));
    zext_ln433_fu_841_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(not_cmp_i_i176_fu_836_p2),12));
    zext_ln435_fu_851_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(idx_2_reg_1720),64));
    zext_ln436_fu_870_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(idx_nxt_reg_1742),64));
    zext_ln75_1_fu_1055_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_4_fu_1019_p4),9));
    zext_ln75_2_fu_1163_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_9_fu_1127_p4),9));
    zext_ln75_fu_954_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln674_2_fu_930_p1),9));
    zext_ln864_1_fu_1236_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Wxy_V_fu_1227_p4),22));
end behav;
