-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_xfMat2Array_64_9_720_720_1_1_s is
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
    out_mat_data85_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    out_mat_data85_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    out_mat_data85_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    out_mat_data85_empty_n : IN STD_LOGIC;
    out_mat_data85_read : OUT STD_LOGIC;
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
    dstPtr_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    dstPtr_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    dstPtr_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    dstPtr_empty_n : IN STD_LOGIC;
    dstPtr_read : OUT STD_LOGIC;
    stride_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    stride_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    stride_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    stride_empty_n : IN STD_LOGIC;
    stride_read : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_xfMat2Array_64_9_720_720_1_1_s is 
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
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal dstPtr_blk_n : STD_LOGIC;
    signal stride_blk_n : STD_LOGIC;
    signal stride_read_reg_93 : STD_LOGIC_VECTOR (31 downto 0);
    signal dstPtr_read_reg_98 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln1565_fu_84_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln1565_reg_103 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_Mat2Axi_fu_72_out_mat_data85_read : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWVALID : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_WVALID : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_WLAST : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARVALID : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_RREADY : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_m_axi_gmem3_BREADY : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_ap_start : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_ap_done : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_ap_ready : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_ap_idle : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_ap_continue : STD_LOGIC;
    signal grp_Mat2Axi_fu_72_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_sync_grp_Mat2Axi_fu_72_ap_ready : STD_LOGIC;
    signal ap_sync_grp_Mat2Axi_fu_72_ap_done : STD_LOGIC;
    signal ap_block_state3_on_subcall_done : BOOLEAN;
    signal ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready : STD_LOGIC := '0';
    signal ap_sync_reg_grp_Mat2Axi_fu_72_ap_done : STD_LOGIC := '0';
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_Mat2Axi IS
    port (
        out_mat_data85_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        out_mat_data85_empty_n : IN STD_LOGIC;
        out_mat_data85_read : OUT STD_LOGIC;
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
        dout : IN STD_LOGIC_VECTOR (63 downto 0);
        rows : IN STD_LOGIC_VECTOR (15 downto 0);
        cols : IN STD_LOGIC_VECTOR (31 downto 0);
        stride : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        dout_ap_vld : IN STD_LOGIC;
        rows_ap_vld : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        stride_ap_vld : IN STD_LOGIC;
        cols_ap_vld : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;



begin
    grp_Mat2Axi_fu_72 : component pp_pipeline_accel_Mat2Axi
    port map (
        out_mat_data85_dout => out_mat_data85_dout,
        out_mat_data85_empty_n => out_mat_data85_empty_n,
        out_mat_data85_read => grp_Mat2Axi_fu_72_out_mat_data85_read,
        m_axi_gmem3_AWVALID => grp_Mat2Axi_fu_72_m_axi_gmem3_AWVALID,
        m_axi_gmem3_AWREADY => m_axi_gmem3_AWREADY,
        m_axi_gmem3_AWADDR => grp_Mat2Axi_fu_72_m_axi_gmem3_AWADDR,
        m_axi_gmem3_AWID => grp_Mat2Axi_fu_72_m_axi_gmem3_AWID,
        m_axi_gmem3_AWLEN => grp_Mat2Axi_fu_72_m_axi_gmem3_AWLEN,
        m_axi_gmem3_AWSIZE => grp_Mat2Axi_fu_72_m_axi_gmem3_AWSIZE,
        m_axi_gmem3_AWBURST => grp_Mat2Axi_fu_72_m_axi_gmem3_AWBURST,
        m_axi_gmem3_AWLOCK => grp_Mat2Axi_fu_72_m_axi_gmem3_AWLOCK,
        m_axi_gmem3_AWCACHE => grp_Mat2Axi_fu_72_m_axi_gmem3_AWCACHE,
        m_axi_gmem3_AWPROT => grp_Mat2Axi_fu_72_m_axi_gmem3_AWPROT,
        m_axi_gmem3_AWQOS => grp_Mat2Axi_fu_72_m_axi_gmem3_AWQOS,
        m_axi_gmem3_AWREGION => grp_Mat2Axi_fu_72_m_axi_gmem3_AWREGION,
        m_axi_gmem3_AWUSER => grp_Mat2Axi_fu_72_m_axi_gmem3_AWUSER,
        m_axi_gmem3_WVALID => grp_Mat2Axi_fu_72_m_axi_gmem3_WVALID,
        m_axi_gmem3_WREADY => m_axi_gmem3_WREADY,
        m_axi_gmem3_WDATA => grp_Mat2Axi_fu_72_m_axi_gmem3_WDATA,
        m_axi_gmem3_WSTRB => grp_Mat2Axi_fu_72_m_axi_gmem3_WSTRB,
        m_axi_gmem3_WLAST => grp_Mat2Axi_fu_72_m_axi_gmem3_WLAST,
        m_axi_gmem3_WID => grp_Mat2Axi_fu_72_m_axi_gmem3_WID,
        m_axi_gmem3_WUSER => grp_Mat2Axi_fu_72_m_axi_gmem3_WUSER,
        m_axi_gmem3_ARVALID => grp_Mat2Axi_fu_72_m_axi_gmem3_ARVALID,
        m_axi_gmem3_ARREADY => ap_const_logic_0,
        m_axi_gmem3_ARADDR => grp_Mat2Axi_fu_72_m_axi_gmem3_ARADDR,
        m_axi_gmem3_ARID => grp_Mat2Axi_fu_72_m_axi_gmem3_ARID,
        m_axi_gmem3_ARLEN => grp_Mat2Axi_fu_72_m_axi_gmem3_ARLEN,
        m_axi_gmem3_ARSIZE => grp_Mat2Axi_fu_72_m_axi_gmem3_ARSIZE,
        m_axi_gmem3_ARBURST => grp_Mat2Axi_fu_72_m_axi_gmem3_ARBURST,
        m_axi_gmem3_ARLOCK => grp_Mat2Axi_fu_72_m_axi_gmem3_ARLOCK,
        m_axi_gmem3_ARCACHE => grp_Mat2Axi_fu_72_m_axi_gmem3_ARCACHE,
        m_axi_gmem3_ARPROT => grp_Mat2Axi_fu_72_m_axi_gmem3_ARPROT,
        m_axi_gmem3_ARQOS => grp_Mat2Axi_fu_72_m_axi_gmem3_ARQOS,
        m_axi_gmem3_ARREGION => grp_Mat2Axi_fu_72_m_axi_gmem3_ARREGION,
        m_axi_gmem3_ARUSER => grp_Mat2Axi_fu_72_m_axi_gmem3_ARUSER,
        m_axi_gmem3_RVALID => ap_const_logic_0,
        m_axi_gmem3_RREADY => grp_Mat2Axi_fu_72_m_axi_gmem3_RREADY,
        m_axi_gmem3_RDATA => ap_const_lv64_0,
        m_axi_gmem3_RLAST => ap_const_logic_0,
        m_axi_gmem3_RID => ap_const_lv1_0,
        m_axi_gmem3_RFIFONUM => ap_const_lv9_0,
        m_axi_gmem3_RUSER => ap_const_lv1_0,
        m_axi_gmem3_RRESP => ap_const_lv2_0,
        m_axi_gmem3_BVALID => m_axi_gmem3_BVALID,
        m_axi_gmem3_BREADY => grp_Mat2Axi_fu_72_m_axi_gmem3_BREADY,
        m_axi_gmem3_BRESP => m_axi_gmem3_BRESP,
        m_axi_gmem3_BID => m_axi_gmem3_BID,
        m_axi_gmem3_BUSER => m_axi_gmem3_BUSER,
        dout => dstPtr_read_reg_98,
        rows => trunc_ln1565_reg_103,
        cols => p_read1,
        stride => stride_read_reg_93,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        dout_ap_vld => ap_const_logic_1,
        rows_ap_vld => ap_const_logic_1,
        ap_start => grp_Mat2Axi_fu_72_ap_start,
        stride_ap_vld => ap_const_logic_1,
        cols_ap_vld => ap_const_logic_1,
        ap_done => grp_Mat2Axi_fu_72_ap_done,
        ap_ready => grp_Mat2Axi_fu_72_ap_ready,
        ap_idle => grp_Mat2Axi_fu_72_ap_idle,
        ap_continue => grp_Mat2Axi_fu_72_ap_continue);





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


    ap_sync_reg_grp_Mat2Axi_fu_72_ap_done_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_Mat2Axi_fu_72_ap_done <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
                    ap_sync_reg_grp_Mat2Axi_fu_72_ap_done <= ap_const_logic_0;
                elsif ((grp_Mat2Axi_fu_72_ap_done = ap_const_logic_1)) then 
                    ap_sync_reg_grp_Mat2Axi_fu_72_ap_done <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
                    ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready <= ap_const_logic_0;
                elsif ((grp_Mat2Axi_fu_72_ap_ready = ap_const_logic_1)) then 
                    ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_Mat2Axi_fu_72_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_Mat2Axi_fu_72_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_sync_grp_Mat2Axi_fu_72_ap_ready = ap_const_logic_0)))) then 
                    grp_Mat2Axi_fu_72_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_Mat2Axi_fu_72_ap_ready = ap_const_logic_1)) then 
                    grp_Mat2Axi_fu_72_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                dstPtr_read_reg_98 <= dstPtr_dout;
                stride_read_reg_93 <= stride_dout;
                trunc_ln1565_reg_103 <= trunc_ln1565_fu_84_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, dstPtr_empty_n, stride_empty_n, ap_CS_fsm_state3, ap_block_state3_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((dstPtr_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (stride_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
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

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, dstPtr_empty_n, stride_empty_n)
    begin
        if (((dstPtr_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (stride_empty_n = ap_const_logic_0))) then 
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


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, dstPtr_empty_n, stride_empty_n)
    begin
                ap_block_state1 <= ((dstPtr_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (stride_empty_n = ap_const_logic_0));
    end process;


    ap_block_state3_on_subcall_done_assign_proc : process(ap_sync_grp_Mat2Axi_fu_72_ap_ready, ap_sync_grp_Mat2Axi_fu_72_ap_done)
    begin
                ap_block_state3_on_subcall_done <= ((ap_sync_grp_Mat2Axi_fu_72_ap_ready and ap_sync_grp_Mat2Axi_fu_72_ap_done) = ap_const_logic_0);
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

    ap_sync_grp_Mat2Axi_fu_72_ap_done <= (grp_Mat2Axi_fu_72_ap_done or ap_sync_reg_grp_Mat2Axi_fu_72_ap_done);
    ap_sync_grp_Mat2Axi_fu_72_ap_ready <= (grp_Mat2Axi_fu_72_ap_ready or ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready);

    dstPtr_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dstPtr_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dstPtr_blk_n <= dstPtr_empty_n;
        else 
            dstPtr_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    dstPtr_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dstPtr_empty_n, stride_empty_n)
    begin
        if ((not(((dstPtr_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (stride_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dstPtr_read <= ap_const_logic_1;
        else 
            dstPtr_read <= ap_const_logic_0;
        end if; 
    end process;


    grp_Mat2Axi_fu_72_ap_continue_assign_proc : process(ap_CS_fsm_state3, ap_block_state3_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_boolean_0 = ap_block_state3_on_subcall_done))) then 
            grp_Mat2Axi_fu_72_ap_continue <= ap_const_logic_1;
        else 
            grp_Mat2Axi_fu_72_ap_continue <= ap_const_logic_0;
        end if; 
    end process;

    grp_Mat2Axi_fu_72_ap_start <= grp_Mat2Axi_fu_72_ap_start_reg;
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
    m_axi_gmem3_AWADDR <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWADDR;
    m_axi_gmem3_AWBURST <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWBURST;
    m_axi_gmem3_AWCACHE <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWCACHE;
    m_axi_gmem3_AWID <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWID;
    m_axi_gmem3_AWLEN <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWLEN;
    m_axi_gmem3_AWLOCK <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWLOCK;
    m_axi_gmem3_AWPROT <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWPROT;
    m_axi_gmem3_AWQOS <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWQOS;
    m_axi_gmem3_AWREGION <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWREGION;
    m_axi_gmem3_AWSIZE <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWSIZE;
    m_axi_gmem3_AWUSER <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWUSER;

    m_axi_gmem3_AWVALID_assign_proc : process(grp_Mat2Axi_fu_72_m_axi_gmem3_AWVALID, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_gmem3_AWVALID <= grp_Mat2Axi_fu_72_m_axi_gmem3_AWVALID;
        else 
            m_axi_gmem3_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem3_BREADY_assign_proc : process(grp_Mat2Axi_fu_72_m_axi_gmem3_BREADY, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_gmem3_BREADY <= grp_Mat2Axi_fu_72_m_axi_gmem3_BREADY;
        else 
            m_axi_gmem3_BREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem3_RREADY <= ap_const_logic_0;
    m_axi_gmem3_WDATA <= grp_Mat2Axi_fu_72_m_axi_gmem3_WDATA;
    m_axi_gmem3_WID <= grp_Mat2Axi_fu_72_m_axi_gmem3_WID;
    m_axi_gmem3_WLAST <= grp_Mat2Axi_fu_72_m_axi_gmem3_WLAST;
    m_axi_gmem3_WSTRB <= grp_Mat2Axi_fu_72_m_axi_gmem3_WSTRB;
    m_axi_gmem3_WUSER <= grp_Mat2Axi_fu_72_m_axi_gmem3_WUSER;

    m_axi_gmem3_WVALID_assign_proc : process(grp_Mat2Axi_fu_72_m_axi_gmem3_WVALID, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_gmem3_WVALID <= grp_Mat2Axi_fu_72_m_axi_gmem3_WVALID;
        else 
            m_axi_gmem3_WVALID <= ap_const_logic_0;
        end if; 
    end process;


    out_mat_data85_read_assign_proc : process(grp_Mat2Axi_fu_72_out_mat_data85_read, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            out_mat_data85_read <= grp_Mat2Axi_fu_72_out_mat_data85_read;
        else 
            out_mat_data85_read <= ap_const_logic_0;
        end if; 
    end process;


    stride_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, stride_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            stride_blk_n <= stride_empty_n;
        else 
            stride_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    stride_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, dstPtr_empty_n, stride_empty_n)
    begin
        if ((not(((dstPtr_empty_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (stride_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            stride_read <= ap_const_logic_1;
        else 
            stride_read <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln1565_fu_84_p1 <= p_read(16 - 1 downto 0);
end behav;
