-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_Mat2Axi is
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
end;


architecture behav of pp_pipeline_accel_Mat2Axi is 
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal entry_proc10_U0_ap_start : STD_LOGIC;
    signal entry_proc10_U0_ap_done : STD_LOGIC;
    signal entry_proc10_U0_ap_continue : STD_LOGIC;
    signal entry_proc10_U0_ap_idle : STD_LOGIC;
    signal entry_proc10_U0_ap_ready : STD_LOGIC;
    signal entry_proc10_U0_dout_c_din : STD_LOGIC_VECTOR (63 downto 0);
    signal entry_proc10_U0_dout_c_write : STD_LOGIC;
    signal entry_proc10_U0_rows_c_din : STD_LOGIC_VECTOR (15 downto 0);
    signal entry_proc10_U0_rows_c_write : STD_LOGIC;
    signal Mat2Axi_Block_entry3_proc_U0_ap_start : STD_LOGIC;
    signal Mat2Axi_Block_entry3_proc_U0_ap_done : STD_LOGIC;
    signal Mat2Axi_Block_entry3_proc_U0_ap_continue : STD_LOGIC;
    signal Mat2Axi_Block_entry3_proc_U0_ap_idle : STD_LOGIC;
    signal Mat2Axi_Block_entry3_proc_U0_ap_ready : STD_LOGIC;
    signal Mat2Axi_Block_entry3_proc_U0_cols : STD_LOGIC_VECTOR (15 downto 0);
    signal Mat2Axi_Block_entry3_proc_U0_ap_return : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_full_n : STD_LOGIC;
    signal addrbound_U0_ap_start : STD_LOGIC;
    signal addrbound_U0_ap_done : STD_LOGIC;
    signal addrbound_U0_ap_continue : STD_LOGIC;
    signal addrbound_U0_ap_idle : STD_LOGIC;
    signal addrbound_U0_ap_ready : STD_LOGIC;
    signal addrbound_U0_return_r : STD_LOGIC_VECTOR (18 downto 0);
    signal addrbound_U0_rows_read : STD_LOGIC;
    signal p_channel_full_n : STD_LOGIC;
    signal Mat2Axi_Block_entry35_proc_U0_ap_start : STD_LOGIC;
    signal Mat2Axi_Block_entry35_proc_U0_ap_done : STD_LOGIC;
    signal Mat2Axi_Block_entry35_proc_U0_ap_continue : STD_LOGIC;
    signal Mat2Axi_Block_entry35_proc_U0_ap_idle : STD_LOGIC;
    signal Mat2Axi_Block_entry35_proc_U0_ap_ready : STD_LOGIC;
    signal Mat2Axi_Block_entry35_proc_U0_ap_return : STD_LOGIC_VECTOR (18 downto 0);
    signal axibound_V_full_n : STD_LOGIC;
    signal Mat2AxiStream_U0_out_mat_data85_read : STD_LOGIC;
    signal Mat2AxiStream_U0_ldata1_din : STD_LOGIC_VECTOR (63 downto 0);
    signal Mat2AxiStream_U0_ldata1_write : STD_LOGIC;
    signal Mat2AxiStream_U0_ap_start : STD_LOGIC;
    signal Mat2AxiStream_U0_ap_done : STD_LOGIC;
    signal Mat2AxiStream_U0_ap_ready : STD_LOGIC;
    signal Mat2AxiStream_U0_ap_idle : STD_LOGIC;
    signal Mat2AxiStream_U0_ap_continue : STD_LOGIC;
    signal AxiStream2Axi_U0_ap_start : STD_LOGIC;
    signal AxiStream2Axi_U0_ap_done : STD_LOGIC;
    signal AxiStream2Axi_U0_ap_continue : STD_LOGIC;
    signal AxiStream2Axi_U0_ap_idle : STD_LOGIC;
    signal AxiStream2Axi_U0_ap_ready : STD_LOGIC;
    signal AxiStream2Axi_U0_ldata1_read : STD_LOGIC;
    signal AxiStream2Axi_U0_m_axi_gmem3_AWVALID : STD_LOGIC;
    signal AxiStream2Axi_U0_m_axi_gmem3_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_WVALID : STD_LOGIC;
    signal AxiStream2Axi_U0_m_axi_gmem3_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_WLAST : STD_LOGIC;
    signal AxiStream2Axi_U0_m_axi_gmem3_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARVALID : STD_LOGIC;
    signal AxiStream2Axi_U0_m_axi_gmem3_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal AxiStream2Axi_U0_m_axi_gmem3_RREADY : STD_LOGIC;
    signal AxiStream2Axi_U0_m_axi_gmem3_BREADY : STD_LOGIC;
    signal AxiStream2Axi_U0_dout_read : STD_LOGIC;
    signal dout_c_full_n : STD_LOGIC;
    signal dout_c_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal dout_c_num_data_valid : STD_LOGIC_VECTOR (3 downto 0);
    signal dout_c_fifo_cap : STD_LOGIC_VECTOR (3 downto 0);
    signal dout_c_empty_n : STD_LOGIC;
    signal rows_c_full_n : STD_LOGIC;
    signal rows_c_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal rows_c_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal rows_c_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal rows_c_empty_n : STD_LOGIC;
    signal tmp_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_empty_n : STD_LOGIC;
    signal p_channel_dout : STD_LOGIC_VECTOR (18 downto 0);
    signal p_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal p_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal p_channel_empty_n : STD_LOGIC;
    signal axibound_V_dout : STD_LOGIC_VECTOR (18 downto 0);
    signal axibound_V_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal axibound_V_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal axibound_V_empty_n : STD_LOGIC;
    signal ldata_full_n : STD_LOGIC;
    signal ldata_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal ldata_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal ldata_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal ldata_empty_n : STD_LOGIC;
    signal ap_sync_ready : STD_LOGIC;
    signal ap_sync_reg_entry_proc10_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_entry_proc10_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_Mat2Axi_Block_entry3_proc_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Mat2Axi_Block_entry3_proc_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_Mat2AxiStream_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Mat2AxiStream_U0_ap_ready : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_entry_proc10 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        dout : IN STD_LOGIC_VECTOR (63 downto 0);
        dout_c_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        dout_c_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
        dout_c_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
        dout_c_full_n : IN STD_LOGIC;
        dout_c_write : OUT STD_LOGIC;
        rows : IN STD_LOGIC_VECTOR (15 downto 0);
        rows_c_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        rows_c_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_c_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_c_full_n : IN STD_LOGIC;
        rows_c_write : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_Mat2Axi_Block_entry3_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        stride : IN STD_LOGIC_VECTOR (31 downto 0);
        cols : IN STD_LOGIC_VECTOR (15 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component pp_pipeline_accel_addrbound IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        return_r : OUT STD_LOGIC_VECTOR (18 downto 0);
        rows_dout : IN STD_LOGIC_VECTOR (15 downto 0);
        rows_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_empty_n : IN STD_LOGIC;
        rows_read : OUT STD_LOGIC;
        cols : IN STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component pp_pipeline_accel_Mat2Axi_Block_entry35_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        axibound_V_1 : IN STD_LOGIC_VECTOR (18 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (18 downto 0) );
    end component;


    component pp_pipeline_accel_Mat2AxiStream IS
    port (
        out_mat_data85_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        out_mat_data85_empty_n : IN STD_LOGIC;
        out_mat_data85_read : OUT STD_LOGIC;
        ldata1_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        ldata1_full_n : IN STD_LOGIC;
        ldata1_write : OUT STD_LOGIC;
        rows : IN STD_LOGIC_VECTOR (15 downto 0);
        cols : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        rows_ap_vld : IN STD_LOGIC;
        cols_ap_vld : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_AxiStream2Axi IS
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
    end component;


    component pp_pipeline_accel_fifo_w64_d5_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (63 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (63 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w16_d3_S_x IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (15 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (15 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w16_d2_S_x IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (15 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (15 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w19_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (18 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (18 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w64_d2_S_x0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (63 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (63 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    entry_proc10_U0 : component pp_pipeline_accel_entry_proc10
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => entry_proc10_U0_ap_start,
        ap_done => entry_proc10_U0_ap_done,
        ap_continue => entry_proc10_U0_ap_continue,
        ap_idle => entry_proc10_U0_ap_idle,
        ap_ready => entry_proc10_U0_ap_ready,
        dout => dout,
        dout_c_din => entry_proc10_U0_dout_c_din,
        dout_c_num_data_valid => dout_c_num_data_valid,
        dout_c_fifo_cap => dout_c_fifo_cap,
        dout_c_full_n => dout_c_full_n,
        dout_c_write => entry_proc10_U0_dout_c_write,
        rows => rows,
        rows_c_din => entry_proc10_U0_rows_c_din,
        rows_c_num_data_valid => rows_c_num_data_valid,
        rows_c_fifo_cap => rows_c_fifo_cap,
        rows_c_full_n => rows_c_full_n,
        rows_c_write => entry_proc10_U0_rows_c_write);

    Mat2Axi_Block_entry3_proc_U0 : component pp_pipeline_accel_Mat2Axi_Block_entry3_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Mat2Axi_Block_entry3_proc_U0_ap_start,
        ap_done => Mat2Axi_Block_entry3_proc_U0_ap_done,
        ap_continue => Mat2Axi_Block_entry3_proc_U0_ap_continue,
        ap_idle => Mat2Axi_Block_entry3_proc_U0_ap_idle,
        ap_ready => Mat2Axi_Block_entry3_proc_U0_ap_ready,
        stride => stride,
        cols => Mat2Axi_Block_entry3_proc_U0_cols,
        ap_return => Mat2Axi_Block_entry3_proc_U0_ap_return);

    addrbound_U0 : component pp_pipeline_accel_addrbound
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => addrbound_U0_ap_start,
        ap_done => addrbound_U0_ap_done,
        ap_continue => addrbound_U0_ap_continue,
        ap_idle => addrbound_U0_ap_idle,
        ap_ready => addrbound_U0_ap_ready,
        return_r => addrbound_U0_return_r,
        rows_dout => rows_c_dout,
        rows_num_data_valid => rows_c_num_data_valid,
        rows_fifo_cap => rows_c_fifo_cap,
        rows_empty_n => rows_c_empty_n,
        rows_read => addrbound_U0_rows_read,
        cols => tmp_dout);

    Mat2Axi_Block_entry35_proc_U0 : component pp_pipeline_accel_Mat2Axi_Block_entry35_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Mat2Axi_Block_entry35_proc_U0_ap_start,
        ap_done => Mat2Axi_Block_entry35_proc_U0_ap_done,
        ap_continue => Mat2Axi_Block_entry35_proc_U0_ap_continue,
        ap_idle => Mat2Axi_Block_entry35_proc_U0_ap_idle,
        ap_ready => Mat2Axi_Block_entry35_proc_U0_ap_ready,
        axibound_V_1 => p_channel_dout,
        ap_return => Mat2Axi_Block_entry35_proc_U0_ap_return);

    Mat2AxiStream_U0 : component pp_pipeline_accel_Mat2AxiStream
    port map (
        out_mat_data85_dout => out_mat_data85_dout,
        out_mat_data85_empty_n => out_mat_data85_empty_n,
        out_mat_data85_read => Mat2AxiStream_U0_out_mat_data85_read,
        ldata1_din => Mat2AxiStream_U0_ldata1_din,
        ldata1_full_n => ldata_full_n,
        ldata1_write => Mat2AxiStream_U0_ldata1_write,
        rows => rows,
        cols => cols,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        rows_ap_vld => rows_ap_vld,
        cols_ap_vld => cols_ap_vld,
        ap_start => Mat2AxiStream_U0_ap_start,
        ap_done => Mat2AxiStream_U0_ap_done,
        ap_ready => Mat2AxiStream_U0_ap_ready,
        ap_idle => Mat2AxiStream_U0_ap_idle,
        ap_continue => Mat2AxiStream_U0_ap_continue);

    AxiStream2Axi_U0 : component pp_pipeline_accel_AxiStream2Axi
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => AxiStream2Axi_U0_ap_start,
        ap_done => AxiStream2Axi_U0_ap_done,
        ap_continue => AxiStream2Axi_U0_ap_continue,
        ap_idle => AxiStream2Axi_U0_ap_idle,
        ap_ready => AxiStream2Axi_U0_ap_ready,
        ldata1_dout => ldata_dout,
        ldata1_num_data_valid => ldata_num_data_valid,
        ldata1_fifo_cap => ldata_fifo_cap,
        ldata1_empty_n => ldata_empty_n,
        ldata1_read => AxiStream2Axi_U0_ldata1_read,
        m_axi_gmem3_AWVALID => AxiStream2Axi_U0_m_axi_gmem3_AWVALID,
        m_axi_gmem3_AWREADY => m_axi_gmem3_AWREADY,
        m_axi_gmem3_AWADDR => AxiStream2Axi_U0_m_axi_gmem3_AWADDR,
        m_axi_gmem3_AWID => AxiStream2Axi_U0_m_axi_gmem3_AWID,
        m_axi_gmem3_AWLEN => AxiStream2Axi_U0_m_axi_gmem3_AWLEN,
        m_axi_gmem3_AWSIZE => AxiStream2Axi_U0_m_axi_gmem3_AWSIZE,
        m_axi_gmem3_AWBURST => AxiStream2Axi_U0_m_axi_gmem3_AWBURST,
        m_axi_gmem3_AWLOCK => AxiStream2Axi_U0_m_axi_gmem3_AWLOCK,
        m_axi_gmem3_AWCACHE => AxiStream2Axi_U0_m_axi_gmem3_AWCACHE,
        m_axi_gmem3_AWPROT => AxiStream2Axi_U0_m_axi_gmem3_AWPROT,
        m_axi_gmem3_AWQOS => AxiStream2Axi_U0_m_axi_gmem3_AWQOS,
        m_axi_gmem3_AWREGION => AxiStream2Axi_U0_m_axi_gmem3_AWREGION,
        m_axi_gmem3_AWUSER => AxiStream2Axi_U0_m_axi_gmem3_AWUSER,
        m_axi_gmem3_WVALID => AxiStream2Axi_U0_m_axi_gmem3_WVALID,
        m_axi_gmem3_WREADY => m_axi_gmem3_WREADY,
        m_axi_gmem3_WDATA => AxiStream2Axi_U0_m_axi_gmem3_WDATA,
        m_axi_gmem3_WSTRB => AxiStream2Axi_U0_m_axi_gmem3_WSTRB,
        m_axi_gmem3_WLAST => AxiStream2Axi_U0_m_axi_gmem3_WLAST,
        m_axi_gmem3_WID => AxiStream2Axi_U0_m_axi_gmem3_WID,
        m_axi_gmem3_WUSER => AxiStream2Axi_U0_m_axi_gmem3_WUSER,
        m_axi_gmem3_ARVALID => AxiStream2Axi_U0_m_axi_gmem3_ARVALID,
        m_axi_gmem3_ARREADY => ap_const_logic_0,
        m_axi_gmem3_ARADDR => AxiStream2Axi_U0_m_axi_gmem3_ARADDR,
        m_axi_gmem3_ARID => AxiStream2Axi_U0_m_axi_gmem3_ARID,
        m_axi_gmem3_ARLEN => AxiStream2Axi_U0_m_axi_gmem3_ARLEN,
        m_axi_gmem3_ARSIZE => AxiStream2Axi_U0_m_axi_gmem3_ARSIZE,
        m_axi_gmem3_ARBURST => AxiStream2Axi_U0_m_axi_gmem3_ARBURST,
        m_axi_gmem3_ARLOCK => AxiStream2Axi_U0_m_axi_gmem3_ARLOCK,
        m_axi_gmem3_ARCACHE => AxiStream2Axi_U0_m_axi_gmem3_ARCACHE,
        m_axi_gmem3_ARPROT => AxiStream2Axi_U0_m_axi_gmem3_ARPROT,
        m_axi_gmem3_ARQOS => AxiStream2Axi_U0_m_axi_gmem3_ARQOS,
        m_axi_gmem3_ARREGION => AxiStream2Axi_U0_m_axi_gmem3_ARREGION,
        m_axi_gmem3_ARUSER => AxiStream2Axi_U0_m_axi_gmem3_ARUSER,
        m_axi_gmem3_RVALID => ap_const_logic_0,
        m_axi_gmem3_RREADY => AxiStream2Axi_U0_m_axi_gmem3_RREADY,
        m_axi_gmem3_RDATA => ap_const_lv64_0,
        m_axi_gmem3_RLAST => ap_const_logic_0,
        m_axi_gmem3_RID => ap_const_lv1_0,
        m_axi_gmem3_RFIFONUM => ap_const_lv9_0,
        m_axi_gmem3_RUSER => ap_const_lv1_0,
        m_axi_gmem3_RRESP => ap_const_lv2_0,
        m_axi_gmem3_BVALID => m_axi_gmem3_BVALID,
        m_axi_gmem3_BREADY => AxiStream2Axi_U0_m_axi_gmem3_BREADY,
        m_axi_gmem3_BRESP => m_axi_gmem3_BRESP,
        m_axi_gmem3_BID => m_axi_gmem3_BID,
        m_axi_gmem3_BUSER => m_axi_gmem3_BUSER,
        dout_dout => dout_c_dout,
        dout_num_data_valid => dout_c_num_data_valid,
        dout_fifo_cap => dout_c_fifo_cap,
        dout_empty_n => dout_c_empty_n,
        dout_read => AxiStream2Axi_U0_dout_read,
        p_read => axibound_V_dout);

    dout_c_U : component pp_pipeline_accel_fifo_w64_d5_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc10_U0_dout_c_din,
        if_full_n => dout_c_full_n,
        if_write => entry_proc10_U0_dout_c_write,
        if_dout => dout_c_dout,
        if_num_data_valid => dout_c_num_data_valid,
        if_fifo_cap => dout_c_fifo_cap,
        if_empty_n => dout_c_empty_n,
        if_read => AxiStream2Axi_U0_dout_read);

    rows_c_U : component pp_pipeline_accel_fifo_w16_d3_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc10_U0_rows_c_din,
        if_full_n => rows_c_full_n,
        if_write => entry_proc10_U0_rows_c_write,
        if_dout => rows_c_dout,
        if_num_data_valid => rows_c_num_data_valid,
        if_fifo_cap => rows_c_fifo_cap,
        if_empty_n => rows_c_empty_n,
        if_read => addrbound_U0_rows_read);

    tmp_U : component pp_pipeline_accel_fifo_w16_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Mat2Axi_Block_entry3_proc_U0_ap_return,
        if_full_n => tmp_full_n,
        if_write => Mat2Axi_Block_entry3_proc_U0_ap_done,
        if_dout => tmp_dout,
        if_num_data_valid => tmp_num_data_valid,
        if_fifo_cap => tmp_fifo_cap,
        if_empty_n => tmp_empty_n,
        if_read => addrbound_U0_ap_ready);

    p_channel_U : component pp_pipeline_accel_fifo_w19_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => addrbound_U0_return_r,
        if_full_n => p_channel_full_n,
        if_write => addrbound_U0_ap_done,
        if_dout => p_channel_dout,
        if_num_data_valid => p_channel_num_data_valid,
        if_fifo_cap => p_channel_fifo_cap,
        if_empty_n => p_channel_empty_n,
        if_read => Mat2Axi_Block_entry35_proc_U0_ap_ready);

    axibound_V_U : component pp_pipeline_accel_fifo_w19_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Mat2Axi_Block_entry35_proc_U0_ap_return,
        if_full_n => axibound_V_full_n,
        if_write => Mat2Axi_Block_entry35_proc_U0_ap_done,
        if_dout => axibound_V_dout,
        if_num_data_valid => axibound_V_num_data_valid,
        if_fifo_cap => axibound_V_fifo_cap,
        if_empty_n => axibound_V_empty_n,
        if_read => AxiStream2Axi_U0_ap_ready);

    ldata_U : component pp_pipeline_accel_fifo_w64_d2_S_x0
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Mat2AxiStream_U0_ldata1_din,
        if_full_n => ldata_full_n,
        if_write => Mat2AxiStream_U0_ldata1_write,
        if_dout => ldata_dout,
        if_num_data_valid => ldata_num_data_valid,
        if_fifo_cap => ldata_fifo_cap,
        if_empty_n => ldata_empty_n,
        if_read => AxiStream2Axi_U0_ldata1_read);





    ap_sync_reg_Mat2AxiStream_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Mat2AxiStream_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Mat2AxiStream_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Mat2AxiStream_U0_ap_ready <= ap_sync_Mat2AxiStream_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_Mat2Axi_Block_entry3_proc_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Mat2Axi_Block_entry3_proc_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Mat2Axi_Block_entry3_proc_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Mat2Axi_Block_entry3_proc_U0_ap_ready <= ap_sync_Mat2Axi_Block_entry3_proc_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_entry_proc10_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_entry_proc10_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_entry_proc10_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_entry_proc10_U0_ap_ready <= ap_sync_entry_proc10_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;

    AxiStream2Axi_U0_ap_continue <= ap_continue;
    AxiStream2Axi_U0_ap_start <= axibound_V_empty_n;
    Mat2AxiStream_U0_ap_continue <= ap_const_logic_1;
    Mat2AxiStream_U0_ap_start <= ((ap_sync_reg_Mat2AxiStream_U0_ap_ready xor ap_const_logic_1) and ap_start);
    Mat2Axi_Block_entry35_proc_U0_ap_continue <= axibound_V_full_n;
    Mat2Axi_Block_entry35_proc_U0_ap_start <= p_channel_empty_n;
    Mat2Axi_Block_entry3_proc_U0_ap_continue <= tmp_full_n;
    Mat2Axi_Block_entry3_proc_U0_ap_start <= ((ap_sync_reg_Mat2Axi_Block_entry3_proc_U0_ap_ready xor ap_const_logic_1) and ap_start);
    
    Mat2Axi_Block_entry3_proc_U0_cols_proc : process(cols)
    variable vlo_cpy : STD_LOGIC_VECTOR(32+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(32+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(32 - 1 downto 0);
    variable Mat2Axi_Block_entry3_proc_U0_cols_i : integer;
    variable section : STD_LOGIC_VECTOR(32 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(32 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(32 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(5 - 1 downto 0) := ap_const_lv32_0(5 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(5 - 1 downto 0) := ap_const_lv32_10(5 - 1 downto 0);
        v0_cpy := cols;
        if (vlo_cpy(5 - 1 downto 0) > vhi_cpy(5 - 1 downto 0)) then
            vhi_cpy(5-1 downto 0) := std_logic_vector(32-1-unsigned(ap_const_lv32_10(5-1 downto 0)));
            vlo_cpy(5-1 downto 0) := std_logic_vector(32-1-unsigned(ap_const_lv32_0(5-1 downto 0)));
            for Mat2Axi_Block_entry3_proc_U0_cols_i in 0 to 32-1 loop
                v0_cpy(Mat2Axi_Block_entry3_proc_U0_cols_i) := cols(32-1-Mat2Axi_Block_entry3_proc_U0_cols_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(5-1 downto 0)))));

        section := (others=>'0');
        section(5-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(5-1 downto 0)) - unsigned(vlo_cpy(5-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(32-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        Mat2Axi_Block_entry3_proc_U0_cols <= resvalue(16-1 downto 0);
    end process;

    addrbound_U0_ap_continue <= p_channel_full_n;
    addrbound_U0_ap_start <= tmp_empty_n;
    ap_done <= AxiStream2Axi_U0_ap_done;
    ap_idle <= ((axibound_V_empty_n xor ap_const_logic_1) and (p_channel_empty_n xor ap_const_logic_1) and (tmp_empty_n xor ap_const_logic_1) and entry_proc10_U0_ap_idle and addrbound_U0_ap_idle and Mat2Axi_Block_entry3_proc_U0_ap_idle and Mat2Axi_Block_entry35_proc_U0_ap_idle and Mat2AxiStream_U0_ap_idle and AxiStream2Axi_U0_ap_idle);
    ap_ready <= ap_sync_ready;
    ap_sync_Mat2AxiStream_U0_ap_ready <= (ap_sync_reg_Mat2AxiStream_U0_ap_ready or Mat2AxiStream_U0_ap_ready);
    ap_sync_Mat2Axi_Block_entry3_proc_U0_ap_ready <= (ap_sync_reg_Mat2Axi_Block_entry3_proc_U0_ap_ready or Mat2Axi_Block_entry3_proc_U0_ap_ready);
    ap_sync_entry_proc10_U0_ap_ready <= (entry_proc10_U0_ap_ready or ap_sync_reg_entry_proc10_U0_ap_ready);
    ap_sync_ready <= (ap_sync_entry_proc10_U0_ap_ready and ap_sync_Mat2Axi_Block_entry3_proc_U0_ap_ready and ap_sync_Mat2AxiStream_U0_ap_ready);
    entry_proc10_U0_ap_continue <= ap_const_logic_1;
    entry_proc10_U0_ap_start <= ((ap_sync_reg_entry_proc10_U0_ap_ready xor ap_const_logic_1) and ap_start);
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
    m_axi_gmem3_AWADDR <= AxiStream2Axi_U0_m_axi_gmem3_AWADDR;
    m_axi_gmem3_AWBURST <= AxiStream2Axi_U0_m_axi_gmem3_AWBURST;
    m_axi_gmem3_AWCACHE <= AxiStream2Axi_U0_m_axi_gmem3_AWCACHE;
    m_axi_gmem3_AWID <= AxiStream2Axi_U0_m_axi_gmem3_AWID;
    m_axi_gmem3_AWLEN <= AxiStream2Axi_U0_m_axi_gmem3_AWLEN;
    m_axi_gmem3_AWLOCK <= AxiStream2Axi_U0_m_axi_gmem3_AWLOCK;
    m_axi_gmem3_AWPROT <= AxiStream2Axi_U0_m_axi_gmem3_AWPROT;
    m_axi_gmem3_AWQOS <= AxiStream2Axi_U0_m_axi_gmem3_AWQOS;
    m_axi_gmem3_AWREGION <= AxiStream2Axi_U0_m_axi_gmem3_AWREGION;
    m_axi_gmem3_AWSIZE <= AxiStream2Axi_U0_m_axi_gmem3_AWSIZE;
    m_axi_gmem3_AWUSER <= AxiStream2Axi_U0_m_axi_gmem3_AWUSER;
    m_axi_gmem3_AWVALID <= AxiStream2Axi_U0_m_axi_gmem3_AWVALID;
    m_axi_gmem3_BREADY <= AxiStream2Axi_U0_m_axi_gmem3_BREADY;
    m_axi_gmem3_RREADY <= ap_const_logic_0;
    m_axi_gmem3_WDATA <= AxiStream2Axi_U0_m_axi_gmem3_WDATA;
    m_axi_gmem3_WID <= AxiStream2Axi_U0_m_axi_gmem3_WID;
    m_axi_gmem3_WLAST <= AxiStream2Axi_U0_m_axi_gmem3_WLAST;
    m_axi_gmem3_WSTRB <= AxiStream2Axi_U0_m_axi_gmem3_WSTRB;
    m_axi_gmem3_WUSER <= AxiStream2Axi_U0_m_axi_gmem3_WUSER;
    m_axi_gmem3_WVALID <= AxiStream2Axi_U0_m_axi_gmem3_WVALID;
    out_mat_data85_read <= Mat2AxiStream_U0_out_mat_data85_read;
end behav;
