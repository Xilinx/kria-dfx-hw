-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_AxiStream2Axi is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ldata1_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    ldata1_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_empty_n : IN STD_LOGIC;
    ldata1_read : OUT STD_LOGIC;
    m_axi_gmem3_AWVALID : OUT STD_LOGIC;
    m_axi_gmem3_AWREADY : IN STD_LOGIC;
    m_axi_gmem3_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem3_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem3_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_WVALID : OUT STD_LOGIC;
    m_axi_gmem3_WREADY : IN STD_LOGIC;
    m_axi_gmem3_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem3_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem3_WLAST : OUT STD_LOGIC;
    m_axi_gmem3_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_ARVALID : OUT STD_LOGIC;
    m_axi_gmem3_ARREADY : IN STD_LOGIC;
    m_axi_gmem3_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem3_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem3_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_RVALID : IN STD_LOGIC;
    m_axi_gmem3_RREADY : OUT STD_LOGIC;
    m_axi_gmem3_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem3_RLAST : IN STD_LOGIC;
    m_axi_gmem3_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
    m_axi_gmem3_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_BVALID : IN STD_LOGIC;
    m_axi_gmem3_BREADY : OUT STD_LOGIC;
    m_axi_gmem3_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    dout_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    dout_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    dout_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    dout_empty_n : IN STD_LOGIC;
    dout_read : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (18 downto 0) );
end;


architecture behav of pp_pipeline_accel_AxiStream2Axi is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000001000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000010000000000000000000";
    constant ap_ST_fsm_state21 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000100000000000000000000";
    constant ap_ST_fsm_state22 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000001000000000000000000000";
    constant ap_ST_fsm_state23 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000010000000000000000000000";
    constant ap_ST_fsm_state24 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000100000000000000000000000";
    constant ap_ST_fsm_state25 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000001000000000000000000000000";
    constant ap_ST_fsm_state26 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000010000000000000000000000000";
    constant ap_ST_fsm_state27 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000100000000000000000000000000";
    constant ap_ST_fsm_state28 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000001000000000000000000000000000";
    constant ap_ST_fsm_state29 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000010000000000000000000000000000";
    constant ap_ST_fsm_state30 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000100000000000000000000000000000";
    constant ap_ST_fsm_state31 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000001000000000000000000000000000000";
    constant ap_ST_fsm_state32 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000010000000000000000000000000000000";
    constant ap_ST_fsm_state33 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000100000000000000000000000000000000";
    constant ap_ST_fsm_state34 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000001000000000000000000000000000000000";
    constant ap_ST_fsm_state35 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000010000000000000000000000000000000000";
    constant ap_ST_fsm_state36 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000100000000000000000000000000000000000";
    constant ap_ST_fsm_state37 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000001000000000000000000000000000000000000";
    constant ap_ST_fsm_state38 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000010000000000000000000000000000000000000";
    constant ap_ST_fsm_state39 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000100000000000000000000000000000000000000";
    constant ap_ST_fsm_state40 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000001000000000000000000000000000000000000000";
    constant ap_ST_fsm_state41 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000010000000000000000000000000000000000000000";
    constant ap_ST_fsm_state42 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000100000000000000000000000000000000000000000";
    constant ap_ST_fsm_state43 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000001000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state44 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000010000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state45 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000100000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state46 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000001000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state47 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000010000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state48 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000100000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state49 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000001000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state50 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000010000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state51 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000100000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state52 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000001000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state53 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000010000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state54 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000100000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state55 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000001000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state56 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000010000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state57 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000100000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state58 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000001000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state59 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000010000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state60 : STD_LOGIC_VECTOR (71 downto 0) := "000000000000100000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state61 : STD_LOGIC_VECTOR (71 downto 0) := "000000000001000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state62 : STD_LOGIC_VECTOR (71 downto 0) := "000000000010000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state63 : STD_LOGIC_VECTOR (71 downto 0) := "000000000100000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state64 : STD_LOGIC_VECTOR (71 downto 0) := "000000001000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state65 : STD_LOGIC_VECTOR (71 downto 0) := "000000010000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state66 : STD_LOGIC_VECTOR (71 downto 0) := "000000100000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state67 : STD_LOGIC_VECTOR (71 downto 0) := "000001000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state68 : STD_LOGIC_VECTOR (71 downto 0) := "000010000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state69 : STD_LOGIC_VECTOR (71 downto 0) := "000100000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state70 : STD_LOGIC_VECTOR (71 downto 0) := "001000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state71 : STD_LOGIC_VECTOR (71 downto 0) := "010000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state72 : STD_LOGIC_VECTOR (71 downto 0) := "100000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_47 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000111";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (71 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal gmem3_blk_n_AW : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal gmem3_blk_n_B : STD_LOGIC;
    signal ap_CS_fsm_state72 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state72 : signal is "none";
    signal icmp_ln1073_reg_121 : STD_LOGIC_VECTOR (0 downto 0);
    signal dout_blk_n : STD_LOGIC;
    signal icmp_ln1073_fu_85_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln_reg_125 : STD_LOGIC_VECTOR (60 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_done : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_idle : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_ready : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ldata1_read : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWVALID : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WVALID : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WLAST : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARVALID : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_RREADY : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_BREADY : STD_LOGIC;
    signal grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal sext_ln1387_fu_101_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln1387_fu_111_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state72 : BOOLEAN;
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (71 downto 0);
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
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_AxiStream2Axi_Pipeline_MMIterOutLoop2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ldata1_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        ldata1_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        ldata1_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        ldata1_empty_n : IN STD_LOGIC;
        ldata1_read : OUT STD_LOGIC;
        m_axi_gmem3_AWVALID : OUT STD_LOGIC;
        m_axi_gmem3_AWREADY : IN STD_LOGIC;
        m_axi_gmem3_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem3_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_WVALID : OUT STD_LOGIC;
        m_axi_gmem3_WREADY : IN STD_LOGIC;
        m_axi_gmem3_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axi_gmem3_WLAST : OUT STD_LOGIC;
        m_axi_gmem3_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_ARVALID : OUT STD_LOGIC;
        m_axi_gmem3_ARREADY : IN STD_LOGIC;
        m_axi_gmem3_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem3_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RVALID : IN STD_LOGIC;
        m_axi_gmem3_RREADY : OUT STD_LOGIC;
        m_axi_gmem3_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_RLAST : IN STD_LOGIC;
        m_axi_gmem3_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
        m_axi_gmem3_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_BVALID : IN STD_LOGIC;
        m_axi_gmem3_BREADY : OUT STD_LOGIC;
        m_axi_gmem3_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        sext_ln1387 : IN STD_LOGIC_VECTOR (60 downto 0);
        p_read : IN STD_LOGIC_VECTOR (18 downto 0) );
    end component;



begin
    grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75 : component pp_pipeline_accel_AxiStream2Axi_Pipeline_MMIterOutLoop2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start,
        ap_done => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_done,
        ap_idle => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_idle,
        ap_ready => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_ready,
        ldata1_dout => ldata1_dout,
        ldata1_num_data_valid => ap_const_lv2_0,
        ldata1_fifo_cap => ap_const_lv2_0,
        ldata1_empty_n => ldata1_empty_n,
        ldata1_read => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ldata1_read,
        m_axi_gmem3_AWVALID => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWVALID,
        m_axi_gmem3_AWREADY => m_axi_gmem3_AWREADY,
        m_axi_gmem3_AWADDR => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWADDR,
        m_axi_gmem3_AWID => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWID,
        m_axi_gmem3_AWLEN => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWLEN,
        m_axi_gmem3_AWSIZE => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWSIZE,
        m_axi_gmem3_AWBURST => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWBURST,
        m_axi_gmem3_AWLOCK => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWLOCK,
        m_axi_gmem3_AWCACHE => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWCACHE,
        m_axi_gmem3_AWPROT => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWPROT,
        m_axi_gmem3_AWQOS => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWQOS,
        m_axi_gmem3_AWREGION => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWREGION,
        m_axi_gmem3_AWUSER => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWUSER,
        m_axi_gmem3_WVALID => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WVALID,
        m_axi_gmem3_WREADY => m_axi_gmem3_WREADY,
        m_axi_gmem3_WDATA => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WDATA,
        m_axi_gmem3_WSTRB => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WSTRB,
        m_axi_gmem3_WLAST => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WLAST,
        m_axi_gmem3_WID => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WID,
        m_axi_gmem3_WUSER => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WUSER,
        m_axi_gmem3_ARVALID => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARVALID,
        m_axi_gmem3_ARREADY => ap_const_logic_0,
        m_axi_gmem3_ARADDR => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARADDR,
        m_axi_gmem3_ARID => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARID,
        m_axi_gmem3_ARLEN => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARLEN,
        m_axi_gmem3_ARSIZE => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARSIZE,
        m_axi_gmem3_ARBURST => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARBURST,
        m_axi_gmem3_ARLOCK => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARLOCK,
        m_axi_gmem3_ARCACHE => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARCACHE,
        m_axi_gmem3_ARPROT => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARPROT,
        m_axi_gmem3_ARQOS => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARQOS,
        m_axi_gmem3_ARREGION => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARREGION,
        m_axi_gmem3_ARUSER => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_ARUSER,
        m_axi_gmem3_RVALID => ap_const_logic_0,
        m_axi_gmem3_RREADY => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_RREADY,
        m_axi_gmem3_RDATA => ap_const_lv64_0,
        m_axi_gmem3_RLAST => ap_const_logic_0,
        m_axi_gmem3_RID => ap_const_lv1_0,
        m_axi_gmem3_RFIFONUM => ap_const_lv9_0,
        m_axi_gmem3_RUSER => ap_const_lv1_0,
        m_axi_gmem3_RRESP => ap_const_lv2_0,
        m_axi_gmem3_BVALID => m_axi_gmem3_BVALID,
        m_axi_gmem3_BREADY => grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_BREADY,
        m_axi_gmem3_BRESP => m_axi_gmem3_BRESP,
        m_axi_gmem3_BID => m_axi_gmem3_BID,
        m_axi_gmem3_BUSER => m_axi_gmem3_BUSER,
        sext_ln1387 => trunc_ln_reg_125,
        p_read => p_read);





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
                elsif ((not(((icmp_ln1073_reg_121 = ap_const_lv1_0) and (m_axi_gmem3_BVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state72))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_ready = ap_const_logic_1)) then 
                    grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                icmp_ln1073_reg_121 <= icmp_ln1073_fu_85_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (icmp_ln1073_fu_85_p2 = ap_const_lv1_0))) then
                trunc_ln_reg_125 <= dout_dout(63 downto 3);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, m_axi_gmem3_AWREADY, m_axi_gmem3_BVALID, dout_empty_n, ap_CS_fsm_state2, ap_CS_fsm_state72, icmp_ln1073_reg_121, icmp_ln1073_fu_85_p2, grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_done, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (dout_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1) and (icmp_ln1073_fu_85_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state72;
                elsif ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (dout_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1) and (icmp_ln1073_fu_85_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (m_axi_gmem3_AWREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
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
                ap_NS_fsm <= ap_ST_fsm_state70;
            when ap_ST_fsm_state70 => 
                ap_NS_fsm <= ap_ST_fsm_state71;
            when ap_ST_fsm_state71 => 
                ap_NS_fsm <= ap_ST_fsm_state72;
            when ap_ST_fsm_state72 => 
                if ((not(((icmp_ln1073_reg_121 = ap_const_lv1_0) and (m_axi_gmem3_BVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state72))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state72;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state72 <= ap_CS_fsm(71);
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

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, dout_empty_n)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (dout_empty_n = ap_const_logic_0))) then 
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

    ap_ST_fsm_state2_blk_assign_proc : process(m_axi_gmem3_AWREADY)
    begin
        if ((m_axi_gmem3_AWREADY = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

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

    ap_ST_fsm_state4_blk_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_done)
    begin
        if ((grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

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

    ap_ST_fsm_state72_blk_assign_proc : process(m_axi_gmem3_BVALID, icmp_ln1073_reg_121)
    begin
        if (((icmp_ln1073_reg_121 = ap_const_lv1_0) and (m_axi_gmem3_BVALID = ap_const_logic_0))) then 
            ap_ST_fsm_state72_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state72_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, dout_empty_n)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (dout_empty_n = ap_const_logic_0));
    end process;


    ap_block_state72_assign_proc : process(m_axi_gmem3_BVALID, icmp_ln1073_reg_121)
    begin
                ap_block_state72 <= ((icmp_ln1073_reg_121 = ap_const_lv1_0) and (m_axi_gmem3_BVALID = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, m_axi_gmem3_BVALID, ap_CS_fsm_state72, icmp_ln1073_reg_121)
    begin
        if ((not(((icmp_ln1073_reg_121 = ap_const_lv1_0) and (m_axi_gmem3_BVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state72))) then 
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


    ap_ready_assign_proc : process(m_axi_gmem3_BVALID, ap_CS_fsm_state72, icmp_ln1073_reg_121)
    begin
        if ((not(((icmp_ln1073_reg_121 = ap_const_lv1_0) and (m_axi_gmem3_BVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state72))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    dout_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dout_empty_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dout_blk_n <= dout_empty_n;
        else 
            dout_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    dout_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dout_empty_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0) or (dout_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dout_read <= ap_const_logic_1;
        else 
            dout_read <= ap_const_logic_0;
        end if; 
    end process;


    gmem3_blk_n_AW_assign_proc : process(m_axi_gmem3_AWREADY, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            gmem3_blk_n_AW <= m_axi_gmem3_AWREADY;
        else 
            gmem3_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    gmem3_blk_n_B_assign_proc : process(m_axi_gmem3_BVALID, ap_CS_fsm_state72, icmp_ln1073_reg_121)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state72) and (icmp_ln1073_reg_121 = ap_const_lv1_0))) then 
            gmem3_blk_n_B <= m_axi_gmem3_BVALID;
        else 
            gmem3_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;

    grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ap_start_reg;
    icmp_ln1073_fu_85_p2 <= "1" when (p_read = ap_const_lv19_0) else "0";

    ldata1_read_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ldata1_read, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ldata1_read <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_ldata1_read;
        else 
            ldata1_read <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem3_ARADDR <= ap_const_lv64_0;
    m_axi_gmem3_ARBURST <= ap_const_lv2_0;
    m_axi_gmem3_ARCACHE <= ap_const_lv4_0;
    m_axi_gmem3_ARID <= ap_const_lv1_0;
    m_axi_gmem3_ARLEN <= ap_const_lv32_0;
    m_axi_gmem3_ARLOCK <= ap_const_lv2_0;
    m_axi_gmem3_ARPROT <= ap_const_lv3_0;
    m_axi_gmem3_ARQOS <= ap_const_lv4_0;
    m_axi_gmem3_ARREGION <= ap_const_lv4_0;
    m_axi_gmem3_ARSIZE <= ap_const_lv3_0;
    m_axi_gmem3_ARUSER <= ap_const_lv1_0;
    m_axi_gmem3_ARVALID <= ap_const_logic_0;

    m_axi_gmem3_AWADDR_assign_proc : process(m_axi_gmem3_AWREADY, ap_CS_fsm_state2, grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWADDR, ap_CS_fsm_state3, ap_CS_fsm_state4, sext_ln1387_fu_101_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (m_axi_gmem3_AWREADY = ap_const_logic_1))) then 
            m_axi_gmem3_AWADDR <= sext_ln1387_fu_101_p1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWADDR <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWADDR;
        else 
            m_axi_gmem3_AWADDR <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    m_axi_gmem3_AWBURST_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWBURST, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWBURST <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWBURST;
        else 
            m_axi_gmem3_AWBURST <= ap_const_lv2_0;
        end if; 
    end process;


    m_axi_gmem3_AWCACHE_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWCACHE, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWCACHE <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWCACHE;
        else 
            m_axi_gmem3_AWCACHE <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem3_AWID_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWID, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWID <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWID;
        else 
            m_axi_gmem3_AWID <= ap_const_lv1_0;
        end if; 
    end process;


    m_axi_gmem3_AWLEN_assign_proc : process(m_axi_gmem3_AWREADY, ap_CS_fsm_state2, grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWLEN, ap_CS_fsm_state3, ap_CS_fsm_state4, zext_ln1387_fu_111_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (m_axi_gmem3_AWREADY = ap_const_logic_1))) then 
            m_axi_gmem3_AWLEN <= zext_ln1387_fu_111_p1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWLEN <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWLEN;
        else 
            m_axi_gmem3_AWLEN <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    m_axi_gmem3_AWLOCK_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWLOCK, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWLOCK <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWLOCK;
        else 
            m_axi_gmem3_AWLOCK <= ap_const_lv2_0;
        end if; 
    end process;


    m_axi_gmem3_AWPROT_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWPROT, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWPROT <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWPROT;
        else 
            m_axi_gmem3_AWPROT <= ap_const_lv3_0;
        end if; 
    end process;


    m_axi_gmem3_AWQOS_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWQOS, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWQOS <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWQOS;
        else 
            m_axi_gmem3_AWQOS <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem3_AWREGION_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWREGION, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWREGION <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWREGION;
        else 
            m_axi_gmem3_AWREGION <= ap_const_lv4_0;
        end if; 
    end process;


    m_axi_gmem3_AWSIZE_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWSIZE, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWSIZE <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWSIZE;
        else 
            m_axi_gmem3_AWSIZE <= ap_const_lv3_0;
        end if; 
    end process;


    m_axi_gmem3_AWUSER_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWUSER, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWUSER <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWUSER;
        else 
            m_axi_gmem3_AWUSER <= ap_const_lv1_0;
        end if; 
    end process;


    m_axi_gmem3_AWVALID_assign_proc : process(m_axi_gmem3_AWREADY, ap_CS_fsm_state2, grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWVALID, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (m_axi_gmem3_AWREADY = ap_const_logic_1))) then 
            m_axi_gmem3_AWVALID <= ap_const_logic_1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_AWVALID <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_AWVALID;
        else 
            m_axi_gmem3_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem3_BREADY_assign_proc : process(m_axi_gmem3_BVALID, ap_CS_fsm_state72, icmp_ln1073_reg_121, grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_BREADY, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if ((not(((icmp_ln1073_reg_121 = ap_const_lv1_0) and (m_axi_gmem3_BVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state72) and (icmp_ln1073_reg_121 = ap_const_lv1_0))) then 
            m_axi_gmem3_BREADY <= ap_const_logic_1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_BREADY <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_BREADY;
        else 
            m_axi_gmem3_BREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem3_RREADY <= ap_const_logic_0;
    m_axi_gmem3_WDATA <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WDATA;
    m_axi_gmem3_WID <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WID;
    m_axi_gmem3_WLAST <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WLAST;
    m_axi_gmem3_WSTRB <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WSTRB;
    m_axi_gmem3_WUSER <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WUSER;

    m_axi_gmem3_WVALID_assign_proc : process(grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WVALID, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem3_WVALID <= grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75_m_axi_gmem3_WVALID;
        else 
            m_axi_gmem3_WVALID <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln1387_fu_101_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_reg_125),64));

    zext_ln1387_fu_111_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_read),32));
end behav;
