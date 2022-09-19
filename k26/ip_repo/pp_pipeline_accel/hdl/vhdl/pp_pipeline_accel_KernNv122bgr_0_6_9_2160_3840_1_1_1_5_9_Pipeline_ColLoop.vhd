-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    imgInput_y_data81_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    imgInput_y_data81_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_y_data81_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_y_data81_empty_n : IN STD_LOGIC;
    imgInput_y_data81_read : OUT STD_LOGIC;
    imgInput_uv_data82_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    imgInput_uv_data82_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_uv_data82_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_uv_data82_empty_n : IN STD_LOGIC;
    imgInput_uv_data82_read : OUT STD_LOGIC;
    uvStream_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    uvStream_full_n : IN STD_LOGIC;
    uvStream_write : OUT STD_LOGIC;
    uvStream_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    uvStream_empty_n : IN STD_LOGIC;
    uvStream_read : OUT STD_LOGIC;
    rgb_mat_data83_din : OUT STD_LOGIC_VECTOR (23 downto 0);
    rgb_mat_data83_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rgb_mat_data83_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rgb_mat_data83_full_n : IN STD_LOGIC;
    rgb_mat_data83_write : OUT STD_LOGIC;
    evenBlock : IN STD_LOGIC_VECTOR (0 downto 0);
    width : IN STD_LOGIC_VECTOR (15 downto 0);
    evenRow : IN STD_LOGIC_VECTOR (0 downto 0);
    uvPacked_V_1_out_i : IN STD_LOGIC_VECTOR (15 downto 0);
    uvPacked_V_1_out_o : OUT STD_LOGIC_VECTOR (15 downto 0);
    uvPacked_V_1_out_o_ap_vld : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv8_10 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_const_lv8_F0 : STD_LOGIC_VECTOR (7 downto 0) := "11110000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv8_80 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_15 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010101";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv21_14FE : STD_LOGIC_VECTOR (20 downto 0) := "000000001010011111110";
    constant ap_const_lv21_4000 : STD_LOGIC_VECTOR (20 downto 0) := "000000100000000000000";
    constant ap_const_lv23_4C4A : STD_LOGIC_VECTOR (22 downto 0) := "00000000100110001001010";
    constant ap_const_lv23_7FCDF3 : STD_LOGIC_VECTOR (22 downto 0) := "11111111100110111110011";
    constant ap_const_lv19_24E : STD_LOGIC_VECTOR (18 downto 0) := "0000000001001001110";
    constant ap_const_lv24_FF97EF : STD_LOGIC_VECTOR (23 downto 0) := "111111111001011111101111";

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
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal evenBlock_1_reg_177 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op36_read_state2 : BOOLEAN;
    signal ap_predicate_op37_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal evenBlock_1_reg_177_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op38_read_state3 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal icmp_ln4200_reg_637 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln4200_reg_637_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state9_pp0_stage0_iter8 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln4200_fu_196_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal rgb_mat_data83_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal imgInput_y_data81_blk_n : STD_LOGIC;
    signal imgInput_uv_data82_blk_n : STD_LOGIC;
    signal uvStream_o_blk_n : STD_LOGIC;
    signal uvStream_i_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln4200_reg_637_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln4200_reg_637_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln4200_reg_637_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln4200_reg_637_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln4200_reg_637_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln4200_reg_637_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal evenBlock_2_fu_208_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal evenBlock_2_reg_641 : STD_LOGIC_VECTOR (0 downto 0);
    signal t_reg_646 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_V_reg_652 : STD_LOGIC_VECTOR (15 downto 0);
    signal y1_fu_240_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal y1_reg_657 : STD_LOGIC_VECTOR (7 downto 0);
    signal y1_reg_657_pp0_iter3_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal y1_reg_657_pp0_iter4_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal y1_reg_657_pp0_iter5_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal y1_reg_657_pp0_iter6_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal v_fu_266_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal v_reg_670 : STD_LOGIC_VECTOR (7 downto 0);
    signal v_reg_670_pp0_iter4_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal v_reg_670_pp0_iter5_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal v_reg_670_pp0_iter6_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal u_fu_276_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal u_reg_677 : STD_LOGIC_VECTOR (7 downto 0);
    signal u_reg_677_pp0_iter4_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal u_reg_677_pp0_iter5_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal u_reg_677_pp0_iter6_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln847_3_fu_300_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal zext_ln847_fu_303_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln847_reg_714 : STD_LOGIC_VECTOR (9 downto 0);
    signal trunc_ln_reg_720 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln759_3_reg_731 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln874_fu_338_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln874_reg_737 : STD_LOGIC_VECTOR (9 downto 0);
    signal Value_uchar_6_fu_408_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_6_reg_742 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_7_fu_486_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_7_reg_747 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_8_fu_563_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_8_reg_752 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_mux_evenBlock_1_phi_fu_180_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal j_fu_122 : STD_LOGIC_VECTOR (15 downto 0);
    signal j_3_fu_202_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_sig_allocacmp_j_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal icmp_ln4220_fu_230_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln4220_fu_235_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp9_fu_256_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln714_fu_272_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_579_p3 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln_fu_306_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal grp_fu_589_p3 : STD_LOGIC_VECTOR (22 downto 0);
    signal grp_fu_598_p3 : STD_LOGIC_VECTOR (22 downto 0);
    signal shl_ln_fu_318_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fu_607_p3 : STD_LOGIC_VECTOR (21 downto 0);
    signal sext_ln757_fu_325_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal sext_ln4224_fu_344_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln848_fu_350_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal sext_ln848_fu_347_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal Value_int_fu_355_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_fu_361_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln766_fu_385_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln761_fu_371_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_20_fu_377_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln761_fu_402_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln761_fu_394_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_fu_389_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_616_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal trunc_ln759_1_fu_416_p4 : STD_LOGIC_VECTOR (8 downto 0);
    signal sext_ln759_fu_425_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal Value_int_1_fu_438_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_21_fu_443_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln759_2_fu_429_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln761_1_fu_453_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_22_fu_459_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln761_1_fu_480_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln761_2_fu_472_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_2_fu_467_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal sext_ln759_1_fu_502_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal sext_ln874_fu_494_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal Value_int_2_fu_508_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_23_fu_514_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal sext_ln759_2_fu_505_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln766_3_fu_538_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln874_fu_497_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln761_2_fu_524_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_24_fu_530_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln761_2_fu_557_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln761_4_fu_549_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal Value_uchar_4_fu_543_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_579_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_579_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal grp_fu_579_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_589_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_589_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_fu_598_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_598_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_fu_607_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal grp_fu_607_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_fu_616_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_579_ce : STD_LOGIC;
    signal grp_fu_589_ce : STD_LOGIC;
    signal grp_fu_598_ce : STD_LOGIC;
    signal grp_fu_607_ce : STD_LOGIC;
    signal grp_fu_616_ce : STD_LOGIC;
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
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal grp_fu_579_p00 : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_fu_607_p20 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_condition_642 : BOOLEAN;
    signal ap_condition_647 : BOOLEAN;
    signal ap_condition_652 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_mac_muladd_8ns_13ns_15ns_21_4_1 IS
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
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (12 downto 0);
        din2 : IN STD_LOGIC_VECTOR (14 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (20 downto 0) );
    end component;


    component pp_pipeline_accel_mac_muladd_8s_15ns_21ns_23_4_1 IS
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
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (14 downto 0);
        din2 : IN STD_LOGIC_VECTOR (20 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (22 downto 0) );
    end component;


    component pp_pipeline_accel_mac_muladd_8s_15s_21ns_23_4_1 IS
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
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (14 downto 0);
        din2 : IN STD_LOGIC_VECTOR (20 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (22 downto 0) );
    end component;


    component pp_pipeline_accel_mac_muladd_8s_10ns_21ns_22_4_1 IS
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
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (9 downto 0);
        din2 : IN STD_LOGIC_VECTOR (20 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (21 downto 0) );
    end component;


    component pp_pipeline_accel_mac_muladd_8s_16s_23s_24_4_1 IS
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
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        din2 : IN STD_LOGIC_VECTOR (22 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (23 downto 0) );
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
    mac_muladd_8ns_13ns_15ns_21_4_1_U147 : component pp_pipeline_accel_mac_muladd_8ns_13ns_15ns_21_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 8,
        din1_WIDTH => 13,
        din2_WIDTH => 15,
        dout_WIDTH => 21)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_579_p0,
        din1 => grp_fu_579_p1,
        din2 => grp_fu_579_p2,
        ce => grp_fu_579_ce,
        dout => grp_fu_579_p3);

    mac_muladd_8s_15ns_21ns_23_4_1_U148 : component pp_pipeline_accel_mac_muladd_8s_15ns_21ns_23_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 8,
        din1_WIDTH => 15,
        din2_WIDTH => 21,
        dout_WIDTH => 23)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => v_fu_266_p2,
        din1 => grp_fu_589_p1,
        din2 => grp_fu_589_p2,
        ce => grp_fu_589_ce,
        dout => grp_fu_589_p3);

    mac_muladd_8s_15s_21ns_23_4_1_U149 : component pp_pipeline_accel_mac_muladd_8s_15s_21ns_23_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 8,
        din1_WIDTH => 15,
        din2_WIDTH => 21,
        dout_WIDTH => 23)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => u_fu_276_p2,
        din1 => grp_fu_598_p1,
        din2 => grp_fu_598_p2,
        ce => grp_fu_598_ce,
        dout => grp_fu_598_p3);

    mac_muladd_8s_10ns_21ns_22_4_1_U150 : component pp_pipeline_accel_mac_muladd_8s_10ns_21ns_22_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 8,
        din1_WIDTH => 10,
        din2_WIDTH => 21,
        dout_WIDTH => 22)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => u_fu_276_p2,
        din1 => grp_fu_607_p1,
        din2 => grp_fu_607_p2,
        ce => grp_fu_607_ce,
        dout => grp_fu_607_p3);

    mac_muladd_8s_16s_23s_24_4_1_U151 : component pp_pipeline_accel_mac_muladd_8s_16s_23s_24_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 8,
        din1_WIDTH => 16,
        din2_WIDTH => 23,
        dout_WIDTH => 24)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => v_reg_670,
        din1 => grp_fu_616_p1,
        din2 => grp_fu_598_p3,
        ce => grp_fu_616_ce,
        dout => grp_fu_616_p3);

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
                elsif (((ap_loop_exit_ready_pp0_iter7_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    evenBlock_1_reg_177_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
                if ((ap_const_boolean_1 = ap_condition_647)) then 
                    evenBlock_1_reg_177 <= evenBlock_2_reg_641;
                elsif (((ap_loop_init = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    evenBlock_1_reg_177 <= evenBlock;
                end if;
            end if; 
        end if;
    end process;

    j_fu_122_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln4200_fu_196_p2 = ap_const_lv1_0))) then 
                    j_fu_122 <= j_3_fu_202_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_122 <= ap_const_lv16_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln4200_reg_637_pp0_iter6_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                Value_uchar_6_reg_742 <= Value_uchar_6_fu_408_p3;
                Value_uchar_7_reg_747 <= Value_uchar_7_fu_486_p3;
                Value_uchar_8_reg_752 <= Value_uchar_8_fu_563_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln4200_reg_637_pp0_iter5_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                add_ln874_reg_737 <= add_ln874_fu_338_p2;
                trunc_ln759_3_reg_731 <= grp_fu_607_p3(21 downto 15);
                trunc_ln_reg_720 <= trunc_ln_fu_306_p1(22 downto 15);
                    zext_ln847_reg_714(7 downto 0) <= zext_ln847_fu_303_p1(7 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                evenBlock_1_reg_177_pp0_iter1_reg <= evenBlock_1_reg_177;
                icmp_ln4200_reg_637 <= icmp_ln4200_fu_196_p2;
                icmp_ln4200_reg_637_pp0_iter1_reg <= icmp_ln4200_reg_637;
                t_reg_646 <= imgInput_y_data81_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
                ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
                ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
                icmp_ln4200_reg_637_pp0_iter2_reg <= icmp_ln4200_reg_637_pp0_iter1_reg;
                icmp_ln4200_reg_637_pp0_iter3_reg <= icmp_ln4200_reg_637_pp0_iter2_reg;
                icmp_ln4200_reg_637_pp0_iter4_reg <= icmp_ln4200_reg_637_pp0_iter3_reg;
                icmp_ln4200_reg_637_pp0_iter5_reg <= icmp_ln4200_reg_637_pp0_iter4_reg;
                icmp_ln4200_reg_637_pp0_iter6_reg <= icmp_ln4200_reg_637_pp0_iter5_reg;
                icmp_ln4200_reg_637_pp0_iter7_reg <= icmp_ln4200_reg_637_pp0_iter6_reg;
                u_reg_677_pp0_iter4_reg <= u_reg_677;
                u_reg_677_pp0_iter5_reg <= u_reg_677_pp0_iter4_reg;
                u_reg_677_pp0_iter6_reg <= u_reg_677_pp0_iter5_reg;
                v_reg_670_pp0_iter4_reg <= v_reg_670;
                v_reg_670_pp0_iter5_reg <= v_reg_670_pp0_iter4_reg;
                v_reg_670_pp0_iter6_reg <= v_reg_670_pp0_iter5_reg;
                y1_reg_657_pp0_iter3_reg <= y1_reg_657;
                y1_reg_657_pp0_iter4_reg <= y1_reg_657_pp0_iter3_reg;
                y1_reg_657_pp0_iter5_reg <= y1_reg_657_pp0_iter4_reg;
                y1_reg_657_pp0_iter6_reg <= y1_reg_657_pp0_iter5_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln4200_fu_196_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                evenBlock_2_reg_641 <= evenBlock_2_fu_208_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_V_reg_652 <= imgInput_uv_data82_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln4200_reg_637_pp0_iter2_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                u_reg_677 <= u_fu_276_p2;
                v_reg_670 <= v_fu_266_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln4200_reg_637_pp0_iter1_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                y1_reg_657 <= y1_fu_240_p3;
            end if;
        end if;
    end process;
    zext_ln847_reg_714(9 downto 8) <= "00";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    Value_int_1_fu_438_p2 <= std_logic_vector(signed(sext_ln759_fu_425_p1) + signed(zext_ln847_reg_714));
    Value_int_2_fu_508_p2 <= std_logic_vector(signed(sext_ln759_1_fu_502_p1) + signed(sext_ln874_fu_494_p1));
    Value_int_fu_355_p2 <= std_logic_vector(unsigned(add_ln848_fu_350_p2) + unsigned(sext_ln848_fu_347_p1));
    Value_uchar_2_fu_467_p2 <= std_logic_vector(unsigned(trunc_ln759_2_fu_429_p4) + unsigned(y1_reg_657_pp0_iter6_reg));
    Value_uchar_4_fu_543_p2 <= std_logic_vector(unsigned(add_ln766_3_fu_538_p2) + unsigned(shl_ln874_fu_497_p2));
    Value_uchar_6_fu_408_p3 <= 
        select_ln761_fu_394_p3 when (or_ln761_fu_402_p2(0) = '1') else 
        Value_uchar_fu_389_p2;
    Value_uchar_7_fu_486_p3 <= 
        select_ln761_2_fu_472_p3 when (or_ln761_1_fu_480_p2(0) = '1') else 
        Value_uchar_2_fu_467_p2;
    Value_uchar_8_fu_563_p3 <= 
        select_ln761_4_fu_549_p3 when (or_ln761_2_fu_557_p2(0) = '1') else 
        Value_uchar_4_fu_543_p2;
    Value_uchar_fu_389_p2 <= std_logic_vector(unsigned(add_ln766_fu_385_p2) + unsigned(v_reg_670_pp0_iter6_reg));
    add_ln4220_fu_235_p2 <= std_logic_vector(unsigned(t_reg_646) + unsigned(ap_const_lv8_F0));
    add_ln766_3_fu_538_p2 <= std_logic_vector(unsigned(y1_reg_657_pp0_iter6_reg) + unsigned(sext_ln759_2_fu_505_p1));
    add_ln766_fu_385_p2 <= std_logic_vector(unsigned(y1_reg_657_pp0_iter6_reg) + unsigned(trunc_ln_reg_720));
    add_ln848_fu_350_p2 <= std_logic_vector(signed(sext_ln4224_fu_344_p1) + signed(zext_ln847_reg_714));
    add_ln874_fu_338_p2 <= std_logic_vector(signed(sext_ln757_fu_325_p1) + signed(zext_ln847_fu_303_p1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter8, imgInput_y_data81_empty_n, imgInput_uv_data82_empty_n, ap_predicate_op36_read_state2, uvStream_full_n, ap_predicate_op37_write_state2, uvStream_empty_n, ap_predicate_op38_read_state3, rgb_mat_data83_full_n, icmp_ln4200_reg_637_pp0_iter7_reg)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_predicate_op38_read_state3 = ap_const_boolean_1) and (uvStream_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((imgInput_y_data81_empty_n = ap_const_logic_0) or ((ap_predicate_op37_write_state2 = ap_const_boolean_1) and (uvStream_full_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (imgInput_uv_data82_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (icmp_ln4200_reg_637_pp0_iter7_reg = ap_const_lv1_0) and (rgb_mat_data83_full_n = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter8, imgInput_y_data81_empty_n, imgInput_uv_data82_empty_n, ap_predicate_op36_read_state2, uvStream_full_n, ap_predicate_op37_write_state2, uvStream_empty_n, ap_predicate_op38_read_state3, rgb_mat_data83_full_n, icmp_ln4200_reg_637_pp0_iter7_reg)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_predicate_op38_read_state3 = ap_const_boolean_1) and (uvStream_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((imgInput_y_data81_empty_n = ap_const_logic_0) or ((ap_predicate_op37_write_state2 = ap_const_boolean_1) and (uvStream_full_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (imgInput_uv_data82_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (icmp_ln4200_reg_637_pp0_iter7_reg = ap_const_lv1_0) and (rgb_mat_data83_full_n = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter8, imgInput_y_data81_empty_n, imgInput_uv_data82_empty_n, ap_predicate_op36_read_state2, uvStream_full_n, ap_predicate_op37_write_state2, uvStream_empty_n, ap_predicate_op38_read_state3, rgb_mat_data83_full_n, icmp_ln4200_reg_637_pp0_iter7_reg)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_predicate_op38_read_state3 = ap_const_boolean_1) and (uvStream_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((imgInput_y_data81_empty_n = ap_const_logic_0) or ((ap_predicate_op37_write_state2 = ap_const_boolean_1) and (uvStream_full_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (imgInput_uv_data82_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (icmp_ln4200_reg_637_pp0_iter7_reg = ap_const_lv1_0) and (rgb_mat_data83_full_n = ap_const_logic_0)));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state2_pp0_stage0_iter1_assign_proc : process(imgInput_y_data81_empty_n, imgInput_uv_data82_empty_n, ap_predicate_op36_read_state2, uvStream_full_n, ap_predicate_op37_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((imgInput_y_data81_empty_n = ap_const_logic_0) or ((ap_predicate_op37_write_state2 = ap_const_boolean_1) and (uvStream_full_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (imgInput_uv_data82_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(uvStream_empty_n, ap_predicate_op38_read_state3)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((ap_predicate_op38_read_state3 = ap_const_boolean_1) and (uvStream_empty_n = ap_const_logic_0));
    end process;

        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage0_iter7 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state9_pp0_stage0_iter8_assign_proc : process(rgb_mat_data83_full_n, icmp_ln4200_reg_637_pp0_iter7_reg)
    begin
                ap_block_state9_pp0_stage0_iter8 <= ((icmp_ln4200_reg_637_pp0_iter7_reg = ap_const_lv1_0) and (rgb_mat_data83_full_n = ap_const_logic_0));
    end process;


    ap_condition_642_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln4200_reg_637, ap_block_pp0_stage0)
    begin
                ap_condition_642 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln4200_reg_637 = ap_const_lv1_0));
    end process;


    ap_condition_647_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln4200_reg_637, ap_block_pp0_stage0_11001)
    begin
                ap_condition_647 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln4200_reg_637 = ap_const_lv1_0));
    end process;


    ap_condition_652_assign_proc : process(ap_enable_reg_pp0_iter2, evenBlock_1_reg_177_pp0_iter1_reg, ap_block_pp0_stage0)
    begin
                ap_condition_652 <= ((evenBlock_1_reg_177_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln4200_fu_196_p2)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln4200_fu_196_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter7_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter7_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7, ap_enable_reg_pp0_iter8)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_phi_mux_evenBlock_1_phi_fu_180_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, evenBlock, evenBlock_2_reg_641, ap_loop_init, ap_condition_642)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
            if ((ap_const_boolean_1 = ap_condition_642)) then 
                ap_phi_mux_evenBlock_1_phi_fu_180_p4 <= evenBlock_2_reg_641;
            elsif ((ap_loop_init = ap_const_logic_1)) then 
                ap_phi_mux_evenBlock_1_phi_fu_180_p4 <= evenBlock;
            else 
                ap_phi_mux_evenBlock_1_phi_fu_180_p4 <= evenBlock_2_reg_641;
            end if;
        else 
            ap_phi_mux_evenBlock_1_phi_fu_180_p4 <= evenBlock_2_reg_641;
        end if; 
    end process;


    ap_predicate_op36_read_state2_assign_proc : process(evenBlock_1_reg_177, evenRow)
    begin
                ap_predicate_op36_read_state2 <= ((evenBlock_1_reg_177 = ap_const_lv1_1) and (evenRow = ap_const_lv1_1));
    end process;


    ap_predicate_op37_write_state2_assign_proc : process(evenBlock_1_reg_177, evenRow)
    begin
                ap_predicate_op37_write_state2 <= ((evenBlock_1_reg_177 = ap_const_lv1_1) and (evenRow = ap_const_lv1_1));
    end process;


    ap_predicate_op38_read_state3_assign_proc : process(evenBlock_1_reg_177_pp0_iter1_reg, evenRow)
    begin
                ap_predicate_op38_read_state3 <= ((evenBlock_1_reg_177_pp0_iter1_reg = ap_const_lv1_1) and (evenRow = ap_const_lv1_0));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_j_2_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, j_fu_122)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_sig_allocacmp_j_2 <= ap_const_lv16_0;
        else 
            ap_sig_allocacmp_j_2 <= j_fu_122;
        end if; 
    end process;

    evenBlock_2_fu_208_p2 <= (ap_phi_mux_evenBlock_1_phi_fu_180_p4 xor ap_const_lv1_1);

    grp_fu_579_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_579_ce <= ap_const_logic_1;
        else 
            grp_fu_579_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_579_p0 <= grp_fu_579_p00(8 - 1 downto 0);
    grp_fu_579_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(y1_fu_240_p3),21));
    grp_fu_579_p1 <= ap_const_lv21_14FE(13 - 1 downto 0);
    grp_fu_579_p2 <= ap_const_lv21_4000(15 - 1 downto 0);

    grp_fu_589_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_589_ce <= ap_const_logic_1;
        else 
            grp_fu_589_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_589_p1 <= ap_const_lv23_4C4A(15 - 1 downto 0);
    grp_fu_589_p2 <= zext_ln847_3_fu_300_p1(21 - 1 downto 0);

    grp_fu_598_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_598_ce <= ap_const_logic_1;
        else 
            grp_fu_598_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_598_p1 <= ap_const_lv23_7FCDF3(15 - 1 downto 0);
    grp_fu_598_p2 <= zext_ln847_3_fu_300_p1(21 - 1 downto 0);

    grp_fu_607_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_607_ce <= ap_const_logic_1;
        else 
            grp_fu_607_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_607_p1 <= ap_const_lv19_24E(10 - 1 downto 0);
    grp_fu_607_p2 <= grp_fu_607_p20(21 - 1 downto 0);
    grp_fu_607_p20 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_579_p3),22));

    grp_fu_616_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_616_ce <= ap_const_logic_1;
        else 
            grp_fu_616_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_616_p1 <= ap_const_lv24_FF97EF(16 - 1 downto 0);
    icmp_ln4200_fu_196_p2 <= "1" when (ap_sig_allocacmp_j_2 = width) else "0";
    icmp_ln4220_fu_230_p2 <= "1" when (unsigned(t_reg_646) > unsigned(ap_const_lv8_10)) else "0";
    icmp_ln761_1_fu_453_p2 <= "1" when (tmp_21_fu_443_p4 = ap_const_lv2_1) else "0";
    icmp_ln761_2_fu_524_p2 <= "1" when (signed(tmp_23_fu_514_p4) > signed(ap_const_lv3_0)) else "0";
    icmp_ln761_fu_371_p2 <= "1" when (tmp_fu_361_p4 = ap_const_lv2_1) else "0";

    imgInput_uv_data82_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, imgInput_uv_data82_empty_n, ap_predicate_op36_read_state2, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            imgInput_uv_data82_blk_n <= imgInput_uv_data82_empty_n;
        else 
            imgInput_uv_data82_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    imgInput_uv_data82_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op36_read_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op36_read_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            imgInput_uv_data82_read <= ap_const_logic_1;
        else 
            imgInput_uv_data82_read <= ap_const_logic_0;
        end if; 
    end process;


    imgInput_y_data81_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, imgInput_y_data81_empty_n, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            imgInput_y_data81_blk_n <= imgInput_y_data81_empty_n;
        else 
            imgInput_y_data81_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    imgInput_y_data81_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            imgInput_y_data81_read <= ap_const_logic_1;
        else 
            imgInput_y_data81_read <= ap_const_logic_0;
        end if; 
    end process;

    j_3_fu_202_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_j_2) + unsigned(ap_const_lv16_1));
    or_ln761_1_fu_480_p2 <= (tmp_22_fu_459_p3 or icmp_ln761_1_fu_453_p2);
    or_ln761_2_fu_557_p2 <= (tmp_24_fu_530_p3 or icmp_ln761_2_fu_524_p2);
    or_ln761_fu_402_p2 <= (tmp_20_fu_377_p3 or icmp_ln761_fu_371_p2);

    rgb_mat_data83_blk_n_assign_proc : process(ap_enable_reg_pp0_iter8, rgb_mat_data83_full_n, icmp_ln4200_reg_637_pp0_iter7_reg, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln4200_reg_637_pp0_iter7_reg = ap_const_lv1_0))) then 
            rgb_mat_data83_blk_n <= rgb_mat_data83_full_n;
        else 
            rgb_mat_data83_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rgb_mat_data83_din <= ((Value_uchar_6_reg_742 & Value_uchar_7_reg_747) & Value_uchar_8_reg_752);

    rgb_mat_data83_write_assign_proc : process(ap_enable_reg_pp0_iter8, icmp_ln4200_reg_637_pp0_iter7_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln4200_reg_637_pp0_iter7_reg = ap_const_lv1_0))) then 
            rgb_mat_data83_write <= ap_const_logic_1;
        else 
            rgb_mat_data83_write <= ap_const_logic_0;
        end if; 
    end process;

    select_ln761_2_fu_472_p3 <= 
        ap_const_lv8_FF when (icmp_ln761_1_fu_453_p2(0) = '1') else 
        ap_const_lv8_0;
    select_ln761_4_fu_549_p3 <= 
        ap_const_lv8_FF when (icmp_ln761_2_fu_524_p2(0) = '1') else 
        ap_const_lv8_0;
    select_ln761_fu_394_p3 <= 
        ap_const_lv8_FF when (icmp_ln761_fu_371_p2(0) = '1') else 
        ap_const_lv8_0;
        sext_ln4224_fu_344_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(v_reg_670_pp0_iter6_reg),10));

        sext_ln757_fu_325_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(shl_ln_fu_318_p3),10));

        sext_ln759_1_fu_502_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln874_reg_737),11));

        sext_ln759_2_fu_505_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln759_3_reg_731),8));

        sext_ln759_fu_425_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln759_1_fu_416_p4),10));

        sext_ln848_fu_347_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_reg_720),10));

        sext_ln874_fu_494_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln759_3_reg_731),11));

    shl_ln874_fu_497_p2 <= std_logic_vector(shift_left(unsigned(u_reg_677_pp0_iter6_reg),to_integer(unsigned('0' & ap_const_lv8_1(8-1 downto 0)))));
    shl_ln_fu_318_p3 <= (u_reg_677_pp0_iter5_reg & ap_const_lv1_0);
    tmp9_fu_256_p4 <= uvPacked_V_1_out_i(15 downto 8);
    tmp_20_fu_377_p3 <= Value_int_fu_355_p2(9 downto 9);
    tmp_21_fu_443_p4 <= Value_int_1_fu_438_p2(9 downto 8);
    tmp_22_fu_459_p3 <= Value_int_1_fu_438_p2(9 downto 9);
    tmp_23_fu_514_p4 <= Value_int_2_fu_508_p2(10 downto 8);
    tmp_24_fu_530_p3 <= Value_int_2_fu_508_p2(10 downto 10);
    tmp_fu_361_p4 <= Value_int_fu_355_p2(9 downto 8);
    trunc_ln714_fu_272_p1 <= uvPacked_V_1_out_i(8 - 1 downto 0);
    trunc_ln759_1_fu_416_p4 <= grp_fu_616_p3(23 downto 15);
    trunc_ln759_2_fu_429_p4 <= grp_fu_616_p3(22 downto 15);
    trunc_ln_fu_306_p1 <= grp_fu_589_p3;
    u_fu_276_p2 <= (trunc_ln714_fu_272_p1 xor ap_const_lv8_80);

    uvPacked_V_1_out_o_assign_proc : process(uvStream_dout, evenRow, uvPacked_V_1_out_i, tmp_V_reg_652, ap_condition_652)
    begin
        if ((ap_const_boolean_1 = ap_condition_652)) then
            if ((evenRow = ap_const_lv1_1)) then 
                uvPacked_V_1_out_o <= tmp_V_reg_652;
            elsif ((evenRow = ap_const_lv1_0)) then 
                uvPacked_V_1_out_o <= uvStream_dout;
            else 
                uvPacked_V_1_out_o <= uvPacked_V_1_out_i;
            end if;
        else 
            uvPacked_V_1_out_o <= uvPacked_V_1_out_i;
        end if; 
    end process;


    uvPacked_V_1_out_o_ap_vld_assign_proc : process(ap_enable_reg_pp0_iter2, evenBlock_1_reg_177_pp0_iter1_reg, evenRow, ap_block_pp0_stage0_11001)
    begin
        if ((((evenBlock_1_reg_177_pp0_iter1_reg = ap_const_lv1_1) and (evenRow = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((evenBlock_1_reg_177_pp0_iter1_reg = ap_const_lv1_1) and (evenRow = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            uvPacked_V_1_out_o_ap_vld <= ap_const_logic_1;
        else 
            uvPacked_V_1_out_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    uvStream_din <= imgInput_uv_data82_dout;

    uvStream_i_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, uvStream_empty_n, ap_predicate_op38_read_state3, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op38_read_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            uvStream_i_blk_n <= uvStream_empty_n;
        else 
            uvStream_i_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    uvStream_o_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, uvStream_full_n, ap_predicate_op37_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op37_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            uvStream_o_blk_n <= uvStream_full_n;
        else 
            uvStream_o_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    uvStream_read_assign_proc : process(ap_enable_reg_pp0_iter2, ap_predicate_op38_read_state3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op38_read_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            uvStream_read <= ap_const_logic_1;
        else 
            uvStream_read <= ap_const_logic_0;
        end if; 
    end process;


    uvStream_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op37_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op37_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            uvStream_write <= ap_const_logic_1;
        else 
            uvStream_write <= ap_const_logic_0;
        end if; 
    end process;

    v_fu_266_p2 <= (tmp9_fu_256_p4 xor ap_const_lv8_80);
    y1_fu_240_p3 <= 
        add_ln4220_fu_235_p2 when (icmp_ln4220_fu_230_p2(0) = '1') else 
        ap_const_lv8_0;
    zext_ln847_3_fu_300_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_579_p3),23));
    zext_ln847_fu_303_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(y1_reg_657_pp0_iter5_reg),10));
end behav;
