-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_MatStream2AxiStream_2_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
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
    rows_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    rows_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_empty_n : IN STD_LOGIC;
    rows_read : OUT STD_LOGIC;
    cols_bound_per_npc_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    cols_bound_per_npc_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    cols_bound_per_npc_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    cols_bound_per_npc_empty_n : IN STD_LOGIC;
    cols_bound_per_npc_read : OUT STD_LOGIC;
    last_blk_width : IN STD_LOGIC_VECTOR (3 downto 0) );
end;


architecture behav of pp_pipeline_accel_MatStream2AxiStream_2_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ldata1_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal icmp_ln1069_fu_119_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal rows_blk_n : STD_LOGIC;
    signal cols_bound_per_npc_blk_n : STD_LOGIC;
    signal cols_bound_per_npc_read_reg_144 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_fu_94_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal empty_reg_150 : STD_LOGIC_VECTOR (15 downto 0);
    signal last_blk_width_read_reg_165 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal op2_assign_fu_106_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal op2_assign_reg_170 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_fu_125_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bound_reg_175 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start : STD_LOGIC;
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done : STD_LOGIC;
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_idle : STD_LOGIC;
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_ready : STD_LOGIC;
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_out_mat_data85_read : STD_LOGIC;
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_write : STD_LOGIC;
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out_ap_vld : STD_LOGIC;
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out_ap_vld : STD_LOGIC;
    signal grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_state6 : BOOLEAN;
    signal grp_fu_125_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_125_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_125_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal grp_fu_125_p00 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_125_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol IS
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
    end component;


    component pp_pipeline_accel_mul_mul_16ns_16ns_32_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79 : component pp_pipeline_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start,
        ap_done => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done,
        ap_idle => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_idle,
        ap_ready => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_ready,
        out_mat_data85_dout => out_mat_data85_dout,
        out_mat_data85_num_data_valid => ap_const_lv2_0,
        out_mat_data85_fifo_cap => ap_const_lv2_0,
        out_mat_data85_empty_n => out_mat_data85_empty_n,
        out_mat_data85_read => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_out_mat_data85_read,
        ldata1_din => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din,
        ldata1_num_data_valid => ap_const_lv2_0,
        ldata1_fifo_cap => ap_const_lv2_0,
        ldata1_full_n => ldata1_full_n,
        ldata1_write => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_write,
        bound => bound_reg_175,
        cols_bound_per_npc_cast => empty_reg_150,
        op2_assign => op2_assign_reg_170,
        last_blk_width_load => last_blk_width_read_reg_165,
        cols_bound_per_npc_load => cols_bound_per_npc_read_reg_144,
        localbuffer_V_3_out => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out,
        localbuffer_V_3_out_ap_vld => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out_ap_vld,
        filled_V_1_out => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out,
        filled_V_1_out_ap_vld => grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out_ap_vld);

    mul_mul_16ns_16ns_32_4_1_U305 : component pp_pipeline_accel_mul_mul_16ns_16ns_32_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_125_p0,
        din1 => grp_fu_125_p1,
        ce => grp_fu_125_ce,
        dout => grp_fu_125_p2);





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


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not(((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ldata1_full_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_ready = ap_const_logic_1)) then 
                    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                bound_reg_175 <= grp_fu_125_p2;
                op2_assign_reg_170 <= op2_assign_fu_106_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                cols_bound_per_npc_read_reg_144 <= cols_bound_per_npc_dout;
                empty_reg_150 <= empty_fu_94_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                last_blk_width_read_reg_165 <= last_blk_width;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ldata1_full_n, rows_empty_n, cols_bound_per_npc_empty_n, ap_CS_fsm_state6, icmp_ln1069_fu_119_p2, grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done, ap_CS_fsm_state5)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                if ((not(((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ldata1_full_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, rows_empty_n, cols_bound_per_npc_empty_n)
    begin
        if (((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done)
    begin
        if ((grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state6_blk_assign_proc : process(ldata1_full_n, icmp_ln1069_fu_119_p2)
    begin
        if (((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ldata1_full_n = ap_const_logic_0))) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, rows_empty_n, cols_bound_per_npc_empty_n)
    begin
                ap_block_state1 <= ((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_block_state6_assign_proc : process(ldata1_full_n, icmp_ln1069_fu_119_p2)
    begin
                ap_block_state6 <= ((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ldata1_full_n = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ldata1_full_n, ap_CS_fsm_state6, icmp_ln1069_fu_119_p2)
    begin
        if ((not(((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ldata1_full_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ldata1_full_n, ap_CS_fsm_state6, icmp_ln1069_fu_119_p2)
    begin
        if ((not(((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ldata1_full_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    cols_bound_per_npc_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cols_bound_per_npc_empty_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_bound_per_npc_blk_n <= cols_bound_per_npc_empty_n;
        else 
            cols_bound_per_npc_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    cols_bound_per_npc_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, cols_bound_per_npc_empty_n)
    begin
        if ((not(((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_bound_per_npc_read <= ap_const_logic_1;
        else 
            cols_bound_per_npc_read <= ap_const_logic_0;
        end if; 
    end process;

    empty_fu_94_p1 <= cols_bound_per_npc_dout(16 - 1 downto 0);
    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start <= grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg;

    grp_fu_125_ce_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, cols_bound_per_npc_empty_n, ap_CS_fsm_state6, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or ((ap_const_logic_1 = ap_CS_fsm_state1) and ((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))))) then 
            grp_fu_125_ce <= ap_const_logic_0;
        else 
            grp_fu_125_ce <= ap_const_logic_1;
        end if; 
    end process;

    grp_fu_125_p0 <= grp_fu_125_p00(16 - 1 downto 0);
    grp_fu_125_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rows_dout),32));
    grp_fu_125_p1 <= grp_fu_125_p10(16 - 1 downto 0);
    grp_fu_125_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(empty_fu_94_p1),32));
    icmp_ln1069_fu_119_p2 <= "1" when (grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out = ap_const_lv7_0) else "0";

    ldata1_blk_n_assign_proc : process(ldata1_full_n, ap_CS_fsm_state6, icmp_ln1069_fu_119_p2)
    begin
        if (((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ldata1_blk_n <= ldata1_full_n;
        else 
            ldata1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ldata1_din_assign_proc : process(ldata1_full_n, ap_CS_fsm_state6, icmp_ln1069_fu_119_p2, grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din, grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out, ap_CS_fsm_state5)
    begin
        if ((not(((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ldata1_full_n = ap_const_logic_0))) and (icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ldata1_din <= grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ldata1_din <= grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din;
        else 
            ldata1_din <= grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din;
        end if; 
    end process;


    ldata1_write_assign_proc : process(ldata1_full_n, ap_CS_fsm_state6, icmp_ln1069_fu_119_p2, grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_write, ap_CS_fsm_state5)
    begin
        if ((not(((icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ldata1_full_n = ap_const_logic_0))) and (icmp_ln1069_fu_119_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ldata1_write <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ldata1_write <= grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_write;
        else 
            ldata1_write <= ap_const_logic_0;
        end if; 
    end process;

    op2_assign_fu_106_p2 <= std_logic_vector(unsigned(cols_bound_per_npc_read_reg_144) + unsigned(ap_const_lv32_FFFFFFFF));

    out_mat_data85_read_assign_proc : process(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_out_mat_data85_read, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            out_mat_data85_read <= grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_out_mat_data85_read;
        else 
            out_mat_data85_read <= ap_const_logic_0;
        end if; 
    end process;


    rows_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_blk_n <= rows_empty_n;
        else 
            rows_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rows_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, cols_bound_per_npc_empty_n)
    begin
        if ((not(((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_read <= ap_const_logic_1;
        else 
            rows_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
