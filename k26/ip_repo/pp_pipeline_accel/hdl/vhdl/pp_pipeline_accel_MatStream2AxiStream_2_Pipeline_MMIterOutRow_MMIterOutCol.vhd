-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    out_mat_data85_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    out_mat_data85_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    out_mat_data85_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    out_mat_data85_empty_n : IN STD_LOGIC;
    out_mat_data85_read : OUT STD_LOGIC;
    ldata1_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    ldata1_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_full_n : IN STD_LOGIC;
    ldata1_write : OUT STD_LOGIC;
    bound : IN STD_LOGIC_VECTOR (31 downto 0);
    cols_bound_per_npc_cast : IN STD_LOGIC_VECTOR (15 downto 0);
    op2_assign : IN STD_LOGIC_VECTOR (31 downto 0);
    last_blk_width_load : IN STD_LOGIC_VECTOR (3 downto 0);
    cols_bound_per_npc_load : IN STD_LOGIC_VECTOR (31 downto 0);
    localbuffer_V_3_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    localbuffer_V_3_out_ap_vld : OUT STD_LOGIC;
    filled_V_1_out : OUT STD_LOGIC_VECTOR (6 downto 0);
    filled_V_1_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv24_0 : STD_LOGIC_VECTOR (23 downto 0) := "000000000000000000000000";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv7_40 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv8_40 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";

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
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal icmp_ln1309_reg_465 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1309_reg_465_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_reg_480 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op44_read_state4 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal icmp_ln1309_reg_465_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_1_reg_494 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op67_write_state5 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln1309_fu_202_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal out_mat_data85_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ldata1_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal select_ln1302_fu_221_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal select_ln1302_reg_469 : STD_LOGIC_VECTOR (15 downto 0);
    signal bLast_fu_237_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_reg_475 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1073_fu_242_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal filled_V_load_1_reg_489 : STD_LOGIC_VECTOR (6 downto 0);
    signal icmp_ln1073_1_fu_281_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ret_V_28_fu_291_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ret_V_28_reg_498 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln984_fu_297_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln984_reg_504 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal or_ln_fu_301_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln1321_fu_267_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_phi_reg_pp0_iter0_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter1_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter2_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter3_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter4_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal filled_V_fu_86 : STD_LOGIC_VECTOR (6 downto 0);
    signal filled_next_fu_313_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal localbuffer_V_fu_90 : STD_LOGIC_VECTOR (63 downto 0);
    signal localbuffer_V_3_fu_382_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal ret_V_fu_340_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal j_V_fu_94 : STD_LOGIC_VECTOR (15 downto 0);
    signal j_V_1_fu_247_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_sig_allocacmp_j_V_load : STD_LOGIC_VECTOR (15 downto 0);
    signal indvar_flatten_fu_98 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln1309_fu_207_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal icmp_ln1314_fu_216_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln1073_fu_234_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal xf_bits_per_clock_fu_257_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal sext_ln1321_fu_263_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal sub_ln1332_fu_275_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln1542_fu_287_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1322_fu_327_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln976_fu_331_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal r_V_30_fu_334_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln599_fu_357_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln976_1_fu_362_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln501_fu_354_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln994_fu_372_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_s_fu_347_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_V_fu_366_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal r_V_29_fu_376_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_406 : BOOLEAN;
    signal ap_condition_409 : BOOLEAN;
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter3_reg = ap_const_logic_1))) then 
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


    ap_phi_reg_pp0_iter3_val_V_1_reg_168_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                if (((icmp_ln1309_reg_465 = ap_const_lv1_0) and (icmp_ln1073_fu_242_p2 = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter3_val_V_1_reg_168 <= ap_const_lv24_0;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter3_val_V_1_reg_168 <= ap_phi_reg_pp0_iter2_val_V_1_reg_168;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter4_val_V_1_reg_168_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then
                if (((icmp_ln1073_reg_480 = ap_const_lv1_1) and (icmp_ln1309_reg_465_pp0_iter2_reg = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter4_val_V_1_reg_168 <= out_mat_data85_dout;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter4_val_V_1_reg_168 <= ap_phi_reg_pp0_iter3_val_V_1_reg_168;
                end if;
            end if; 
        end if;
    end process;

    filled_V_fu_86_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    filled_V_fu_86 <= ap_const_lv7_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    filled_V_fu_86 <= filled_next_fu_313_p2;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten_fu_98_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_98 <= ap_const_lv32_0;
                elsif (((icmp_ln1309_fu_202_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    indvar_flatten_fu_98 <= add_ln1309_fu_207_p2;
                end if;
            end if; 
        end if;
    end process;

    j_V_fu_94_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    j_V_fu_94 <= ap_const_lv16_0;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    j_V_fu_94 <= j_V_1_fu_247_p2;
                end if;
            end if; 
        end if;
    end process;

    localbuffer_V_fu_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    localbuffer_V_fu_90 <= ap_const_lv64_0;
                elsif ((ap_const_boolean_1 = ap_condition_409)) then 
                    localbuffer_V_fu_90 <= ret_V_fu_340_p2;
                elsif ((ap_const_boolean_1 = ap_condition_406)) then 
                    localbuffer_V_fu_90 <= localbuffer_V_3_fu_382_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
                icmp_ln1309_reg_465 <= icmp_ln1309_fu_202_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                filled_V_load_1_reg_489 <= filled_V_fu_86;
                icmp_ln1073_1_reg_494 <= icmp_ln1073_1_fu_281_p2;
                icmp_ln1309_reg_465_pp0_iter2_reg <= icmp_ln1309_reg_465;
                icmp_ln1309_reg_465_pp0_iter3_reg <= icmp_ln1309_reg_465_pp0_iter2_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter1_val_V_1_reg_168 <= ap_phi_reg_pp0_iter0_val_V_1_reg_168;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter2_val_V_1_reg_168 <= ap_phi_reg_pp0_iter1_val_V_1_reg_168;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1309_reg_465 = ap_const_lv1_0))) then
                bLast_reg_475 <= bLast_fu_237_p2;
                icmp_ln1073_reg_480 <= icmp_ln1073_fu_242_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1309_reg_465_pp0_iter2_reg = ap_const_lv1_0) and (icmp_ln1073_1_fu_281_p2 = ap_const_lv1_0))) then
                ret_V_28_reg_498 <= ret_V_28_fu_291_p2;
                trunc_ln984_reg_504 <= trunc_ln984_fu_297_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1309_fu_202_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                select_ln1302_reg_469 <= select_ln1302_fu_221_p3;
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
    add_ln1309_fu_207_p2 <= std_logic_vector(unsigned(indvar_flatten_fu_98) + unsigned(ap_const_lv32_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, out_mat_data85_empty_n, ap_predicate_op44_read_state4, ldata1_full_n, ap_predicate_op67_write_state5)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_predicate_op67_write_state5 = ap_const_boolean_1) and (ldata1_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1)) or ((ap_predicate_op44_read_state4 = ap_const_boolean_1) and (out_mat_data85_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, out_mat_data85_empty_n, ap_predicate_op44_read_state4, ldata1_full_n, ap_predicate_op67_write_state5)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_predicate_op67_write_state5 = ap_const_boolean_1) and (ldata1_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1)) or ((ap_predicate_op44_read_state4 = ap_const_boolean_1) and (out_mat_data85_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, out_mat_data85_empty_n, ap_predicate_op44_read_state4, ldata1_full_n, ap_predicate_op67_write_state5)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_predicate_op67_write_state5 = ap_const_boolean_1) and (ldata1_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1)) or ((ap_predicate_op44_read_state4 = ap_const_boolean_1) and (out_mat_data85_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter3_assign_proc : process(out_mat_data85_empty_n, ap_predicate_op44_read_state4)
    begin
                ap_block_state4_pp0_stage0_iter3 <= ((ap_predicate_op44_read_state4 = ap_const_boolean_1) and (out_mat_data85_empty_n = ap_const_logic_0));
    end process;


    ap_block_state5_pp0_stage0_iter4_assign_proc : process(ldata1_full_n, ap_predicate_op67_write_state5)
    begin
                ap_block_state5_pp0_stage0_iter4 <= ((ap_predicate_op67_write_state5 = ap_const_boolean_1) and (ldata1_full_n = ap_const_logic_0));
    end process;


    ap_condition_406_assign_proc : process(ap_enable_reg_pp0_iter4, icmp_ln1309_reg_465_pp0_iter3_reg, icmp_ln1073_1_reg_494)
    begin
                ap_condition_406 <= ((icmp_ln1073_1_reg_494 = ap_const_lv1_0) and (icmp_ln1309_reg_465_pp0_iter3_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1));
    end process;


    ap_condition_409_assign_proc : process(ap_enable_reg_pp0_iter4, icmp_ln1309_reg_465_pp0_iter3_reg, icmp_ln1073_1_reg_494)
    begin
                ap_condition_409 <= ((icmp_ln1073_1_reg_494 = ap_const_lv1_1) and (icmp_ln1309_reg_465_pp0_iter3_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1));
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln1309_fu_202_p2)
    begin
        if (((icmp_ln1309_fu_202_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter3_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter3_reg = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4)
    begin
        if (((ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4_assign_proc : process(icmp_ln1309_reg_465_pp0_iter2_reg, icmp_ln1073_1_fu_281_p2, or_ln_fu_301_p3, ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159, zext_ln1321_fu_267_p1)
    begin
        if ((icmp_ln1309_reg_465_pp0_iter2_reg = ap_const_lv1_0)) then
            if ((icmp_ln1073_1_fu_281_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 <= zext_ln1321_fu_267_p1;
            elsif ((icmp_ln1073_1_fu_281_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 <= or_ln_fu_301_p3;
            else 
                ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 <= ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159;
            end if;
        else 
            ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 <= ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_val_V_1_reg_168 <= "XXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159 <= "XXXXXXX";

    ap_predicate_op44_read_state4_assign_proc : process(icmp_ln1309_reg_465_pp0_iter2_reg, icmp_ln1073_reg_480)
    begin
                ap_predicate_op44_read_state4 <= ((icmp_ln1073_reg_480 = ap_const_lv1_1) and (icmp_ln1309_reg_465_pp0_iter2_reg = ap_const_lv1_0));
    end process;


    ap_predicate_op67_write_state5_assign_proc : process(icmp_ln1309_reg_465_pp0_iter3_reg, icmp_ln1073_1_reg_494)
    begin
                ap_predicate_op67_write_state5 <= ((icmp_ln1073_1_reg_494 = ap_const_lv1_0) and (icmp_ln1309_reg_465_pp0_iter3_reg = ap_const_lv1_0));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_j_V_load_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0, j_V_fu_94, j_V_1_fu_247_p2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            ap_sig_allocacmp_j_V_load <= j_V_1_fu_247_p2;
        else 
            ap_sig_allocacmp_j_V_load <= j_V_fu_94;
        end if; 
    end process;

    bLast_fu_237_p2 <= "1" when (zext_ln1073_fu_234_p1 = op2_assign) else "0";
    filled_V_1_out <= filled_V_fu_86;

    filled_V_1_out_ap_vld_assign_proc : process(icmp_ln1309_reg_465_pp0_iter2_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1309_reg_465_pp0_iter2_reg = ap_const_lv1_1))) then 
            filled_V_1_out_ap_vld <= ap_const_logic_1;
        else 
            filled_V_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    filled_next_fu_313_p2 <= std_logic_vector(unsigned(ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4) + unsigned(filled_V_fu_86));
    icmp_ln1073_1_fu_281_p2 <= "1" when (unsigned(sub_ln1332_fu_275_p2) > unsigned(filled_V_fu_86)) else "0";
    icmp_ln1073_fu_242_p2 <= "1" when (signed(zext_ln1073_fu_234_p1) < signed(cols_bound_per_npc_load)) else "0";
    icmp_ln1309_fu_202_p2 <= "1" when (indvar_flatten_fu_98 = bound) else "0";
    icmp_ln1314_fu_216_p2 <= "1" when (ap_sig_allocacmp_j_V_load = cols_bound_per_npc_cast) else "0";
    j_V_1_fu_247_p2 <= std_logic_vector(unsigned(select_ln1302_reg_469) + unsigned(ap_const_lv16_1));

    ldata1_blk_n_assign_proc : process(ap_enable_reg_pp0_iter4, ldata1_full_n, ap_predicate_op67_write_state5, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op67_write_state5 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            ldata1_blk_n <= ldata1_full_n;
        else 
            ldata1_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    ldata1_din <= (r_V_30_fu_334_p2 or localbuffer_V_fu_90);

    ldata1_write_assign_proc : process(ap_enable_reg_pp0_iter4, ap_predicate_op67_write_state5, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op67_write_state5 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            ldata1_write <= ap_const_logic_1;
        else 
            ldata1_write <= ap_const_logic_0;
        end if; 
    end process;

    localbuffer_V_3_fu_382_p3 <= 
        r_V_fu_366_p2 when (p_Result_s_fu_347_p3(0) = '1') else 
        r_V_29_fu_376_p2;
    localbuffer_V_3_out <= localbuffer_V_fu_90;

    localbuffer_V_3_out_ap_vld_assign_proc : process(icmp_ln1309_reg_465_pp0_iter2_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1309_reg_465_pp0_iter2_reg = ap_const_lv1_1))) then 
            localbuffer_V_3_out_ap_vld <= ap_const_logic_1;
        else 
            localbuffer_V_3_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    or_ln_fu_301_p3 <= (ap_const_lv2_2 & sext_ln1321_fu_263_p1);

    out_mat_data85_blk_n_assign_proc : process(ap_enable_reg_pp0_iter3, out_mat_data85_empty_n, ap_predicate_op44_read_state4, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op44_read_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            out_mat_data85_blk_n <= out_mat_data85_empty_n;
        else 
            out_mat_data85_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    out_mat_data85_read_assign_proc : process(ap_enable_reg_pp0_iter3, ap_predicate_op44_read_state4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op44_read_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            out_mat_data85_read <= ap_const_logic_1;
        else 
            out_mat_data85_read <= ap_const_logic_0;
        end if; 
    end process;

    p_Result_s_fu_347_p3 <= ret_V_28_reg_498(7 downto 7);
    r_V_29_fu_376_p2 <= std_logic_vector(shift_right(unsigned(zext_ln1322_fu_327_p1),to_integer(unsigned('0' & zext_ln994_fu_372_p1(31-1 downto 0)))));
    r_V_30_fu_334_p2 <= std_logic_vector(shift_left(unsigned(zext_ln1322_fu_327_p1),to_integer(unsigned('0' & zext_ln976_fu_331_p1(31-1 downto 0)))));
    r_V_fu_366_p2 <= std_logic_vector(shift_left(unsigned(zext_ln1322_fu_327_p1),to_integer(unsigned('0' & zext_ln976_1_fu_362_p1(31-1 downto 0)))));
    ret_V_28_fu_291_p2 <= std_logic_vector(unsigned(ap_const_lv8_40) - unsigned(zext_ln1542_fu_287_p1));
    ret_V_fu_340_p2 <= (r_V_30_fu_334_p2 or localbuffer_V_fu_90);
    select_ln1302_fu_221_p3 <= 
        ap_const_lv16_0 when (icmp_ln1314_fu_216_p2(0) = '1') else 
        ap_sig_allocacmp_j_V_load;
        sext_ln1321_fu_263_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(xf_bits_per_clock_fu_257_p3),5));

    sub_ln1332_fu_275_p2 <= std_logic_vector(signed(ap_const_lv7_40) - signed(zext_ln1321_fu_267_p1));
    sub_ln599_fu_357_p2 <= std_logic_vector(unsigned(ap_const_lv6_0) - unsigned(trunc_ln984_reg_504));
    trunc_ln501_fu_354_p1 <= ret_V_28_reg_498(7 - 1 downto 0);
    trunc_ln984_fu_297_p1 <= ret_V_28_fu_291_p2(6 - 1 downto 0);
    xf_bits_per_clock_fu_257_p3 <= 
        last_blk_width_load when (bLast_reg_475(0) = '1') else 
        ap_const_lv4_8;
    zext_ln1073_fu_234_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln1302_reg_469),32));
    zext_ln1321_fu_267_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln1321_fu_263_p1),7));
    zext_ln1322_fu_327_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_reg_pp0_iter4_val_V_1_reg_168),64));
    zext_ln1542_fu_287_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(filled_V_fu_86),8));
    zext_ln976_1_fu_362_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln599_fu_357_p2),64));
    zext_ln976_fu_331_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(filled_V_load_1_reg_489),64));
    zext_ln994_fu_372_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln501_fu_354_p1),64));
end behav;
