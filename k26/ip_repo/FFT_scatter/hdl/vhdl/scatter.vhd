-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2020.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity scatter is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    axis_in_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
    axis_in_TVALID : IN STD_LOGIC;
    axis_in_TREADY : OUT STD_LOGIC;
    axis_in_TKEEP : IN STD_LOGIC_VECTOR (15 downto 0);
    axis_in_TSTRB : IN STD_LOGIC_VECTOR (15 downto 0);
    axis_in_TUSER : IN STD_LOGIC_VECTOR (15 downto 0);
    axis_in_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    axis_in_TID : IN STD_LOGIC_VECTOR (7 downto 0);
    axis_in_TDEST : IN STD_LOGIC_VECTOR (7 downto 0);
    axis_out_TDATA : OUT STD_LOGIC_VECTOR (127 downto 0);
    axis_out_TVALID : OUT STD_LOGIC;
    axis_out_TREADY : IN STD_LOGIC;
    axis_out_TKEEP : OUT STD_LOGIC_VECTOR (15 downto 0);
    axis_out_TSTRB : OUT STD_LOGIC_VECTOR (15 downto 0);
    axis_out_TUSER : OUT STD_LOGIC_VECTOR (15 downto 0);
    axis_out_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    axis_out_TID : OUT STD_LOGIC_VECTOR (7 downto 0);
    axis_out_TDEST : OUT STD_LOGIC_VECTOR (7 downto 0) );
end;


architecture behav of scatter is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "scatter_scatter,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu7ev-ffvc1156-2-e,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.276750,HLS_SYN_LAT=4099,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=222,HLS_SYN_LUT=213,HLS_VERSION=2020_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv13_1000 : STD_LOGIC_VECTOR (12 downto 0) := "1000000000000";
    constant ap_const_lv13_1 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000001";
    constant ap_const_lv11_400 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv11_3FF : STD_LOGIC_VECTOR (10 downto 0) := "01111111111";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

    signal ap_rst_n_inv : STD_LOGIC;
    signal axis_in_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln284_fu_158_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal axis_out_TDATA_blk_n : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal icmp_ln284_reg_240 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal icmp_ln284_reg_240_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal indvar_flatten_reg_125 : STD_LOGIC_VECTOR (12 downto 0);
    signal i_reg_136 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_reg_147 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_io : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal add_ln284_fu_164_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal s_data_V_reg_249 : STD_LOGIC_VECTOR (127 downto 0);
    signal s_keep_V_reg_254 : STD_LOGIC_VECTOR (15 downto 0);
    signal s_strb_V_reg_259 : STD_LOGIC_VECTOR (15 downto 0);
    signal s_user_V_reg_264 : STD_LOGIC_VECTOR (15 downto 0);
    signal s_id_V_reg_269 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln284_1_fu_210_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal select_ln284_1_reg_274 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_1_fu_234_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_flush_enable : STD_LOGIC;
    signal ap_condition_pp0_exit_iter1_state3 : STD_LOGIC;
    signal ap_phi_mux_i_phi_fu_140_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal icmp_ln286_fu_190_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln284_1_fu_204_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal s_dest_V_fu_218_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln284_fu_196_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal regslice_both_axis_out_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal regslice_both_axis_in_V_data_V_U_apdone_blk : STD_LOGIC;
    signal axis_in_TDATA_int_regslice : STD_LOGIC_VECTOR (127 downto 0);
    signal axis_in_TVALID_int_regslice : STD_LOGIC;
    signal axis_in_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_axis_in_V_data_V_U_ack_in : STD_LOGIC;
    signal regslice_both_axis_in_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal axis_in_TKEEP_int_regslice : STD_LOGIC_VECTOR (15 downto 0);
    signal regslice_both_axis_in_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_in_V_keep_V_U_ack_in : STD_LOGIC;
    signal regslice_both_axis_in_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal axis_in_TSTRB_int_regslice : STD_LOGIC_VECTOR (15 downto 0);
    signal regslice_both_axis_in_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_in_V_strb_V_U_ack_in : STD_LOGIC;
    signal regslice_both_axis_in_V_user_V_U_apdone_blk : STD_LOGIC;
    signal axis_in_TUSER_int_regslice : STD_LOGIC_VECTOR (15 downto 0);
    signal regslice_both_axis_in_V_user_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_in_V_user_V_U_ack_in : STD_LOGIC;
    signal regslice_both_axis_in_V_last_V_U_apdone_blk : STD_LOGIC;
    signal axis_in_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_axis_in_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_in_V_last_V_U_ack_in : STD_LOGIC;
    signal regslice_both_axis_in_V_id_V_U_apdone_blk : STD_LOGIC;
    signal axis_in_TID_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal regslice_both_axis_in_V_id_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_in_V_id_V_U_ack_in : STD_LOGIC;
    signal regslice_both_axis_in_V_dest_V_U_apdone_blk : STD_LOGIC;
    signal axis_in_TDEST_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal regslice_both_axis_in_V_dest_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_in_V_dest_V_U_ack_in : STD_LOGIC;
    signal axis_out_TVALID_int_regslice : STD_LOGIC;
    signal axis_out_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_axis_out_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_out_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_axis_out_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_axis_out_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_out_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_axis_out_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_axis_out_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_out_V_user_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_axis_out_V_user_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_axis_out_V_user_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_out_V_last_V_U_apdone_blk : STD_LOGIC;
    signal axis_out_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_axis_out_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_axis_out_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_out_V_id_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_axis_out_V_id_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_axis_out_V_id_V_U_vld_out : STD_LOGIC;
    signal regslice_both_axis_out_V_dest_V_U_apdone_blk : STD_LOGIC;
    signal axis_out_TDEST_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal regslice_both_axis_out_V_dest_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_axis_out_V_dest_V_U_vld_out : STD_LOGIC;

    component regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    regslice_both_axis_in_V_data_V_U : component regslice_both
    generic map (
        DataWidth => 128)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in_TDATA,
        vld_in => axis_in_TVALID,
        ack_in => regslice_both_axis_in_V_data_V_U_ack_in,
        data_out => axis_in_TDATA_int_regslice,
        vld_out => axis_in_TVALID_int_regslice,
        ack_out => axis_in_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in_V_data_V_U_apdone_blk);

    regslice_both_axis_in_V_keep_V_U : component regslice_both
    generic map (
        DataWidth => 16)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in_TKEEP,
        vld_in => axis_in_TVALID,
        ack_in => regslice_both_axis_in_V_keep_V_U_ack_in,
        data_out => axis_in_TKEEP_int_regslice,
        vld_out => regslice_both_axis_in_V_keep_V_U_vld_out,
        ack_out => axis_in_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in_V_keep_V_U_apdone_blk);

    regslice_both_axis_in_V_strb_V_U : component regslice_both
    generic map (
        DataWidth => 16)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in_TSTRB,
        vld_in => axis_in_TVALID,
        ack_in => regslice_both_axis_in_V_strb_V_U_ack_in,
        data_out => axis_in_TSTRB_int_regslice,
        vld_out => regslice_both_axis_in_V_strb_V_U_vld_out,
        ack_out => axis_in_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in_V_strb_V_U_apdone_blk);

    regslice_both_axis_in_V_user_V_U : component regslice_both
    generic map (
        DataWidth => 16)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in_TUSER,
        vld_in => axis_in_TVALID,
        ack_in => regslice_both_axis_in_V_user_V_U_ack_in,
        data_out => axis_in_TUSER_int_regslice,
        vld_out => regslice_both_axis_in_V_user_V_U_vld_out,
        ack_out => axis_in_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in_V_user_V_U_apdone_blk);

    regslice_both_axis_in_V_last_V_U : component regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in_TLAST,
        vld_in => axis_in_TVALID,
        ack_in => regslice_both_axis_in_V_last_V_U_ack_in,
        data_out => axis_in_TLAST_int_regslice,
        vld_out => regslice_both_axis_in_V_last_V_U_vld_out,
        ack_out => axis_in_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in_V_last_V_U_apdone_blk);

    regslice_both_axis_in_V_id_V_U : component regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in_TID,
        vld_in => axis_in_TVALID,
        ack_in => regslice_both_axis_in_V_id_V_U_ack_in,
        data_out => axis_in_TID_int_regslice,
        vld_out => regslice_both_axis_in_V_id_V_U_vld_out,
        ack_out => axis_in_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in_V_id_V_U_apdone_blk);

    regslice_both_axis_in_V_dest_V_U : component regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in_TDEST,
        vld_in => axis_in_TVALID,
        ack_in => regslice_both_axis_in_V_dest_V_U_ack_in,
        data_out => axis_in_TDEST_int_regslice,
        vld_out => regslice_both_axis_in_V_dest_V_U_vld_out,
        ack_out => axis_in_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in_V_dest_V_U_apdone_blk);

    regslice_both_axis_out_V_data_V_U : component regslice_both
    generic map (
        DataWidth => 128)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => s_data_V_reg_249,
        vld_in => axis_out_TVALID_int_regslice,
        ack_in => axis_out_TREADY_int_regslice,
        data_out => axis_out_TDATA,
        vld_out => regslice_both_axis_out_V_data_V_U_vld_out,
        ack_out => axis_out_TREADY,
        apdone_blk => regslice_both_axis_out_V_data_V_U_apdone_blk);

    regslice_both_axis_out_V_keep_V_U : component regslice_both
    generic map (
        DataWidth => 16)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => s_keep_V_reg_254,
        vld_in => axis_out_TVALID_int_regslice,
        ack_in => regslice_both_axis_out_V_keep_V_U_ack_in_dummy,
        data_out => axis_out_TKEEP,
        vld_out => regslice_both_axis_out_V_keep_V_U_vld_out,
        ack_out => axis_out_TREADY,
        apdone_blk => regslice_both_axis_out_V_keep_V_U_apdone_blk);

    regslice_both_axis_out_V_strb_V_U : component regslice_both
    generic map (
        DataWidth => 16)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => s_strb_V_reg_259,
        vld_in => axis_out_TVALID_int_regslice,
        ack_in => regslice_both_axis_out_V_strb_V_U_ack_in_dummy,
        data_out => axis_out_TSTRB,
        vld_out => regslice_both_axis_out_V_strb_V_U_vld_out,
        ack_out => axis_out_TREADY,
        apdone_blk => regslice_both_axis_out_V_strb_V_U_apdone_blk);

    regslice_both_axis_out_V_user_V_U : component regslice_both
    generic map (
        DataWidth => 16)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => s_user_V_reg_264,
        vld_in => axis_out_TVALID_int_regslice,
        ack_in => regslice_both_axis_out_V_user_V_U_ack_in_dummy,
        data_out => axis_out_TUSER,
        vld_out => regslice_both_axis_out_V_user_V_U_vld_out,
        ack_out => axis_out_TREADY,
        apdone_blk => regslice_both_axis_out_V_user_V_U_apdone_blk);

    regslice_both_axis_out_V_last_V_U : component regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_out_TLAST_int_regslice,
        vld_in => axis_out_TVALID_int_regslice,
        ack_in => regslice_both_axis_out_V_last_V_U_ack_in_dummy,
        data_out => axis_out_TLAST,
        vld_out => regslice_both_axis_out_V_last_V_U_vld_out,
        ack_out => axis_out_TREADY,
        apdone_blk => regslice_both_axis_out_V_last_V_U_apdone_blk);

    regslice_both_axis_out_V_id_V_U : component regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => s_id_V_reg_269,
        vld_in => axis_out_TVALID_int_regslice,
        ack_in => regslice_both_axis_out_V_id_V_U_ack_in_dummy,
        data_out => axis_out_TID,
        vld_out => regslice_both_axis_out_V_id_V_U_vld_out,
        ack_out => axis_out_TREADY,
        apdone_blk => regslice_both_axis_out_V_id_V_U_apdone_blk);

    regslice_both_axis_out_V_dest_V_U : component regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_out_TDEST_int_regslice,
        vld_in => axis_out_TVALID_int_regslice,
        ack_in => regslice_both_axis_out_V_dest_V_U_ack_in_dummy,
        data_out => axis_out_TDEST,
        vld_out => regslice_both_axis_out_V_dest_V_U_vld_out,
        ack_out => axis_out_TREADY,
        apdone_blk => regslice_both_axis_out_V_dest_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_pp0_flush_enable)) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) or ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter1_state3)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter1_state3))) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_reg_136_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln284_reg_240_pp0_iter1_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                i_reg_136 <= select_ln284_1_reg_274;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
                i_reg_136 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;

    indvar_flatten_reg_125_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln284_fu_158_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                indvar_flatten_reg_125 <= add_ln284_fu_164_p2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
                indvar_flatten_reg_125 <= ap_const_lv13_0;
            end if; 
        end if;
    end process;

    j_reg_147_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln284_reg_240 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                j_reg_147 <= j_1_fu_234_p2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
                j_reg_147 <= ap_const_lv11_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln284_reg_240 <= icmp_ln284_fu_158_p2;
                icmp_ln284_reg_240_pp0_iter1_reg <= icmp_ln284_reg_240;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln284_fu_158_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                s_data_V_reg_249 <= axis_in_TDATA_int_regslice;
                s_id_V_reg_269 <= axis_in_TID_int_regslice;
                s_keep_V_reg_254 <= axis_in_TKEEP_int_regslice;
                s_strb_V_reg_259 <= axis_in_TSTRB_int_regslice;
                s_user_V_reg_264 <= axis_in_TUSER_int_regslice;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln284_reg_240 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                select_ln284_1_reg_274 <= select_ln284_1_fu_210_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, ap_CS_fsm_state5, regslice_both_axis_out_V_data_V_U_apdone_blk)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state5 => 
                if (((regslice_both_axis_out_V_data_V_U_apdone_blk = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    add_ln284_1_fu_204_p2 <= std_logic_vector(unsigned(ap_const_lv3_1) + unsigned(ap_phi_mux_i_phi_fu_140_p4));
    add_ln284_fu_164_p2 <= std_logic_vector(unsigned(indvar_flatten_reg_125) + unsigned(ap_const_lv13_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state5 <= ap_CS_fsm(2);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter0, icmp_ln284_fu_158_p2, axis_in_TVALID_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= ((icmp_ln284_fu_158_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (axis_in_TVALID_int_regslice = ap_const_logic_0));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter0, icmp_ln284_fu_158_p2, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_block_state3_io, ap_block_state4_io, axis_in_TVALID_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state4_io)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state3_io)) or ((icmp_ln284_fu_158_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (axis_in_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter0, icmp_ln284_fu_158_p2, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_block_state3_io, ap_block_state4_io, axis_in_TVALID_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state4_io)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state3_io)) or ((icmp_ln284_fu_158_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (axis_in_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter0_assign_proc : process(icmp_ln284_fu_158_p2, axis_in_TVALID_int_regslice)
    begin
                ap_block_state2_pp0_stage0_iter0 <= ((icmp_ln284_fu_158_p2 = ap_const_lv1_0) and (axis_in_TVALID_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state3_io_assign_proc : process(icmp_ln284_reg_240, axis_out_TREADY_int_regslice)
    begin
                ap_block_state3_io <= ((icmp_ln284_reg_240 = ap_const_lv1_0) and (axis_out_TREADY_int_regslice = ap_const_logic_0));
    end process;

        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_io_assign_proc : process(icmp_ln284_reg_240_pp0_iter1_reg, axis_out_TREADY_int_regslice)
    begin
                ap_block_state4_io <= ((icmp_ln284_reg_240_pp0_iter1_reg = ap_const_lv1_0) and (axis_out_TREADY_int_regslice = ap_const_logic_0));
    end process;

        ap_block_state4_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter1_state3_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_condition_pp0_exit_iter1_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter1_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_condition_pp0_flush_enable_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln284_fu_158_p2, ap_block_pp0_stage0_subdone)
    begin
        if (((icmp_ln284_fu_158_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_pp0_flush_enable <= ap_const_logic_1;
        else 
            ap_condition_pp0_flush_enable <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_i_phi_fu_140_p4_assign_proc : process(ap_block_pp0_stage0, ap_enable_reg_pp0_iter2, icmp_ln284_reg_240_pp0_iter1_reg, i_reg_136, select_ln284_1_reg_274)
    begin
        if (((icmp_ln284_reg_240_pp0_iter1_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_i_phi_fu_140_p4 <= select_ln284_1_reg_274;
        else 
            ap_phi_mux_i_phi_fu_140_p4 <= i_reg_136;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    axis_in_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0, icmp_ln284_fu_158_p2, axis_in_TVALID_int_regslice)
    begin
        if (((icmp_ln284_fu_158_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            axis_in_TDATA_blk_n <= axis_in_TVALID_int_regslice;
        else 
            axis_in_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    axis_in_TREADY <= regslice_both_axis_in_V_data_V_U_ack_in;

    axis_in_TREADY_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, icmp_ln284_fu_158_p2, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln284_fu_158_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            axis_in_TREADY_int_regslice <= ap_const_logic_1;
        else 
            axis_in_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    axis_out_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln284_reg_240, ap_enable_reg_pp0_iter2, icmp_ln284_reg_240_pp0_iter1_reg, axis_out_TREADY_int_regslice)
    begin
        if ((((icmp_ln284_reg_240_pp0_iter1_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((icmp_ln284_reg_240 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            axis_out_TDATA_blk_n <= axis_out_TREADY_int_regslice;
        else 
            axis_out_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    axis_out_TDEST_int_regslice <= std_logic_vector(IEEE.numeric_std.resize(unsigned(s_dest_V_fu_218_p1),8));
    axis_out_TLAST_int_regslice <= "1" when (select_ln284_fu_196_p3 = ap_const_lv11_3FF) else "0";
    axis_out_TVALID <= regslice_both_axis_out_V_data_V_U_vld_out;

    axis_out_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln284_reg_240, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln284_reg_240 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            axis_out_TVALID_int_regslice <= ap_const_logic_1;
        else 
            axis_out_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln284_fu_158_p2 <= "1" when (indvar_flatten_reg_125 = ap_const_lv13_1000) else "0";
    icmp_ln286_fu_190_p2 <= "1" when (j_reg_147 = ap_const_lv11_400) else "0";
    j_1_fu_234_p2 <= std_logic_vector(unsigned(ap_const_lv11_1) + unsigned(select_ln284_fu_196_p3));
    s_dest_V_fu_218_p1 <= select_ln284_1_fu_210_p3(2 - 1 downto 0);
    select_ln284_1_fu_210_p3 <= 
        add_ln284_1_fu_204_p2 when (icmp_ln286_fu_190_p2(0) = '1') else 
        ap_phi_mux_i_phi_fu_140_p4;
    select_ln284_fu_196_p3 <= 
        ap_const_lv11_0 when (icmp_ln286_fu_190_p2(0) = '1') else 
        j_reg_147;
end behav;
