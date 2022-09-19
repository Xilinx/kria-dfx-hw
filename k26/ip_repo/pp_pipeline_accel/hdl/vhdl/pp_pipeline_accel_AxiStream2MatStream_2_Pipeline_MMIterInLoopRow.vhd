-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow is
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
    imgInput_uv_data82_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    imgInput_uv_data82_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_uv_data82_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_uv_data82_full_n : IN STD_LOGIC;
    imgInput_uv_data82_write : OUT STD_LOGIC;
    mul_ln1062 : IN STD_LOGIC_VECTOR (21 downto 0);
    sext_ln1082 : IN STD_LOGIC_VECTOR (5 downto 0);
    cols_bound_per_npc_cast3 : IN STD_LOGIC_VECTOR (10 downto 0);
    sub_cast : IN STD_LOGIC_VECTOR (11 downto 0);
    last_blk_width_load : IN STD_LOGIC_VECTOR (4 downto 0);
    sub3 : IN STD_LOGIC_VECTOR (6 downto 0);
    add_ln1082 : IN STD_LOGIC_VECTOR (6 downto 0) );
end;


architecture behav of pp_pipeline_accel_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv22_0 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv7_3F : STD_LOGIC_VECTOR (6 downto 0) := "0111111";
    constant ap_const_lv22_1 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000001";
    constant ap_const_lv5_10 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv7_30 : STD_LOGIC_VECTOR (6 downto 0) := "0110000";
    constant ap_const_lv7_4F : STD_LOGIC_VECTOR (6 downto 0) := "1001111";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv26_0 : STD_LOGIC_VECTOR (25 downto 0) := "00000000000000000000000000";
    constant ap_const_lv6_3F : STD_LOGIC_VECTOR (5 downto 0) := "111111";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv7_41 : STD_LOGIC_VECTOR (6 downto 0) := "1000001";
    constant ap_const_lv64_FFFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv5_F : STD_LOGIC_VECTOR (4 downto 0) := "01111";
    constant ap_const_lv16_FFFF : STD_LOGIC_VECTOR (15 downto 0) := "1111111111111111";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";

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
    signal icmp_ln1062_reg_839 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1062_reg_839_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_reg_855 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op101_read_state4 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal icmp_ln1093_reg_851 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1093_reg_851_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln1062_fu_225_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ldata1_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal imgInput_uv_data82_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal sub_cast_cast_fu_194_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_cast_cast_reg_829 : STD_LOGIC_VECTOR (31 downto 0);
    signal cols_bound_per_npc_cast3_cast_fu_198_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal cols_bound_per_npc_cast3_cast_reg_834 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln1062_reg_839_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_fu_239_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_reg_843 : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_reg_843_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_reg_843_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_width_reg_843_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1093_fu_247_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1093_reg_851_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1093_reg_851_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_fu_307_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_reg_855_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln674_1_fu_329_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln674_1_reg_859 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln674_4_fu_335_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln674_4_reg_866 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln674_5_fu_339_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln674_5_reg_874 : STD_LOGIC_VECTOR (6 downto 0);
    signal icmp_ln1074_fu_354_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1074_reg_880 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1074_reg_880_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1075_fu_360_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln1075_reg_885 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln1075_reg_885_pp0_iter3_reg : STD_LOGIC_VECTOR (4 downto 0);
    signal icmp_ln674_fu_374_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln674_reg_890 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln674_fu_380_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln674_reg_897 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln674_1_fu_408_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln674_1_reg_904 : STD_LOGIC_VECTOR (6 downto 0);
    signal icmp_ln414_fu_414_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln414_reg_909 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln414_reg_909_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln414_fu_420_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln414_reg_917 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln414_reg_917_pp0_iter3_reg : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln414_1_fu_424_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln414_1_reg_925 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln414_1_reg_925_pp0_iter3_reg : STD_LOGIC_VECTOR (4 downto 0);
    signal sub_ln674_7_fu_485_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub_ln674_7_reg_931 : STD_LOGIC_VECTOR (6 downto 0);
    signal lshr_ln674_3_fu_495_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_3_reg_936 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln674_2_fu_536_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub_ln674_2_reg_941 : STD_LOGIC_VECTOR (6 downto 0);
    signal lshr_ln674_fu_546_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_reg_946 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln414_2_fu_587_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal sub_ln414_2_reg_951 : STD_LOGIC_VECTOR (4 downto 0);
    signal shl_ln414_fu_597_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal shl_ln414_reg_956 : STD_LOGIC_VECTOR (15 downto 0);
    signal localbuffer_V_6_fu_622_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_15_fu_735_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal sub_ln674_8_fu_744_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal sub_ln674_8_reg_972 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_phi_reg_pp0_iter0_localbuffer_V_8_reg_175 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter1_localbuffer_V_8_reg_175 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter2_localbuffer_V_8_reg_175 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter3_localbuffer_V_8_reg_175 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter4_localbuffer_V_8_reg_175 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175 : STD_LOGIC_VECTOR (15 downto 0);
    signal rem_fu_104 : STD_LOGIC_VECTOR (31 downto 0);
    signal rem_2_fu_343_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal rem_1_fu_428_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_108 : STD_LOGIC_VECTOR (21 downto 0);
    signal i_9_fu_230_p2 : STD_LOGIC_VECTOR (21 downto 0);
    signal j_fu_112 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_4_fu_261_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Val2_s_fu_116 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal add_ln1094_fu_255_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xf_bits_per_clock_fu_283_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal ptr_width_minus_fu_297_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln1068_fu_289_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln1082_fu_313_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln1082_fu_319_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_184_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln1082_fu_323_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_364_p4 : STD_LOGIC_VECTOR (25 downto 0);
    signal zext_ln1068_1_fu_293_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln1079_fu_384_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln1079_fu_398_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sext_ln1079_1_fu_394_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub_ln674_3_fu_402_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sext_ln1079_fu_390_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln1069_fu_303_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln674_4_fu_452_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub_ln674_6_fu_461_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_31_fu_442_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln674_5_fu_456_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_3_fu_465_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_5_fu_479_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_4_fu_472_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln674_3_fu_491_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln674_fu_511_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_fu_189_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_26_fu_501_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln674_fu_516_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_2_fu_530_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln674_1_fu_523_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln674_fu_542_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln674_2_fu_552_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_2_fu_555_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_14_fu_561_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln414_1_fu_571_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal select_ln414_fu_576_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal select_ln414_2_fu_581_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_34_fu_567_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln414_1_fu_593_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln674_4_fu_608_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_4_fu_611_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_16_fu_617_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln674_1_fu_626_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln674_1_fu_629_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_s_fu_635_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln414_fu_644_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln414_fu_649_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_32_fu_640_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal lshr_ln414_fu_653_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_13_fu_659_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal select_ln414_1_fu_672_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_30_fu_684_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln414_2_fu_677_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln414_3_fu_681_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal shl_ln414_1_fu_699_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal lshr_ln414_1_fu_705_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal and_ln414_fu_711_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal localbuffer_V_fu_665_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal xor_ln414_fu_717_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal select_ln414_3_fu_693_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal and_ln414_1_fu_723_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal and_ln414_2_fu_729_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln674_6_fu_741_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln674_5_fu_750_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal lshr_ln674_5_fu_753_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal select_ln1067_fu_759_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_731 : BOOLEAN;
    signal ap_condition_735 : BOOLEAN;
    signal ap_condition_738 : BOOLEAN;
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


    ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then
                if (((icmp_ln1073_reg_855_pp0_iter3_reg = ap_const_lv1_0) and (icmp_ln1062_reg_839_pp0_iter3_reg = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175 <= localbuffer_V_6_fu_622_p1;
                elsif (((icmp_ln1073_reg_855_pp0_iter3_reg = ap_const_lv1_1) and (icmp_ln1062_reg_839_pp0_iter3_reg = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175 <= p_Result_15_fu_735_p2;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter4_localbuffer_V_8_reg_175;
                end if;
            end if; 
        end if;
    end process;

    i_fu_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_108 <= ap_const_lv22_0;
                elsif (((icmp_ln1062_fu_225_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_108 <= i_9_fu_230_p2;
                end if;
            end if; 
        end if;
    end process;

    j_fu_112_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_112 <= ap_const_lv32_0;
                elsif (((icmp_ln1062_fu_225_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    j_fu_112 <= j_4_fu_261_p3;
                end if;
            end if; 
        end if;
    end process;

    p_Val2_s_fu_116_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    p_Val2_s_fu_116 <= ap_const_lv64_0;
                elsif ((ap_const_boolean_1 = ap_condition_731)) then 
                    p_Val2_s_fu_116 <= ldata1_dout;
                end if;
            end if; 
        end if;
    end process;

    rem_fu_104_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    rem_fu_104 <= ap_const_lv32_0;
                elsif ((ap_const_boolean_1 = ap_condition_738)) then 
                    rem_fu_104 <= rem_1_fu_428_p2;
                elsif ((ap_const_boolean_1 = ap_condition_735)) then 
                    rem_fu_104 <= rem_2_fu_343_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1062_reg_839 = ap_const_lv1_0) and (icmp_ln1073_fu_307_p2 = ap_const_lv1_1))) then
                add_ln674_1_reg_904 <= add_ln674_1_fu_408_p2;
                icmp_ln1074_reg_880 <= icmp_ln1074_fu_354_p2;
                icmp_ln414_reg_909 <= icmp_ln414_fu_414_p2;
                icmp_ln674_reg_890 <= icmp_ln674_fu_374_p2;
                trunc_ln1075_reg_885 <= trunc_ln1075_fu_360_p1;
                trunc_ln414_1_reg_925 <= trunc_ln414_1_fu_424_p1;
                trunc_ln414_reg_917 <= trunc_ln414_fu_420_p1;
                trunc_ln674_reg_897 <= trunc_ln674_fu_380_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
                    cols_bound_per_npc_cast3_cast_reg_834(10 downto 0) <= cols_bound_per_npc_cast3_cast_fu_198_p1(10 downto 0);
                icmp_ln1062_reg_839 <= icmp_ln1062_fu_225_p2;
                sub_cast_cast_reg_829 <= sub_cast_cast_fu_194_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                bLast_width_reg_843_pp0_iter2_reg <= bLast_width_reg_843;
                bLast_width_reg_843_pp0_iter3_reg <= bLast_width_reg_843_pp0_iter2_reg;
                bLast_width_reg_843_pp0_iter4_reg <= bLast_width_reg_843_pp0_iter3_reg;
                icmp_ln1062_reg_839_pp0_iter2_reg <= icmp_ln1062_reg_839;
                icmp_ln1062_reg_839_pp0_iter3_reg <= icmp_ln1062_reg_839_pp0_iter2_reg;
                icmp_ln1073_reg_855_pp0_iter3_reg <= icmp_ln1073_reg_855;
                icmp_ln1074_reg_880_pp0_iter3_reg <= icmp_ln1074_reg_880;
                icmp_ln1093_reg_851_pp0_iter2_reg <= icmp_ln1093_reg_851;
                icmp_ln1093_reg_851_pp0_iter3_reg <= icmp_ln1093_reg_851_pp0_iter2_reg;
                icmp_ln1093_reg_851_pp0_iter4_reg <= icmp_ln1093_reg_851_pp0_iter3_reg;
                icmp_ln414_reg_909_pp0_iter3_reg <= icmp_ln414_reg_909;
                trunc_ln1075_reg_885_pp0_iter3_reg <= trunc_ln1075_reg_885;
                trunc_ln414_1_reg_925_pp0_iter3_reg <= trunc_ln414_1_reg_925;
                trunc_ln414_reg_917_pp0_iter3_reg <= trunc_ln414_reg_917;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter1_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter0_localbuffer_V_8_reg_175;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter2_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter1_localbuffer_V_8_reg_175;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                ap_phi_reg_pp0_iter3_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter2_localbuffer_V_8_reg_175;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then
                ap_phi_reg_pp0_iter4_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter3_localbuffer_V_8_reg_175;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1062_fu_225_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                bLast_width_reg_843 <= bLast_width_fu_239_p2;
                icmp_ln1093_reg_851 <= icmp_ln1093_fu_247_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1062_reg_839 = ap_const_lv1_0))) then
                icmp_ln1073_reg_855 <= icmp_ln1073_fu_307_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1062_reg_839 = ap_const_lv1_0) and (icmp_ln1073_fu_307_p2 = ap_const_lv1_0))) then
                icmp_ln674_1_reg_859 <= icmp_ln674_1_fu_329_p2;
                trunc_ln674_4_reg_866 <= trunc_ln674_4_fu_335_p1;
                trunc_ln674_5_reg_874 <= trunc_ln674_5_fu_339_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1073_reg_855 = ap_const_lv1_0) and (icmp_ln1062_reg_839_pp0_iter2_reg = ap_const_lv1_0))) then
                lshr_ln674_3_reg_936 <= lshr_ln674_3_fu_495_p2;
                sub_ln674_7_reg_931 <= sub_ln674_7_fu_485_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1073_reg_855 = ap_const_lv1_1) and (icmp_ln1062_reg_839_pp0_iter2_reg = ap_const_lv1_0) and (icmp_ln1074_reg_880 = ap_const_lv1_0))) then
                lshr_ln674_reg_946 <= lshr_ln674_fu_546_p2;
                sub_ln674_2_reg_941 <= sub_ln674_2_fu_536_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1073_reg_855 = ap_const_lv1_1) and (icmp_ln1062_reg_839_pp0_iter2_reg = ap_const_lv1_0))) then
                shl_ln414_reg_956 <= shl_ln414_fu_597_p2;
                sub_ln414_2_reg_951 <= sub_ln414_2_fu_587_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (bLast_width_reg_843_pp0_iter3_reg = ap_const_lv1_1))) then
                sub_ln674_8_reg_972 <= sub_ln674_8_fu_744_p2;
            end if;
        end if;
    end process;
    cols_bound_per_npc_cast3_cast_reg_834(31 downto 11) <= "000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln1079_fu_384_p2 <= std_logic_vector(unsigned(zext_ln1068_1_fu_293_p1) + unsigned(ap_const_lv6_3F));
    add_ln1094_fu_255_p2 <= std_logic_vector(unsigned(j_fu_112) + unsigned(ap_const_lv32_1));
    add_ln674_1_fu_408_p2 <= std_logic_vector(unsigned(sub_ln674_3_fu_402_p2) + unsigned(ap_const_lv7_3F));
    add_ln674_fu_511_p2 <= std_logic_vector(unsigned(trunc_ln674_reg_897) + unsigned(ap_const_lv7_41));
    and_ln414_1_fu_723_p2 <= (xor_ln414_fu_717_p2 and localbuffer_V_fu_665_p3);
    and_ln414_2_fu_729_p2 <= (select_ln414_3_fu_693_p3 and and_ln414_fu_711_p2);
    and_ln414_fu_711_p2 <= (shl_ln414_1_fu_699_p2 and lshr_ln414_1_fu_705_p2);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter5, ldata1_empty_n, ap_predicate_op101_read_state4, imgInput_uv_data82_full_n, icmp_ln1093_reg_851_pp0_iter4_reg)
    begin
                ap_block_pp0_stage0_01001 <= (((icmp_ln1093_reg_851_pp0_iter4_reg = ap_const_lv1_1) and (imgInput_uv_data82_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)) or ((ap_predicate_op101_read_state4 = ap_const_boolean_1) and (ldata1_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter5, ldata1_empty_n, ap_predicate_op101_read_state4, imgInput_uv_data82_full_n, icmp_ln1093_reg_851_pp0_iter4_reg)
    begin
                ap_block_pp0_stage0_11001 <= (((icmp_ln1093_reg_851_pp0_iter4_reg = ap_const_lv1_1) and (imgInput_uv_data82_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)) or ((ap_predicate_op101_read_state4 = ap_const_boolean_1) and (ldata1_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter5, ldata1_empty_n, ap_predicate_op101_read_state4, imgInput_uv_data82_full_n, icmp_ln1093_reg_851_pp0_iter4_reg)
    begin
                ap_block_pp0_stage0_subdone <= (((icmp_ln1093_reg_851_pp0_iter4_reg = ap_const_lv1_1) and (imgInput_uv_data82_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1)) or ((ap_predicate_op101_read_state4 = ap_const_boolean_1) and (ldata1_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter3_assign_proc : process(ldata1_empty_n, ap_predicate_op101_read_state4)
    begin
                ap_block_state4_pp0_stage0_iter3 <= ((ap_predicate_op101_read_state4 = ap_const_boolean_1) and (ldata1_empty_n = ap_const_logic_0));
    end process;

        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state6_pp0_stage0_iter5_assign_proc : process(imgInput_uv_data82_full_n, icmp_ln1093_reg_851_pp0_iter4_reg)
    begin
                ap_block_state6_pp0_stage0_iter5 <= ((icmp_ln1093_reg_851_pp0_iter4_reg = ap_const_lv1_1) and (imgInput_uv_data82_full_n = ap_const_logic_0));
    end process;


    ap_condition_731_assign_proc : process(ap_enable_reg_pp0_iter3, icmp_ln1062_reg_839_pp0_iter2_reg, icmp_ln1073_reg_855)
    begin
                ap_condition_731 <= ((icmp_ln1073_reg_855 = ap_const_lv1_1) and (icmp_ln1062_reg_839_pp0_iter2_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1));
    end process;


    ap_condition_735_assign_proc : process(ap_enable_reg_pp0_iter2, icmp_ln1062_reg_839, icmp_ln1073_fu_307_p2)
    begin
                ap_condition_735 <= ((icmp_ln1062_reg_839 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (icmp_ln1073_fu_307_p2 = ap_const_lv1_0));
    end process;


    ap_condition_738_assign_proc : process(ap_enable_reg_pp0_iter2, icmp_ln1062_reg_839, icmp_ln1073_fu_307_p2)
    begin
                ap_condition_738 <= ((icmp_ln1062_reg_839 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (icmp_ln1073_fu_307_p2 = ap_const_lv1_1));
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln1062_fu_225_p2)
    begin
        if (((icmp_ln1062_fu_225_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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
    ap_phi_reg_pp0_iter0_localbuffer_V_8_reg_175 <= "XXXXXXXXXXXXXXXX";

    ap_predicate_op101_read_state4_assign_proc : process(icmp_ln1062_reg_839_pp0_iter2_reg, icmp_ln1073_reg_855)
    begin
                ap_predicate_op101_read_state4 <= ((icmp_ln1073_reg_855 = ap_const_lv1_1) and (icmp_ln1062_reg_839_pp0_iter2_reg = ap_const_lv1_0));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    bLast_width_fu_239_p2 <= "1" when (j_fu_112 = sub_cast_cast_reg_829) else "0";
    cols_bound_per_npc_cast3_cast_fu_198_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(cols_bound_per_npc_cast3),32));
    grp_fu_184_p2 <= std_logic_vector(unsigned(ap_const_lv32_40) - unsigned(rem_fu_104));
    grp_fu_189_p2 <= std_logic_vector(unsigned(ap_const_lv7_3F) - unsigned(trunc_ln674_reg_897));
    i_9_fu_230_p2 <= std_logic_vector(unsigned(i_fu_108) + unsigned(ap_const_lv22_1));
    icmp_ln1062_fu_225_p2 <= "1" when (i_fu_108 = mul_ln1062) else "0";
    icmp_ln1073_fu_307_p2 <= "1" when (signed(zext_ln1068_fu_289_p1) > signed(rem_fu_104)) else "0";
    icmp_ln1074_fu_354_p2 <= "1" when (rem_fu_104 = ap_const_lv32_0) else "0";
    icmp_ln1093_fu_247_p2 <= "1" when (signed(j_fu_112) < signed(cols_bound_per_npc_cast3_cast_reg_834)) else "0";
    icmp_ln414_fu_414_p2 <= "1" when (unsigned(rem_fu_104) > unsigned(sext_ln1079_fu_390_p1)) else "0";
    icmp_ln674_1_fu_329_p2 <= "1" when (unsigned(grp_fu_184_p2) > unsigned(sub_ln1082_fu_323_p2)) else "0";
    icmp_ln674_fu_374_p2 <= "0" when (tmp_fu_364_p4 = ap_const_lv26_0) else "1";

    imgInput_uv_data82_blk_n_assign_proc : process(ap_enable_reg_pp0_iter5, imgInput_uv_data82_full_n, icmp_ln1093_reg_851_pp0_iter4_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln1093_reg_851_pp0_iter4_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
            imgInput_uv_data82_blk_n <= imgInput_uv_data82_full_n;
        else 
            imgInput_uv_data82_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgInput_uv_data82_din <= (select_ln1067_fu_759_p3 and ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175);

    imgInput_uv_data82_write_assign_proc : process(ap_enable_reg_pp0_iter5, icmp_ln1093_reg_851_pp0_iter4_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1093_reg_851_pp0_iter4_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
            imgInput_uv_data82_write <= ap_const_logic_1;
        else 
            imgInput_uv_data82_write <= ap_const_logic_0;
        end if; 
    end process;

    j_4_fu_261_p3 <= 
        ap_const_lv32_0 when (bLast_width_fu_239_p2(0) = '1') else 
        add_ln1094_fu_255_p2;

    ldata1_blk_n_assign_proc : process(ap_enable_reg_pp0_iter3, ldata1_empty_n, ap_predicate_op101_read_state4, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op101_read_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            ldata1_blk_n <= ldata1_empty_n;
        else 
            ldata1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ldata1_read_assign_proc : process(ap_enable_reg_pp0_iter3, ap_predicate_op101_read_state4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op101_read_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            ldata1_read <= ap_const_logic_1;
        else 
            ldata1_read <= ap_const_logic_0;
        end if; 
    end process;

    localbuffer_V_6_fu_622_p1 <= p_Result_16_fu_617_p2(16 - 1 downto 0);
    localbuffer_V_fu_665_p3 <= 
        ap_const_lv16_0 when (icmp_ln1074_reg_880_pp0_iter3_reg(0) = '1') else 
        p_Result_13_fu_659_p2;
    lshr_ln414_1_fu_705_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv16_FFFF),to_integer(unsigned('0' & zext_ln414_3_fu_681_p1(16-1 downto 0)))));
    lshr_ln414_fu_653_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv16_FFFF),to_integer(unsigned('0' & zext_ln414_fu_649_p1(16-1 downto 0)))));
    lshr_ln674_1_fu_629_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv64_FFFFFFFFFFFFFFFF),to_integer(unsigned('0' & zext_ln674_1_fu_626_p1(31-1 downto 0)))));
    lshr_ln674_2_fu_555_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv64_FFFFFFFFFFFFFFFF),to_integer(unsigned('0' & zext_ln674_2_fu_552_p1(31-1 downto 0)))));
    lshr_ln674_3_fu_495_p2 <= std_logic_vector(shift_right(unsigned(select_ln674_4_fu_472_p3),to_integer(unsigned('0' & zext_ln674_3_fu_491_p1(31-1 downto 0)))));
    lshr_ln674_4_fu_611_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv64_FFFFFFFFFFFFFFFF),to_integer(unsigned('0' & zext_ln674_4_fu_608_p1(31-1 downto 0)))));
    lshr_ln674_5_fu_753_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv16_FFFF),to_integer(unsigned('0' & zext_ln674_5_fu_750_p1(16-1 downto 0)))));
    lshr_ln674_fu_546_p2 <= std_logic_vector(shift_right(unsigned(select_ln674_1_fu_523_p3),to_integer(unsigned('0' & zext_ln674_fu_542_p1(31-1 downto 0)))));
    p_Result_13_fu_659_p2 <= (tmp_32_fu_640_p1 and lshr_ln414_fu_653_p2);
    p_Result_14_fu_561_p2 <= (lshr_ln674_2_fu_555_p2 and ldata1_dout);
    p_Result_15_fu_735_p2 <= (and_ln414_2_fu_729_p2 or and_ln414_1_fu_723_p2);
    p_Result_16_fu_617_p2 <= (lshr_ln674_4_fu_611_p2 and lshr_ln674_3_reg_936);
    p_Result_s_fu_635_p2 <= (lshr_ln674_reg_946 and lshr_ln674_1_fu_629_p2);
    ptr_width_minus_fu_297_p3 <= 
        sub3 when (bLast_width_reg_843(0) = '1') else 
        ap_const_lv7_30;
    rem_1_fu_428_p2 <= std_logic_vector(unsigned(rem_fu_104) + unsigned(zext_ln1069_fu_303_p1));
    rem_2_fu_343_p2 <= std_logic_vector(unsigned(rem_fu_104) - unsigned(zext_ln1068_fu_289_p1));
    select_ln1067_fu_759_p3 <= 
        lshr_ln674_5_fu_753_p2 when (bLast_width_reg_843_pp0_iter4_reg(0) = '1') else 
        ap_const_lv16_FFFF;
    select_ln1082_fu_313_p3 <= 
        add_ln1082 when (bLast_width_reg_843(0) = '1') else 
        ap_const_lv7_4F;
    select_ln414_1_fu_672_p3 <= 
        trunc_ln414_1_reg_925_pp0_iter3_reg when (icmp_ln414_reg_909_pp0_iter3_reg(0) = '1') else 
        trunc_ln414_reg_917_pp0_iter3_reg;
    select_ln414_2_fu_581_p3 <= 
        sub_ln414_1_fu_571_p2 when (icmp_ln414_reg_909(0) = '1') else 
        trunc_ln414_reg_917;
    select_ln414_3_fu_693_p3 <= 
        tmp_30_fu_684_p4 when (icmp_ln414_reg_909_pp0_iter3_reg(0) = '1') else 
        shl_ln414_reg_956;
    select_ln414_fu_576_p3 <= 
        trunc_ln414_reg_917 when (icmp_ln414_reg_909(0) = '1') else 
        trunc_ln414_1_reg_925;
    select_ln674_1_fu_523_p3 <= 
        tmp_26_fu_501_p4 when (icmp_ln674_reg_890(0) = '1') else 
        p_Val2_s_fu_116;
    select_ln674_2_fu_530_p3 <= 
        grp_fu_189_p2 when (icmp_ln674_reg_890(0) = '1') else 
        trunc_ln674_reg_897;
    select_ln674_3_fu_465_p3 <= 
        sub_ln674_4_fu_452_p2 when (icmp_ln674_1_reg_859(0) = '1') else 
        sub_ln674_6_fu_461_p2;
    select_ln674_4_fu_472_p3 <= 
        tmp_31_fu_442_p4 when (icmp_ln674_1_reg_859(0) = '1') else 
        p_Val2_s_fu_116;
    select_ln674_5_fu_479_p3 <= 
        sub_ln674_5_fu_456_p2 when (icmp_ln674_1_reg_859(0) = '1') else 
        trunc_ln674_4_reg_866;
    select_ln674_fu_516_p3 <= 
        add_ln674_fu_511_p2 when (icmp_ln674_reg_890(0) = '1') else 
        grp_fu_189_p2;
        sext_ln1079_1_fu_394_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln1079_fu_384_p2),7));

        sext_ln1079_fu_390_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln1079_fu_384_p2),32));

    shl_ln414_1_fu_699_p2 <= std_logic_vector(shift_left(unsigned(ap_const_lv16_FFFF),to_integer(unsigned('0' & zext_ln414_2_fu_677_p1(16-1 downto 0)))));
    shl_ln414_fu_597_p2 <= std_logic_vector(shift_left(unsigned(tmp_34_fu_567_p1),to_integer(unsigned('0' & zext_ln414_1_fu_593_p1(16-1 downto 0)))));
        sub_cast_cast_fu_194_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_cast),32));

    sub_ln1082_fu_323_p2 <= std_logic_vector(unsigned(zext_ln1082_fu_319_p1) - unsigned(rem_fu_104));
    sub_ln414_1_fu_571_p2 <= std_logic_vector(unsigned(ap_const_lv5_F) - unsigned(trunc_ln414_reg_917));
    sub_ln414_2_fu_587_p2 <= std_logic_vector(unsigned(ap_const_lv5_F) - unsigned(select_ln414_fu_576_p3));
    sub_ln414_fu_644_p2 <= std_logic_vector(signed(ap_const_lv5_10) - signed(trunc_ln1075_reg_885_pp0_iter3_reg));
    sub_ln674_2_fu_536_p2 <= std_logic_vector(unsigned(ap_const_lv7_3F) - unsigned(select_ln674_fu_516_p3));
    sub_ln674_3_fu_402_p2 <= std_logic_vector(unsigned(trunc_ln1079_fu_398_p1) - unsigned(sext_ln1079_1_fu_394_p1));
    sub_ln674_4_fu_452_p2 <= std_logic_vector(unsigned(trunc_ln674_4_reg_866) - unsigned(trunc_ln674_5_reg_874));
    sub_ln674_5_fu_456_p2 <= std_logic_vector(unsigned(ap_const_lv7_3F) - unsigned(trunc_ln674_4_reg_866));
    sub_ln674_6_fu_461_p2 <= std_logic_vector(unsigned(trunc_ln674_5_reg_874) - unsigned(trunc_ln674_4_reg_866));
    sub_ln674_7_fu_485_p2 <= std_logic_vector(unsigned(ap_const_lv7_3F) - unsigned(select_ln674_3_fu_465_p3));
    sub_ln674_8_fu_744_p2 <= std_logic_vector(unsigned(ap_const_lv5_F) - unsigned(trunc_ln674_6_fu_741_p1));
    
    tmp_26_fu_501_p4_proc : process(p_Val2_s_fu_116)
    variable vlo_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_26_fu_501_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(6 - 1 downto 0) := ap_const_lv32_3F(6 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(6 - 1 downto 0) := ap_const_lv32_0(6 - 1 downto 0);
        v0_cpy := p_Val2_s_fu_116;
        if (vlo_cpy(6 - 1 downto 0) > vhi_cpy(6 - 1 downto 0)) then
            vhi_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_0(6-1 downto 0)));
            vlo_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_3F(6-1 downto 0)));
            for tmp_26_fu_501_p4_i in 0 to 64-1 loop
                v0_cpy(tmp_26_fu_501_p4_i) := p_Val2_s_fu_116(64-1-tmp_26_fu_501_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(6-1 downto 0)))));

        section := (others=>'0');
        section(6-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(6-1 downto 0)) - unsigned(vlo_cpy(6-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(64-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_26_fu_501_p4 <= resvalue(64-1 downto 0);
    end process;

    
    tmp_30_fu_684_p4_proc : process(shl_ln414_reg_956)
    variable vlo_cpy : STD_LOGIC_VECTOR(16+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(16+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(16 - 1 downto 0);
    variable tmp_30_fu_684_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(16 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(16 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(16 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(4 - 1 downto 0) := ap_const_lv32_F(4 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(4 - 1 downto 0) := ap_const_lv32_0(4 - 1 downto 0);
        v0_cpy := shl_ln414_reg_956;
        if (vlo_cpy(4 - 1 downto 0) > vhi_cpy(4 - 1 downto 0)) then
            vhi_cpy(4-1 downto 0) := std_logic_vector(16-1-unsigned(ap_const_lv32_0(4-1 downto 0)));
            vlo_cpy(4-1 downto 0) := std_logic_vector(16-1-unsigned(ap_const_lv32_F(4-1 downto 0)));
            for tmp_30_fu_684_p4_i in 0 to 16-1 loop
                v0_cpy(tmp_30_fu_684_p4_i) := shl_ln414_reg_956(16-1-tmp_30_fu_684_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(4-1 downto 0)))));

        section := (others=>'0');
        section(4-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(4-1 downto 0)) - unsigned(vlo_cpy(4-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(16-1 downto 0)))));
        res_mask := res_mask(16-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_30_fu_684_p4 <= resvalue(16-1 downto 0);
    end process;

    
    tmp_31_fu_442_p4_proc : process(p_Val2_s_fu_116)
    variable vlo_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_31_fu_442_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(6 - 1 downto 0) := ap_const_lv32_3F(6 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(6 - 1 downto 0) := ap_const_lv32_0(6 - 1 downto 0);
        v0_cpy := p_Val2_s_fu_116;
        if (vlo_cpy(6 - 1 downto 0) > vhi_cpy(6 - 1 downto 0)) then
            vhi_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_0(6-1 downto 0)));
            vlo_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_3F(6-1 downto 0)));
            for tmp_31_fu_442_p4_i in 0 to 64-1 loop
                v0_cpy(tmp_31_fu_442_p4_i) := p_Val2_s_fu_116(64-1-tmp_31_fu_442_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(6-1 downto 0)))));

        section := (others=>'0');
        section(6-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(6-1 downto 0)) - unsigned(vlo_cpy(6-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(64-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_31_fu_442_p4 <= resvalue(64-1 downto 0);
    end process;

    tmp_32_fu_640_p1 <= p_Result_s_fu_635_p2(16 - 1 downto 0);
    tmp_34_fu_567_p1 <= p_Result_14_fu_561_p2(16 - 1 downto 0);
    tmp_fu_364_p4 <= grp_fu_184_p2(31 downto 6);
    trunc_ln1075_fu_360_p1 <= rem_fu_104(5 - 1 downto 0);
    trunc_ln1079_fu_398_p1 <= rem_fu_104(7 - 1 downto 0);
    trunc_ln414_1_fu_424_p1 <= add_ln1079_fu_384_p2(5 - 1 downto 0);
    trunc_ln414_fu_420_p1 <= rem_fu_104(5 - 1 downto 0);
    trunc_ln674_4_fu_335_p1 <= grp_fu_184_p2(7 - 1 downto 0);
    trunc_ln674_5_fu_339_p1 <= sub_ln1082_fu_323_p2(7 - 1 downto 0);
    trunc_ln674_6_fu_741_p1 <= sext_ln1082(5 - 1 downto 0);
    trunc_ln674_fu_380_p1 <= grp_fu_184_p2(7 - 1 downto 0);
    xf_bits_per_clock_fu_283_p3 <= 
        last_blk_width_load when (bLast_width_reg_843(0) = '1') else 
        ap_const_lv5_10;
    xor_ln414_fu_717_p2 <= (ap_const_lv16_FFFF xor and_ln414_fu_711_p2);
    zext_ln1068_1_fu_293_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xf_bits_per_clock_fu_283_p3),6));
    zext_ln1068_fu_289_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xf_bits_per_clock_fu_283_p3),32));
    zext_ln1069_fu_303_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ptr_width_minus_fu_297_p3),32));
    zext_ln1082_fu_319_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln1082_fu_313_p3),32));
    zext_ln414_1_fu_593_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln414_2_fu_581_p3),16));
    zext_ln414_2_fu_677_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln414_1_fu_672_p3),16));
    zext_ln414_3_fu_681_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln414_2_reg_951),16));
    zext_ln414_fu_649_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln414_fu_644_p2),16));
    zext_ln674_1_fu_626_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln674_2_reg_941),64));
    zext_ln674_2_fu_552_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln674_1_reg_904),64));
    zext_ln674_3_fu_491_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln674_5_fu_479_p3),64));
    zext_ln674_4_fu_608_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln674_7_reg_931),64));
    zext_ln674_5_fu_750_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln674_8_reg_972),16));
    zext_ln674_fu_542_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln674_2_fu_530_p3),64));
end behav;
