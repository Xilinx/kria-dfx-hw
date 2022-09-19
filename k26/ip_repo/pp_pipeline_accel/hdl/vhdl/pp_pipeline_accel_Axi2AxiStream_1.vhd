-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_Axi2AxiStream_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_gmem1_AWVALID : OUT STD_LOGIC;
    m_axi_gmem1_AWREADY : IN STD_LOGIC;
    m_axi_gmem1_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem1_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem1_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem1_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem1_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_WVALID : OUT STD_LOGIC;
    m_axi_gmem1_WREADY : IN STD_LOGIC;
    m_axi_gmem1_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem1_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem1_WLAST : OUT STD_LOGIC;
    m_axi_gmem1_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_ARVALID : OUT STD_LOGIC;
    m_axi_gmem1_ARREADY : IN STD_LOGIC;
    m_axi_gmem1_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem1_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem1_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem1_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem1_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_RVALID : IN STD_LOGIC;
    m_axi_gmem1_RREADY : OUT STD_LOGIC;
    m_axi_gmem1_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem1_RLAST : IN STD_LOGIC;
    m_axi_gmem1_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
    m_axi_gmem1_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_BVALID : IN STD_LOGIC;
    m_axi_gmem1_BREADY : OUT STD_LOGIC;
    m_axi_gmem1_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem1_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    din : IN STD_LOGIC_VECTOR (63 downto 0);
    ldata_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    ldata_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata_full_n : IN STD_LOGIC;
    ldata_write : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (15 downto 0);
    p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
    p_read2 : IN STD_LOGIC_VECTOR (15 downto 0);
    stride : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of pp_pipeline_accel_Axi2AxiStream_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000001000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000010000000000000000000";
    constant ap_ST_fsm_state21 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000100000000000000000000";
    constant ap_ST_fsm_state22 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000001000000000000000000000";
    constant ap_ST_fsm_state23 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000010000000000000000000000";
    constant ap_ST_fsm_state24 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000100000000000000000000000";
    constant ap_ST_fsm_state25 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000001000000000000000000000000";
    constant ap_ST_fsm_state26 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000010000000000000000000000000";
    constant ap_ST_fsm_state27 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000100000000000000000000000000";
    constant ap_ST_fsm_state28 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000001000000000000000000000000000";
    constant ap_ST_fsm_state29 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000010000000000000000000000000000";
    constant ap_ST_fsm_state30 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000100000000000000000000000000000";
    constant ap_ST_fsm_state31 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000001000000000000000000000000000000";
    constant ap_ST_fsm_state32 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000010000000000000000000000000000000";
    constant ap_ST_fsm_state33 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000100000000000000000000000000000000";
    constant ap_ST_fsm_state34 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000001000000000000000000000000000000000";
    constant ap_ST_fsm_state35 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000010000000000000000000000000000000000";
    constant ap_ST_fsm_state36 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000100000000000000000000000000000000000";
    constant ap_ST_fsm_state37 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000001000000000000000000000000000000000000";
    constant ap_ST_fsm_state38 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000010000000000000000000000000000000000000";
    constant ap_ST_fsm_state39 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000100000000000000000000000000000000000000";
    constant ap_ST_fsm_state40 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000001000000000000000000000000000000000000000";
    constant ap_ST_fsm_state41 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000010000000000000000000000000000000000000000";
    constant ap_ST_fsm_state42 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000100000000000000000000000000000000000000000";
    constant ap_ST_fsm_state43 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000001000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state44 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000010000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state45 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000100000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state46 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000001000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state47 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000010000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state48 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000100000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state49 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000001000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state50 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000010000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state51 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000100000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state52 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000001000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state53 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000010000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state54 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000100000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state55 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000001000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state56 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000010000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state57 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000100000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state58 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000001000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state59 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000010000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state60 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000100000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state61 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000001000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state62 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000010000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state63 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000100000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state64 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000001000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state65 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000010000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state66 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000100000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state67 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000001000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state68 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000010000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state69 : STD_LOGIC_VECTOR (79 downto 0) := "00000000000100000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state70 : STD_LOGIC_VECTOR (79 downto 0) := "00000000001000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state71 : STD_LOGIC_VECTOR (79 downto 0) := "00000000010000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state72 : STD_LOGIC_VECTOR (79 downto 0) := "00000000100000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state73 : STD_LOGIC_VECTOR (79 downto 0) := "00000001000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state74 : STD_LOGIC_VECTOR (79 downto 0) := "00000010000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state75 : STD_LOGIC_VECTOR (79 downto 0) := "00000100000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state76 : STD_LOGIC_VECTOR (79 downto 0) := "00001000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state77 : STD_LOGIC_VECTOR (79 downto 0) := "00010000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state78 : STD_LOGIC_VECTOR (79 downto 0) := "00100000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state79 : STD_LOGIC_VECTOR (79 downto 0) := "01000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state80 : STD_LOGIC_VECTOR (79 downto 0) := "10000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_4E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001110";
    constant ap_const_lv32_4F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001111";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv27_3F : STD_LOGIC_VECTOR (26 downto 0) := "000000000000000000000111111";
    constant ap_const_lv32_1A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011010";
    constant ap_const_lv21_0 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000000";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (79 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal gmem1_blk_n_AR : STD_LOGIC;
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal cols_int16_fu_152_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal cols_int16_reg_347 : STD_LOGIC_VECTOR (15 downto 0);
    signal icmp_ln1021_fu_156_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1021_reg_352 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln232_fu_167_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal trunc_ln1540_fu_176_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal trunc_ln1540_reg_373 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal trunc_ln1540_2_fu_179_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal trunc_ln1540_2_reg_378 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal cols_addrbound_fu_195_p4 : STD_LOGIC_VECTOR (20 downto 0);
    signal cols_addrbound_reg_393 : STD_LOGIC_VECTOR (20 downto 0);
    signal cmp_i82_i_fu_235_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp_i82_i_reg_398 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln1028_fu_241_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal zext_ln1028_reg_402 : STD_LOGIC_VECTOR (51 downto 0);
    signal zext_ln1028_1_fu_245_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln1028_1_reg_407 : STD_LOGIC_VECTOR (31 downto 0);
    signal r_2_fu_261_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal r_2_reg_415 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal icmp_ln1024_fu_256_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_271_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_reg_425 : STD_LOGIC_VECTOR (51 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal trunc_ln_reg_430 : STD_LOGIC_VECTOR (60 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_done : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_idle : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_ready : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWVALID : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WVALID : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WLAST : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARVALID : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_RREADY : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_BREADY : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_din : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_write : STD_LOGIC;
    signal grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state79 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state79 : signal is "none";
    signal ap_CS_fsm_state80 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state80 : signal is "none";
    signal sext_ln1028_fu_302_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal r_fu_102 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_block_state80_on_subcall_done : BOOLEAN;
    signal ap_block_state1 : BOOLEAN;
    signal trunc_ln1540_fu_176_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_316_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln1540_2_fu_179_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_323_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ret_V_fu_182_p3 : STD_LOGIC_VECTOR (26 downto 0);
    signal add_ln587_fu_189_p2 : STD_LOGIC_VECTOR (26 downto 0);
    signal ret_V_31_fu_205_p3 : STD_LOGIC_VECTOR (26 downto 0);
    signal add_ln587_1_fu_212_p2 : STD_LOGIC_VECTOR (26 downto 0);
    signal stride_addrbound_fu_218_p4 : STD_LOGIC_VECTOR (20 downto 0);
    signal addrbound_V_fu_228_p3 : STD_LOGIC_VECTOR (20 downto 0);
    signal zext_ln1024_fu_252_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_271_p0 : STD_LOGIC_VECTOR (30 downto 0);
    signal grp_fu_271_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal tmp_s_fu_276_p3 : STD_LOGIC_VECTOR (54 downto 0);
    signal p_cast1_i_fu_283_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_226_fu_287_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_316_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_316_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_323_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_323_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (79 downto 0);
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
    signal ap_ST_fsm_state75_blk : STD_LOGIC;
    signal ap_ST_fsm_state76_blk : STD_LOGIC;
    signal ap_ST_fsm_state77_blk : STD_LOGIC;
    signal ap_ST_fsm_state78_blk : STD_LOGIC;
    signal ap_ST_fsm_state79_blk : STD_LOGIC;
    signal ap_ST_fsm_state80_blk : STD_LOGIC;
    signal grp_fu_271_p00 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fu_316_p00 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_323_p00 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        m_axi_gmem1_AWVALID : OUT STD_LOGIC;
        m_axi_gmem1_AWREADY : IN STD_LOGIC;
        m_axi_gmem1_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem1_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem1_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem1_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem1_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_WVALID : OUT STD_LOGIC;
        m_axi_gmem1_WREADY : IN STD_LOGIC;
        m_axi_gmem1_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem1_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axi_gmem1_WLAST : OUT STD_LOGIC;
        m_axi_gmem1_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_ARVALID : OUT STD_LOGIC;
        m_axi_gmem1_ARREADY : IN STD_LOGIC;
        m_axi_gmem1_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem1_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem1_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem1_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem1_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_RVALID : IN STD_LOGIC;
        m_axi_gmem1_RREADY : OUT STD_LOGIC;
        m_axi_gmem1_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem1_RLAST : IN STD_LOGIC;
        m_axi_gmem1_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
        m_axi_gmem1_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_BVALID : IN STD_LOGIC;
        m_axi_gmem1_BREADY : OUT STD_LOGIC;
        m_axi_gmem1_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        ldata_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        ldata_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        ldata_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        ldata_full_n : IN STD_LOGIC;
        ldata_write : OUT STD_LOGIC;
        sext_ln1028 : IN STD_LOGIC_VECTOR (60 downto 0);
        cols_addrbound : IN STD_LOGIC_VECTOR (20 downto 0) );
    end component;


    component pp_pipeline_accel_mul_31ns_21ns_52_2_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (30 downto 0);
        din1 : IN STD_LOGIC_VECTOR (20 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (51 downto 0) );
    end component;


    component pp_pipeline_accel_mul_mul_16ns_16ns_32_3_1 IS
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
    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142 : component pp_pipeline_accel_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start,
        ap_done => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_done,
        ap_idle => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_idle,
        ap_ready => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_ready,
        m_axi_gmem1_AWVALID => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWVALID,
        m_axi_gmem1_AWREADY => ap_const_logic_0,
        m_axi_gmem1_AWADDR => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWADDR,
        m_axi_gmem1_AWID => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWID,
        m_axi_gmem1_AWLEN => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWLEN,
        m_axi_gmem1_AWSIZE => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWSIZE,
        m_axi_gmem1_AWBURST => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWBURST,
        m_axi_gmem1_AWLOCK => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWLOCK,
        m_axi_gmem1_AWCACHE => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWCACHE,
        m_axi_gmem1_AWPROT => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWPROT,
        m_axi_gmem1_AWQOS => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWQOS,
        m_axi_gmem1_AWREGION => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWREGION,
        m_axi_gmem1_AWUSER => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_AWUSER,
        m_axi_gmem1_WVALID => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WVALID,
        m_axi_gmem1_WREADY => ap_const_logic_0,
        m_axi_gmem1_WDATA => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WDATA,
        m_axi_gmem1_WSTRB => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WSTRB,
        m_axi_gmem1_WLAST => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WLAST,
        m_axi_gmem1_WID => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WID,
        m_axi_gmem1_WUSER => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_WUSER,
        m_axi_gmem1_ARVALID => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARVALID,
        m_axi_gmem1_ARREADY => m_axi_gmem1_ARREADY,
        m_axi_gmem1_ARADDR => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARADDR,
        m_axi_gmem1_ARID => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARID,
        m_axi_gmem1_ARLEN => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLEN,
        m_axi_gmem1_ARSIZE => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARSIZE,
        m_axi_gmem1_ARBURST => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARBURST,
        m_axi_gmem1_ARLOCK => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLOCK,
        m_axi_gmem1_ARCACHE => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARCACHE,
        m_axi_gmem1_ARPROT => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARPROT,
        m_axi_gmem1_ARQOS => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARQOS,
        m_axi_gmem1_ARREGION => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARREGION,
        m_axi_gmem1_ARUSER => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARUSER,
        m_axi_gmem1_RVALID => m_axi_gmem1_RVALID,
        m_axi_gmem1_RREADY => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_RREADY,
        m_axi_gmem1_RDATA => m_axi_gmem1_RDATA,
        m_axi_gmem1_RLAST => m_axi_gmem1_RLAST,
        m_axi_gmem1_RID => m_axi_gmem1_RID,
        m_axi_gmem1_RFIFONUM => m_axi_gmem1_RFIFONUM,
        m_axi_gmem1_RUSER => m_axi_gmem1_RUSER,
        m_axi_gmem1_RRESP => m_axi_gmem1_RRESP,
        m_axi_gmem1_BVALID => ap_const_logic_0,
        m_axi_gmem1_BREADY => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_BREADY,
        m_axi_gmem1_BRESP => ap_const_lv2_0,
        m_axi_gmem1_BID => ap_const_lv1_0,
        m_axi_gmem1_BUSER => ap_const_lv1_0,
        ldata_din => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_din,
        ldata_num_data_valid => ap_const_lv2_0,
        ldata_fifo_cap => ap_const_lv2_0,
        ldata_full_n => ldata_full_n,
        ldata_write => grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_write,
        sext_ln1028 => trunc_ln_reg_430,
        cols_addrbound => cols_addrbound_reg_393);

    mul_31ns_21ns_52_2_1_U18 : component pp_pipeline_accel_mul_31ns_21ns_52_2_1
    generic map (
        ID => 1,
        NUM_STAGE => 2,
        din0_WIDTH => 31,
        din1_WIDTH => 21,
        dout_WIDTH => 52)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_271_p0,
        din1 => grp_fu_271_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_271_p2);

    mul_mul_16ns_16ns_32_3_1_U19 : component pp_pipeline_accel_mul_mul_16ns_16ns_32_3_1
    generic map (
        ID => 1,
        NUM_STAGE => 3,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_316_p0,
        din1 => grp_fu_316_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_316_p2);

    mul_mul_16ns_16ns_32_3_1_U20 : component pp_pipeline_accel_mul_mul_16ns_16ns_32_3_1
    generic map (
        ID => 1,
        NUM_STAGE => 3,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_323_p0,
        din1 => grp_fu_323_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_323_p2);





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
                elsif (((icmp_ln1024_fu_256_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state79)) then 
                    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_ready = ap_const_logic_1)) then 
                    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    r_fu_102_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                r_fu_102 <= ap_const_lv31_0;
            elsif (((ap_const_boolean_0 = ap_block_state80_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state80))) then 
                r_fu_102 <= r_2_reg_415;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                cmp_i82_i_reg_398 <= cmp_i82_i_fu_235_p2;
                cols_addrbound_reg_393 <= add_ln587_fu_189_p2(26 downto 6);
                    zext_ln1028_1_reg_407(20 downto 0) <= zext_ln1028_1_fu_245_p1(20 downto 0);
                    zext_ln1028_reg_402(20 downto 0) <= zext_ln1028_fu_241_p1(20 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                cols_int16_reg_347 <= cols_int16_fu_152_p1;
                icmp_ln1021_reg_352 <= icmp_ln1021_fu_156_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                empty_reg_425 <= grp_fu_271_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                r_2_reg_415 <= r_2_fu_261_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln1021_reg_352 = ap_const_lv1_0))) then
                trunc_ln1540_2_reg_378 <= trunc_ln1540_2_fu_179_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                trunc_ln1540_reg_373 <= trunc_ln1540_fu_176_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                trunc_ln_reg_430 <= empty_226_fu_287_p2(63 downto 3);
            end if;
        end if;
    end process;
    zext_ln1028_reg_402(51 downto 21) <= "0000000000000000000000000000000";
    zext_ln1028_1_reg_407(31 downto 21) <= "00000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, m_axi_gmem1_ARREADY, ap_CS_fsm_state9, cmp_i82_i_reg_398, ap_CS_fsm_state6, icmp_ln1024_fu_256_p2, ap_CS_fsm_state8, ap_CS_fsm_state80, ap_block_state80_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
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
                if (((icmp_ln1024_fu_256_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                if (((cmp_i82_i_reg_398 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                    ap_NS_fsm <= ap_ST_fsm_state80;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when ap_ST_fsm_state9 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state9) and (m_axi_gmem1_ARREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
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
                ap_NS_fsm <= ap_ST_fsm_state70;
            when ap_ST_fsm_state70 => 
                ap_NS_fsm <= ap_ST_fsm_state71;
            when ap_ST_fsm_state71 => 
                ap_NS_fsm <= ap_ST_fsm_state72;
            when ap_ST_fsm_state72 => 
                ap_NS_fsm <= ap_ST_fsm_state73;
            when ap_ST_fsm_state73 => 
                ap_NS_fsm <= ap_ST_fsm_state74;
            when ap_ST_fsm_state74 => 
                ap_NS_fsm <= ap_ST_fsm_state75;
            when ap_ST_fsm_state75 => 
                ap_NS_fsm <= ap_ST_fsm_state76;
            when ap_ST_fsm_state76 => 
                ap_NS_fsm <= ap_ST_fsm_state77;
            when ap_ST_fsm_state77 => 
                ap_NS_fsm <= ap_ST_fsm_state78;
            when ap_ST_fsm_state78 => 
                ap_NS_fsm <= ap_ST_fsm_state79;
            when ap_ST_fsm_state79 => 
                ap_NS_fsm <= ap_ST_fsm_state80;
            when ap_ST_fsm_state80 => 
                if (((ap_const_boolean_0 = ap_block_state80_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state80))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state80;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    add_ln587_1_fu_212_p2 <= std_logic_vector(unsigned(ret_V_31_fu_205_p3) + unsigned(ap_const_lv27_3F));
    add_ln587_fu_189_p2 <= std_logic_vector(unsigned(ret_V_fu_182_p3) + unsigned(ap_const_lv27_3F));
    addrbound_V_fu_228_p3 <= 
        cols_addrbound_fu_195_p4 when (icmp_ln1021_reg_352(0) = '1') else 
        stride_addrbound_fu_218_p4;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state79 <= ap_CS_fsm(78);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state80 <= ap_CS_fsm(79);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
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

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
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
    ap_ST_fsm_state69_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state70_blk <= ap_const_logic_0;
    ap_ST_fsm_state71_blk <= ap_const_logic_0;
    ap_ST_fsm_state72_blk <= ap_const_logic_0;
    ap_ST_fsm_state73_blk <= ap_const_logic_0;
    ap_ST_fsm_state74_blk <= ap_const_logic_0;
    ap_ST_fsm_state75_blk <= ap_const_logic_0;
    ap_ST_fsm_state76_blk <= ap_const_logic_0;
    ap_ST_fsm_state77_blk <= ap_const_logic_0;
    ap_ST_fsm_state78_blk <= ap_const_logic_0;
    ap_ST_fsm_state79_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;

    ap_ST_fsm_state80_blk_assign_proc : process(ap_block_state80_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state80_on_subcall_done)) then 
            ap_ST_fsm_state80_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state80_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state8_blk <= ap_const_logic_0;

    ap_ST_fsm_state9_blk_assign_proc : process(m_axi_gmem1_ARREADY)
    begin
        if ((m_axi_gmem1_ARREADY = ap_const_logic_0)) then 
            ap_ST_fsm_state9_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state9_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_block_state80_on_subcall_done_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_done)
    begin
                ap_block_state80_on_subcall_done <= ((grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_done = ap_const_logic_0) and (cmp_i82_i_reg_398 = ap_const_lv1_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state6, icmp_ln1024_fu_256_p2)
    begin
        if (((icmp_ln1024_fu_256_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state6, icmp_ln1024_fu_256_p2)
    begin
        if (((icmp_ln1024_fu_256_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    cmp_i82_i_fu_235_p2 <= "1" when (cols_addrbound_fu_195_p4 = ap_const_lv21_0) else "0";
    cols_addrbound_fu_195_p4 <= add_ln587_fu_189_p2(26 downto 6);
    cols_int16_fu_152_p1 <= stride(16 - 1 downto 0);
    empty_226_fu_287_p2 <= std_logic_vector(unsigned(p_cast1_i_fu_283_p1) + unsigned(din));

    gmem1_blk_n_AR_assign_proc : process(m_axi_gmem1_ARREADY, ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            gmem1_blk_n_AR <= m_axi_gmem1_ARREADY;
        else 
            gmem1_blk_n_AR <= ap_const_logic_1;
        end if; 
    end process;

    grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ap_start_reg;
    grp_fu_271_p0 <= grp_fu_271_p00(31 - 1 downto 0);
    grp_fu_271_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_fu_102),52));
    grp_fu_271_p1 <= zext_ln1028_reg_402(21 - 1 downto 0);
    grp_fu_316_p0 <= grp_fu_316_p00(16 - 1 downto 0);
    grp_fu_316_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_read2),32));
    grp_fu_316_p1 <= zext_ln232_fu_167_p1(16 - 1 downto 0);
    grp_fu_323_p0 <= grp_fu_323_p00(16 - 1 downto 0);
    grp_fu_323_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(cols_int16_reg_347),32));
    grp_fu_323_p1 <= zext_ln232_fu_167_p1(16 - 1 downto 0);
    icmp_ln1021_fu_156_p2 <= "1" when (stride = ap_const_lv32_FFFFFFFF) else "0";
    icmp_ln1024_fu_256_p2 <= "1" when (signed(zext_ln1024_fu_252_p1) < signed(p_read1)) else "0";
    ldata_din <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_din;

    ldata_write_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_write, ap_CS_fsm_state80)
    begin
        if (((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80))) then 
            ldata_write <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_ldata_write;
        else 
            ldata_write <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem1_ARADDR_assign_proc : process(m_axi_gmem1_ARREADY, ap_CS_fsm_state9, cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARADDR, ap_CS_fsm_state79, ap_CS_fsm_state80, sext_ln1028_fu_302_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (m_axi_gmem1_ARREADY = ap_const_logic_1))) then 
            m_axi_gmem1_ARADDR <= sext_ln1028_fu_302_p1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARADDR <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARADDR;
        else 
            m_axi_gmem1_ARADDR <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    m_axi_gmem1_ARBURST_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARBURST, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARBURST <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARBURST;
        else 
            m_axi_gmem1_ARBURST <= ap_const_lv2_0;
        end if; 
    end process;


    m_axi_gmem1_ARCACHE_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARCACHE, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARCACHE <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARCACHE;
        else 
            m_axi_gmem1_ARCACHE <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem1_ARID_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARID, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARID <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARID;
        else 
            m_axi_gmem1_ARID <= ap_const_lv1_0;
        end if; 
    end process;


    m_axi_gmem1_ARLEN_assign_proc : process(m_axi_gmem1_ARREADY, ap_CS_fsm_state9, cmp_i82_i_reg_398, zext_ln1028_1_reg_407, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLEN, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (m_axi_gmem1_ARREADY = ap_const_logic_1))) then 
            m_axi_gmem1_ARLEN <= zext_ln1028_1_reg_407;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARLEN <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLEN;
        else 
            m_axi_gmem1_ARLEN <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    m_axi_gmem1_ARLOCK_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLOCK, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARLOCK <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARLOCK;
        else 
            m_axi_gmem1_ARLOCK <= ap_const_lv2_0;
        end if; 
    end process;


    m_axi_gmem1_ARPROT_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARPROT, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARPROT <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARPROT;
        else 
            m_axi_gmem1_ARPROT <= ap_const_lv3_0;
        end if; 
    end process;


    m_axi_gmem1_ARQOS_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARQOS, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARQOS <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARQOS;
        else 
            m_axi_gmem1_ARQOS <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem1_ARREGION_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARREGION, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARREGION <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARREGION;
        else 
            m_axi_gmem1_ARREGION <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem1_ARSIZE_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARSIZE, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARSIZE <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARSIZE;
        else 
            m_axi_gmem1_ARSIZE <= ap_const_lv3_0;
        end if; 
    end process;


    m_axi_gmem1_ARUSER_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARUSER, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARUSER <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARUSER;
        else 
            m_axi_gmem1_ARUSER <= ap_const_lv1_0;
        end if; 
    end process;


    m_axi_gmem1_ARVALID_assign_proc : process(m_axi_gmem1_ARREADY, ap_CS_fsm_state9, cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARVALID, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (m_axi_gmem1_ARREADY = ap_const_logic_1))) then 
            m_axi_gmem1_ARVALID <= ap_const_logic_1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_ARVALID <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_ARVALID;
        else 
            m_axi_gmem1_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem1_AWADDR <= ap_const_lv64_0;
    m_axi_gmem1_AWBURST <= ap_const_lv2_0;
    m_axi_gmem1_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem1_AWID <= ap_const_lv1_0;
    m_axi_gmem1_AWLEN <= ap_const_lv32_0;
    m_axi_gmem1_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem1_AWPROT <= ap_const_lv3_0;
    m_axi_gmem1_AWQOS <= ap_const_lv4_0;
    m_axi_gmem1_AWREGION <= ap_const_lv4_0;
    m_axi_gmem1_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem1_AWUSER <= ap_const_lv1_0;
    m_axi_gmem1_AWVALID <= ap_const_logic_0;
    m_axi_gmem1_BREADY <= ap_const_logic_0;

    m_axi_gmem1_RREADY_assign_proc : process(cmp_i82_i_reg_398, grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_RREADY, ap_CS_fsm_state79, ap_CS_fsm_state80)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state79) or ((cmp_i82_i_reg_398 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state80)))) then 
            m_axi_gmem1_RREADY <= grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142_m_axi_gmem1_RREADY;
        else 
            m_axi_gmem1_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem1_WDATA <= ap_const_lv64_0;
    m_axi_gmem1_WID <= ap_const_lv1_0;
    m_axi_gmem1_WLAST <= ap_const_logic_0;
    m_axi_gmem1_WSTRB <= ap_const_lv8_0;
    m_axi_gmem1_WUSER <= ap_const_lv1_0;
    m_axi_gmem1_WVALID <= ap_const_logic_0;
    p_cast1_i_fu_283_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_s_fu_276_p3),64));
    r_2_fu_261_p2 <= std_logic_vector(unsigned(r_fu_102) + unsigned(ap_const_lv31_1));
    ret_V_31_fu_205_p3 <= (trunc_ln1540_2_reg_378 & ap_const_lv3_0);
    ret_V_fu_182_p3 <= (trunc_ln1540_reg_373 & ap_const_lv3_0);
        sext_ln1028_fu_302_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_reg_430),64));

    stride_addrbound_fu_218_p4 <= add_ln587_1_fu_212_p2(26 downto 6);
    tmp_s_fu_276_p3 <= (empty_reg_425 & ap_const_lv3_0);
    trunc_ln1540_2_fu_179_p0 <= grp_fu_323_p2;
    trunc_ln1540_2_fu_179_p1 <= trunc_ln1540_2_fu_179_p0(24 - 1 downto 0);
    trunc_ln1540_fu_176_p0 <= grp_fu_316_p2;
    trunc_ln1540_fu_176_p1 <= trunc_ln1540_fu_176_p0(24 - 1 downto 0);
    zext_ln1024_fu_252_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_fu_102),32));
    zext_ln1028_1_fu_245_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(cols_addrbound_fu_195_p4),32));
    zext_ln1028_fu_241_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(addrbound_V_fu_228_p3),52));
    zext_ln232_fu_167_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_read),32));
end behav;
