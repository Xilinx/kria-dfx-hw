-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_resize_1_9_2160_3840_720_720_1_9_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
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
    resize_out_mat_data84_write : OUT STD_LOGIC;
    resize_out_mat_rows_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    resize_out_mat_rows_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    resize_out_mat_rows_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    resize_out_mat_rows_c_full_n : IN STD_LOGIC;
    resize_out_mat_rows_c_write : OUT STD_LOGIC;
    resize_out_mat_cols_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    resize_out_mat_cols_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    resize_out_mat_cols_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    resize_out_mat_cols_c_full_n : IN STD_LOGIC;
    resize_out_mat_cols_c_write : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_resize_1_9_2160_3840_720_720_1_9_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal resize_out_mat_rows_c_blk_n : STD_LOGIC;
    signal resize_out_mat_cols_c_blk_n : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_idle : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_ready : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_rgb_mat_data83_read : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_resize_out_mat_data84_din : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_resize_out_mat_data84_write : STD_LOGIC;
    signal grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state1_ignore_call10 : BOOLEAN;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s IS
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
    end component;



begin
    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82 : component pp_pipeline_accel_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start,
        ap_done => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done,
        ap_idle => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_idle,
        ap_ready => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_ready,
        p_read => p_read,
        p_read1 => p_read1,
        rgb_mat_data83_dout => rgb_mat_data83_dout,
        rgb_mat_data83_num_data_valid => ap_const_lv2_0,
        rgb_mat_data83_fifo_cap => ap_const_lv2_0,
        rgb_mat_data83_empty_n => rgb_mat_data83_empty_n,
        rgb_mat_data83_read => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_rgb_mat_data83_read,
        p_read2 => p_read2,
        p_read3 => p_read3,
        resize_out_mat_data84_din => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_resize_out_mat_data84_din,
        resize_out_mat_data84_num_data_valid => ap_const_lv2_0,
        resize_out_mat_data84_fifo_cap => ap_const_lv2_0,
        resize_out_mat_data84_full_n => resize_out_mat_data84_full_n,
        resize_out_mat_data84_write => grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_resize_out_mat_data84_write);





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
                elsif (((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start_reg <= ap_const_logic_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (resize_out_mat_cols_c_full_n = ap_const_logic_0) or (resize_out_mat_rows_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_ready = ap_const_logic_1)) then 
                    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, resize_out_mat_rows_c_full_n, resize_out_mat_cols_c_full_n, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (resize_out_mat_cols_c_full_n = ap_const_logic_0) or (resize_out_mat_rows_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, resize_out_mat_rows_c_full_n, resize_out_mat_cols_c_full_n)
    begin
        if (((ap_start = ap_const_logic_0) or (resize_out_mat_cols_c_full_n = ap_const_logic_0) or (resize_out_mat_rows_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done)
    begin
        if ((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, resize_out_mat_rows_c_full_n, resize_out_mat_cols_c_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (resize_out_mat_cols_c_full_n = ap_const_logic_0) or (resize_out_mat_rows_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state1_ignore_call10_assign_proc : process(ap_start, ap_done_reg, resize_out_mat_rows_c_full_n, resize_out_mat_cols_c_full_n)
    begin
                ap_block_state1_ignore_call10 <= ((ap_start = ap_const_logic_0) or (resize_out_mat_cols_c_full_n = ap_const_logic_0) or (resize_out_mat_rows_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
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


    ap_ready_assign_proc : process(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_ap_start_reg;

    resize_out_mat_cols_c_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, resize_out_mat_cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            resize_out_mat_cols_c_blk_n <= resize_out_mat_cols_c_full_n;
        else 
            resize_out_mat_cols_c_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    resize_out_mat_cols_c_din <= p_read3;

    resize_out_mat_cols_c_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, resize_out_mat_rows_c_full_n, resize_out_mat_cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (resize_out_mat_cols_c_full_n = ap_const_logic_0) or (resize_out_mat_rows_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            resize_out_mat_cols_c_write <= ap_const_logic_1;
        else 
            resize_out_mat_cols_c_write <= ap_const_logic_0;
        end if; 
    end process;

    resize_out_mat_data84_din <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_resize_out_mat_data84_din;

    resize_out_mat_data84_write_assign_proc : process(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_resize_out_mat_data84_write, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            resize_out_mat_data84_write <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_resize_out_mat_data84_write;
        else 
            resize_out_mat_data84_write <= ap_const_logic_0;
        end if; 
    end process;


    resize_out_mat_rows_c_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, resize_out_mat_rows_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            resize_out_mat_rows_c_blk_n <= resize_out_mat_rows_c_full_n;
        else 
            resize_out_mat_rows_c_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    resize_out_mat_rows_c_din <= p_read2;

    resize_out_mat_rows_c_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, resize_out_mat_rows_c_full_n, resize_out_mat_cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (resize_out_mat_cols_c_full_n = ap_const_logic_0) or (resize_out_mat_rows_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            resize_out_mat_rows_c_write <= ap_const_logic_1;
        else 
            resize_out_mat_rows_c_write <= ap_const_logic_0;
        end if; 
    end process;


    rgb_mat_data83_read_assign_proc : process(grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_rgb_mat_data83_read, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            rgb_mat_data83_read <= grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82_rgb_mat_data83_read;
        else 
            rgb_mat_data83_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
