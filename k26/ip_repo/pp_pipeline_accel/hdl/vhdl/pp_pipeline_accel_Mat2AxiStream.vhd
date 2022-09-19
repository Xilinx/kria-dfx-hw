-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_Mat2AxiStream is
port (
    out_mat_data85_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    out_mat_data85_empty_n : IN STD_LOGIC;
    out_mat_data85_read : OUT STD_LOGIC;
    ldata1_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    ldata1_full_n : IN STD_LOGIC;
    ldata1_write : OUT STD_LOGIC;
    rows : IN STD_LOGIC_VECTOR (15 downto 0);
    cols : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    rows_ap_vld : IN STD_LOGIC;
    cols_ap_vld : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_Mat2AxiStream is 
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal entry_proc_U0_ap_start : STD_LOGIC;
    signal entry_proc_U0_ap_done : STD_LOGIC;
    signal entry_proc_U0_ap_continue : STD_LOGIC;
    signal entry_proc_U0_ap_idle : STD_LOGIC;
    signal entry_proc_U0_ap_ready : STD_LOGIC;
    signal entry_proc_U0_rows_c_din : STD_LOGIC_VECTOR (15 downto 0);
    signal entry_proc_U0_rows_c_write : STD_LOGIC;
    signal entry_proc_U0_cols_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal entry_proc_U0_cols_c_write : STD_LOGIC;
    signal last_blk_pxl_width_U0_ap_start : STD_LOGIC;
    signal last_blk_pxl_width_U0_ap_done : STD_LOGIC;
    signal last_blk_pxl_width_U0_ap_continue : STD_LOGIC;
    signal last_blk_pxl_width_U0_ap_idle : STD_LOGIC;
    signal last_blk_pxl_width_U0_ap_ready : STD_LOGIC;
    signal last_blk_pxl_width_U0_return_r : STD_LOGIC_VECTOR (3 downto 0);
    signal last_blk_width_channel_full_n : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_ap_start : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_ap_done : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_ap_continue : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_ap_idle : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_ap_ready : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_out_mat_data85_read : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_ldata1_din : STD_LOGIC_VECTOR (63 downto 0);
    signal MatStream2AxiStream_2_U0_ldata1_write : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_rows_read : STD_LOGIC;
    signal MatStream2AxiStream_2_U0_cols_bound_per_npc_read : STD_LOGIC;
    signal rows_c_full_n : STD_LOGIC;
    signal rows_c_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal rows_c_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal rows_c_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal rows_c_empty_n : STD_LOGIC;
    signal cols_c_full_n : STD_LOGIC;
    signal cols_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal cols_c_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal cols_c_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal cols_c_empty_n : STD_LOGIC;
    signal last_blk_width_channel_dout : STD_LOGIC_VECTOR (3 downto 0);
    signal last_blk_width_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal last_blk_width_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal last_blk_width_channel_empty_n : STD_LOGIC;
    signal ap_sync_ready : STD_LOGIC;
    signal ap_sync_reg_entry_proc_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_entry_proc_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_last_blk_pxl_width_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_last_blk_pxl_width_U0_ap_ready : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_entry_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        rows : IN STD_LOGIC_VECTOR (15 downto 0);
        rows_c_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        rows_c_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_c_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_c_full_n : IN STD_LOGIC;
        rows_c_write : OUT STD_LOGIC;
        cols : IN STD_LOGIC_VECTOR (31 downto 0);
        cols_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        cols_c_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
        cols_c_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
        cols_c_full_n : IN STD_LOGIC;
        cols_c_write : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_last_blk_pxl_width IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        return_r : OUT STD_LOGIC_VECTOR (3 downto 0) );
    end component;


    component pp_pipeline_accel_MatStream2AxiStream_2_s IS
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
    end component;


    component pp_pipeline_accel_fifo_w16_d3_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (15 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (15 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w32_d3_S_x0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w4_d2_S_x IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (3 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    entry_proc_U0 : component pp_pipeline_accel_entry_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => entry_proc_U0_ap_start,
        ap_done => entry_proc_U0_ap_done,
        ap_continue => entry_proc_U0_ap_continue,
        ap_idle => entry_proc_U0_ap_idle,
        ap_ready => entry_proc_U0_ap_ready,
        rows => rows,
        rows_c_din => entry_proc_U0_rows_c_din,
        rows_c_num_data_valid => rows_c_num_data_valid,
        rows_c_fifo_cap => rows_c_fifo_cap,
        rows_c_full_n => rows_c_full_n,
        rows_c_write => entry_proc_U0_rows_c_write,
        cols => cols,
        cols_c_din => entry_proc_U0_cols_c_din,
        cols_c_num_data_valid => cols_c_num_data_valid,
        cols_c_fifo_cap => cols_c_fifo_cap,
        cols_c_full_n => cols_c_full_n,
        cols_c_write => entry_proc_U0_cols_c_write);

    last_blk_pxl_width_U0 : component pp_pipeline_accel_last_blk_pxl_width
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => last_blk_pxl_width_U0_ap_start,
        ap_done => last_blk_pxl_width_U0_ap_done,
        ap_continue => last_blk_pxl_width_U0_ap_continue,
        ap_idle => last_blk_pxl_width_U0_ap_idle,
        ap_ready => last_blk_pxl_width_U0_ap_ready,
        return_r => last_blk_pxl_width_U0_return_r);

    MatStream2AxiStream_2_U0 : component pp_pipeline_accel_MatStream2AxiStream_2_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => MatStream2AxiStream_2_U0_ap_start,
        ap_done => MatStream2AxiStream_2_U0_ap_done,
        ap_continue => MatStream2AxiStream_2_U0_ap_continue,
        ap_idle => MatStream2AxiStream_2_U0_ap_idle,
        ap_ready => MatStream2AxiStream_2_U0_ap_ready,
        out_mat_data85_dout => out_mat_data85_dout,
        out_mat_data85_num_data_valid => ap_const_lv2_0,
        out_mat_data85_fifo_cap => ap_const_lv2_0,
        out_mat_data85_empty_n => out_mat_data85_empty_n,
        out_mat_data85_read => MatStream2AxiStream_2_U0_out_mat_data85_read,
        ldata1_din => MatStream2AxiStream_2_U0_ldata1_din,
        ldata1_num_data_valid => ap_const_lv2_0,
        ldata1_fifo_cap => ap_const_lv2_0,
        ldata1_full_n => ldata1_full_n,
        ldata1_write => MatStream2AxiStream_2_U0_ldata1_write,
        rows_dout => rows_c_dout,
        rows_num_data_valid => rows_c_num_data_valid,
        rows_fifo_cap => rows_c_fifo_cap,
        rows_empty_n => rows_c_empty_n,
        rows_read => MatStream2AxiStream_2_U0_rows_read,
        cols_bound_per_npc_dout => cols_c_dout,
        cols_bound_per_npc_num_data_valid => cols_c_num_data_valid,
        cols_bound_per_npc_fifo_cap => cols_c_fifo_cap,
        cols_bound_per_npc_empty_n => cols_c_empty_n,
        cols_bound_per_npc_read => MatStream2AxiStream_2_U0_cols_bound_per_npc_read,
        last_blk_width => last_blk_width_channel_dout);

    rows_c_U : component pp_pipeline_accel_fifo_w16_d3_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc_U0_rows_c_din,
        if_full_n => rows_c_full_n,
        if_write => entry_proc_U0_rows_c_write,
        if_dout => rows_c_dout,
        if_num_data_valid => rows_c_num_data_valid,
        if_fifo_cap => rows_c_fifo_cap,
        if_empty_n => rows_c_empty_n,
        if_read => MatStream2AxiStream_2_U0_rows_read);

    cols_c_U : component pp_pipeline_accel_fifo_w32_d3_S_x0
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc_U0_cols_c_din,
        if_full_n => cols_c_full_n,
        if_write => entry_proc_U0_cols_c_write,
        if_dout => cols_c_dout,
        if_num_data_valid => cols_c_num_data_valid,
        if_fifo_cap => cols_c_fifo_cap,
        if_empty_n => cols_c_empty_n,
        if_read => MatStream2AxiStream_2_U0_cols_bound_per_npc_read);

    last_blk_width_channel_U : component pp_pipeline_accel_fifo_w4_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => last_blk_pxl_width_U0_return_r,
        if_full_n => last_blk_width_channel_full_n,
        if_write => last_blk_pxl_width_U0_ap_done,
        if_dout => last_blk_width_channel_dout,
        if_num_data_valid => last_blk_width_channel_num_data_valid,
        if_fifo_cap => last_blk_width_channel_fifo_cap,
        if_empty_n => last_blk_width_channel_empty_n,
        if_read => MatStream2AxiStream_2_U0_ap_ready);





    ap_sync_reg_entry_proc_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_entry_proc_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_entry_proc_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_entry_proc_U0_ap_ready <= ap_sync_entry_proc_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_last_blk_pxl_width_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_last_blk_pxl_width_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_last_blk_pxl_width_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_last_blk_pxl_width_U0_ap_ready <= ap_sync_last_blk_pxl_width_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;

    MatStream2AxiStream_2_U0_ap_continue <= ap_continue;
    MatStream2AxiStream_2_U0_ap_start <= last_blk_width_channel_empty_n;
    ap_done <= MatStream2AxiStream_2_U0_ap_done;
    ap_idle <= (last_blk_pxl_width_U0_ap_idle and (last_blk_width_channel_empty_n xor ap_const_logic_1) and entry_proc_U0_ap_idle and MatStream2AxiStream_2_U0_ap_idle);
    ap_ready <= ap_sync_ready;
    ap_sync_entry_proc_U0_ap_ready <= (entry_proc_U0_ap_ready or ap_sync_reg_entry_proc_U0_ap_ready);
    ap_sync_last_blk_pxl_width_U0_ap_ready <= (last_blk_pxl_width_U0_ap_ready or ap_sync_reg_last_blk_pxl_width_U0_ap_ready);
    ap_sync_ready <= (ap_sync_last_blk_pxl_width_U0_ap_ready and ap_sync_entry_proc_U0_ap_ready);
    entry_proc_U0_ap_continue <= ap_const_logic_1;
    entry_proc_U0_ap_start <= ((ap_sync_reg_entry_proc_U0_ap_ready xor ap_const_logic_1) and ap_start);
    last_blk_pxl_width_U0_ap_continue <= last_blk_width_channel_full_n;
    last_blk_pxl_width_U0_ap_start <= ((ap_sync_reg_last_blk_pxl_width_U0_ap_ready xor ap_const_logic_1) and ap_start);
    ldata1_din <= MatStream2AxiStream_2_U0_ldata1_din;
    ldata1_write <= MatStream2AxiStream_2_U0_ldata1_write;
    out_mat_data85_read <= MatStream2AxiStream_2_U0_out_mat_data85_read;
end behav;
