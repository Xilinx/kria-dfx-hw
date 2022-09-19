-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_Array2xfMat_64_6_1080_1920_1_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_gmem2_AWVALID : OUT STD_LOGIC;
    m_axi_gmem2_AWREADY : IN STD_LOGIC;
    m_axi_gmem2_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem2_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem2_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_WVALID : OUT STD_LOGIC;
    m_axi_gmem2_WREADY : IN STD_LOGIC;
    m_axi_gmem2_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem2_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem2_WLAST : OUT STD_LOGIC;
    m_axi_gmem2_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_ARVALID : OUT STD_LOGIC;
    m_axi_gmem2_ARREADY : IN STD_LOGIC;
    m_axi_gmem2_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem2_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem2_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_RVALID : IN STD_LOGIC;
    m_axi_gmem2_RREADY : OUT STD_LOGIC;
    m_axi_gmem2_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem2_RLAST : IN STD_LOGIC;
    m_axi_gmem2_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
    m_axi_gmem2_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_BVALID : IN STD_LOGIC;
    m_axi_gmem2_BREADY : OUT STD_LOGIC;
    m_axi_gmem2_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem2_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    img_inp_uv : IN STD_LOGIC_VECTOR (63 downto 0);
    p_read : IN STD_LOGIC_VECTOR (10 downto 0);
    p_read1 : IN STD_LOGIC_VECTOR (10 downto 0);
    imgInput_uv_data_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    imgInput_uv_data_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_uv_data_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_uv_data_full_n : IN STD_LOGIC;
    imgInput_uv_data_write : OUT STD_LOGIC;
    p_read2 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of pp_pipeline_accel_Array2xfMat_64_6_1080_1920_1_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWVALID : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_WVALID : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_WLAST : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARVALID : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_RREADY : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_m_axi_gmem2_BREADY : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_imgInput_uv_data82_din : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_Axi2Mat_fu_64_imgInput_uv_data82_write : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_ap_start : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_ap_done : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_ap_ready : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_ap_idle : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_ap_continue : STD_LOGIC;
    signal grp_Axi2Mat_fu_64_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_sync_grp_Axi2Mat_fu_64_ap_ready : STD_LOGIC;
    signal ap_sync_grp_Axi2Mat_fu_64_ap_done : STD_LOGIC;
    signal ap_block_state3_on_subcall_done : BOOLEAN;
    signal ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready : STD_LOGIC := '0';
    signal ap_sync_reg_grp_Axi2Mat_fu_64_ap_done : STD_LOGIC := '0';
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_Axi2Mat IS
    port (
        m_axi_gmem2_AWVALID : OUT STD_LOGIC;
        m_axi_gmem2_AWREADY : IN STD_LOGIC;
        m_axi_gmem2_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem2_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem2_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem2_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem2_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_WVALID : OUT STD_LOGIC;
        m_axi_gmem2_WREADY : IN STD_LOGIC;
        m_axi_gmem2_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem2_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axi_gmem2_WLAST : OUT STD_LOGIC;
        m_axi_gmem2_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_ARVALID : OUT STD_LOGIC;
        m_axi_gmem2_ARREADY : IN STD_LOGIC;
        m_axi_gmem2_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem2_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem2_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem2_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem2_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_RVALID : IN STD_LOGIC;
        m_axi_gmem2_RREADY : OUT STD_LOGIC;
        m_axi_gmem2_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem2_RLAST : IN STD_LOGIC;
        m_axi_gmem2_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
        m_axi_gmem2_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_BVALID : IN STD_LOGIC;
        m_axi_gmem2_BREADY : OUT STD_LOGIC;
        m_axi_gmem2_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        din : IN STD_LOGIC_VECTOR (63 downto 0);
        imgInput_uv_data82_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        imgInput_uv_data82_full_n : IN STD_LOGIC;
        imgInput_uv_data82_write : OUT STD_LOGIC;
        rows : IN STD_LOGIC_VECTOR (10 downto 0);
        cols : IN STD_LOGIC_VECTOR (10 downto 0);
        stride : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        stride_ap_vld : IN STD_LOGIC;
        rows_ap_vld : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        din_ap_vld : IN STD_LOGIC;
        cols_ap_vld : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;



begin
    grp_Axi2Mat_fu_64 : component pp_pipeline_accel_Axi2Mat
    port map (
        m_axi_gmem2_AWVALID => grp_Axi2Mat_fu_64_m_axi_gmem2_AWVALID,
        m_axi_gmem2_AWREADY => ap_const_logic_0,
        m_axi_gmem2_AWADDR => grp_Axi2Mat_fu_64_m_axi_gmem2_AWADDR,
        m_axi_gmem2_AWID => grp_Axi2Mat_fu_64_m_axi_gmem2_AWID,
        m_axi_gmem2_AWLEN => grp_Axi2Mat_fu_64_m_axi_gmem2_AWLEN,
        m_axi_gmem2_AWSIZE => grp_Axi2Mat_fu_64_m_axi_gmem2_AWSIZE,
        m_axi_gmem2_AWBURST => grp_Axi2Mat_fu_64_m_axi_gmem2_AWBURST,
        m_axi_gmem2_AWLOCK => grp_Axi2Mat_fu_64_m_axi_gmem2_AWLOCK,
        m_axi_gmem2_AWCACHE => grp_Axi2Mat_fu_64_m_axi_gmem2_AWCACHE,
        m_axi_gmem2_AWPROT => grp_Axi2Mat_fu_64_m_axi_gmem2_AWPROT,
        m_axi_gmem2_AWQOS => grp_Axi2Mat_fu_64_m_axi_gmem2_AWQOS,
        m_axi_gmem2_AWREGION => grp_Axi2Mat_fu_64_m_axi_gmem2_AWREGION,
        m_axi_gmem2_AWUSER => grp_Axi2Mat_fu_64_m_axi_gmem2_AWUSER,
        m_axi_gmem2_WVALID => grp_Axi2Mat_fu_64_m_axi_gmem2_WVALID,
        m_axi_gmem2_WREADY => ap_const_logic_0,
        m_axi_gmem2_WDATA => grp_Axi2Mat_fu_64_m_axi_gmem2_WDATA,
        m_axi_gmem2_WSTRB => grp_Axi2Mat_fu_64_m_axi_gmem2_WSTRB,
        m_axi_gmem2_WLAST => grp_Axi2Mat_fu_64_m_axi_gmem2_WLAST,
        m_axi_gmem2_WID => grp_Axi2Mat_fu_64_m_axi_gmem2_WID,
        m_axi_gmem2_WUSER => grp_Axi2Mat_fu_64_m_axi_gmem2_WUSER,
        m_axi_gmem2_ARVALID => grp_Axi2Mat_fu_64_m_axi_gmem2_ARVALID,
        m_axi_gmem2_ARREADY => m_axi_gmem2_ARREADY,
        m_axi_gmem2_ARADDR => grp_Axi2Mat_fu_64_m_axi_gmem2_ARADDR,
        m_axi_gmem2_ARID => grp_Axi2Mat_fu_64_m_axi_gmem2_ARID,
        m_axi_gmem2_ARLEN => grp_Axi2Mat_fu_64_m_axi_gmem2_ARLEN,
        m_axi_gmem2_ARSIZE => grp_Axi2Mat_fu_64_m_axi_gmem2_ARSIZE,
        m_axi_gmem2_ARBURST => grp_Axi2Mat_fu_64_m_axi_gmem2_ARBURST,
        m_axi_gmem2_ARLOCK => grp_Axi2Mat_fu_64_m_axi_gmem2_ARLOCK,
        m_axi_gmem2_ARCACHE => grp_Axi2Mat_fu_64_m_axi_gmem2_ARCACHE,
        m_axi_gmem2_ARPROT => grp_Axi2Mat_fu_64_m_axi_gmem2_ARPROT,
        m_axi_gmem2_ARQOS => grp_Axi2Mat_fu_64_m_axi_gmem2_ARQOS,
        m_axi_gmem2_ARREGION => grp_Axi2Mat_fu_64_m_axi_gmem2_ARREGION,
        m_axi_gmem2_ARUSER => grp_Axi2Mat_fu_64_m_axi_gmem2_ARUSER,
        m_axi_gmem2_RVALID => m_axi_gmem2_RVALID,
        m_axi_gmem2_RREADY => grp_Axi2Mat_fu_64_m_axi_gmem2_RREADY,
        m_axi_gmem2_RDATA => m_axi_gmem2_RDATA,
        m_axi_gmem2_RLAST => m_axi_gmem2_RLAST,
        m_axi_gmem2_RID => m_axi_gmem2_RID,
        m_axi_gmem2_RFIFONUM => m_axi_gmem2_RFIFONUM,
        m_axi_gmem2_RUSER => m_axi_gmem2_RUSER,
        m_axi_gmem2_RRESP => m_axi_gmem2_RRESP,
        m_axi_gmem2_BVALID => ap_const_logic_0,
        m_axi_gmem2_BREADY => grp_Axi2Mat_fu_64_m_axi_gmem2_BREADY,
        m_axi_gmem2_BRESP => ap_const_lv2_0,
        m_axi_gmem2_BID => ap_const_lv1_0,
        m_axi_gmem2_BUSER => ap_const_lv1_0,
        din => img_inp_uv,
        imgInput_uv_data82_din => grp_Axi2Mat_fu_64_imgInput_uv_data82_din,
        imgInput_uv_data82_full_n => imgInput_uv_data_full_n,
        imgInput_uv_data82_write => grp_Axi2Mat_fu_64_imgInput_uv_data82_write,
        rows => p_read,
        cols => p_read1,
        stride => p_read2,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        stride_ap_vld => ap_const_logic_1,
        rows_ap_vld => ap_const_logic_1,
        ap_start => grp_Axi2Mat_fu_64_ap_start,
        din_ap_vld => ap_const_logic_1,
        cols_ap_vld => ap_const_logic_1,
        ap_done => grp_Axi2Mat_fu_64_ap_done,
        ap_ready => grp_Axi2Mat_fu_64_ap_ready,
        ap_idle => grp_Axi2Mat_fu_64_ap_idle,
        ap_continue => grp_Axi2Mat_fu_64_ap_continue);





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
                elsif (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_Axi2Mat_fu_64_ap_done_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_Axi2Mat_fu_64_ap_done <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
                    ap_sync_reg_grp_Axi2Mat_fu_64_ap_done <= ap_const_logic_0;
                elsif ((grp_Axi2Mat_fu_64_ap_done = ap_const_logic_1)) then 
                    ap_sync_reg_grp_Axi2Mat_fu_64_ap_done <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
                    ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready <= ap_const_logic_0;
                elsif ((grp_Axi2Mat_fu_64_ap_ready = ap_const_logic_1)) then 
                    ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_Axi2Mat_fu_64_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_Axi2Mat_fu_64_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_sync_grp_Axi2Mat_fu_64_ap_ready = ap_const_logic_0)))) then 
                    grp_Axi2Mat_fu_64_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_Axi2Mat_fu_64_ap_ready = ap_const_logic_1)) then 
                    grp_Axi2Mat_fu_64_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state3, ap_block_state3_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(ap_block_state3_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state3_on_subcall_done)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state3_on_subcall_done_assign_proc : process(ap_sync_grp_Axi2Mat_fu_64_ap_ready, ap_sync_grp_Axi2Mat_fu_64_ap_done)
    begin
                ap_block_state3_on_subcall_done <= ((ap_sync_grp_Axi2Mat_fu_64_ap_ready and ap_sync_grp_Axi2Mat_fu_64_ap_done) = ap_const_logic_0);
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state3, ap_block_state3_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state3, ap_block_state3_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_sync_grp_Axi2Mat_fu_64_ap_done <= (grp_Axi2Mat_fu_64_ap_done or ap_sync_reg_grp_Axi2Mat_fu_64_ap_done);
    ap_sync_grp_Axi2Mat_fu_64_ap_ready <= (grp_Axi2Mat_fu_64_ap_ready or ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready);

    grp_Axi2Mat_fu_64_ap_continue_assign_proc : process(ap_CS_fsm_state3, ap_block_state3_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
            grp_Axi2Mat_fu_64_ap_continue <= ap_const_logic_1;
        else 
            grp_Axi2Mat_fu_64_ap_continue <= ap_const_logic_0;
        end if; 
    end process;

    grp_Axi2Mat_fu_64_ap_start <= grp_Axi2Mat_fu_64_ap_start_reg;
    imgInput_uv_data_din <= grp_Axi2Mat_fu_64_imgInput_uv_data82_din;

    imgInput_uv_data_write_assign_proc : process(grp_Axi2Mat_fu_64_imgInput_uv_data82_write, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            imgInput_uv_data_write <= grp_Axi2Mat_fu_64_imgInput_uv_data82_write;
        else 
            imgInput_uv_data_write <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem2_ARADDR <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARADDR;
    m_axi_gmem2_ARBURST <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARBURST;
    m_axi_gmem2_ARCACHE <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARCACHE;
    m_axi_gmem2_ARID <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARID;
    m_axi_gmem2_ARLEN <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARLEN;
    m_axi_gmem2_ARLOCK <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARLOCK;
    m_axi_gmem2_ARPROT <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARPROT;
    m_axi_gmem2_ARQOS <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARQOS;
    m_axi_gmem2_ARREGION <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARREGION;
    m_axi_gmem2_ARSIZE <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARSIZE;
    m_axi_gmem2_ARUSER <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARUSER;

    m_axi_gmem2_ARVALID_assign_proc : process(ap_CS_fsm_state2, grp_Axi2Mat_fu_64_m_axi_gmem2_ARVALID, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_gmem2_ARVALID <= grp_Axi2Mat_fu_64_m_axi_gmem2_ARVALID;
        else 
            m_axi_gmem2_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem2_AWADDR <= ap_const_lv64_0;
    m_axi_gmem2_AWBURST <= ap_const_lv2_0;
    m_axi_gmem2_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem2_AWID <= ap_const_lv1_0;
    m_axi_gmem2_AWLEN <= ap_const_lv32_0;
    m_axi_gmem2_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem2_AWPROT <= ap_const_lv3_0;
    m_axi_gmem2_AWQOS <= ap_const_lv4_0;
    m_axi_gmem2_AWREGION <= ap_const_lv4_0;
    m_axi_gmem2_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem2_AWUSER <= ap_const_lv1_0;
    m_axi_gmem2_AWVALID <= ap_const_logic_0;
    m_axi_gmem2_BREADY <= ap_const_logic_0;

    m_axi_gmem2_RREADY_assign_proc : process(ap_CS_fsm_state2, grp_Axi2Mat_fu_64_m_axi_gmem2_RREADY, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_gmem2_RREADY <= grp_Axi2Mat_fu_64_m_axi_gmem2_RREADY;
        else 
            m_axi_gmem2_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem2_WDATA <= ap_const_lv64_0;
    m_axi_gmem2_WID <= ap_const_lv1_0;
    m_axi_gmem2_WLAST <= ap_const_logic_0;
    m_axi_gmem2_WSTRB <= ap_const_lv8_0;
    m_axi_gmem2_WUSER <= ap_const_lv1_0;
    m_axi_gmem2_WVALID <= ap_const_logic_0;
end behav;
