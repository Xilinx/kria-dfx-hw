-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_gmem4_AWVALID : OUT STD_LOGIC;
    m_axi_gmem4_AWREADY : IN STD_LOGIC;
    m_axi_gmem4_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem4_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem4_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_WVALID : OUT STD_LOGIC;
    m_axi_gmem4_WREADY : IN STD_LOGIC;
    m_axi_gmem4_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem4_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem4_WLAST : OUT STD_LOGIC;
    m_axi_gmem4_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_ARVALID : OUT STD_LOGIC;
    m_axi_gmem4_ARREADY : IN STD_LOGIC;
    m_axi_gmem4_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem4_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem4_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_RVALID : IN STD_LOGIC;
    m_axi_gmem4_RREADY : OUT STD_LOGIC;
    m_axi_gmem4_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem4_RLAST : IN STD_LOGIC;
    m_axi_gmem4_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
    m_axi_gmem4_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_BVALID : IN STD_LOGIC;
    m_axi_gmem4_BREADY : OUT STD_LOGIC;
    m_axi_gmem4_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    sext_ln115 : IN STD_LOGIC_VECTOR (60 downto 0);
    beta_reg_V_2_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    beta_reg_V_2_out_ap_vld : OUT STD_LOGIC;
    beta_reg_V_1_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    beta_reg_V_1_out_ap_vld : OUT STD_LOGIC;
    beta_reg_V_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    beta_reg_V_out_ap_vld : OUT STD_LOGIC;
    alpha_reg_V_9_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    alpha_reg_V_9_out_ap_vld : OUT STD_LOGIC;
    alpha_reg_V_8_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    alpha_reg_V_8_out_ap_vld : OUT STD_LOGIC;
    alpha_reg_V_7_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    alpha_reg_V_7_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv3_6 : STD_LOGIC_VECTOR (2 downto 0) := "110";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_34 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110100";
    constant ap_const_lv32_3E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111110";
    constant ap_const_lv63_0 : STD_LOGIC_VECTOR (62 downto 0) := "000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv12_433 : STD_LOGIC_VECTOR (11 downto 0) := "010000110011";
    constant ap_const_lv11_433 : STD_LOGIC_VECTOR (10 downto 0) := "10000110011";
    constant ap_const_lv54_0 : STD_LOGIC_VECTOR (53 downto 0) := "000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv12_4 : STD_LOGIC_VECTOR (11 downto 0) := "000000000100";
    constant ap_const_lv12_FFC : STD_LOGIC_VECTOR (11 downto 0) := "111111111100";
    constant ap_const_lv12_36 : STD_LOGIC_VECTOR (11 downto 0) := "000000110110";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv6_3F : STD_LOGIC_VECTOR (5 downto 0) := "111111";
    constant ap_const_lv11_7FB : STD_LOGIC_VECTOR (10 downto 0) := "11111111011";
    constant ap_const_lv3_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";

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
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter8 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln115_reg_979 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln115_reg_983 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op34_read_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal ap_block_state9_pp0_stage0_iter8 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln115_fu_232_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal gmem4_blk_n_R : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal i_3_reg_973 : STD_LOGIC_VECTOR (2 downto 0);
    signal i_3_reg_973_pp0_iter1_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal i_3_reg_973_pp0_iter2_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal i_3_reg_973_pp0_iter3_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal i_3_reg_973_pp0_iter4_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal i_3_reg_973_pp0_iter5_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal i_3_reg_973_pp0_iter6_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal i_3_reg_973_pp0_iter7_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal icmp_ln115_reg_979_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln115_reg_979_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln115_reg_979_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln115_reg_979_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln115_reg_979_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln115_reg_979_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln115_fu_244_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln115_reg_983_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem4_addr_read_reg_987 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln120_fu_267_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln120_reg_992 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_reg_997 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_997_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_997_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_997_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln592_fu_302_p1 : STD_LOGIC_VECTOR (62 downto 0);
    signal trunc_ln592_reg_1007 : STD_LOGIC_VECTOR (62 downto 0);
    signal isneg_reg_1012 : STD_LOGIC_VECTOR (0 downto 0);
    signal isneg_reg_1012_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal isneg_reg_1012_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_tmp_reg_1019 : STD_LOGIC_VECTOR (10 downto 0);
    signal trunc_ln600_fu_324_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal trunc_ln600_reg_1025 : STD_LOGIC_VECTOR (51 downto 0);
    signal trunc_ln600_reg_1025_pp0_iter5_reg : STD_LOGIC_VECTOR (51 downto 0);
    signal icmp_ln606_fu_328_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln606_reg_1030 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln606_reg_1030_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln606_reg_1030_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal F2_fu_336_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal F2_reg_1039 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln610_fu_342_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln610_reg_1051 : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln610_reg_1051_pp0_iter6_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal icmp_ln617_fu_346_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln617_reg_1056 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln617_reg_1056_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln617_reg_1056_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln610_1_fu_351_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal trunc_ln610_1_reg_1062 : STD_LOGIC_VECTOR (10 downto 0);
    signal trunc_ln610_1_reg_1062_pp0_iter6_reg : STD_LOGIC_VECTOR (10 downto 0);
    signal man_V_3_fu_372_p3 : STD_LOGIC_VECTOR (53 downto 0);
    signal man_V_3_reg_1067 : STD_LOGIC_VECTOR (53 downto 0);
    signal icmp_ln616_fu_379_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln616_reg_1075 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln616_reg_1075_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal sh_amt_fu_389_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal sh_amt_reg_1080 : STD_LOGIC_VECTOR (11 downto 0);
    signal icmp_ln616_1_fu_396_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln616_1_reg_1086 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln616_1_reg_1086_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal sh_amt_1_fu_411_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal sh_amt_1_reg_1091 : STD_LOGIC_VECTOR (11 downto 0);
    signal icmp_ln617_1_fu_419_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln617_1_reg_1096 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln617_1_reg_1096_pp0_iter7_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln618_fu_424_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln618_reg_1102 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln620_fu_428_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln620_reg_1110 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln623_fu_434_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln623_reg_1115 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln626_fu_441_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln626_reg_1121 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln638_fu_456_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln638_reg_1126 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln620_1_fu_462_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln620_1_reg_1131 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln626_1_fu_468_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln626_1_reg_1136 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln638_1_fu_484_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln638_1_reg_1141 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln423_fu_611_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln423_reg_1146 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln423_1_fu_627_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln423_1_reg_1151 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln617_fu_643_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln617_reg_1156 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln617_1_fu_655_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln617_1_reg_1161 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_phi_mux_empty_phi_fu_206_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_reg_pp0_iter2_empty_reg_203 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln115_fu_262_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal shiftreg_fu_118 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_122 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln115_fu_238_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_sig_allocacmp_i_3 : STD_LOGIC_VECTOR (2 downto 0);
    signal alpha_reg_V_1_fu_126 : STD_LOGIC_VECTOR (7 downto 0);
    signal alpha_reg_V_6_fu_850_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal alpha_reg_V_2_fu_130 : STD_LOGIC_VECTOR (7 downto 0);
    signal alpha_reg_V_5_fu_836_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal alpha_reg_V_3_fu_134 : STD_LOGIC_VECTOR (7 downto 0);
    signal alpha_reg_V_4_fu_822_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal beta_reg_V_fu_138 : STD_LOGIC_VECTOR (7 downto 0);
    signal beta_reg_V_6_fu_802_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal beta_reg_V_1_fu_142 : STD_LOGIC_VECTOR (7 downto 0);
    signal beta_reg_V_5_fu_782_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal beta_reg_V_2_fu_146 : STD_LOGIC_VECTOR (7 downto 0);
    signal beta_reg_V_4_fu_762_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal grp_fu_212_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_212_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ireg_fu_298_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln501_fu_333_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal man_V_fu_355_p3 : STD_LOGIC_VECTOR (52 downto 0);
    signal zext_ln604_fu_362_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal man_V_1_fu_366_p2 : STD_LOGIC_VECTOR (53 downto 0);
    signal sub_ln616_fu_384_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln616_fu_401_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal sub_ln616_1_fu_406_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_18_fu_446_p4 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_19_fu_474_p4 : STD_LOGIC_VECTOR (8 downto 0);
    signal trunc_ln621_fu_496_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln621_fu_499_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal ashr_ln621_fu_503_p2 : STD_LOGIC_VECTOR (53 downto 0);
    signal trunc_ln621_1_fu_508_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sext_ln616_fu_490_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln616cast_fu_518_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln639_fu_522_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal sext_ln616_1_fu_493_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln621_1_fu_534_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal ashr_ln621_1_fu_538_p2 : STD_LOGIC_VECTOR (53 downto 0);
    signal trunc_ln621_2_fu_543_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sext_ln616_1cast_fu_553_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln639_1_fu_557_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln626_fu_569_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln626_fu_574_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln626_1_fu_585_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln626_1_fu_590_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_s_fu_578_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal qb_fu_601_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln620_fu_512_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln423_fu_607_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_1_fu_594_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal qb_1_fu_617_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln620_1_fu_547_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln423_1_fu_623_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal xor_ln606_fu_633_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln617_fu_638_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln638_fu_527_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal and_ln617_1_fu_650_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln638_1_fu_562_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal or_ln617_fu_685_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln617_fu_689_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln616_fu_695_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln616_fu_700_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal or_ln617_1_fu_716_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln617_1_fu_720_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln616_1_fu_726_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln616_1_fu_731_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln122_fu_713_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln121_fu_680_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln124_fu_744_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln121_fu_750_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln124_fu_756_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal beta_reg_V_3_fu_737_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln124_1_fu_770_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln124_1_fu_776_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln124_fu_790_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln124_1_fu_796_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln122_fu_810_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln122_1_fu_816_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal alpha_reg_V_fu_706_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal and_ln122_fu_830_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln122_1_fu_844_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_212_ce : STD_LOGIC;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter6_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter7_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_fpext_32ns_64_2_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
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
    fpext_32ns_64_2_no_dsp_1_U249 : component pp_pipeline_accel_fpext_32ns_64_2_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_212_p0,
        ce => grp_fu_212_ce,
        dout => grp_fu_212_p1);

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
                elsif (((ap_loop_exit_ready_pp0_iter7_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter8_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter8 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
                end if; 
            end if;
        end if;
    end process;


    i_fu_122_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln115_fu_232_p2 = ap_const_lv1_0))) then 
                    i_fu_122 <= add_ln115_fu_238_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_122 <= ap_const_lv3_0;
                end if;
            end if; 
        end if;
    end process;

    shiftreg_fu_118_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    shiftreg_fu_118 <= ap_const_lv32_0;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    shiftreg_fu_118 <= ap_phi_mux_empty_phi_fu_206_p4(63 downto 32);
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                F2_reg_1039 <= F2_fu_336_p2;
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
                ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
                ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
                exp_tmp_reg_1019 <= ireg_fu_298_p1(62 downto 52);
                i_3_reg_973_pp0_iter2_reg <= i_3_reg_973_pp0_iter1_reg;
                i_3_reg_973_pp0_iter3_reg <= i_3_reg_973_pp0_iter2_reg;
                i_3_reg_973_pp0_iter4_reg <= i_3_reg_973_pp0_iter3_reg;
                i_3_reg_973_pp0_iter5_reg <= i_3_reg_973_pp0_iter4_reg;
                i_3_reg_973_pp0_iter6_reg <= i_3_reg_973_pp0_iter5_reg;
                i_3_reg_973_pp0_iter7_reg <= i_3_reg_973_pp0_iter6_reg;
                icmp_ln115_reg_979_pp0_iter2_reg <= icmp_ln115_reg_979_pp0_iter1_reg;
                icmp_ln115_reg_979_pp0_iter3_reg <= icmp_ln115_reg_979_pp0_iter2_reg;
                icmp_ln115_reg_979_pp0_iter4_reg <= icmp_ln115_reg_979_pp0_iter3_reg;
                icmp_ln115_reg_979_pp0_iter5_reg <= icmp_ln115_reg_979_pp0_iter4_reg;
                icmp_ln115_reg_979_pp0_iter6_reg <= icmp_ln115_reg_979_pp0_iter5_reg;
                icmp_ln606_reg_1030 <= icmp_ln606_fu_328_p2;
                icmp_ln606_reg_1030_pp0_iter6_reg <= icmp_ln606_reg_1030;
                icmp_ln606_reg_1030_pp0_iter7_reg <= icmp_ln606_reg_1030_pp0_iter6_reg;
                icmp_ln616_1_reg_1086_pp0_iter7_reg <= icmp_ln616_1_reg_1086;
                icmp_ln616_reg_1075_pp0_iter7_reg <= icmp_ln616_reg_1075;
                icmp_ln617_1_reg_1096_pp0_iter7_reg <= icmp_ln617_1_reg_1096;
                icmp_ln617_reg_1056 <= icmp_ln617_fu_346_p2;
                icmp_ln617_reg_1056_pp0_iter6_reg <= icmp_ln617_reg_1056;
                icmp_ln617_reg_1056_pp0_iter7_reg <= icmp_ln617_reg_1056_pp0_iter6_reg;
                isneg_reg_1012 <= ireg_fu_298_p1(63 downto 63);
                isneg_reg_1012_pp0_iter5_reg <= isneg_reg_1012;
                isneg_reg_1012_pp0_iter6_reg <= isneg_reg_1012_pp0_iter5_reg;
                man_V_3_reg_1067 <= man_V_3_fu_372_p3;
                select_ln623_reg_1115 <= select_ln623_fu_434_p3;
                tmp_reg_997 <= ap_phi_mux_empty_phi_fu_206_p4(31 downto 31);
                tmp_reg_997_pp0_iter3_reg <= tmp_reg_997;
                tmp_reg_997_pp0_iter4_reg <= tmp_reg_997_pp0_iter3_reg;
                tmp_reg_997_pp0_iter5_reg <= tmp_reg_997_pp0_iter4_reg;
                trunc_ln120_reg_992 <= trunc_ln120_fu_267_p1;
                trunc_ln592_reg_1007 <= trunc_ln592_fu_302_p1;
                trunc_ln600_reg_1025 <= trunc_ln600_fu_324_p1;
                trunc_ln600_reg_1025_pp0_iter5_reg <= trunc_ln600_reg_1025;
                trunc_ln610_1_reg_1062 <= trunc_ln610_1_fu_351_p1;
                trunc_ln610_1_reg_1062_pp0_iter6_reg <= trunc_ln610_1_reg_1062;
                trunc_ln610_reg_1051 <= trunc_ln610_fu_342_p1;
                trunc_ln610_reg_1051_pp0_iter6_reg <= trunc_ln610_reg_1051;
                trunc_ln618_reg_1102 <= trunc_ln618_fu_424_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln606_reg_1030_pp0_iter6_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                add_ln423_1_reg_1151 <= add_ln423_1_fu_627_p2;
                add_ln423_reg_1146 <= add_ln423_fu_611_p2;
                select_ln617_1_reg_1161 <= select_ln617_1_fu_655_p3;
                select_ln617_reg_1156 <= select_ln617_fu_643_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter8 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                alpha_reg_V_1_fu_126 <= alpha_reg_V_6_fu_850_p3;
                alpha_reg_V_2_fu_130 <= alpha_reg_V_5_fu_836_p3;
                alpha_reg_V_3_fu_134 <= alpha_reg_V_4_fu_822_p3;
                beta_reg_V_1_fu_142 <= beta_reg_V_5_fu_782_p3;
                beta_reg_V_2_fu_146 <= beta_reg_V_4_fu_762_p3;
                beta_reg_V_fu_138 <= beta_reg_V_6_fu_802_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                i_3_reg_973 <= ap_sig_allocacmp_i_3;
                i_3_reg_973_pp0_iter1_reg <= i_3_reg_973;
                icmp_ln115_reg_979 <= icmp_ln115_fu_232_p2;
                icmp_ln115_reg_979_pp0_iter1_reg <= icmp_ln115_reg_979;
                trunc_ln115_reg_983_pp0_iter1_reg <= trunc_ln115_reg_983;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op34_read_state2 = ap_const_boolean_1))) then
                gmem4_addr_read_reg_987 <= m_axi_gmem4_RDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln606_reg_1030 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln616_1_reg_1086 <= icmp_ln616_1_fu_396_p2;
                icmp_ln616_reg_1075 <= icmp_ln616_fu_379_p2;
                icmp_ln617_1_reg_1096 <= icmp_ln617_1_fu_419_p2;
                icmp_ln620_1_reg_1131 <= icmp_ln620_1_fu_462_p2;
                icmp_ln620_reg_1110 <= icmp_ln620_fu_428_p2;
                icmp_ln626_1_reg_1136 <= icmp_ln626_1_fu_468_p2;
                icmp_ln626_reg_1121 <= icmp_ln626_fu_441_p2;
                icmp_ln638_1_reg_1141 <= icmp_ln638_1_fu_484_p2;
                icmp_ln638_reg_1126 <= icmp_ln638_fu_456_p2;
                sh_amt_1_reg_1091 <= sh_amt_1_fu_411_p3;
                sh_amt_reg_1080 <= sh_amt_fu_389_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln115_fu_232_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                trunc_ln115_reg_983 <= trunc_ln115_fu_244_p1;
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
    F2_fu_336_p2 <= std_logic_vector(unsigned(ap_const_lv12_433) - unsigned(zext_ln501_fu_333_p1));
    add_ln115_fu_238_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_3) + unsigned(ap_const_lv3_1));
    add_ln423_1_fu_627_p2 <= std_logic_vector(unsigned(select_ln620_1_fu_547_p3) + unsigned(zext_ln423_1_fu_623_p1));
    add_ln423_fu_611_p2 <= std_logic_vector(unsigned(select_ln620_fu_512_p3) + unsigned(zext_ln423_fu_607_p1));
    add_ln616_fu_401_p2 <= std_logic_vector(unsigned(F2_reg_1039) + unsigned(ap_const_lv12_FFC));
    add_ln626_1_fu_585_p2 <= std_logic_vector(unsigned(trunc_ln610_1_reg_1062_pp0_iter6_reg) + unsigned(ap_const_lv11_7FB));
    add_ln626_fu_569_p2 <= std_logic_vector(unsigned(trunc_ln610_reg_1051_pp0_iter6_reg) + unsigned(ap_const_lv6_3F));
    alpha_reg_V_4_fu_822_p3 <= 
        alpha_reg_V_3_fu_134 when (or_ln122_1_fu_816_p2(0) = '1') else 
        alpha_reg_V_fu_706_p3;
    alpha_reg_V_5_fu_836_p3 <= 
        alpha_reg_V_fu_706_p3 when (and_ln122_fu_830_p2(0) = '1') else 
        alpha_reg_V_2_fu_130;
    alpha_reg_V_6_fu_850_p3 <= 
        alpha_reg_V_fu_706_p3 when (and_ln122_1_fu_844_p2(0) = '1') else 
        alpha_reg_V_1_fu_126;
    alpha_reg_V_7_out <= alpha_reg_V_1_fu_126;

    alpha_reg_V_7_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln115_reg_979_pp0_iter6_reg)
    begin
        if (((icmp_ln115_reg_979_pp0_iter6_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            alpha_reg_V_7_out_ap_vld <= ap_const_logic_1;
        else 
            alpha_reg_V_7_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    alpha_reg_V_8_out <= alpha_reg_V_2_fu_130;

    alpha_reg_V_8_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln115_reg_979_pp0_iter6_reg)
    begin
        if (((icmp_ln115_reg_979_pp0_iter6_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            alpha_reg_V_8_out_ap_vld <= ap_const_logic_1;
        else 
            alpha_reg_V_8_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    alpha_reg_V_9_out <= alpha_reg_V_3_fu_134;

    alpha_reg_V_9_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln115_reg_979_pp0_iter6_reg)
    begin
        if (((icmp_ln115_reg_979_pp0_iter6_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            alpha_reg_V_9_out_ap_vld <= ap_const_logic_1;
        else 
            alpha_reg_V_9_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    alpha_reg_V_fu_706_p3 <= 
        ap_const_lv8_0 when (icmp_ln606_reg_1030_pp0_iter7_reg(0) = '1') else 
        select_ln616_fu_700_p3;
    and_ln122_1_fu_844_p2 <= (icmp_ln124_1_fu_770_p2 and icmp_ln121_fu_680_p2);
    and_ln122_fu_830_p2 <= (icmp_ln124_fu_744_p2 and icmp_ln121_fu_680_p2);
    and_ln124_1_fu_776_p2 <= (xor_ln121_fu_750_p2 and icmp_ln124_1_fu_770_p2);
    and_ln124_fu_756_p2 <= (xor_ln121_fu_750_p2 and icmp_ln124_fu_744_p2);
    and_ln616_1_fu_726_p2 <= (xor_ln617_1_fu_720_p2 and icmp_ln616_1_reg_1086_pp0_iter7_reg);
    and_ln616_fu_695_p2 <= (xor_ln617_fu_689_p2 and icmp_ln616_reg_1075_pp0_iter7_reg);
    and_ln617_1_fu_650_p2 <= (xor_ln606_fu_633_p2 and icmp_ln617_1_reg_1096);
    and_ln617_fu_638_p2 <= (xor_ln606_fu_633_p2 and icmp_ln617_reg_1056_pp0_iter6_reg);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, m_axi_gmem4_RVALID, ap_predicate_op34_read_state2)
    begin
                ap_block_pp0_stage0_01001 <= ((m_axi_gmem4_RVALID = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_predicate_op34_read_state2 = ap_const_boolean_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, m_axi_gmem4_RVALID, ap_predicate_op34_read_state2)
    begin
                ap_block_pp0_stage0_11001 <= ((m_axi_gmem4_RVALID = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_predicate_op34_read_state2 = ap_const_boolean_1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, m_axi_gmem4_RVALID, ap_predicate_op34_read_state2)
    begin
                ap_block_pp0_stage0_subdone <= ((m_axi_gmem4_RVALID = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_predicate_op34_read_state2 = ap_const_boolean_1));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state2_pp0_stage0_iter1_assign_proc : process(m_axi_gmem4_RVALID, ap_predicate_op34_read_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((m_axi_gmem4_RVALID = ap_const_logic_0) and (ap_predicate_op34_read_state2 = ap_const_boolean_1));
    end process;

        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage0_iter7 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state9_pp0_stage0_iter8 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln115_fu_232_p2)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln115_fu_232_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln115_reg_979, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln115_reg_979 = ap_const_lv1_1))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter7_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter7_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7, ap_enable_reg_pp0_iter8)
    begin
        if (((ap_enable_reg_pp0_iter8 = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_phi_mux_empty_phi_fu_206_p4_assign_proc : process(icmp_ln115_reg_979_pp0_iter1_reg, trunc_ln115_reg_983_pp0_iter1_reg, gmem4_addr_read_reg_987, ap_phi_reg_pp0_iter2_empty_reg_203, zext_ln115_fu_262_p1)
    begin
        if ((icmp_ln115_reg_979_pp0_iter1_reg = ap_const_lv1_0)) then
            if ((trunc_ln115_reg_983_pp0_iter1_reg = ap_const_lv1_1)) then 
                ap_phi_mux_empty_phi_fu_206_p4 <= zext_ln115_fu_262_p1;
            elsif ((trunc_ln115_reg_983_pp0_iter1_reg = ap_const_lv1_0)) then 
                ap_phi_mux_empty_phi_fu_206_p4 <= gmem4_addr_read_reg_987;
            else 
                ap_phi_mux_empty_phi_fu_206_p4 <= ap_phi_reg_pp0_iter2_empty_reg_203;
            end if;
        else 
            ap_phi_mux_empty_phi_fu_206_p4 <= ap_phi_reg_pp0_iter2_empty_reg_203;
        end if; 
    end process;

    ap_phi_reg_pp0_iter2_empty_reg_203 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    ap_predicate_op34_read_state2_assign_proc : process(icmp_ln115_reg_979, trunc_ln115_reg_983)
    begin
                ap_predicate_op34_read_state2 <= ((trunc_ln115_reg_983 = ap_const_lv1_0) and (icmp_ln115_reg_979 = ap_const_lv1_0));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_3_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_122)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_sig_allocacmp_i_3 <= ap_const_lv3_0;
        else 
            ap_sig_allocacmp_i_3 <= i_fu_122;
        end if; 
    end process;

    ashr_ln621_1_fu_538_p2 <= std_logic_vector(shift_right(signed(man_V_3_reg_1067),to_integer(unsigned('0' & zext_ln621_1_fu_534_p1(31-1 downto 0)))));
    ashr_ln621_fu_503_p2 <= std_logic_vector(shift_right(signed(man_V_3_reg_1067),to_integer(unsigned('0' & zext_ln621_fu_499_p1(31-1 downto 0)))));
    beta_reg_V_1_out <= beta_reg_V_1_fu_142;

    beta_reg_V_1_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln115_reg_979_pp0_iter6_reg)
    begin
        if (((icmp_ln115_reg_979_pp0_iter6_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            beta_reg_V_1_out_ap_vld <= ap_const_logic_1;
        else 
            beta_reg_V_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    beta_reg_V_2_out <= beta_reg_V_2_fu_146;

    beta_reg_V_2_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln115_reg_979_pp0_iter6_reg)
    begin
        if (((icmp_ln115_reg_979_pp0_iter6_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            beta_reg_V_2_out_ap_vld <= ap_const_logic_1;
        else 
            beta_reg_V_2_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    beta_reg_V_3_fu_737_p3 <= 
        ap_const_lv8_0 when (icmp_ln606_reg_1030_pp0_iter7_reg(0) = '1') else 
        select_ln616_1_fu_731_p3;
    beta_reg_V_4_fu_762_p3 <= 
        beta_reg_V_3_fu_737_p3 when (and_ln124_fu_756_p2(0) = '1') else 
        beta_reg_V_2_fu_146;
    beta_reg_V_5_fu_782_p3 <= 
        beta_reg_V_3_fu_737_p3 when (and_ln124_1_fu_776_p2(0) = '1') else 
        beta_reg_V_1_fu_142;
    beta_reg_V_6_fu_802_p3 <= 
        beta_reg_V_fu_138 when (or_ln124_1_fu_796_p2(0) = '1') else 
        beta_reg_V_3_fu_737_p3;
    beta_reg_V_out <= beta_reg_V_fu_138;

    beta_reg_V_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln115_reg_979_pp0_iter6_reg)
    begin
        if (((icmp_ln115_reg_979_pp0_iter6_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            beta_reg_V_out_ap_vld <= ap_const_logic_1;
        else 
            beta_reg_V_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    gmem4_blk_n_R_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, m_axi_gmem4_RVALID, ap_predicate_op34_read_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op34_read_state2 = ap_const_boolean_1))) then 
            gmem4_blk_n_R <= m_axi_gmem4_RVALID;
        else 
            gmem4_blk_n_R <= ap_const_logic_1;
        end if; 
    end process;


    grp_fu_212_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_212_ce <= ap_const_logic_1;
        else 
            grp_fu_212_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_212_p0 <= trunc_ln120_reg_992;
    icmp_ln115_fu_232_p2 <= "1" when (ap_sig_allocacmp_i_3 = ap_const_lv3_6) else "0";
    icmp_ln121_fu_680_p2 <= "1" when (unsigned(i_3_reg_973_pp0_iter7_reg) < unsigned(ap_const_lv3_3)) else "0";
    icmp_ln124_1_fu_770_p2 <= "1" when (trunc_ln122_fu_713_p1 = ap_const_lv2_0) else "0";
    icmp_ln124_fu_744_p2 <= "1" when (trunc_ln122_fu_713_p1 = ap_const_lv2_1) else "0";
    icmp_ln606_fu_328_p2 <= "1" when (trunc_ln592_reg_1007 = ap_const_lv63_0) else "0";
    icmp_ln616_1_fu_396_p2 <= "1" when (signed(F2_reg_1039) > signed(ap_const_lv12_4)) else "0";
    icmp_ln616_fu_379_p2 <= "1" when (signed(F2_reg_1039) > signed(ap_const_lv12_0)) else "0";
    icmp_ln617_1_fu_419_p2 <= "1" when (F2_reg_1039 = ap_const_lv12_4) else "0";
    icmp_ln617_fu_346_p2 <= "1" when (exp_tmp_reg_1019 = ap_const_lv11_433) else "0";
    icmp_ln620_1_fu_462_p2 <= "1" when (unsigned(sh_amt_1_fu_411_p3) < unsigned(ap_const_lv12_36)) else "0";
    icmp_ln620_fu_428_p2 <= "1" when (unsigned(sh_amt_fu_389_p3) < unsigned(ap_const_lv12_36)) else "0";
    icmp_ln626_1_fu_468_p2 <= "1" when (signed(add_ln616_fu_401_p2) > signed(ap_const_lv12_36)) else "0";
    icmp_ln626_fu_441_p2 <= "1" when (signed(F2_reg_1039) > signed(ap_const_lv12_36)) else "0";
    icmp_ln638_1_fu_484_p2 <= "1" when (tmp_19_fu_474_p4 = ap_const_lv9_0) else "0";
    icmp_ln638_fu_456_p2 <= "1" when (tmp_18_fu_446_p4 = ap_const_lv9_0) else "0";
    ireg_fu_298_p1 <= grp_fu_212_p1;
    m_axi_gmem4_ARADDR <= ap_const_lv64_0;
    m_axi_gmem4_ARBURST <= ap_const_lv2_0;
    m_axi_gmem4_ARCACHE <= ap_const_lv4_0;
    m_axi_gmem4_ARID <= ap_const_lv1_0;
    m_axi_gmem4_ARLEN <= ap_const_lv32_0;
    m_axi_gmem4_ARLOCK <= ap_const_lv2_0;
    m_axi_gmem4_ARPROT <= ap_const_lv3_0;
    m_axi_gmem4_ARQOS <= ap_const_lv4_0;
    m_axi_gmem4_ARREGION <= ap_const_lv4_0;
    m_axi_gmem4_ARSIZE <= ap_const_lv3_0;
    m_axi_gmem4_ARUSER <= ap_const_lv1_0;
    m_axi_gmem4_ARVALID <= ap_const_logic_0;
    m_axi_gmem4_AWADDR <= ap_const_lv64_0;
    m_axi_gmem4_AWBURST <= ap_const_lv2_0;
    m_axi_gmem4_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem4_AWID <= ap_const_lv1_0;
    m_axi_gmem4_AWLEN <= ap_const_lv32_0;
    m_axi_gmem4_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem4_AWPROT <= ap_const_lv3_0;
    m_axi_gmem4_AWQOS <= ap_const_lv4_0;
    m_axi_gmem4_AWREGION <= ap_const_lv4_0;
    m_axi_gmem4_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem4_AWUSER <= ap_const_lv1_0;
    m_axi_gmem4_AWVALID <= ap_const_logic_0;
    m_axi_gmem4_BREADY <= ap_const_logic_0;

    m_axi_gmem4_RREADY_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op34_read_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op34_read_state2 = ap_const_boolean_1))) then 
            m_axi_gmem4_RREADY <= ap_const_logic_1;
        else 
            m_axi_gmem4_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem4_WDATA <= ap_const_lv64_0;
    m_axi_gmem4_WID <= ap_const_lv1_0;
    m_axi_gmem4_WLAST <= ap_const_logic_0;
    m_axi_gmem4_WSTRB <= ap_const_lv8_0;
    m_axi_gmem4_WUSER <= ap_const_lv1_0;
    m_axi_gmem4_WVALID <= ap_const_logic_0;
    man_V_1_fu_366_p2 <= std_logic_vector(unsigned(ap_const_lv54_0) - unsigned(zext_ln604_fu_362_p1));
    man_V_3_fu_372_p3 <= 
        man_V_1_fu_366_p2 when (isneg_reg_1012_pp0_iter5_reg(0) = '1') else 
        zext_ln604_fu_362_p1;
    man_V_fu_355_p3 <= (ap_const_lv1_1 & trunc_ln600_reg_1025_pp0_iter5_reg);
    or_ln122_1_fu_816_p2 <= (or_ln122_fu_810_p2 or icmp_ln124_1_fu_770_p2);
    or_ln122_fu_810_p2 <= (xor_ln121_fu_750_p2 or icmp_ln124_fu_744_p2);
    or_ln124_1_fu_796_p2 <= (or_ln124_fu_790_p2 or icmp_ln121_fu_680_p2);
    or_ln124_fu_790_p2 <= (icmp_ln124_fu_744_p2 or icmp_ln124_1_fu_770_p2);
    or_ln617_1_fu_716_p2 <= (icmp_ln617_1_reg_1096_pp0_iter7_reg or icmp_ln606_reg_1030_pp0_iter7_reg);
    or_ln617_fu_685_p2 <= (icmp_ln617_reg_1056_pp0_iter7_reg or icmp_ln606_reg_1030_pp0_iter7_reg);
    p_Result_1_fu_594_p3 <= man_V_3_reg_1067(to_integer(unsigned(zext_ln626_1_fu_590_p1)) downto to_integer(unsigned(zext_ln626_1_fu_590_p1))) when (to_integer(unsigned(zext_ln626_1_fu_590_p1)) >= 0 and to_integer(unsigned(zext_ln626_1_fu_590_p1)) <=53) else "-";
    p_Result_s_fu_578_p3 <= man_V_3_reg_1067(to_integer(unsigned(zext_ln626_fu_574_p1)) downto to_integer(unsigned(zext_ln626_fu_574_p1))) when (to_integer(unsigned(zext_ln626_fu_574_p1)) >= 0 and to_integer(unsigned(zext_ln626_fu_574_p1)) <=53) else "-";
    qb_1_fu_617_p3 <= 
        isneg_reg_1012_pp0_iter6_reg when (icmp_ln626_1_reg_1136(0) = '1') else 
        p_Result_1_fu_594_p3;
    qb_fu_601_p3 <= 
        isneg_reg_1012_pp0_iter6_reg when (icmp_ln626_reg_1121(0) = '1') else 
        p_Result_s_fu_578_p3;
    select_ln616_1_fu_731_p3 <= 
        add_ln423_1_reg_1151 when (and_ln616_1_fu_726_p2(0) = '1') else 
        select_ln617_1_reg_1161;
    select_ln616_fu_700_p3 <= 
        add_ln423_reg_1146 when (and_ln616_fu_695_p2(0) = '1') else 
        select_ln617_reg_1156;
    select_ln617_1_fu_655_p3 <= 
        trunc_ln618_reg_1102 when (and_ln617_1_fu_650_p2(0) = '1') else 
        select_ln638_1_fu_562_p3;
    select_ln617_fu_643_p3 <= 
        trunc_ln618_reg_1102 when (and_ln617_fu_638_p2(0) = '1') else 
        select_ln638_fu_527_p3;
    select_ln620_1_fu_547_p3 <= 
        trunc_ln621_2_fu_543_p1 when (icmp_ln620_1_reg_1131(0) = '1') else 
        select_ln623_reg_1115;
    select_ln620_fu_512_p3 <= 
        trunc_ln621_1_fu_508_p1 when (icmp_ln620_reg_1110(0) = '1') else 
        select_ln623_reg_1115;
    select_ln623_fu_434_p3 <= 
        ap_const_lv8_FF when (tmp_reg_997_pp0_iter5_reg(0) = '1') else 
        ap_const_lv8_0;
    select_ln638_1_fu_562_p3 <= 
        shl_ln639_1_fu_557_p2 when (icmp_ln638_1_reg_1141(0) = '1') else 
        ap_const_lv8_0;
    select_ln638_fu_527_p3 <= 
        shl_ln639_fu_522_p2 when (icmp_ln638_reg_1126(0) = '1') else 
        ap_const_lv8_0;
        sext_ln616_1_fu_493_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sh_amt_1_reg_1091),32));

    sext_ln616_1cast_fu_553_p1 <= sext_ln616_1_fu_493_p1(8 - 1 downto 0);
        sext_ln616_fu_490_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sh_amt_reg_1080),32));

    sext_ln616cast_fu_518_p1 <= sext_ln616_fu_490_p1(8 - 1 downto 0);
    sh_amt_1_fu_411_p3 <= 
        add_ln616_fu_401_p2 when (icmp_ln616_1_fu_396_p2(0) = '1') else 
        sub_ln616_1_fu_406_p2;
    sh_amt_fu_389_p3 <= 
        F2_reg_1039 when (icmp_ln616_fu_379_p2(0) = '1') else 
        sub_ln616_fu_384_p2;
    shl_ln639_1_fu_557_p2 <= std_logic_vector(shift_left(unsigned(trunc_ln618_reg_1102),to_integer(unsigned('0' & sext_ln616_1cast_fu_553_p1(8-1 downto 0)))));
    shl_ln639_fu_522_p2 <= std_logic_vector(shift_left(unsigned(trunc_ln618_reg_1102),to_integer(unsigned('0' & sext_ln616cast_fu_518_p1(8-1 downto 0)))));
    sub_ln616_1_fu_406_p2 <= std_logic_vector(unsigned(ap_const_lv12_4) - unsigned(F2_reg_1039));
    sub_ln616_fu_384_p2 <= std_logic_vector(unsigned(ap_const_lv12_0) - unsigned(F2_reg_1039));
    tmp_18_fu_446_p4 <= sh_amt_fu_389_p3(11 downto 3);
    tmp_19_fu_474_p4 <= sh_amt_1_fu_411_p3(11 downto 3);
    trunc_ln115_fu_244_p1 <= ap_sig_allocacmp_i_3(1 - 1 downto 0);
    trunc_ln120_fu_267_p1 <= ap_phi_mux_empty_phi_fu_206_p4(32 - 1 downto 0);
    trunc_ln122_fu_713_p1 <= i_3_reg_973_pp0_iter7_reg(2 - 1 downto 0);
    trunc_ln592_fu_302_p1 <= ireg_fu_298_p1(63 - 1 downto 0);
    trunc_ln600_fu_324_p1 <= ireg_fu_298_p1(52 - 1 downto 0);
    trunc_ln610_1_fu_351_p1 <= F2_fu_336_p2(11 - 1 downto 0);
    trunc_ln610_fu_342_p1 <= F2_fu_336_p2(6 - 1 downto 0);
    trunc_ln618_fu_424_p1 <= man_V_3_fu_372_p3(8 - 1 downto 0);
    trunc_ln621_1_fu_508_p1 <= ashr_ln621_fu_503_p2(8 - 1 downto 0);
    trunc_ln621_2_fu_543_p1 <= ashr_ln621_1_fu_538_p2(8 - 1 downto 0);
    trunc_ln621_fu_496_p1 <= sh_amt_reg_1080(11 - 1 downto 0);
    xor_ln121_fu_750_p2 <= (icmp_ln121_fu_680_p2 xor ap_const_lv1_1);
    xor_ln606_fu_633_p2 <= (icmp_ln606_reg_1030_pp0_iter6_reg xor ap_const_lv1_1);
    xor_ln617_1_fu_720_p2 <= (or_ln617_1_fu_716_p2 xor ap_const_lv1_1);
    xor_ln617_fu_689_p2 <= (or_ln617_fu_685_p2 xor ap_const_lv1_1);
    zext_ln115_fu_262_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shiftreg_fu_118),64));
    zext_ln423_1_fu_623_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(qb_1_fu_617_p3),8));
    zext_ln423_fu_607_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(qb_fu_601_p3),8));
    zext_ln501_fu_333_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(exp_tmp_reg_1019),12));
    zext_ln604_fu_362_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(man_V_fu_355_p3),54));
    zext_ln621_1_fu_534_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln616_1_fu_493_p1),54));
    zext_ln621_fu_499_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln621_fu_496_p1),54));
    zext_ln626_1_fu_590_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln626_1_fu_585_p2),32));
    zext_ln626_fu_574_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln626_fu_569_p2),32));
end behav;
