-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_AxiStream2MatStream_2_1_Pipeline_MMIterInLoopRow is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ldata1_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    ldata1_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_empty_n : IN STD_LOGIC;
    ldata1_read : OUT STD_LOGIC;
    imgInput_y_data81_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    imgInput_y_data81_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_y_data81_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_y_data81_full_n : IN STD_LOGIC;
    imgInput_y_data81_write : OUT STD_LOGIC;
    bound : IN STD_LOGIC_VECTOR (31 downto 0);
    sext_ln1082 : IN STD_LOGIC_VECTOR (4 downto 0);
    cols_bound_per_npc_load : IN STD_LOGIC_VECTOR (31 downto 0);
    sub : IN STD_LOGIC_VECTOR (31 downto 0);
    last_blk_width_load : IN STD_LOGIC_VECTOR (3 downto 0);
    sub3 : IN STD_LOGIC_VECTOR (6 downto 0);
    add_ln1082 : IN STD_LOGIC_VECTOR (6 downto 0) );
end;


architecture behav of pp_pipeline_accel_AxiStream2MatStream_2_1_Pipeline_MMIterInLoopRow is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv7_3F : STD_LOGIC_VECTOR (6 downto 0) := "0111111";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv7_38 : STD_LOGIC_VECTOR (6 downto 0) := "0111000";
    constant ap_const_lv7_47 : STD_LOGIC_VECTOR (6 downto 0) := "1000111";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv26_0 : STD_LOGIC_VECTOR (25 downto 0) := "00000000000000000000000000";
    constant ap_const_lv5_1F : STD_LOGIC_VECTOR (4 downto 0) := "11111";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv7_41 : STD_LOGIC_VECTOR (6 downto 0) := "1000001";
    constant ap_const_lv64_FFFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv4_7 : STD_LOGIC_VECTOR (3 downto 0) := "0111";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";

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
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal icmp_ln1062_reg_831 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1062_reg_831_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_reg_847 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op100_read_state4 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal icmp_ln1093_reg_843 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1093_reg_843_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln1062_fu_217_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ldata1_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal imgInput_y_data81_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln1062_reg_831_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_fu_231_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_reg_835 : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_reg_835_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_reg_835_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_reg_835_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1093_fu_239_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1093_reg_843_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1093_reg_843_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_fu_299_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_reg_847_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln674_2_fu_321_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln674_2_reg_851 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln674_7_fu_327_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln674_7_reg_858 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln674_8_fu_331_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln674_8_reg_866 : STD_LOGIC_VECTOR (6 downto 0);
    signal icmp_ln1074_fu_346_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1074_reg_872 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1074_reg_872_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1075_fu_352_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln1075_reg_877 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln1075_reg_877_pp0_iter3_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal icmp_ln674_fu_366_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln674_reg_882 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln674_fu_372_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln674_reg_889 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln674_2_fu_400_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln674_2_reg_896 : STD_LOGIC_VECTOR (6 downto 0);
    signal icmp_ln414_fu_406_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln414_reg_901 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln414_reg_901_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln414_fu_412_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln414_reg_909 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln414_reg_909_pp0_iter3_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln414_2_fu_416_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln414_2_reg_917 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln414_2_reg_917_pp0_iter3_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal sub_ln674_15_fu_477_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub_ln674_15_reg_923 : STD_LOGIC_VECTOR (6 downto 0);
    signal lshr_ln674_8_fu_487_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_8_reg_928 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln674_10_fu_528_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub_ln674_10_reg_933 : STD_LOGIC_VECTOR (6 downto 0);
    signal lshr_ln674_fu_538_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_reg_938 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln414_4_fu_579_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal sub_ln414_4_reg_943 : STD_LOGIC_VECTOR (3 downto 0);
    signal shl_ln414_fu_589_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln414_reg_948 : STD_LOGIC_VECTOR (7 downto 0);
    signal localbuffer_V_12_fu_614_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_19_fu_727_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal sub_ln674_16_fu_736_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal sub_ln674_16_reg_964 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_phi_reg_pp0_iter0_localbuffer_V_13_reg_171 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter1_localbuffer_V_13_reg_171 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter2_localbuffer_V_13_reg_171 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter3_localbuffer_V_13_reg_171 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter4_localbuffer_V_13_reg_171 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171 : STD_LOGIC_VECTOR (7 downto 0);
    signal rem_fu_100 : STD_LOGIC_VECTOR (31 downto 0);
    signal rem_5_fu_335_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal rem_4_fu_420_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_104 : STD_LOGIC_VECTOR (30 downto 0);
    signal add_ln1062_fu_222_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal j_fu_108 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_5_fu_253_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Val2_s_fu_112 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln1062_fu_213_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln1094_fu_247_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xf_bits_per_clock_fu_275_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal ptr_width_minus_fu_289_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln1068_fu_281_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln1082_fu_305_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln1082_fu_311_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_180_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln1082_fu_315_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_356_p4 : STD_LOGIC_VECTOR (25 downto 0);
    signal zext_ln1068_1_fu_285_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal add_ln1079_fu_376_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln1079_fu_390_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sext_ln1079_2_fu_386_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub_ln674_11_fu_394_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sext_ln1079_fu_382_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln1069_fu_295_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln674_12_fu_444_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub_ln674_14_fu_453_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_40_fu_434_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln674_13_fu_448_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_8_fu_457_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_10_fu_471_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_9_fu_464_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln674_8_fu_483_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln674_fu_503_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_fu_185_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_35_fu_493_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln674_fu_508_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_7_fu_522_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_6_fu_515_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln674_fu_534_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln674_7_fu_544_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_7_fu_547_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_18_fu_553_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln414_3_fu_563_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln414_fu_568_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln414_5_fu_573_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_43_fu_559_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln414_4_fu_585_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln674_9_fu_600_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_9_fu_603_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_20_fu_609_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln674_6_fu_618_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_6_fu_621_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_s_fu_627_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln414_fu_636_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal zext_ln414_fu_641_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_41_fu_632_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal lshr_ln414_fu_645_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_17_fu_651_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln414_4_fu_664_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_39_fu_676_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln414_5_fu_669_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln414_6_fu_673_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln414_2_fu_691_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal lshr_ln414_2_fu_697_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal and_ln414_fu_703_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal localbuffer_V_fu_657_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal xor_ln414_fu_709_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln414_6_fu_685_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal and_ln414_3_fu_715_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal and_ln414_4_fu_721_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_9_fu_733_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal zext_ln674_10_fu_742_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal lshr_ln674_10_fu_745_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln1067_fu_751_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_728 : BOOLEAN;
    signal ap_condition_732 : BOOLEAN;
    signal ap_condition_735 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

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
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1))) then 
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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
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


    ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then
                if (((icmp_ln1073_reg_847_pp0_iter3_reg = ap_const_lv1_0) and (icmp_ln1062_reg_831_pp0_iter3_reg = ap_const_lv1_1))) then 
                    ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171 <= localbuffer_V_12_fu_614_p1;
                elsif (((icmp_ln1073_reg_847_pp0_iter3_reg = ap_const_lv1_1) and (icmp_ln1062_reg_831_pp0_iter3_reg = ap_const_lv1_1))) then 
                    ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171 <= p_Result_19_fu_727_p2;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter4_localbuffer_V_13_reg_171;
                end if;
            end if; 
        end if;
    end process;

    i_fu_104_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_104 <= ap_const_lv31_0;
                elsif (((icmp_ln1062_fu_217_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_104 <= add_ln1062_fu_222_p2;
                end if;
            end if; 
        end if;
    end process;

    j_fu_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_108 <= ap_const_lv32_0;
                elsif (((icmp_ln1062_fu_217_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    j_fu_108 <= j_5_fu_253_p3;
                end if;
            end if; 
        end if;
    end process;

    p_Val2_s_fu_112_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    p_Val2_s_fu_112 <= ap_const_lv64_0;
                elsif ((ap_const_boolean_1 = ap_condition_728)) then 
                    p_Val2_s_fu_112 <= ldata1_dout;
                end if;
            end if; 
        end if;
    end process;

    rem_fu_100_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    rem_fu_100 <= ap_const_lv32_0;
                elsif ((ap_const_boolean_1 = ap_condition_735)) then 
                    rem_fu_100 <= rem_4_fu_420_p2;
                elsif ((ap_const_boolean_1 = ap_condition_732)) then 
                    rem_fu_100 <= rem_5_fu_335_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1062_reg_831 = ap_const_lv1_1) and (icmp_ln1073_fu_299_p2 = ap_const_lv1_1))) then
                add_ln674_2_reg_896 <= add_ln674_2_fu_400_p2;
                icmp_ln1074_reg_872 <= icmp_ln1074_fu_346_p2;
                icmp_ln414_reg_901 <= icmp_ln414_fu_406_p2;
                icmp_ln674_reg_882 <= icmp_ln674_fu_366_p2;
                trunc_ln1075_reg_877 <= trunc_ln1075_fu_352_p1;
                trunc_ln414_2_reg_917 <= trunc_ln414_2_fu_416_p1;
                trunc_ln414_reg_909 <= trunc_ln414_fu_412_p1;
                trunc_ln674_reg_889 <= trunc_ln674_fu_372_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
                icmp_ln1062_reg_831 <= icmp_ln1062_fu_217_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                bLast_width_reg_835_pp0_iter2_reg <= bLast_width_reg_835;
                bLast_width_reg_835_pp0_iter3_reg <= bLast_width_reg_835_pp0_iter2_reg;
                bLast_width_reg_835_pp0_iter4_reg <= bLast_width_reg_835_pp0_iter3_reg;
                icmp_ln1062_reg_831_pp0_iter2_reg <= icmp_ln1062_reg_831;
                icmp_ln1062_reg_831_pp0_iter3_reg <= icmp_ln1062_reg_831_pp0_iter2_reg;
                icmp_ln1073_reg_847_pp0_iter3_reg <= icmp_ln1073_reg_847;
                icmp_ln1074_reg_872_pp0_iter3_reg <= icmp_ln1074_reg_872;
                icmp_ln1093_reg_843_pp0_iter2_reg <= icmp_ln1093_reg_843;
                icmp_ln1093_reg_843_pp0_iter3_reg <= icmp_ln1093_reg_843_pp0_iter2_reg;
                icmp_ln1093_reg_843_pp0_iter4_reg <= icmp_ln1093_reg_843_pp0_iter3_reg;
                icmp_ln414_reg_901_pp0_iter3_reg <= icmp_ln414_reg_901;
                trunc_ln1075_reg_877_pp0_iter3_reg <= trunc_ln1075_reg_877;
                trunc_ln414_2_reg_917_pp0_iter3_reg <= trunc_ln414_2_reg_917;
                trunc_ln414_reg_909_pp0_iter3_reg <= trunc_ln414_reg_909;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter1_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter0_localbuffer_V_13_reg_171;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter2_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter1_localbuffer_V_13_reg_171;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                ap_phi_reg_pp0_iter3_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter2_localbuffer_V_13_reg_171;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then
                ap_phi_reg_pp0_iter4_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter3_localbuffer_V_13_reg_171;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1062_fu_217_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                bLast_width_reg_835 <= bLast_width_fu_231_p2;
                icmp_ln1093_reg_843 <= icmp_ln1093_fu_239_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1062_reg_831 = ap_const_lv1_1))) then
                icmp_ln1073_reg_847 <= icmp_ln1073_fu_299_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1062_reg_831 = ap_const_lv1_1) and (icmp_ln1073_fu_299_p2 = ap_const_lv1_0))) then
                icmp_ln674_2_reg_851 <= icmp_ln674_2_fu_321_p2;
                trunc_ln674_7_reg_858 <= trunc_ln674_7_fu_327_p1;
                trunc_ln674_8_reg_866 <= trunc_ln674_8_fu_331_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1073_reg_847 = ap_const_lv1_0) and (icmp_ln1062_reg_831_pp0_iter2_reg = ap_const_lv1_1))) then
                lshr_ln674_8_reg_928 <= lshr_ln674_8_fu_487_p2;
                sub_ln674_15_reg_923 <= sub_ln674_15_fu_477_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1073_reg_847 = ap_const_lv1_1) and (icmp_ln1062_reg_831_pp0_iter2_reg = ap_const_lv1_1) and (icmp_ln1074_reg_872 = ap_const_lv1_0))) then
                lshr_ln674_reg_938 <= lshr_ln674_fu_538_p2;
                sub_ln674_10_reg_933 <= sub_ln674_10_fu_528_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1073_reg_847 = ap_const_lv1_1) and (icmp_ln1062_reg_831_pp0_iter2_reg = ap_const_lv1_1))) then
                shl_ln414_reg_948 <= shl_ln414_fu_589_p2;
                sub_ln414_4_reg_943 <= sub_ln414_4_fu_579_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (bLast_width_reg_835_pp0_iter3_reg = ap_const_lv1_1))) then
                sub_ln674_16_reg_964 <= sub_ln674_16_fu_736_p2;
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
    add_ln1062_fu_222_p2 <= std_logic_vector(unsigned(i_fu_104) + unsigned(ap_const_lv31_1));
    add_ln1079_fu_376_p2 <= std_logic_vector(unsigned(zext_ln1068_1_fu_285_p1) + unsigned(ap_const_lv5_1F));
    add_ln1094_fu_247_p2 <= std_logic_vector(unsigned(j_fu_108) + unsigned(ap_const_lv32_1));
    add_ln674_2_fu_400_p2 <= std_logic_vector(unsigned(sub_ln674_11_fu_394_p2) + unsigned(ap_const_lv7_3F));
    add_ln674_fu_503_p2 <= std_logic_vector(unsigned(trunc_ln674_reg_889) + unsigned(ap_const_lv7_41));
    and_ln414_3_fu_715_p2 <= (xor_ln414_fu_709_p2 and localbuffer_V_fu_657_p3);
    and_ln414_4_fu_721_p2 <= (select_ln414_6_fu_685_p3 and and_ln414_fu_703_p2);
    and_ln414_fu_703_p2 <= (shl_ln414_2_fu_691_p2 and lshr_ln414_2_fu_697_p2);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter5, ldata1_empty_n, ap_predicate_op100_read_state4, imgInput_y_data81_full_n, icmp_ln1093_reg_843_pp0_iter4_reg)
    begin
                ap_block_pp0_stage0_01001 <= (((icmp_ln1093_reg_843_pp0_iter4_reg = ap_const_lv1_1) and (imgInput_y_data81_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)) or ((ap_predicate_op100_read_state4 = ap_const_boolean_1) and (ldata1_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter5, ldata1_empty_n, ap_predicate_op100_read_state4, imgInput_y_data81_full_n, icmp_ln1093_reg_843_pp0_iter4_reg)
    begin
                ap_block_pp0_stage0_11001 <= (((icmp_ln1093_reg_843_pp0_iter4_reg = ap_const_lv1_1) and (imgInput_y_data81_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)) or ((ap_predicate_op100_read_state4 = ap_const_boolean_1) and (ldata1_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter5, ldata1_empty_n, ap_predicate_op100_read_state4, imgInput_y_data81_full_n, icmp_ln1093_reg_843_pp0_iter4_reg)
    begin
                ap_block_pp0_stage0_subdone <= (((icmp_ln1093_reg_843_pp0_iter4_reg = ap_const_lv1_1) and (imgInput_y_data81_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)) or ((ap_predicate_op100_read_state4 = ap_const_boolean_1) and (ldata1_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter3_assign_proc : process(ldata1_empty_n, ap_predicate_op100_read_state4)
    begin
                ap_block_state4_pp0_stage0_iter3 <= ((ap_predicate_op100_read_state4 = ap_const_boolean_1) and (ldata1_empty_n = ap_const_logic_0));
    end process;

        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state6_pp0_stage0_iter5_assign_proc : process(imgInput_y_data81_full_n, icmp_ln1093_reg_843_pp0_iter4_reg)
    begin
                ap_block_state6_pp0_stage0_iter5 <= ((icmp_ln1093_reg_843_pp0_iter4_reg = ap_const_lv1_1) and (imgInput_y_data81_full_n = ap_const_logic_0));
    end process;


    ap_condition_728_assign_proc : process(ap_enable_reg_pp0_iter3, icmp_ln1062_reg_831_pp0_iter2_reg, icmp_ln1073_reg_847)
    begin
                ap_condition_728 <= ((icmp_ln1073_reg_847 = ap_const_lv1_1) and (icmp_ln1062_reg_831_pp0_iter2_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1));
    end process;


    ap_condition_732_assign_proc : process(ap_enable_reg_pp0_iter2, icmp_ln1062_reg_831, icmp_ln1073_fu_299_p2)
    begin
                ap_condition_732 <= ((icmp_ln1062_reg_831 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (icmp_ln1073_fu_299_p2 = ap_const_lv1_0));
    end process;


    ap_condition_735_assign_proc : process(ap_enable_reg_pp0_iter2, icmp_ln1062_reg_831, icmp_ln1073_fu_299_p2)
    begin
                ap_condition_735 <= ((icmp_ln1062_reg_831 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (icmp_ln1073_fu_299_p2 = ap_const_lv1_1));
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln1062_fu_217_p2)
    begin
        if (((icmp_ln1062_fu_217_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5)
    begin
        if (((ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;
    ap_phi_reg_pp0_iter0_localbuffer_V_13_reg_171 <= "XXXXXXXX";

    ap_predicate_op100_read_state4_assign_proc : process(icmp_ln1062_reg_831_pp0_iter2_reg, icmp_ln1073_reg_847)
    begin
                ap_predicate_op100_read_state4 <= ((icmp_ln1073_reg_847 = ap_const_lv1_1) and (icmp_ln1062_reg_831_pp0_iter2_reg = ap_const_lv1_1));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    bLast_width_fu_231_p2 <= "1" when (j_fu_108 = sub) else "0";
    grp_fu_180_p2 <= std_logic_vector(unsigned(ap_const_lv32_40) - unsigned(rem_fu_100));
    grp_fu_185_p2 <= std_logic_vector(unsigned(ap_const_lv7_3F) - unsigned(trunc_ln674_reg_889));
    icmp_ln1062_fu_217_p2 <= "1" when (signed(zext_ln1062_fu_213_p1) < signed(bound)) else "0";
    icmp_ln1073_fu_299_p2 <= "1" when (signed(zext_ln1068_fu_281_p1) > signed(rem_fu_100)) else "0";
    icmp_ln1074_fu_346_p2 <= "1" when (rem_fu_100 = ap_const_lv32_0) else "0";
    icmp_ln1093_fu_239_p2 <= "1" when (signed(j_fu_108) < signed(cols_bound_per_npc_load)) else "0";
    icmp_ln414_fu_406_p2 <= "1" when (unsigned(rem_fu_100) > unsigned(sext_ln1079_fu_382_p1)) else "0";
    icmp_ln674_2_fu_321_p2 <= "1" when (unsigned(grp_fu_180_p2) > unsigned(sub_ln1082_fu_315_p2)) else "0";
    icmp_ln674_fu_366_p2 <= "0" when (tmp_fu_356_p4 = ap_const_lv26_0) else "1";

    imgInput_y_data81_blk_n_assign_proc : process(ap_enable_reg_pp0_iter5, imgInput_y_data81_full_n, icmp_ln1093_reg_843_pp0_iter4_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln1093_reg_843_pp0_iter4_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
            imgInput_y_data81_blk_n <= imgInput_y_data81_full_n;
        else 
            imgInput_y_data81_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgInput_y_data81_din <= (select_ln1067_fu_751_p3 and ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171);

    imgInput_y_data81_write_assign_proc : process(ap_enable_reg_pp0_iter5, icmp_ln1093_reg_843_pp0_iter4_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1093_reg_843_pp0_iter4_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
            imgInput_y_data81_write <= ap_const_logic_1;
        else 
            imgInput_y_data81_write <= ap_const_logic_0;
        end if; 
    end process;

    j_5_fu_253_p3 <= 
        ap_const_lv32_0 when (bLast_width_fu_231_p2(0) = '1') else 
        add_ln1094_fu_247_p2;

    ldata1_blk_n_assign_proc : process(ap_enable_reg_pp0_iter3, ldata1_empty_n, ap_predicate_op100_read_state4, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op100_read_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            ldata1_blk_n <= ldata1_empty_n;
        else 
            ldata1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ldata1_read_assign_proc : process(ap_enable_reg_pp0_iter3, ap_predicate_op100_read_state4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op100_read_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            ldata1_read <= ap_const_logic_1;
        else 
            ldata1_read <= ap_const_logic_0;
        end if; 
    end process;

    localbuffer_V_12_fu_614_p1 <= p_Result_20_fu_609_p2(8 - 1 downto 0);
    localbuffer_V_fu_657_p3 <= 
        ap_const_lv8_0 when (icmp_ln1074_reg_872_pp0_iter3_reg(0) = '1') else 
        p_Result_17_fu_651_p2;
    lshr_ln414_2_fu_697_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv8_FF),to_integer(unsigned('0' & zext_ln414_6_fu_673_p1(8-1 downto 0)))));
    lshr_ln414_fu_645_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv8_FF),to_integer(unsigned('0' & zext_ln414_fu_641_p1(8-1 downto 0)))));
    lshr_ln674_10_fu_745_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv8_FF),to_integer(unsigned('0' & zext_ln674_10_fu_742_p1(8-1 downto 0)))));
    lshr_ln674_6_fu_621_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv64_FFFFFFFFFFFFFFFF),to_integer(unsigned('0' & zext_ln674_6_fu_618_p1(31-1 downto 0)))));
    lshr_ln674_7_fu_547_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv64_FFFFFFFFFFFFFFFF),to_integer(unsigned('0' & zext_ln674_7_fu_544_p1(31-1 downto 0)))));
    lshr_ln674_8_fu_487_p2 <= std_logic_vector(shift_right(unsigned(select_ln674_9_fu_464_p3),to_integer(unsigned('0' & zext_ln674_8_fu_483_p1(31-1 downto 0)))));
    lshr_ln674_9_fu_603_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv64_FFFFFFFFFFFFFFFF),to_integer(unsigned('0' & zext_ln674_9_fu_600_p1(31-1 downto 0)))));
    lshr_ln674_fu_538_p2 <= std_logic_vector(shift_right(unsigned(select_ln674_6_fu_515_p3),to_integer(unsigned('0' & zext_ln674_fu_534_p1(31-1 downto 0)))));
    p_Result_17_fu_651_p2 <= (tmp_41_fu_632_p1 and lshr_ln414_fu_645_p2);
    p_Result_18_fu_553_p2 <= (lshr_ln674_7_fu_547_p2 and ldata1_dout);
    p_Result_19_fu_727_p2 <= (and_ln414_4_fu_721_p2 or and_ln414_3_fu_715_p2);
    p_Result_20_fu_609_p2 <= (lshr_ln674_9_fu_603_p2 and lshr_ln674_8_reg_928);
    p_Result_s_fu_627_p2 <= (lshr_ln674_reg_938 and lshr_ln674_6_fu_621_p2);
    ptr_width_minus_fu_289_p3 <= 
        sub3 when (bLast_width_reg_835(0) = '1') else 
        ap_const_lv7_38;
    rem_4_fu_420_p2 <= std_logic_vector(unsigned(rem_fu_100) + unsigned(zext_ln1069_fu_295_p1));
    rem_5_fu_335_p2 <= std_logic_vector(unsigned(rem_fu_100) - unsigned(zext_ln1068_fu_281_p1));
    select_ln1067_fu_751_p3 <= 
        lshr_ln674_10_fu_745_p2 when (bLast_width_reg_835_pp0_iter4_reg(0) = '1') else 
        ap_const_lv8_FF;
    select_ln1082_fu_305_p3 <= 
        add_ln1082 when (bLast_width_reg_835(0) = '1') else 
        ap_const_lv7_47;
    select_ln414_4_fu_664_p3 <= 
        trunc_ln414_2_reg_917_pp0_iter3_reg when (icmp_ln414_reg_901_pp0_iter3_reg(0) = '1') else 
        trunc_ln414_reg_909_pp0_iter3_reg;
    select_ln414_5_fu_573_p3 <= 
        sub_ln414_3_fu_563_p2 when (icmp_ln414_reg_901(0) = '1') else 
        trunc_ln414_reg_909;
    select_ln414_6_fu_685_p3 <= 
        tmp_39_fu_676_p4 when (icmp_ln414_reg_901_pp0_iter3_reg(0) = '1') else 
        shl_ln414_reg_948;
    select_ln414_fu_568_p3 <= 
        trunc_ln414_reg_909 when (icmp_ln414_reg_901(0) = '1') else 
        trunc_ln414_2_reg_917;
    select_ln674_10_fu_471_p3 <= 
        sub_ln674_13_fu_448_p2 when (icmp_ln674_2_reg_851(0) = '1') else 
        trunc_ln674_7_reg_858;
    select_ln674_6_fu_515_p3 <= 
        tmp_35_fu_493_p4 when (icmp_ln674_reg_882(0) = '1') else 
        p_Val2_s_fu_112;
    select_ln674_7_fu_522_p3 <= 
        grp_fu_185_p2 when (icmp_ln674_reg_882(0) = '1') else 
        trunc_ln674_reg_889;
    select_ln674_8_fu_457_p3 <= 
        sub_ln674_12_fu_444_p2 when (icmp_ln674_2_reg_851(0) = '1') else 
        sub_ln674_14_fu_453_p2;
    select_ln674_9_fu_464_p3 <= 
        tmp_40_fu_434_p4 when (icmp_ln674_2_reg_851(0) = '1') else 
        p_Val2_s_fu_112;
    select_ln674_fu_508_p3 <= 
        add_ln674_fu_503_p2 when (icmp_ln674_reg_882(0) = '1') else 
        grp_fu_185_p2;
        sext_ln1079_2_fu_386_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln1079_fu_376_p2),7));

        sext_ln1079_fu_382_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln1079_fu_376_p2),32));

    shl_ln414_2_fu_691_p2 <= std_logic_vector(shift_left(unsigned(ap_const_lv8_FF),to_integer(unsigned('0' & zext_ln414_5_fu_669_p1(8-1 downto 0)))));
    shl_ln414_fu_589_p2 <= std_logic_vector(shift_left(unsigned(tmp_43_fu_559_p1),to_integer(unsigned('0' & zext_ln414_4_fu_585_p1(8-1 downto 0)))));
    sub_ln1082_fu_315_p2 <= std_logic_vector(unsigned(zext_ln1082_fu_311_p1) - unsigned(rem_fu_100));
    sub_ln414_3_fu_563_p2 <= std_logic_vector(unsigned(ap_const_lv4_7) - unsigned(trunc_ln414_reg_909));
    sub_ln414_4_fu_579_p2 <= std_logic_vector(unsigned(ap_const_lv4_7) - unsigned(select_ln414_fu_568_p3));
    sub_ln414_fu_636_p2 <= std_logic_vector(signed(ap_const_lv4_8) - signed(trunc_ln1075_reg_877_pp0_iter3_reg));
    sub_ln674_10_fu_528_p2 <= std_logic_vector(unsigned(ap_const_lv7_3F) - unsigned(select_ln674_fu_508_p3));
    sub_ln674_11_fu_394_p2 <= std_logic_vector(unsigned(trunc_ln1079_fu_390_p1) - unsigned(sext_ln1079_2_fu_386_p1));
    sub_ln674_12_fu_444_p2 <= std_logic_vector(unsigned(trunc_ln674_7_reg_858) - unsigned(trunc_ln674_8_reg_866));
    sub_ln674_13_fu_448_p2 <= std_logic_vector(unsigned(ap_const_lv7_3F) - unsigned(trunc_ln674_7_reg_858));
    sub_ln674_14_fu_453_p2 <= std_logic_vector(unsigned(trunc_ln674_8_reg_866) - unsigned(trunc_ln674_7_reg_858));
    sub_ln674_15_fu_477_p2 <= std_logic_vector(unsigned(ap_const_lv7_3F) - unsigned(select_ln674_8_fu_457_p3));
    sub_ln674_16_fu_736_p2 <= std_logic_vector(unsigned(ap_const_lv4_7) - unsigned(trunc_ln674_9_fu_733_p1));
    
    tmp_35_fu_493_p4_proc : process(p_Val2_s_fu_112)
    variable vlo_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_35_fu_493_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(6 - 1 downto 0) := ap_const_lv32_3F(6 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(6 - 1 downto 0) := ap_const_lv32_0(6 - 1 downto 0);
        v0_cpy := p_Val2_s_fu_112;
        if (vlo_cpy(6 - 1 downto 0) > vhi_cpy(6 - 1 downto 0)) then
            vhi_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_0(6-1 downto 0)));
            vlo_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_3F(6-1 downto 0)));
            for tmp_35_fu_493_p4_i in 0 to 64-1 loop
                v0_cpy(tmp_35_fu_493_p4_i) := p_Val2_s_fu_112(64-1-tmp_35_fu_493_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(6-1 downto 0)))));

        section := (others=>'0');
        section(6-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(6-1 downto 0)) - unsigned(vlo_cpy(6-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(64-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_35_fu_493_p4 <= resvalue(64-1 downto 0);
    end process;

    
    tmp_39_fu_676_p4_proc : process(shl_ln414_reg_948)
    variable vlo_cpy : STD_LOGIC_VECTOR(8+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(8+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(8 - 1 downto 0);
    variable tmp_39_fu_676_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(8 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(8 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(8 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(3 - 1 downto 0) := ap_const_lv32_7(3 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(3 - 1 downto 0) := ap_const_lv32_0(3 - 1 downto 0);
        v0_cpy := shl_ln414_reg_948;
        if (vlo_cpy(3 - 1 downto 0) > vhi_cpy(3 - 1 downto 0)) then
            vhi_cpy(3-1 downto 0) := std_logic_vector(8-1-unsigned(ap_const_lv32_0(3-1 downto 0)));
            vlo_cpy(3-1 downto 0) := std_logic_vector(8-1-unsigned(ap_const_lv32_7(3-1 downto 0)));
            for tmp_39_fu_676_p4_i in 0 to 8-1 loop
                v0_cpy(tmp_39_fu_676_p4_i) := shl_ln414_reg_948(8-1-tmp_39_fu_676_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(3-1 downto 0)))));

        section := (others=>'0');
        section(3-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(3-1 downto 0)) - unsigned(vlo_cpy(3-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(8-1 downto 0)))));
        res_mask := res_mask(8-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_39_fu_676_p4 <= resvalue(8-1 downto 0);
    end process;

    
    tmp_40_fu_434_p4_proc : process(p_Val2_s_fu_112)
    variable vlo_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_40_fu_434_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(6 - 1 downto 0) := ap_const_lv32_3F(6 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(6 - 1 downto 0) := ap_const_lv32_0(6 - 1 downto 0);
        v0_cpy := p_Val2_s_fu_112;
        if (vlo_cpy(6 - 1 downto 0) > vhi_cpy(6 - 1 downto 0)) then
            vhi_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_0(6-1 downto 0)));
            vlo_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_3F(6-1 downto 0)));
            for tmp_40_fu_434_p4_i in 0 to 64-1 loop
                v0_cpy(tmp_40_fu_434_p4_i) := p_Val2_s_fu_112(64-1-tmp_40_fu_434_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(6-1 downto 0)))));

        section := (others=>'0');
        section(6-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(6-1 downto 0)) - unsigned(vlo_cpy(6-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(64-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_40_fu_434_p4 <= resvalue(64-1 downto 0);
    end process;

    tmp_41_fu_632_p1 <= p_Result_s_fu_627_p2(8 - 1 downto 0);
    tmp_43_fu_559_p1 <= p_Result_18_fu_553_p2(8 - 1 downto 0);
    tmp_fu_356_p4 <= grp_fu_180_p2(31 downto 6);
    trunc_ln1075_fu_352_p1 <= rem_fu_100(4 - 1 downto 0);
    trunc_ln1079_fu_390_p1 <= rem_fu_100(7 - 1 downto 0);
    trunc_ln414_2_fu_416_p1 <= add_ln1079_fu_376_p2(4 - 1 downto 0);
    trunc_ln414_fu_412_p1 <= rem_fu_100(4 - 1 downto 0);
    trunc_ln674_7_fu_327_p1 <= grp_fu_180_p2(7 - 1 downto 0);
    trunc_ln674_8_fu_331_p1 <= sub_ln1082_fu_315_p2(7 - 1 downto 0);
    trunc_ln674_9_fu_733_p1 <= sext_ln1082(4 - 1 downto 0);
    trunc_ln674_fu_372_p1 <= grp_fu_180_p2(7 - 1 downto 0);
    xf_bits_per_clock_fu_275_p3 <= 
        last_blk_width_load when (bLast_width_reg_835(0) = '1') else 
        ap_const_lv4_8;
    xor_ln414_fu_709_p2 <= (ap_const_lv8_FF xor and_ln414_fu_703_p2);
    zext_ln1062_fu_213_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_fu_104),32));
    zext_ln1068_1_fu_285_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xf_bits_per_clock_fu_275_p3),5));
    zext_ln1068_fu_281_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xf_bits_per_clock_fu_275_p3),32));
    zext_ln1069_fu_295_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ptr_width_minus_fu_289_p3),32));
    zext_ln1082_fu_311_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln1082_fu_305_p3),32));
    zext_ln414_4_fu_585_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln414_5_fu_573_p3),8));
    zext_ln414_5_fu_669_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln414_4_fu_664_p3),8));
    zext_ln414_6_fu_673_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln414_4_reg_943),8));
    zext_ln414_fu_641_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln414_fu_636_p2),8));
    zext_ln674_10_fu_742_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln674_16_reg_964),8));
    zext_ln674_6_fu_618_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln674_10_reg_933),64));
    zext_ln674_7_fu_544_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln674_2_reg_896),64));
    zext_ln674_8_fu_483_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln674_10_fu_471_p3),64));
    zext_ln674_9_fu_600_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln674_15_reg_923),64));
    zext_ln674_fu_534_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln674_7_fu_522_p3),64));
end behav;
