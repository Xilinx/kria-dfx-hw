-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_nv122bgr_0_6_9_2160_3840_1_1_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src_y_rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    src_y_rows_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    src_y_rows_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    src_y_rows_empty_n : IN STD_LOGIC;
    src_y_rows_read : OUT STD_LOGIC;
    src_y_cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    src_y_cols_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    src_y_cols_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    src_y_cols_empty_n : IN STD_LOGIC;
    src_y_cols_read : OUT STD_LOGIC;
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
    rgb_mat_data83_din : OUT STD_LOGIC_VECTOR (23 downto 0);
    rgb_mat_data83_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rgb_mat_data83_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rgb_mat_data83_full_n : IN STD_LOGIC;
    rgb_mat_data83_write : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_nv122bgr_0_6_9_2160_3840_1_1_s is 
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
    signal src_y_rows_blk_n : STD_LOGIC;
    signal src_y_cols_blk_n : STD_LOGIC;
    signal height_fu_58_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal height_reg_68 : STD_LOGIC_VECTOR (15 downto 0);
    signal width_fu_63_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal width_reg_73 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_idle : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_ready : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_y_data81_read : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_uv_data82_read : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_din : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_write : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state1_ignore_call9 : BOOLEAN;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s IS
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
        rgb_mat_data83_din : OUT STD_LOGIC_VECTOR (23 downto 0);
        rgb_mat_data83_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_full_n : IN STD_LOGIC;
        rgb_mat_data83_write : OUT STD_LOGIC;
        height : IN STD_LOGIC_VECTOR (15 downto 0);
        width : IN STD_LOGIC_VECTOR (15 downto 0) );
    end component;



begin
    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46 : component pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start,
        ap_done => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done,
        ap_idle => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_idle,
        ap_ready => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_ready,
        imgInput_y_data81_dout => imgInput_y_data81_dout,
        imgInput_y_data81_num_data_valid => ap_const_lv2_0,
        imgInput_y_data81_fifo_cap => ap_const_lv2_0,
        imgInput_y_data81_empty_n => imgInput_y_data81_empty_n,
        imgInput_y_data81_read => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_y_data81_read,
        imgInput_uv_data82_dout => imgInput_uv_data82_dout,
        imgInput_uv_data82_num_data_valid => ap_const_lv2_0,
        imgInput_uv_data82_fifo_cap => ap_const_lv2_0,
        imgInput_uv_data82_empty_n => imgInput_uv_data82_empty_n,
        imgInput_uv_data82_read => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_uv_data82_read,
        rgb_mat_data83_din => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_din,
        rgb_mat_data83_num_data_valid => ap_const_lv2_0,
        rgb_mat_data83_fifo_cap => ap_const_lv2_0,
        rgb_mat_data83_full_n => rgb_mat_data83_full_n,
        rgb_mat_data83_write => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_write,
        height => height_reg_68,
        width => width_reg_73);





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
                elsif (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg <= ap_const_logic_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (src_y_cols_empty_n = ap_const_logic_0) or (src_y_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_ready = ap_const_logic_1)) then 
                    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                height_reg_68 <= height_fu_58_p1;
                width_reg_73 <= width_fu_63_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, src_y_rows_empty_n, src_y_cols_empty_n, grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (src_y_cols_empty_n = ap_const_logic_0) or (src_y_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
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

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, src_y_rows_empty_n, src_y_cols_empty_n)
    begin
        if (((ap_start = ap_const_logic_0) or (src_y_cols_empty_n = ap_const_logic_0) or (src_y_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done)
    begin
        if ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, src_y_rows_empty_n, src_y_cols_empty_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (src_y_cols_empty_n = ap_const_logic_0) or (src_y_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state1_ignore_call9_assign_proc : process(ap_start, ap_done_reg, src_y_rows_empty_n, src_y_cols_empty_n)
    begin
                ap_block_state1_ignore_call9 <= ((ap_start = ap_const_logic_0) or (src_y_cols_empty_n = ap_const_logic_0) or (src_y_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
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


    ap_ready_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg;
    height_fu_58_p1 <= src_y_rows_dout(16 - 1 downto 0);

    imgInput_uv_data82_read_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_uv_data82_read, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            imgInput_uv_data82_read <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_uv_data82_read;
        else 
            imgInput_uv_data82_read <= ap_const_logic_0;
        end if; 
    end process;


    imgInput_y_data81_read_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_y_data81_read, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            imgInput_y_data81_read <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_y_data81_read;
        else 
            imgInput_y_data81_read <= ap_const_logic_0;
        end if; 
    end process;

    rgb_mat_data83_din <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_din;

    rgb_mat_data83_write_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_write, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            rgb_mat_data83_write <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_write;
        else 
            rgb_mat_data83_write <= ap_const_logic_0;
        end if; 
    end process;


    src_y_cols_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_y_cols_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_y_cols_blk_n <= src_y_cols_empty_n;
        else 
            src_y_cols_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_y_cols_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_y_rows_empty_n, src_y_cols_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (src_y_cols_empty_n = ap_const_logic_0) or (src_y_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_y_cols_read <= ap_const_logic_1;
        else 
            src_y_cols_read <= ap_const_logic_0;
        end if; 
    end process;


    src_y_rows_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_y_rows_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_y_rows_blk_n <= src_y_rows_empty_n;
        else 
            src_y_rows_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_y_rows_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_y_rows_empty_n, src_y_cols_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (src_y_cols_empty_n = ap_const_logic_0) or (src_y_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_y_rows_read <= ap_const_logic_1;
        else 
            src_y_rows_read <= ap_const_logic_0;
        end if; 
    end process;

    width_fu_63_p1 <= src_y_cols_dout(16 - 1 downto 0);
end behav;
