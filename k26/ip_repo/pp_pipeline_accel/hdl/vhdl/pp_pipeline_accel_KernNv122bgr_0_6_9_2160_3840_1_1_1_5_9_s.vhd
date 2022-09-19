-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s is
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
end;


architecture behav of pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal empty_fu_125_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_reg_191 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_214_fu_129_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_214_reg_201 : STD_LOGIC_VECTOR (0 downto 0);
    signal evenBlock_3_fu_152_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal evenBlock_3_reg_209 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln4194_fu_141_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal evenRow_1_fu_157_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal evenRow_1_reg_214 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_idle : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_ready : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_y_data81_read : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_uv_data82_read : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_din : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_write : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_read : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_din : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_write : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o_ap_vld : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_done : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_idle : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_ready : STD_LOGIC;
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_uvStream_read : STD_LOGIC;
    signal evenBlock_reg_78 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal evenRow_reg_90 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal uvStream_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal uvStream_empty_n : STD_LOGIC;
    signal uvStream_read : STD_LOGIC;
    signal uvStream_full_n : STD_LOGIC;
    signal uvStream_write : STD_LOGIC;
    signal uvPacked_V_fu_54 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal i_fu_58 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_7_fu_146_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_state6_on_subcall_done : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop IS
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
    end component;


    component pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        uvStream_dout : IN STD_LOGIC_VECTOR (15 downto 0);
        uvStream_empty_n : IN STD_LOGIC;
        uvStream_read : OUT STD_LOGIC;
        width : IN STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component pp_pipeline_accel_fifo_w16_d3840_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (15 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (15 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102 : component pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start,
        ap_done => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done,
        ap_idle => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_idle,
        ap_ready => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_ready,
        imgInput_y_data81_dout => imgInput_y_data81_dout,
        imgInput_y_data81_num_data_valid => ap_const_lv2_0,
        imgInput_y_data81_fifo_cap => ap_const_lv2_0,
        imgInput_y_data81_empty_n => imgInput_y_data81_empty_n,
        imgInput_y_data81_read => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_y_data81_read,
        imgInput_uv_data82_dout => imgInput_uv_data82_dout,
        imgInput_uv_data82_num_data_valid => ap_const_lv2_0,
        imgInput_uv_data82_fifo_cap => ap_const_lv2_0,
        imgInput_uv_data82_empty_n => imgInput_uv_data82_empty_n,
        imgInput_uv_data82_read => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_uv_data82_read,
        uvStream_din => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_din,
        uvStream_full_n => uvStream_full_n,
        uvStream_write => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_write,
        uvStream_dout => uvStream_dout,
        uvStream_empty_n => uvStream_empty_n,
        uvStream_read => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_read,
        rgb_mat_data83_din => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_din,
        rgb_mat_data83_num_data_valid => ap_const_lv2_0,
        rgb_mat_data83_fifo_cap => ap_const_lv2_0,
        rgb_mat_data83_full_n => rgb_mat_data83_full_n,
        rgb_mat_data83_write => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_write,
        evenBlock => evenBlock_reg_78,
        width => width,
        evenRow => evenRow_reg_90,
        uvPacked_V_1_out_i => uvPacked_V_fu_54,
        uvPacked_V_1_out_o => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o,
        uvPacked_V_1_out_o_ap_vld => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o_ap_vld);

    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119 : component pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start,
        ap_done => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_done,
        ap_idle => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_idle,
        ap_ready => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_ready,
        uvStream_dout => uvStream_dout,
        uvStream_empty_n => uvStream_empty_n,
        uvStream_read => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_uvStream_read,
        width => width);

    uvStream_fifo_U : component pp_pipeline_accel_fifo_w16_d3840_A
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_din,
        if_full_n => uvStream_full_n,
        if_write => uvStream_write,
        if_dout => uvStream_dout,
        if_empty_n => uvStream_empty_n,
        if_read => uvStream_read);





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


    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_ready = ap_const_logic_1)) then 
                    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_ready = ap_const_logic_1)) then 
                    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    evenBlock_reg_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                evenBlock_reg_78 <= evenBlock_3_reg_209;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                evenBlock_reg_78 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    evenRow_reg_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                evenRow_reg_90 <= evenRow_1_reg_214;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                evenRow_reg_90 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    i_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_fu_58 <= ap_const_lv16_0;
            elsif (((icmp_ln4194_fu_141_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_fu_58 <= i_7_fu_146_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                empty_214_reg_201 <= empty_214_fu_129_p1;
                empty_reg_191 <= empty_fu_125_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln4194_fu_141_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                evenBlock_3_reg_209 <= evenBlock_3_fu_152_p2;
                evenRow_1_reg_214 <= evenRow_1_fu_157_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                uvPacked_V_fu_54 <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, empty_reg_191, ap_CS_fsm_state2, icmp_ln4194_fu_141_p2, grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done, ap_CS_fsm_state4, ap_CS_fsm_state6, ap_block_state6_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln4194_fu_141_p2 = ap_const_lv1_1) and (empty_reg_191 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                elsif (((icmp_ln4194_fu_141_p2 = ap_const_lv1_1) and (empty_reg_191 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (ap_const_boolean_0 = ap_block_state6_on_subcall_done))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done)
    begin
        if ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(ap_block_state6_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state6_on_subcall_done)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state6_on_subcall_done_assign_proc : process(empty_reg_191, grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_done)
    begin
                ap_block_state6_on_subcall_done <= ((empty_reg_191 = ap_const_lv1_1) and (grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_done = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state6, ap_block_state6_on_subcall_done)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)) or ((ap_const_logic_1 = ap_CS_fsm_state6) and (ap_const_boolean_0 = ap_block_state6_on_subcall_done)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
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


    ap_ready_assign_proc : process(ap_CS_fsm_state6, ap_block_state6_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) and (ap_const_boolean_0 = ap_block_state6_on_subcall_done))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    empty_214_fu_129_p1 <= width(1 - 1 downto 0);
    empty_fu_125_p1 <= height(1 - 1 downto 0);
    evenBlock_3_fu_152_p2 <= (evenBlock_reg_78 xor empty_214_reg_201);
    evenRow_1_fu_157_p2 <= (evenRow_reg_90 xor ap_const_lv1_1);
    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg;
    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg;
    i_7_fu_146_p2 <= std_logic_vector(unsigned(i_fu_58) + unsigned(ap_const_lv16_1));
    icmp_ln4194_fu_141_p2 <= "1" when (i_fu_58 = height) else "0";

    imgInput_uv_data82_read_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_uv_data82_read, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            imgInput_uv_data82_read <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_uv_data82_read;
        else 
            imgInput_uv_data82_read <= ap_const_logic_0;
        end if; 
    end process;


    imgInput_y_data81_read_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_y_data81_read, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            imgInput_y_data81_read <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_y_data81_read;
        else 
            imgInput_y_data81_read <= ap_const_logic_0;
        end if; 
    end process;

    rgb_mat_data83_din <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_din;

    rgb_mat_data83_write_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_write, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            rgb_mat_data83_write <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_write;
        else 
            rgb_mat_data83_write <= ap_const_logic_0;
        end if; 
    end process;


    uvStream_read_assign_proc : process(empty_reg_191, grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_read, grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_uvStream_read, ap_CS_fsm_state4, ap_CS_fsm_state6)
    begin
        if (((empty_reg_191 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            uvStream_read <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_uvStream_read;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            uvStream_read <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_read;
        else 
            uvStream_read <= ap_const_logic_0;
        end if; 
    end process;


    uvStream_write_assign_proc : process(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_write, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            uvStream_write <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_write;
        else 
            uvStream_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
