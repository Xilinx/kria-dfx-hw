-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    in_mat_rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    in_mat_rows_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    in_mat_rows_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    in_mat_rows_empty_n : IN STD_LOGIC;
    in_mat_rows_read : OUT STD_LOGIC;
    in_mat_cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    in_mat_cols_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    in_mat_cols_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    in_mat_cols_empty_n : IN STD_LOGIC;
    in_mat_cols_read : OUT STD_LOGIC;
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
    params : IN STD_LOGIC_VECTOR (63 downto 0) );
end;


architecture behav of pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000001000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000010000000000000000000";
    constant ap_ST_fsm_state21 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000100000000000000000000";
    constant ap_ST_fsm_state22 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000001000000000000000000000";
    constant ap_ST_fsm_state23 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000010000000000000000000000";
    constant ap_ST_fsm_state24 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000100000000000000000000000";
    constant ap_ST_fsm_state25 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000001000000000000000000000000";
    constant ap_ST_fsm_state26 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000010000000000000000000000000";
    constant ap_ST_fsm_state27 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000100000000000000000000000000";
    constant ap_ST_fsm_state28 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000001000000000000000000000000000";
    constant ap_ST_fsm_state29 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000010000000000000000000000000000";
    constant ap_ST_fsm_state30 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000100000000000000000000000000000";
    constant ap_ST_fsm_state31 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000001000000000000000000000000000000";
    constant ap_ST_fsm_state32 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000010000000000000000000000000000000";
    constant ap_ST_fsm_state33 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000100000000000000000000000000000000";
    constant ap_ST_fsm_state34 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000001000000000000000000000000000000000";
    constant ap_ST_fsm_state35 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000010000000000000000000000000000000000";
    constant ap_ST_fsm_state36 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000100000000000000000000000000000000000";
    constant ap_ST_fsm_state37 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000001000000000000000000000000000000000000";
    constant ap_ST_fsm_state38 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000010000000000000000000000000000000000000";
    constant ap_ST_fsm_state39 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000100000000000000000000000000000000000000";
    constant ap_ST_fsm_state40 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000001000000000000000000000000000000000000000";
    constant ap_ST_fsm_state41 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000010000000000000000000000000000000000000000";
    constant ap_ST_fsm_state42 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000100000000000000000000000000000000000000000";
    constant ap_ST_fsm_state43 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000001000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state44 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000010000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state45 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000100000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state46 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000001000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state47 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000010000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state48 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000100000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state49 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000001000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state50 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000010000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state51 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000100000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state52 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000001000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state53 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000010000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state54 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000100000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state55 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000001000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state56 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000010000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state57 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000100000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state58 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000001000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state59 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000010000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state60 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000100000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state61 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000001000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state62 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000010000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state63 : STD_LOGIC_VECTOR (73 downto 0) := "00000000000100000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state64 : STD_LOGIC_VECTOR (73 downto 0) := "00000000001000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state65 : STD_LOGIC_VECTOR (73 downto 0) := "00000000010000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state66 : STD_LOGIC_VECTOR (73 downto 0) := "00000000100000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state67 : STD_LOGIC_VECTOR (73 downto 0) := "00000001000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state68 : STD_LOGIC_VECTOR (73 downto 0) := "00000010000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state69 : STD_LOGIC_VECTOR (73 downto 0) := "00000100000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state70 : STD_LOGIC_VECTOR (73 downto 0) := "00001000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state71 : STD_LOGIC_VECTOR (73 downto 0) := "00010000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state72 : STD_LOGIC_VECTOR (73 downto 0) := "00100000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state73 : STD_LOGIC_VECTOR (73 downto 0) := "01000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state74 : STD_LOGIC_VECTOR (73 downto 0) := "10000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_44 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000100";
    constant ap_const_lv32_47 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000111";
    constant ap_const_lv32_46 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000110";
    constant ap_const_lv32_48 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001000";
    constant ap_const_lv32_49 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_45 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000101";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal in_mat_rows_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state69 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state69 : signal is "none";
    signal in_mat_cols_blk_n : STD_LOGIC;
    signal gmem4_blk_n_AR : STD_LOGIC;
    signal trunc_ln_fu_137_p4 : STD_LOGIC_VECTOR (60 downto 0);
    signal trunc_ln_reg_240 : STD_LOGIC_VECTOR (60 downto 0);
    signal grp_fu_198_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal loop_count_reg_260 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state72 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state72 : signal is "none";
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_idle : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_ready : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWVALID : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WVALID : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WLAST : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARVALID : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_RREADY : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_BREADY : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out_ap_vld : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out_ap_vld : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out_ap_vld : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out_ap_vld : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out_ap_vld : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out_ap_vld : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_idle : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_ready : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_resize_out_mat_data84_read : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_din : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_write : STD_LOGIC;
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state71 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state71 : signal is "none";
    signal grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state73 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state73 : signal is "none";
    signal ap_CS_fsm_state74 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state74 : signal is "none";
    signal sext_ln115_fu_147_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_state69 : BOOLEAN;
    signal width_fu_158_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal height_fu_162_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_198_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_198_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_198_ce : STD_LOGIC;
    signal ap_CS_fsm_state70 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state70 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (73 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ST_fsm_state16_blk : STD_LOGIC;
    signal ap_ST_fsm_state17_blk : STD_LOGIC;
    signal ap_ST_fsm_state18_blk : STD_LOGIC;
    signal ap_ST_fsm_state19_blk : STD_LOGIC;
    signal ap_ST_fsm_state20_blk : STD_LOGIC;
    signal ap_ST_fsm_state21_blk : STD_LOGIC;
    signal ap_ST_fsm_state22_blk : STD_LOGIC;
    signal ap_ST_fsm_state23_blk : STD_LOGIC;
    signal ap_ST_fsm_state24_blk : STD_LOGIC;
    signal ap_ST_fsm_state25_blk : STD_LOGIC;
    signal ap_ST_fsm_state26_blk : STD_LOGIC;
    signal ap_ST_fsm_state27_blk : STD_LOGIC;
    signal ap_ST_fsm_state28_blk : STD_LOGIC;
    signal ap_ST_fsm_state29_blk : STD_LOGIC;
    signal ap_ST_fsm_state30_blk : STD_LOGIC;
    signal ap_ST_fsm_state31_blk : STD_LOGIC;
    signal ap_ST_fsm_state32_blk : STD_LOGIC;
    signal ap_ST_fsm_state33_blk : STD_LOGIC;
    signal ap_ST_fsm_state34_blk : STD_LOGIC;
    signal ap_ST_fsm_state35_blk : STD_LOGIC;
    signal ap_ST_fsm_state36_blk : STD_LOGIC;
    signal ap_ST_fsm_state37_blk : STD_LOGIC;
    signal ap_ST_fsm_state38_blk : STD_LOGIC;
    signal ap_ST_fsm_state39_blk : STD_LOGIC;
    signal ap_ST_fsm_state40_blk : STD_LOGIC;
    signal ap_ST_fsm_state41_blk : STD_LOGIC;
    signal ap_ST_fsm_state42_blk : STD_LOGIC;
    signal ap_ST_fsm_state43_blk : STD_LOGIC;
    signal ap_ST_fsm_state44_blk : STD_LOGIC;
    signal ap_ST_fsm_state45_blk : STD_LOGIC;
    signal ap_ST_fsm_state46_blk : STD_LOGIC;
    signal ap_ST_fsm_state47_blk : STD_LOGIC;
    signal ap_ST_fsm_state48_blk : STD_LOGIC;
    signal ap_ST_fsm_state49_blk : STD_LOGIC;
    signal ap_ST_fsm_state50_blk : STD_LOGIC;
    signal ap_ST_fsm_state51_blk : STD_LOGIC;
    signal ap_ST_fsm_state52_blk : STD_LOGIC;
    signal ap_ST_fsm_state53_blk : STD_LOGIC;
    signal ap_ST_fsm_state54_blk : STD_LOGIC;
    signal ap_ST_fsm_state55_blk : STD_LOGIC;
    signal ap_ST_fsm_state56_blk : STD_LOGIC;
    signal ap_ST_fsm_state57_blk : STD_LOGIC;
    signal ap_ST_fsm_state58_blk : STD_LOGIC;
    signal ap_ST_fsm_state59_blk : STD_LOGIC;
    signal ap_ST_fsm_state60_blk : STD_LOGIC;
    signal ap_ST_fsm_state61_blk : STD_LOGIC;
    signal ap_ST_fsm_state62_blk : STD_LOGIC;
    signal ap_ST_fsm_state63_blk : STD_LOGIC;
    signal ap_ST_fsm_state64_blk : STD_LOGIC;
    signal ap_ST_fsm_state65_blk : STD_LOGIC;
    signal ap_ST_fsm_state66_blk : STD_LOGIC;
    signal ap_ST_fsm_state67_blk : STD_LOGIC;
    signal ap_ST_fsm_state68_blk : STD_LOGIC;
    signal ap_ST_fsm_state69_blk : STD_LOGIC;
    signal ap_ST_fsm_state70_blk : STD_LOGIC;
    signal ap_ST_fsm_state71_blk : STD_LOGIC;
    signal ap_ST_fsm_state72_blk : STD_LOGIC;
    signal ap_ST_fsm_state73_blk : STD_LOGIC;
    signal ap_ST_fsm_state74_blk : STD_LOGIC;
    signal grp_fu_198_p00 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_198_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1 IS
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
    end component;


    component pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1 IS
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
    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109 : component pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start,
        ap_done => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done,
        ap_idle => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_idle,
        ap_ready => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_ready,
        m_axi_gmem4_AWVALID => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWVALID,
        m_axi_gmem4_AWREADY => ap_const_logic_0,
        m_axi_gmem4_AWADDR => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWADDR,
        m_axi_gmem4_AWID => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWID,
        m_axi_gmem4_AWLEN => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWLEN,
        m_axi_gmem4_AWSIZE => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWSIZE,
        m_axi_gmem4_AWBURST => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWBURST,
        m_axi_gmem4_AWLOCK => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWLOCK,
        m_axi_gmem4_AWCACHE => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWCACHE,
        m_axi_gmem4_AWPROT => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWPROT,
        m_axi_gmem4_AWQOS => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWQOS,
        m_axi_gmem4_AWREGION => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWREGION,
        m_axi_gmem4_AWUSER => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_AWUSER,
        m_axi_gmem4_WVALID => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WVALID,
        m_axi_gmem4_WREADY => ap_const_logic_0,
        m_axi_gmem4_WDATA => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WDATA,
        m_axi_gmem4_WSTRB => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WSTRB,
        m_axi_gmem4_WLAST => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WLAST,
        m_axi_gmem4_WID => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WID,
        m_axi_gmem4_WUSER => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_WUSER,
        m_axi_gmem4_ARVALID => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARVALID,
        m_axi_gmem4_ARREADY => m_axi_gmem4_ARREADY,
        m_axi_gmem4_ARADDR => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARADDR,
        m_axi_gmem4_ARID => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARID,
        m_axi_gmem4_ARLEN => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLEN,
        m_axi_gmem4_ARSIZE => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARSIZE,
        m_axi_gmem4_ARBURST => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARBURST,
        m_axi_gmem4_ARLOCK => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLOCK,
        m_axi_gmem4_ARCACHE => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARCACHE,
        m_axi_gmem4_ARPROT => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARPROT,
        m_axi_gmem4_ARQOS => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARQOS,
        m_axi_gmem4_ARREGION => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARREGION,
        m_axi_gmem4_ARUSER => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARUSER,
        m_axi_gmem4_RVALID => m_axi_gmem4_RVALID,
        m_axi_gmem4_RREADY => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_RREADY,
        m_axi_gmem4_RDATA => m_axi_gmem4_RDATA,
        m_axi_gmem4_RLAST => m_axi_gmem4_RLAST,
        m_axi_gmem4_RID => m_axi_gmem4_RID,
        m_axi_gmem4_RFIFONUM => m_axi_gmem4_RFIFONUM,
        m_axi_gmem4_RUSER => m_axi_gmem4_RUSER,
        m_axi_gmem4_RRESP => m_axi_gmem4_RRESP,
        m_axi_gmem4_BVALID => ap_const_logic_0,
        m_axi_gmem4_BREADY => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_BREADY,
        m_axi_gmem4_BRESP => ap_const_lv2_0,
        m_axi_gmem4_BID => ap_const_lv1_0,
        m_axi_gmem4_BUSER => ap_const_lv1_0,
        sext_ln115 => trunc_ln_reg_240,
        beta_reg_V_2_out => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out,
        beta_reg_V_2_out_ap_vld => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out_ap_vld,
        beta_reg_V_1_out => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out,
        beta_reg_V_1_out_ap_vld => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out_ap_vld,
        beta_reg_V_out => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out,
        beta_reg_V_out_ap_vld => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out_ap_vld,
        alpha_reg_V_9_out => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out,
        alpha_reg_V_9_out_ap_vld => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out_ap_vld,
        alpha_reg_V_8_out => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out,
        alpha_reg_V_8_out_ap_vld => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out_ap_vld,
        alpha_reg_V_7_out => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out,
        alpha_reg_V_7_out_ap_vld => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out_ap_vld);

    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122 : component pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start,
        ap_done => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done,
        ap_idle => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_idle,
        ap_ready => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_ready,
        resize_out_mat_data84_dout => resize_out_mat_data84_dout,
        resize_out_mat_data84_num_data_valid => ap_const_lv2_0,
        resize_out_mat_data84_fifo_cap => ap_const_lv2_0,
        resize_out_mat_data84_empty_n => resize_out_mat_data84_empty_n,
        resize_out_mat_data84_read => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_resize_out_mat_data84_read,
        out_mat_data85_din => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_din,
        out_mat_data85_num_data_valid => ap_const_lv2_0,
        out_mat_data85_fifo_cap => ap_const_lv2_0,
        out_mat_data85_full_n => out_mat_data85_full_n,
        out_mat_data85_write => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_write,
        loop_count => loop_count_reg_260,
        rhs => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_7_out,
        sext_ln1319 => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_out,
        rhs_1 => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_8_out,
        sext_ln1319_1 => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_1_out,
        rhs_2 => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_alpha_reg_V_9_out,
        sext_ln1319_2 => grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_beta_reg_V_2_out);

    mul_mul_16ns_16ns_32_4_1_U272 : component pp_pipeline_accel_mul_mul_16ns_16ns_32_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_198_p0,
        din1 => grp_fu_198_p1,
        ce => grp_fu_198_ce,
        dout => grp_fu_198_p2);





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
                elsif (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state74))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state71)) then 
                    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_ready = ap_const_logic_1)) then 
                    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state73)) then 
                    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_ready = ap_const_logic_1)) then 
                    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state72)) then
                loop_count_reg_260 <= grp_fu_198_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                trunc_ln_reg_240 <= params(63 downto 3);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, in_mat_rows_empty_n, in_mat_cols_empty_n, m_axi_gmem4_ARREADY, ap_CS_fsm_state69, ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done, ap_CS_fsm_state74)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (m_axi_gmem4_ARREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
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
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state18;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state19;
            when ap_ST_fsm_state19 => 
                ap_NS_fsm <= ap_ST_fsm_state20;
            when ap_ST_fsm_state20 => 
                ap_NS_fsm <= ap_ST_fsm_state21;
            when ap_ST_fsm_state21 => 
                ap_NS_fsm <= ap_ST_fsm_state22;
            when ap_ST_fsm_state22 => 
                ap_NS_fsm <= ap_ST_fsm_state23;
            when ap_ST_fsm_state23 => 
                ap_NS_fsm <= ap_ST_fsm_state24;
            when ap_ST_fsm_state24 => 
                ap_NS_fsm <= ap_ST_fsm_state25;
            when ap_ST_fsm_state25 => 
                ap_NS_fsm <= ap_ST_fsm_state26;
            when ap_ST_fsm_state26 => 
                ap_NS_fsm <= ap_ST_fsm_state27;
            when ap_ST_fsm_state27 => 
                ap_NS_fsm <= ap_ST_fsm_state28;
            when ap_ST_fsm_state28 => 
                ap_NS_fsm <= ap_ST_fsm_state29;
            when ap_ST_fsm_state29 => 
                ap_NS_fsm <= ap_ST_fsm_state30;
            when ap_ST_fsm_state30 => 
                ap_NS_fsm <= ap_ST_fsm_state31;
            when ap_ST_fsm_state31 => 
                ap_NS_fsm <= ap_ST_fsm_state32;
            when ap_ST_fsm_state32 => 
                ap_NS_fsm <= ap_ST_fsm_state33;
            when ap_ST_fsm_state33 => 
                ap_NS_fsm <= ap_ST_fsm_state34;
            when ap_ST_fsm_state34 => 
                ap_NS_fsm <= ap_ST_fsm_state35;
            when ap_ST_fsm_state35 => 
                ap_NS_fsm <= ap_ST_fsm_state36;
            when ap_ST_fsm_state36 => 
                ap_NS_fsm <= ap_ST_fsm_state37;
            when ap_ST_fsm_state37 => 
                ap_NS_fsm <= ap_ST_fsm_state38;
            when ap_ST_fsm_state38 => 
                ap_NS_fsm <= ap_ST_fsm_state39;
            when ap_ST_fsm_state39 => 
                ap_NS_fsm <= ap_ST_fsm_state40;
            when ap_ST_fsm_state40 => 
                ap_NS_fsm <= ap_ST_fsm_state41;
            when ap_ST_fsm_state41 => 
                ap_NS_fsm <= ap_ST_fsm_state42;
            when ap_ST_fsm_state42 => 
                ap_NS_fsm <= ap_ST_fsm_state43;
            when ap_ST_fsm_state43 => 
                ap_NS_fsm <= ap_ST_fsm_state44;
            when ap_ST_fsm_state44 => 
                ap_NS_fsm <= ap_ST_fsm_state45;
            when ap_ST_fsm_state45 => 
                ap_NS_fsm <= ap_ST_fsm_state46;
            when ap_ST_fsm_state46 => 
                ap_NS_fsm <= ap_ST_fsm_state47;
            when ap_ST_fsm_state47 => 
                ap_NS_fsm <= ap_ST_fsm_state48;
            when ap_ST_fsm_state48 => 
                ap_NS_fsm <= ap_ST_fsm_state49;
            when ap_ST_fsm_state49 => 
                ap_NS_fsm <= ap_ST_fsm_state50;
            when ap_ST_fsm_state50 => 
                ap_NS_fsm <= ap_ST_fsm_state51;
            when ap_ST_fsm_state51 => 
                ap_NS_fsm <= ap_ST_fsm_state52;
            when ap_ST_fsm_state52 => 
                ap_NS_fsm <= ap_ST_fsm_state53;
            when ap_ST_fsm_state53 => 
                ap_NS_fsm <= ap_ST_fsm_state54;
            when ap_ST_fsm_state54 => 
                ap_NS_fsm <= ap_ST_fsm_state55;
            when ap_ST_fsm_state55 => 
                ap_NS_fsm <= ap_ST_fsm_state56;
            when ap_ST_fsm_state56 => 
                ap_NS_fsm <= ap_ST_fsm_state57;
            when ap_ST_fsm_state57 => 
                ap_NS_fsm <= ap_ST_fsm_state58;
            when ap_ST_fsm_state58 => 
                ap_NS_fsm <= ap_ST_fsm_state59;
            when ap_ST_fsm_state59 => 
                ap_NS_fsm <= ap_ST_fsm_state60;
            when ap_ST_fsm_state60 => 
                ap_NS_fsm <= ap_ST_fsm_state61;
            when ap_ST_fsm_state61 => 
                ap_NS_fsm <= ap_ST_fsm_state62;
            when ap_ST_fsm_state62 => 
                ap_NS_fsm <= ap_ST_fsm_state63;
            when ap_ST_fsm_state63 => 
                ap_NS_fsm <= ap_ST_fsm_state64;
            when ap_ST_fsm_state64 => 
                ap_NS_fsm <= ap_ST_fsm_state65;
            when ap_ST_fsm_state65 => 
                ap_NS_fsm <= ap_ST_fsm_state66;
            when ap_ST_fsm_state66 => 
                ap_NS_fsm <= ap_ST_fsm_state67;
            when ap_ST_fsm_state67 => 
                ap_NS_fsm <= ap_ST_fsm_state68;
            when ap_ST_fsm_state68 => 
                ap_NS_fsm <= ap_ST_fsm_state69;
            when ap_ST_fsm_state69 => 
                if ((not(((in_mat_cols_empty_n = ap_const_logic_0) or (in_mat_rows_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state69))) then
                    ap_NS_fsm <= ap_ST_fsm_state70;
                else
                    ap_NS_fsm <= ap_ST_fsm_state69;
                end if;
            when ap_ST_fsm_state70 => 
                ap_NS_fsm <= ap_ST_fsm_state71;
            when ap_ST_fsm_state71 => 
                ap_NS_fsm <= ap_ST_fsm_state72;
            when ap_ST_fsm_state72 => 
                if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state72))) then
                    ap_NS_fsm <= ap_ST_fsm_state73;
                else
                    ap_NS_fsm <= ap_ST_fsm_state72;
                end if;
            when ap_ST_fsm_state73 => 
                ap_NS_fsm <= ap_ST_fsm_state74;
            when ap_ST_fsm_state74 => 
                if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state74))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state74;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state69 <= ap_CS_fsm(68);
    ap_CS_fsm_state70 <= ap_CS_fsm(69);
    ap_CS_fsm_state71 <= ap_CS_fsm(70);
    ap_CS_fsm_state72 <= ap_CS_fsm(71);
    ap_CS_fsm_state73 <= ap_CS_fsm(72);
    ap_CS_fsm_state74 <= ap_CS_fsm(73);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;
    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;
    ap_ST_fsm_state13_blk <= ap_const_logic_0;
    ap_ST_fsm_state14_blk <= ap_const_logic_0;
    ap_ST_fsm_state15_blk <= ap_const_logic_0;
    ap_ST_fsm_state16_blk <= ap_const_logic_0;
    ap_ST_fsm_state17_blk <= ap_const_logic_0;
    ap_ST_fsm_state18_blk <= ap_const_logic_0;
    ap_ST_fsm_state19_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, m_axi_gmem4_ARREADY)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (m_axi_gmem4_ARREADY = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state20_blk <= ap_const_logic_0;
    ap_ST_fsm_state21_blk <= ap_const_logic_0;
    ap_ST_fsm_state22_blk <= ap_const_logic_0;
    ap_ST_fsm_state23_blk <= ap_const_logic_0;
    ap_ST_fsm_state24_blk <= ap_const_logic_0;
    ap_ST_fsm_state25_blk <= ap_const_logic_0;
    ap_ST_fsm_state26_blk <= ap_const_logic_0;
    ap_ST_fsm_state27_blk <= ap_const_logic_0;
    ap_ST_fsm_state28_blk <= ap_const_logic_0;
    ap_ST_fsm_state29_blk <= ap_const_logic_0;
    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state30_blk <= ap_const_logic_0;
    ap_ST_fsm_state31_blk <= ap_const_logic_0;
    ap_ST_fsm_state32_blk <= ap_const_logic_0;
    ap_ST_fsm_state33_blk <= ap_const_logic_0;
    ap_ST_fsm_state34_blk <= ap_const_logic_0;
    ap_ST_fsm_state35_blk <= ap_const_logic_0;
    ap_ST_fsm_state36_blk <= ap_const_logic_0;
    ap_ST_fsm_state37_blk <= ap_const_logic_0;
    ap_ST_fsm_state38_blk <= ap_const_logic_0;
    ap_ST_fsm_state39_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state40_blk <= ap_const_logic_0;
    ap_ST_fsm_state41_blk <= ap_const_logic_0;
    ap_ST_fsm_state42_blk <= ap_const_logic_0;
    ap_ST_fsm_state43_blk <= ap_const_logic_0;
    ap_ST_fsm_state44_blk <= ap_const_logic_0;
    ap_ST_fsm_state45_blk <= ap_const_logic_0;
    ap_ST_fsm_state46_blk <= ap_const_logic_0;
    ap_ST_fsm_state47_blk <= ap_const_logic_0;
    ap_ST_fsm_state48_blk <= ap_const_logic_0;
    ap_ST_fsm_state49_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state50_blk <= ap_const_logic_0;
    ap_ST_fsm_state51_blk <= ap_const_logic_0;
    ap_ST_fsm_state52_blk <= ap_const_logic_0;
    ap_ST_fsm_state53_blk <= ap_const_logic_0;
    ap_ST_fsm_state54_blk <= ap_const_logic_0;
    ap_ST_fsm_state55_blk <= ap_const_logic_0;
    ap_ST_fsm_state56_blk <= ap_const_logic_0;
    ap_ST_fsm_state57_blk <= ap_const_logic_0;
    ap_ST_fsm_state58_blk <= ap_const_logic_0;
    ap_ST_fsm_state59_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state60_blk <= ap_const_logic_0;
    ap_ST_fsm_state61_blk <= ap_const_logic_0;
    ap_ST_fsm_state62_blk <= ap_const_logic_0;
    ap_ST_fsm_state63_blk <= ap_const_logic_0;
    ap_ST_fsm_state64_blk <= ap_const_logic_0;
    ap_ST_fsm_state65_blk <= ap_const_logic_0;
    ap_ST_fsm_state66_blk <= ap_const_logic_0;
    ap_ST_fsm_state67_blk <= ap_const_logic_0;
    ap_ST_fsm_state68_blk <= ap_const_logic_0;

    ap_ST_fsm_state69_blk_assign_proc : process(in_mat_rows_empty_n, in_mat_cols_empty_n)
    begin
        if (((in_mat_cols_empty_n = ap_const_logic_0) or (in_mat_rows_empty_n = ap_const_logic_0))) then 
            ap_ST_fsm_state69_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state69_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state70_blk <= ap_const_logic_0;
    ap_ST_fsm_state71_blk <= ap_const_logic_0;

    ap_ST_fsm_state72_blk_assign_proc : process(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done)
    begin
        if ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state72_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state72_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state73_blk <= ap_const_logic_0;

    ap_ST_fsm_state74_blk_assign_proc : process(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done)
    begin
        if ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state74_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state74_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_block_state69_assign_proc : process(in_mat_rows_empty_n, in_mat_cols_empty_n)
    begin
                ap_block_state69 <= ((in_mat_cols_empty_n = ap_const_logic_0) or (in_mat_rows_empty_n = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done, ap_CS_fsm_state74)
    begin
        if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state74))) then 
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


    ap_ready_assign_proc : process(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done, ap_CS_fsm_state74)
    begin
        if (((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state74))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    gmem4_blk_n_AR_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, m_axi_gmem4_ARREADY)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            gmem4_blk_n_AR <= m_axi_gmem4_ARREADY;
        else 
            gmem4_blk_n_AR <= ap_const_logic_1;
        end if; 
    end process;


    grp_fu_198_ce_assign_proc : process(in_mat_rows_empty_n, in_mat_cols_empty_n, ap_CS_fsm_state69, ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done, ap_CS_fsm_state71, ap_CS_fsm_state70)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state70) or (ap_const_logic_1 = ap_CS_fsm_state71) or ((grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state72)) or (not(((in_mat_cols_empty_n = ap_const_logic_0) or (in_mat_rows_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state69)))) then 
            grp_fu_198_ce <= ap_const_logic_1;
        else 
            grp_fu_198_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_198_p0 <= grp_fu_198_p00(16 - 1 downto 0);
    grp_fu_198_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(height_fu_162_p1),32));
    grp_fu_198_p1 <= grp_fu_198_p10(16 - 1 downto 0);
    grp_fu_198_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(width_fu_158_p1),32));
    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_ap_start_reg;
    grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_ap_start_reg;
    height_fu_162_p1 <= in_mat_rows_dout(16 - 1 downto 0);

    in_mat_cols_blk_n_assign_proc : process(in_mat_cols_empty_n, ap_CS_fsm_state69)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state69)) then 
            in_mat_cols_blk_n <= in_mat_cols_empty_n;
        else 
            in_mat_cols_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    in_mat_cols_read_assign_proc : process(in_mat_rows_empty_n, in_mat_cols_empty_n, ap_CS_fsm_state69)
    begin
        if ((not(((in_mat_cols_empty_n = ap_const_logic_0) or (in_mat_rows_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state69))) then 
            in_mat_cols_read <= ap_const_logic_1;
        else 
            in_mat_cols_read <= ap_const_logic_0;
        end if; 
    end process;


    in_mat_rows_blk_n_assign_proc : process(in_mat_rows_empty_n, ap_CS_fsm_state69)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state69)) then 
            in_mat_rows_blk_n <= in_mat_rows_empty_n;
        else 
            in_mat_rows_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    in_mat_rows_read_assign_proc : process(in_mat_rows_empty_n, in_mat_cols_empty_n, ap_CS_fsm_state69)
    begin
        if ((not(((in_mat_cols_empty_n = ap_const_logic_0) or (in_mat_rows_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state69))) then 
            in_mat_rows_read <= ap_const_logic_1;
        else 
            in_mat_rows_read <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem4_ARADDR_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, m_axi_gmem4_ARREADY, ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARADDR, ap_CS_fsm_state71, sext_ln115_fu_147_p1)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (m_axi_gmem4_ARREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            m_axi_gmem4_ARADDR <= sext_ln115_fu_147_p1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARADDR <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARADDR;
        else 
            m_axi_gmem4_ARADDR <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    m_axi_gmem4_ARBURST_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARBURST, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARBURST <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARBURST;
        else 
            m_axi_gmem4_ARBURST <= ap_const_lv2_0;
        end if; 
    end process;


    m_axi_gmem4_ARCACHE_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARCACHE, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARCACHE <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARCACHE;
        else 
            m_axi_gmem4_ARCACHE <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem4_ARID_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARID, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARID <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARID;
        else 
            m_axi_gmem4_ARID <= ap_const_lv1_0;
        end if; 
    end process;


    m_axi_gmem4_ARLEN_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, m_axi_gmem4_ARREADY, ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLEN, ap_CS_fsm_state71)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (m_axi_gmem4_ARREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            m_axi_gmem4_ARLEN <= ap_const_lv32_3;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARLEN <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLEN;
        else 
            m_axi_gmem4_ARLEN <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    m_axi_gmem4_ARLOCK_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLOCK, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARLOCK <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARLOCK;
        else 
            m_axi_gmem4_ARLOCK <= ap_const_lv2_0;
        end if; 
    end process;


    m_axi_gmem4_ARPROT_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARPROT, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARPROT <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARPROT;
        else 
            m_axi_gmem4_ARPROT <= ap_const_lv3_0;
        end if; 
    end process;


    m_axi_gmem4_ARQOS_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARQOS, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARQOS <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARQOS;
        else 
            m_axi_gmem4_ARQOS <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem4_ARREGION_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARREGION, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARREGION <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARREGION;
        else 
            m_axi_gmem4_ARREGION <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem4_ARSIZE_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARSIZE, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARSIZE <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARSIZE;
        else 
            m_axi_gmem4_ARSIZE <= ap_const_lv3_0;
        end if; 
    end process;


    m_axi_gmem4_ARUSER_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARUSER, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARUSER <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARUSER;
        else 
            m_axi_gmem4_ARUSER <= ap_const_lv1_0;
        end if; 
    end process;


    m_axi_gmem4_ARVALID_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, m_axi_gmem4_ARREADY, ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARVALID, ap_CS_fsm_state71)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (m_axi_gmem4_ARREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            m_axi_gmem4_ARVALID <= ap_const_logic_1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_ARVALID <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_ARVALID;
        else 
            m_axi_gmem4_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

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

    m_axi_gmem4_RREADY_assign_proc : process(ap_CS_fsm_state72, grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_RREADY, ap_CS_fsm_state71)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state71) or (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            m_axi_gmem4_RREADY <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_115_1_fu_109_m_axi_gmem4_RREADY;
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
    out_mat_data85_din <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_din;

    out_mat_data85_write_assign_proc : process(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_write, ap_CS_fsm_state74)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state74)) then 
            out_mat_data85_write <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_out_mat_data85_write;
        else 
            out_mat_data85_write <= ap_const_logic_0;
        end if; 
    end process;


    resize_out_mat_data84_read_assign_proc : process(grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_resize_out_mat_data84_read, ap_CS_fsm_state74)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state74)) then 
            resize_out_mat_data84_read <= grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122_resize_out_mat_data84_read;
        else 
            resize_out_mat_data84_read <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln115_fu_147_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_fu_137_p4),64));

    trunc_ln_fu_137_p4 <= params(63 downto 3);
    width_fu_158_p1 <= in_mat_cols_dout(16 - 1 downto 0);
end behav;
