-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    resize_out_mat_data84_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    resize_out_mat_data84_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    resize_out_mat_data84_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    resize_out_mat_data84_empty_n : IN STD_LOGIC;
    resize_out_mat_data84_read : OUT STD_LOGIC;
    out_mat_data85_din : OUT STD_LOGIC_VECTOR (23 downto 0);
    out_mat_data85_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    out_mat_data85_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    out_mat_data85_full_n : IN STD_LOGIC;
    out_mat_data85_write : OUT STD_LOGIC;
    loop_count : IN STD_LOGIC_VECTOR (31 downto 0);
    rhs : IN STD_LOGIC_VECTOR (7 downto 0);
    sext_ln1319 : IN STD_LOGIC_VECTOR (7 downto 0);
    rhs_1 : IN STD_LOGIC_VECTOR (7 downto 0);
    sext_ln1319_1 : IN STD_LOGIC_VECTOR (7 downto 0);
    rhs_2 : IN STD_LOGIC_VECTOR (7 downto 0);
    sext_ln1319_2 : IN STD_LOGIC_VECTOR (7 downto 0) );
end;


architecture behav of pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";

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
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln49_fu_173_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal resize_out_mat_data84_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal out_mat_data85_blk_n : STD_LOGIC;
    signal sext_ln1319_2_cast_fu_137_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sext_ln1319_2_cast_reg_361 : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal rhs_2_cast_fu_141_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal rhs_2_cast_reg_366 : STD_LOGIC_VECTOR (8 downto 0);
    signal sext_ln1319_1_cast_fu_145_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sext_ln1319_1_cast_reg_371 : STD_LOGIC_VECTOR (16 downto 0);
    signal rhs_1_cast_fu_149_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal rhs_1_cast_reg_376 : STD_LOGIC_VECTOR (8 downto 0);
    signal sext_ln1319_cast_fu_153_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sext_ln1319_cast_reg_381 : STD_LOGIC_VECTOR (16 downto 0);
    signal rhs_cast_fu_157_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal rhs_cast_reg_386 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_fu_198_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_reg_395 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_24_fu_217_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_24_reg_400 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_25_fu_236_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_25_reg_405 : STD_LOGIC_VECTOR (8 downto 0);
    signal trunc_ln6_reg_410 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_reg_415 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln864_1_reg_420 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_16_reg_425 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln864_2_reg_430 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_17_reg_435 : STD_LOGIC_VECTOR (0 downto 0);
    signal k_fu_78 : STD_LOGIC_VECTOR (30 downto 0);
    signal add_ln49_fu_179_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_k_load : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln49_fu_169_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_1pix_V_fu_190_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln859_fu_194_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal x_1pix_V_1_fu_203_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln859_1_fu_213_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal x_1pix_V_2_fu_222_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln859_2_fu_232_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal r_V_fu_244_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_V_fu_244_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal r_V_25_fu_270_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_V_25_fu_270_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal r_V_26_fu_296_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_V_26_fu_296_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal zext_ln423_fu_319_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln423_1_fu_327_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln423_2_fu_335_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal out_1pix_V_2_fu_338_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal out_1pix_V_1_fu_330_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal out_1pix_V_fu_322_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_mul_9s_8s_17_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (8 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        dout : OUT STD_LOGIC_VECTOR (16 downto 0) );
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
    mul_9s_8s_17_1_1_U259 : component pp_pipeline_accel_mul_9s_8s_17_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 9,
        din1_WIDTH => 8,
        dout_WIDTH => 17)
    port map (
        din0 => ret_V_reg_395,
        din1 => r_V_fu_244_p1,
        dout => r_V_fu_244_p2);

    mul_9s_8s_17_1_1_U260 : component pp_pipeline_accel_mul_9s_8s_17_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 9,
        din1_WIDTH => 8,
        dout_WIDTH => 17)
    port map (
        din0 => ret_V_24_reg_400,
        din1 => r_V_25_fu_270_p1,
        dout => r_V_25_fu_270_p2);

    mul_9s_8s_17_1_1_U261 : component pp_pipeline_accel_mul_9s_8s_17_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 9,
        din1_WIDTH => 8,
        dout_WIDTH => 17)
    port map (
        din0 => ret_V_25_reg_405,
        din1 => r_V_26_fu_296_p1,
        dout => r_V_26_fu_296_p2);

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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
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


    k_fu_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln49_fu_173_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    k_fu_78 <= add_ln49_fu_179_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    k_fu_78 <= ap_const_lv31_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                ret_V_24_reg_400 <= ret_V_24_fu_217_p2;
                ret_V_25_reg_405 <= ret_V_25_fu_236_p2;
                ret_V_reg_395 <= ret_V_fu_198_p2;
                    rhs_1_cast_reg_376(7 downto 0) <= rhs_1_cast_fu_149_p1(7 downto 0);
                    rhs_2_cast_reg_366(7 downto 0) <= rhs_2_cast_fu_141_p1(7 downto 0);
                    rhs_cast_reg_386(7 downto 0) <= rhs_cast_fu_157_p1(7 downto 0);
                sext_ln1319_1_cast_reg_371 <= sext_ln1319_1_cast_fu_145_p1;
                sext_ln1319_2_cast_reg_361 <= sext_ln1319_2_cast_fu_137_p1;
                sext_ln1319_cast_reg_381 <= sext_ln1319_cast_fu_153_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                tmp_16_reg_425 <= r_V_25_fu_270_p2(3 downto 3);
                tmp_17_reg_435 <= r_V_26_fu_296_p2(3 downto 3);
                tmp_reg_415 <= r_V_fu_244_p2(3 downto 3);
                trunc_ln6_reg_410 <= r_V_fu_244_p2(11 downto 4);
                trunc_ln864_1_reg_420 <= r_V_25_fu_270_p2(11 downto 4);
                trunc_ln864_2_reg_430 <= r_V_26_fu_296_p2(11 downto 4);
            end if;
        end if;
    end process;
    rhs_2_cast_reg_366(8) <= '0';
    rhs_1_cast_reg_376(8) <= '0';
    rhs_cast_reg_386(8) <= '0';

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln49_fu_179_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_k_load) + unsigned(ap_const_lv31_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter3, resize_out_mat_data84_empty_n, out_mat_data85_full_n)
    begin
                ap_block_pp0_stage0_01001 <= (((out_mat_data85_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((resize_out_mat_data84_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter3, resize_out_mat_data84_empty_n, out_mat_data85_full_n)
    begin
                ap_block_pp0_stage0_11001 <= (((out_mat_data85_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((resize_out_mat_data84_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter3, resize_out_mat_data84_empty_n, out_mat_data85_full_n)
    begin
                ap_block_pp0_stage0_subdone <= (((out_mat_data85_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((resize_out_mat_data84_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state2_pp0_stage0_iter1_assign_proc : process(resize_out_mat_data84_empty_n)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (resize_out_mat_data84_empty_n = ap_const_logic_0);
    end process;

        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter3_assign_proc : process(out_mat_data85_full_n)
    begin
                ap_block_state4_pp0_stage0_iter3 <= (out_mat_data85_full_n = ap_const_logic_0);
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln49_fu_173_p2)
    begin
        if (((icmp_ln49_fu_173_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_k_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, k_fu_78, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_k_load <= ap_const_lv31_0;
        else 
            ap_sig_allocacmp_k_load <= k_fu_78;
        end if; 
    end process;

    icmp_ln49_fu_173_p2 <= "1" when (signed(zext_ln49_fu_169_p1) < signed(loop_count)) else "0";
    out_1pix_V_1_fu_330_p2 <= std_logic_vector(unsigned(trunc_ln864_1_reg_420) + unsigned(zext_ln423_1_fu_327_p1));
    out_1pix_V_2_fu_338_p2 <= std_logic_vector(unsigned(trunc_ln864_2_reg_430) + unsigned(zext_ln423_2_fu_335_p1));
    out_1pix_V_fu_322_p2 <= std_logic_vector(unsigned(trunc_ln6_reg_410) + unsigned(zext_ln423_fu_319_p1));

    out_mat_data85_blk_n_assign_proc : process(ap_enable_reg_pp0_iter3, out_mat_data85_full_n, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            out_mat_data85_blk_n <= out_mat_data85_full_n;
        else 
            out_mat_data85_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    out_mat_data85_din <= ((out_1pix_V_2_fu_338_p2 & out_1pix_V_1_fu_330_p2) & out_1pix_V_fu_322_p2);

    out_mat_data85_write_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            out_mat_data85_write <= ap_const_logic_1;
        else 
            out_mat_data85_write <= ap_const_logic_0;
        end if; 
    end process;

    r_V_25_fu_270_p1 <= sext_ln1319_1_cast_reg_371(8 - 1 downto 0);
    r_V_26_fu_296_p1 <= sext_ln1319_2_cast_reg_361(8 - 1 downto 0);
    r_V_fu_244_p1 <= sext_ln1319_cast_reg_381(8 - 1 downto 0);

    resize_out_mat_data84_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, resize_out_mat_data84_empty_n, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            resize_out_mat_data84_blk_n <= resize_out_mat_data84_empty_n;
        else 
            resize_out_mat_data84_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    resize_out_mat_data84_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            resize_out_mat_data84_read <= ap_const_logic_1;
        else 
            resize_out_mat_data84_read <= ap_const_logic_0;
        end if; 
    end process;

    ret_V_24_fu_217_p2 <= std_logic_vector(unsigned(zext_ln859_1_fu_213_p1) - unsigned(rhs_1_cast_reg_376));
    ret_V_25_fu_236_p2 <= std_logic_vector(unsigned(zext_ln859_2_fu_232_p1) - unsigned(rhs_2_cast_reg_366));
    ret_V_fu_198_p2 <= std_logic_vector(unsigned(zext_ln859_fu_194_p1) - unsigned(rhs_cast_reg_386));
    rhs_1_cast_fu_149_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_1),9));
    rhs_2_cast_fu_141_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_2),9));
    rhs_cast_fu_157_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs),9));
        sext_ln1319_1_cast_fu_145_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln1319_1),17));

        sext_ln1319_2_cast_fu_137_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln1319_2),17));

        sext_ln1319_cast_fu_153_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln1319),17));

    x_1pix_V_1_fu_203_p4 <= resize_out_mat_data84_dout(15 downto 8);
    x_1pix_V_2_fu_222_p4 <= resize_out_mat_data84_dout(23 downto 16);
    x_1pix_V_fu_190_p1 <= resize_out_mat_data84_dout(8 - 1 downto 0);
    zext_ln423_1_fu_327_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_16_reg_425),8));
    zext_ln423_2_fu_335_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_17_reg_435),8));
    zext_ln423_fu_319_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_reg_415),8));
    zext_ln49_fu_169_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_k_load),32));
    zext_ln859_1_fu_213_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(x_1pix_V_1_fu_203_p4),9));
    zext_ln859_2_fu_232_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(x_1pix_V_2_fu_222_p4),9));
    zext_ln859_fu_194_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(x_1pix_V_fu_190_p1),9));
end behav;
