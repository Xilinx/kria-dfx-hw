-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_Axi2Mat is
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
end;


architecture behav of pp_pipeline_accel_Axi2Mat is 
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal Axi2Mat_Block_entry1_proc_U0_ap_start : STD_LOGIC;
    signal Axi2Mat_Block_entry1_proc_U0_ap_done : STD_LOGIC;
    signal Axi2Mat_Block_entry1_proc_U0_ap_continue : STD_LOGIC;
    signal Axi2Mat_Block_entry1_proc_U0_ap_idle : STD_LOGIC;
    signal Axi2Mat_Block_entry1_proc_U0_ap_ready : STD_LOGIC;
    signal Axi2Mat_Block_entry1_proc_U0_start_out : STD_LOGIC;
    signal Axi2Mat_Block_entry1_proc_U0_start_write : STD_LOGIC;
    signal Axi2Mat_Block_entry1_proc_U0_rows_c_din : STD_LOGIC_VECTOR (10 downto 0);
    signal Axi2Mat_Block_entry1_proc_U0_rows_c_write : STD_LOGIC;
    signal Axi2Mat_Block_entry1_proc_U0_ap_return_0 : STD_LOGIC_VECTOR (10 downto 0);
    signal Axi2Mat_Block_entry1_proc_U0_ap_return_1 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_channel_done_rows_stride_loc_channel : STD_LOGIC;
    signal rows_stride_loc_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_rows_stride_loc_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_rows_stride_loc_channel : STD_LOGIC;
    signal ap_channel_done_rows_burst_loc_channel : STD_LOGIC;
    signal rows_burst_loc_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_rows_burst_loc_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_rows_burst_loc_channel : STD_LOGIC;
    signal Axi2AxiStream_U0_ap_start : STD_LOGIC;
    signal Axi2AxiStream_U0_ap_done : STD_LOGIC;
    signal Axi2AxiStream_U0_ap_continue : STD_LOGIC;
    signal Axi2AxiStream_U0_ap_idle : STD_LOGIC;
    signal Axi2AxiStream_U0_ap_ready : STD_LOGIC;
    signal Axi2AxiStream_U0_m_axi_gmem2_AWVALID : STD_LOGIC;
    signal Axi2AxiStream_U0_m_axi_gmem2_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_WVALID : STD_LOGIC;
    signal Axi2AxiStream_U0_m_axi_gmem2_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_WLAST : STD_LOGIC;
    signal Axi2AxiStream_U0_m_axi_gmem2_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARVALID : STD_LOGIC;
    signal Axi2AxiStream_U0_m_axi_gmem2_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_U0_m_axi_gmem2_RREADY : STD_LOGIC;
    signal Axi2AxiStream_U0_m_axi_gmem2_BREADY : STD_LOGIC;
    signal Axi2AxiStream_U0_ldata_din : STD_LOGIC_VECTOR (63 downto 0);
    signal Axi2AxiStream_U0_ldata_write : STD_LOGIC;
    signal Axi2AxiStream_U0_cols_c_din : STD_LOGIC_VECTOR (10 downto 0);
    signal Axi2AxiStream_U0_cols_c_write : STD_LOGIC;
    signal AxiStream2Mat_U0_ldata1_read : STD_LOGIC;
    signal AxiStream2Mat_U0_imgInput_uv_data82_din : STD_LOGIC_VECTOR (15 downto 0);
    signal AxiStream2Mat_U0_imgInput_uv_data82_write : STD_LOGIC;
    signal AxiStream2Mat_U0_rows_read : STD_LOGIC;
    signal AxiStream2Mat_U0_cols_read : STD_LOGIC;
    signal AxiStream2Mat_U0_ap_start : STD_LOGIC;
    signal AxiStream2Mat_U0_ap_done : STD_LOGIC;
    signal AxiStream2Mat_U0_ap_ready : STD_LOGIC;
    signal AxiStream2Mat_U0_ap_idle : STD_LOGIC;
    signal AxiStream2Mat_U0_ap_continue : STD_LOGIC;
    signal rows_c_full_n : STD_LOGIC;
    signal rows_c_dout : STD_LOGIC_VECTOR (10 downto 0);
    signal rows_c_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal rows_c_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal rows_c_empty_n : STD_LOGIC;
    signal rows_burst_loc_channel_dout : STD_LOGIC_VECTOR (10 downto 0);
    signal rows_burst_loc_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal rows_burst_loc_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal rows_burst_loc_channel_empty_n : STD_LOGIC;
    signal rows_stride_loc_channel_dout : STD_LOGIC_VECTOR (10 downto 0);
    signal rows_stride_loc_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal rows_stride_loc_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal rows_stride_loc_channel_empty_n : STD_LOGIC;
    signal ldata_full_n : STD_LOGIC;
    signal ldata_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal ldata_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal ldata_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal ldata_empty_n : STD_LOGIC;
    signal cols_c_full_n : STD_LOGIC;
    signal cols_c_dout : STD_LOGIC_VECTOR (10 downto 0);
    signal cols_c_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal cols_c_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal cols_c_empty_n : STD_LOGIC;
    signal ap_sync_ready : STD_LOGIC;
    signal ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_Axi2AxiStream_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Axi2AxiStream_U0_ap_ready : STD_LOGIC;
    signal start_for_AxiStream2Mat_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_AxiStream2Mat_U0_full_n : STD_LOGIC;
    signal start_for_AxiStream2Mat_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_AxiStream2Mat_U0_empty_n : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_Axi2Mat_Block_entry1_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        stride : IN STD_LOGIC_VECTOR (31 downto 0);
        rows : IN STD_LOGIC_VECTOR (10 downto 0);
        rows_c_din : OUT STD_LOGIC_VECTOR (10 downto 0);
        rows_c_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_c_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_c_full_n : IN STD_LOGIC;
        rows_c_write : OUT STD_LOGIC;
        ap_return_0 : OUT STD_LOGIC_VECTOR (10 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (10 downto 0) );
    end component;


    component pp_pipeline_accel_Axi2AxiStream IS
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
        din : IN STD_LOGIC_VECTOR (63 downto 0);
        ldata_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        ldata_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        ldata_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        ldata_full_n : IN STD_LOGIC;
        ldata_write : OUT STD_LOGIC;
        p_read : IN STD_LOGIC_VECTOR (10 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (10 downto 0);
        cols : IN STD_LOGIC_VECTOR (10 downto 0);
        stride : IN STD_LOGIC_VECTOR (31 downto 0);
        cols_c_din : OUT STD_LOGIC_VECTOR (10 downto 0);
        cols_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        cols_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        cols_c_full_n : IN STD_LOGIC;
        cols_c_write : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_AxiStream2Mat IS
    port (
        ldata1_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        ldata1_empty_n : IN STD_LOGIC;
        ldata1_read : OUT STD_LOGIC;
        imgInput_uv_data82_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        imgInput_uv_data82_full_n : IN STD_LOGIC;
        imgInput_uv_data82_write : OUT STD_LOGIC;
        rows_dout : IN STD_LOGIC_VECTOR (10 downto 0);
        rows_empty_n : IN STD_LOGIC;
        rows_read : OUT STD_LOGIC;
        cols_dout : IN STD_LOGIC_VECTOR (10 downto 0);
        cols_empty_n : IN STD_LOGIC;
        cols_read : OUT STD_LOGIC;
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w11_d3_S_x IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (10 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (10 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w11_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (10 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (10 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w64_d2_S_x IS
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


    component pp_pipeline_accel_start_for_AxiStream2Mat_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    Axi2Mat_Block_entry1_proc_U0 : component pp_pipeline_accel_Axi2Mat_Block_entry1_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Axi2Mat_Block_entry1_proc_U0_ap_start,
        start_full_n => start_for_AxiStream2Mat_U0_full_n,
        ap_done => Axi2Mat_Block_entry1_proc_U0_ap_done,
        ap_continue => Axi2Mat_Block_entry1_proc_U0_ap_continue,
        ap_idle => Axi2Mat_Block_entry1_proc_U0_ap_idle,
        ap_ready => Axi2Mat_Block_entry1_proc_U0_ap_ready,
        start_out => Axi2Mat_Block_entry1_proc_U0_start_out,
        start_write => Axi2Mat_Block_entry1_proc_U0_start_write,
        stride => stride,
        rows => rows,
        rows_c_din => Axi2Mat_Block_entry1_proc_U0_rows_c_din,
        rows_c_num_data_valid => rows_c_num_data_valid,
        rows_c_fifo_cap => rows_c_fifo_cap,
        rows_c_full_n => rows_c_full_n,
        rows_c_write => Axi2Mat_Block_entry1_proc_U0_rows_c_write,
        ap_return_0 => Axi2Mat_Block_entry1_proc_U0_ap_return_0,
        ap_return_1 => Axi2Mat_Block_entry1_proc_U0_ap_return_1);

    Axi2AxiStream_U0 : component pp_pipeline_accel_Axi2AxiStream
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Axi2AxiStream_U0_ap_start,
        ap_done => Axi2AxiStream_U0_ap_done,
        ap_continue => Axi2AxiStream_U0_ap_continue,
        ap_idle => Axi2AxiStream_U0_ap_idle,
        ap_ready => Axi2AxiStream_U0_ap_ready,
        m_axi_gmem2_AWVALID => Axi2AxiStream_U0_m_axi_gmem2_AWVALID,
        m_axi_gmem2_AWREADY => ap_const_logic_0,
        m_axi_gmem2_AWADDR => Axi2AxiStream_U0_m_axi_gmem2_AWADDR,
        m_axi_gmem2_AWID => Axi2AxiStream_U0_m_axi_gmem2_AWID,
        m_axi_gmem2_AWLEN => Axi2AxiStream_U0_m_axi_gmem2_AWLEN,
        m_axi_gmem2_AWSIZE => Axi2AxiStream_U0_m_axi_gmem2_AWSIZE,
        m_axi_gmem2_AWBURST => Axi2AxiStream_U0_m_axi_gmem2_AWBURST,
        m_axi_gmem2_AWLOCK => Axi2AxiStream_U0_m_axi_gmem2_AWLOCK,
        m_axi_gmem2_AWCACHE => Axi2AxiStream_U0_m_axi_gmem2_AWCACHE,
        m_axi_gmem2_AWPROT => Axi2AxiStream_U0_m_axi_gmem2_AWPROT,
        m_axi_gmem2_AWQOS => Axi2AxiStream_U0_m_axi_gmem2_AWQOS,
        m_axi_gmem2_AWREGION => Axi2AxiStream_U0_m_axi_gmem2_AWREGION,
        m_axi_gmem2_AWUSER => Axi2AxiStream_U0_m_axi_gmem2_AWUSER,
        m_axi_gmem2_WVALID => Axi2AxiStream_U0_m_axi_gmem2_WVALID,
        m_axi_gmem2_WREADY => ap_const_logic_0,
        m_axi_gmem2_WDATA => Axi2AxiStream_U0_m_axi_gmem2_WDATA,
        m_axi_gmem2_WSTRB => Axi2AxiStream_U0_m_axi_gmem2_WSTRB,
        m_axi_gmem2_WLAST => Axi2AxiStream_U0_m_axi_gmem2_WLAST,
        m_axi_gmem2_WID => Axi2AxiStream_U0_m_axi_gmem2_WID,
        m_axi_gmem2_WUSER => Axi2AxiStream_U0_m_axi_gmem2_WUSER,
        m_axi_gmem2_ARVALID => Axi2AxiStream_U0_m_axi_gmem2_ARVALID,
        m_axi_gmem2_ARREADY => m_axi_gmem2_ARREADY,
        m_axi_gmem2_ARADDR => Axi2AxiStream_U0_m_axi_gmem2_ARADDR,
        m_axi_gmem2_ARID => Axi2AxiStream_U0_m_axi_gmem2_ARID,
        m_axi_gmem2_ARLEN => Axi2AxiStream_U0_m_axi_gmem2_ARLEN,
        m_axi_gmem2_ARSIZE => Axi2AxiStream_U0_m_axi_gmem2_ARSIZE,
        m_axi_gmem2_ARBURST => Axi2AxiStream_U0_m_axi_gmem2_ARBURST,
        m_axi_gmem2_ARLOCK => Axi2AxiStream_U0_m_axi_gmem2_ARLOCK,
        m_axi_gmem2_ARCACHE => Axi2AxiStream_U0_m_axi_gmem2_ARCACHE,
        m_axi_gmem2_ARPROT => Axi2AxiStream_U0_m_axi_gmem2_ARPROT,
        m_axi_gmem2_ARQOS => Axi2AxiStream_U0_m_axi_gmem2_ARQOS,
        m_axi_gmem2_ARREGION => Axi2AxiStream_U0_m_axi_gmem2_ARREGION,
        m_axi_gmem2_ARUSER => Axi2AxiStream_U0_m_axi_gmem2_ARUSER,
        m_axi_gmem2_RVALID => m_axi_gmem2_RVALID,
        m_axi_gmem2_RREADY => Axi2AxiStream_U0_m_axi_gmem2_RREADY,
        m_axi_gmem2_RDATA => m_axi_gmem2_RDATA,
        m_axi_gmem2_RLAST => m_axi_gmem2_RLAST,
        m_axi_gmem2_RID => m_axi_gmem2_RID,
        m_axi_gmem2_RFIFONUM => m_axi_gmem2_RFIFONUM,
        m_axi_gmem2_RUSER => m_axi_gmem2_RUSER,
        m_axi_gmem2_RRESP => m_axi_gmem2_RRESP,
        m_axi_gmem2_BVALID => ap_const_logic_0,
        m_axi_gmem2_BREADY => Axi2AxiStream_U0_m_axi_gmem2_BREADY,
        m_axi_gmem2_BRESP => ap_const_lv2_0,
        m_axi_gmem2_BID => ap_const_lv1_0,
        m_axi_gmem2_BUSER => ap_const_lv1_0,
        din => din,
        ldata_din => Axi2AxiStream_U0_ldata_din,
        ldata_num_data_valid => ldata_num_data_valid,
        ldata_fifo_cap => ldata_fifo_cap,
        ldata_full_n => ldata_full_n,
        ldata_write => Axi2AxiStream_U0_ldata_write,
        p_read => rows_burst_loc_channel_dout,
        p_read1 => rows_stride_loc_channel_dout,
        cols => cols,
        stride => stride,
        cols_c_din => Axi2AxiStream_U0_cols_c_din,
        cols_c_num_data_valid => cols_c_num_data_valid,
        cols_c_fifo_cap => cols_c_fifo_cap,
        cols_c_full_n => cols_c_full_n,
        cols_c_write => Axi2AxiStream_U0_cols_c_write);

    AxiStream2Mat_U0 : component pp_pipeline_accel_AxiStream2Mat
    port map (
        ldata1_dout => ldata_dout,
        ldata1_empty_n => ldata_empty_n,
        ldata1_read => AxiStream2Mat_U0_ldata1_read,
        imgInput_uv_data82_din => AxiStream2Mat_U0_imgInput_uv_data82_din,
        imgInput_uv_data82_full_n => imgInput_uv_data82_full_n,
        imgInput_uv_data82_write => AxiStream2Mat_U0_imgInput_uv_data82_write,
        rows_dout => rows_c_dout,
        rows_empty_n => rows_c_empty_n,
        rows_read => AxiStream2Mat_U0_rows_read,
        cols_dout => cols_c_dout,
        cols_empty_n => cols_c_empty_n,
        cols_read => AxiStream2Mat_U0_cols_read,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => AxiStream2Mat_U0_ap_start,
        ap_done => AxiStream2Mat_U0_ap_done,
        ap_ready => AxiStream2Mat_U0_ap_ready,
        ap_idle => AxiStream2Mat_U0_ap_idle,
        ap_continue => AxiStream2Mat_U0_ap_continue);

    rows_c_U : component pp_pipeline_accel_fifo_w11_d3_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2Mat_Block_entry1_proc_U0_rows_c_din,
        if_full_n => rows_c_full_n,
        if_write => Axi2Mat_Block_entry1_proc_U0_rows_c_write,
        if_dout => rows_c_dout,
        if_num_data_valid => rows_c_num_data_valid,
        if_fifo_cap => rows_c_fifo_cap,
        if_empty_n => rows_c_empty_n,
        if_read => AxiStream2Mat_U0_rows_read);

    rows_burst_loc_channel_U : component pp_pipeline_accel_fifo_w11_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2Mat_Block_entry1_proc_U0_ap_return_0,
        if_full_n => rows_burst_loc_channel_full_n,
        if_write => ap_channel_done_rows_burst_loc_channel,
        if_dout => rows_burst_loc_channel_dout,
        if_num_data_valid => rows_burst_loc_channel_num_data_valid,
        if_fifo_cap => rows_burst_loc_channel_fifo_cap,
        if_empty_n => rows_burst_loc_channel_empty_n,
        if_read => Axi2AxiStream_U0_ap_ready);

    rows_stride_loc_channel_U : component pp_pipeline_accel_fifo_w11_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2Mat_Block_entry1_proc_U0_ap_return_1,
        if_full_n => rows_stride_loc_channel_full_n,
        if_write => ap_channel_done_rows_stride_loc_channel,
        if_dout => rows_stride_loc_channel_dout,
        if_num_data_valid => rows_stride_loc_channel_num_data_valid,
        if_fifo_cap => rows_stride_loc_channel_fifo_cap,
        if_empty_n => rows_stride_loc_channel_empty_n,
        if_read => Axi2AxiStream_U0_ap_ready);

    ldata_U : component pp_pipeline_accel_fifo_w64_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2AxiStream_U0_ldata_din,
        if_full_n => ldata_full_n,
        if_write => Axi2AxiStream_U0_ldata_write,
        if_dout => ldata_dout,
        if_num_data_valid => ldata_num_data_valid,
        if_fifo_cap => ldata_fifo_cap,
        if_empty_n => ldata_empty_n,
        if_read => AxiStream2Mat_U0_ldata1_read);

    cols_c_U : component pp_pipeline_accel_fifo_w11_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2AxiStream_U0_cols_c_din,
        if_full_n => cols_c_full_n,
        if_write => Axi2AxiStream_U0_cols_c_write,
        if_dout => cols_c_dout,
        if_num_data_valid => cols_c_num_data_valid,
        if_fifo_cap => cols_c_fifo_cap,
        if_empty_n => cols_c_empty_n,
        if_read => AxiStream2Mat_U0_cols_read);

    start_for_AxiStream2Mat_U0_U : component pp_pipeline_accel_start_for_AxiStream2Mat_U0
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_AxiStream2Mat_U0_din,
        if_full_n => start_for_AxiStream2Mat_U0_full_n,
        if_write => Axi2Mat_Block_entry1_proc_U0_start_write,
        if_dout => start_for_AxiStream2Mat_U0_dout,
        if_empty_n => start_for_AxiStream2Mat_U0_empty_n,
        if_read => AxiStream2Mat_U0_ap_ready);





    ap_sync_reg_Axi2AxiStream_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Axi2AxiStream_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Axi2AxiStream_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Axi2AxiStream_U0_ap_ready <= ap_sync_Axi2AxiStream_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready <= ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_rows_burst_loc_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_channel_write_rows_burst_loc_channel <= ap_const_logic_0;
            else
                if (((Axi2Mat_Block_entry1_proc_U0_ap_done and Axi2Mat_Block_entry1_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_rows_burst_loc_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_rows_burst_loc_channel <= ap_sync_channel_write_rows_burst_loc_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_rows_stride_loc_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_channel_write_rows_stride_loc_channel <= ap_const_logic_0;
            else
                if (((Axi2Mat_Block_entry1_proc_U0_ap_done and Axi2Mat_Block_entry1_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_rows_stride_loc_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_rows_stride_loc_channel <= ap_sync_channel_write_rows_stride_loc_channel;
                end if; 
            end if;
        end if;
    end process;

    Axi2AxiStream_U0_ap_continue <= ap_const_logic_1;
    Axi2AxiStream_U0_ap_start <= (rows_stride_loc_channel_empty_n and rows_burst_loc_channel_empty_n and (ap_sync_reg_Axi2AxiStream_U0_ap_ready xor ap_const_logic_1) and ap_start);
    Axi2Mat_Block_entry1_proc_U0_ap_continue <= (ap_sync_channel_write_rows_stride_loc_channel and ap_sync_channel_write_rows_burst_loc_channel);
    Axi2Mat_Block_entry1_proc_U0_ap_start <= ((ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready xor ap_const_logic_1) and ap_start);
    AxiStream2Mat_U0_ap_continue <= ap_continue;
    AxiStream2Mat_U0_ap_start <= start_for_AxiStream2Mat_U0_empty_n;
    ap_channel_done_rows_burst_loc_channel <= ((ap_sync_reg_channel_write_rows_burst_loc_channel xor ap_const_logic_1) and Axi2Mat_Block_entry1_proc_U0_ap_done);
    ap_channel_done_rows_stride_loc_channel <= ((ap_sync_reg_channel_write_rows_stride_loc_channel xor ap_const_logic_1) and Axi2Mat_Block_entry1_proc_U0_ap_done);
    ap_done <= AxiStream2Mat_U0_ap_done;
    ap_idle <= ((rows_stride_loc_channel_empty_n xor ap_const_logic_1) and (rows_burst_loc_channel_empty_n xor ap_const_logic_1) and AxiStream2Mat_U0_ap_idle and Axi2Mat_Block_entry1_proc_U0_ap_idle and Axi2AxiStream_U0_ap_idle);
    ap_ready <= ap_sync_ready;
    ap_sync_Axi2AxiStream_U0_ap_ready <= (ap_sync_reg_Axi2AxiStream_U0_ap_ready or Axi2AxiStream_U0_ap_ready);
    ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready <= (ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready or Axi2Mat_Block_entry1_proc_U0_ap_ready);
    ap_sync_channel_write_rows_burst_loc_channel <= ((rows_burst_loc_channel_full_n and ap_channel_done_rows_burst_loc_channel) or ap_sync_reg_channel_write_rows_burst_loc_channel);
    ap_sync_channel_write_rows_stride_loc_channel <= ((rows_stride_loc_channel_full_n and ap_channel_done_rows_stride_loc_channel) or ap_sync_reg_channel_write_rows_stride_loc_channel);
    ap_sync_ready <= (ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready and ap_sync_Axi2AxiStream_U0_ap_ready);
    imgInput_uv_data82_din <= AxiStream2Mat_U0_imgInput_uv_data82_din;
    imgInput_uv_data82_write <= AxiStream2Mat_U0_imgInput_uv_data82_write;
    m_axi_gmem2_ARADDR <= Axi2AxiStream_U0_m_axi_gmem2_ARADDR;
    m_axi_gmem2_ARBURST <= Axi2AxiStream_U0_m_axi_gmem2_ARBURST;
    m_axi_gmem2_ARCACHE <= Axi2AxiStream_U0_m_axi_gmem2_ARCACHE;
    m_axi_gmem2_ARID <= Axi2AxiStream_U0_m_axi_gmem2_ARID;
    m_axi_gmem2_ARLEN <= Axi2AxiStream_U0_m_axi_gmem2_ARLEN;
    m_axi_gmem2_ARLOCK <= Axi2AxiStream_U0_m_axi_gmem2_ARLOCK;
    m_axi_gmem2_ARPROT <= Axi2AxiStream_U0_m_axi_gmem2_ARPROT;
    m_axi_gmem2_ARQOS <= Axi2AxiStream_U0_m_axi_gmem2_ARQOS;
    m_axi_gmem2_ARREGION <= Axi2AxiStream_U0_m_axi_gmem2_ARREGION;
    m_axi_gmem2_ARSIZE <= Axi2AxiStream_U0_m_axi_gmem2_ARSIZE;
    m_axi_gmem2_ARUSER <= Axi2AxiStream_U0_m_axi_gmem2_ARUSER;
    m_axi_gmem2_ARVALID <= Axi2AxiStream_U0_m_axi_gmem2_ARVALID;
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
    m_axi_gmem2_RREADY <= Axi2AxiStream_U0_m_axi_gmem2_RREADY;
    m_axi_gmem2_WDATA <= ap_const_lv64_0;
    m_axi_gmem2_WID <= ap_const_lv1_0;
    m_axi_gmem2_WLAST <= ap_const_logic_0;
    m_axi_gmem2_WSTRB <= ap_const_lv8_0;
    m_axi_gmem2_WUSER <= ap_const_lv1_0;
    m_axi_gmem2_WVALID <= ap_const_logic_0;
    start_for_AxiStream2Mat_U0_din <= (0=>ap_const_logic_1, others=>'-');
end behav;
