-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_Axi2Mat_1 is
port (
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
    imgInput_y_data81_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    imgInput_y_data81_full_n : IN STD_LOGIC;
    imgInput_y_data81_write : OUT STD_LOGIC;
    rows : IN STD_LOGIC_VECTOR (31 downto 0);
    cols : IN STD_LOGIC_VECTOR (31 downto 0);
    stride : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    stride_ap_vld : IN STD_LOGIC;
    rows_ap_vld : IN STD_LOGIC;
    cols_ap_vld : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    din_ap_vld : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_Axi2Mat_1 is 
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal Axi2Mat_Block_entry3_proc_U0_ap_start : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_ap_done : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_ap_continue : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_ap_idle : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_ap_ready : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_start_out : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_start_write : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_rows_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal Axi2Mat_Block_entry3_proc_U0_rows_c_write : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_cols_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal Axi2Mat_Block_entry3_proc_U0_cols_c_write : STD_LOGIC;
    signal Axi2Mat_Block_entry3_proc_U0_ap_return_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal Axi2Mat_Block_entry3_proc_U0_ap_return_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal Axi2Mat_Block_entry3_proc_U0_ap_return_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_channel_done_cols_cast_loc_channel : STD_LOGIC;
    signal cols_cast_loc_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_cols_cast_loc_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_cols_cast_loc_channel : STD_LOGIC;
    signal ap_channel_done_rows_stride_loc_channel : STD_LOGIC;
    signal rows_stride_loc_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_rows_stride_loc_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_rows_stride_loc_channel : STD_LOGIC;
    signal ap_channel_done_rows_burst_loc_channel : STD_LOGIC;
    signal rows_burst_loc_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_rows_burst_loc_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_rows_burst_loc_channel : STD_LOGIC;
    signal Axi2AxiStream_1_U0_ap_start : STD_LOGIC;
    signal Axi2AxiStream_1_U0_ap_done : STD_LOGIC;
    signal Axi2AxiStream_1_U0_ap_continue : STD_LOGIC;
    signal Axi2AxiStream_1_U0_ap_idle : STD_LOGIC;
    signal Axi2AxiStream_1_U0_ap_ready : STD_LOGIC;
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWVALID : STD_LOGIC;
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_WVALID : STD_LOGIC;
    signal Axi2AxiStream_1_U0_m_axi_gmem1_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_WLAST : STD_LOGIC;
    signal Axi2AxiStream_1_U0_m_axi_gmem1_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARVALID : STD_LOGIC;
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Axi2AxiStream_1_U0_m_axi_gmem1_RREADY : STD_LOGIC;
    signal Axi2AxiStream_1_U0_m_axi_gmem1_BREADY : STD_LOGIC;
    signal Axi2AxiStream_1_U0_ldata_din : STD_LOGIC_VECTOR (63 downto 0);
    signal Axi2AxiStream_1_U0_ldata_write : STD_LOGIC;
    signal AxiStream2Mat_1_U0_ldata1_read : STD_LOGIC;
    signal AxiStream2Mat_1_U0_imgInput_y_data81_din : STD_LOGIC_VECTOR (7 downto 0);
    signal AxiStream2Mat_1_U0_imgInput_y_data81_write : STD_LOGIC;
    signal AxiStream2Mat_1_U0_rows_read : STD_LOGIC;
    signal AxiStream2Mat_1_U0_cols_read : STD_LOGIC;
    signal AxiStream2Mat_1_U0_ap_start : STD_LOGIC;
    signal AxiStream2Mat_1_U0_ap_done : STD_LOGIC;
    signal AxiStream2Mat_1_U0_ap_ready : STD_LOGIC;
    signal AxiStream2Mat_1_U0_ap_idle : STD_LOGIC;
    signal AxiStream2Mat_1_U0_ap_continue : STD_LOGIC;
    signal rows_c_full_n : STD_LOGIC;
    signal rows_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal rows_c_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal rows_c_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal rows_c_empty_n : STD_LOGIC;
    signal cols_c_full_n : STD_LOGIC;
    signal cols_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal cols_c_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal cols_c_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal cols_c_empty_n : STD_LOGIC;
    signal rows_burst_loc_channel_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal rows_burst_loc_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal rows_burst_loc_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal rows_burst_loc_channel_empty_n : STD_LOGIC;
    signal rows_stride_loc_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal rows_stride_loc_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal rows_stride_loc_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal rows_stride_loc_channel_empty_n : STD_LOGIC;
    signal cols_cast_loc_channel_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal cols_cast_loc_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal cols_cast_loc_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal cols_cast_loc_channel_empty_n : STD_LOGIC;
    signal ldata_full_n : STD_LOGIC;
    signal ldata_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal ldata_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal ldata_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal ldata_empty_n : STD_LOGIC;
    signal ap_sync_ready : STD_LOGIC;
    signal ap_sync_reg_Axi2Mat_Block_entry3_proc_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Axi2Mat_Block_entry3_proc_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_Axi2AxiStream_1_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Axi2AxiStream_1_U0_ap_ready : STD_LOGIC;
    signal start_for_AxiStream2Mat_1_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_AxiStream2Mat_1_U0_full_n : STD_LOGIC;
    signal start_for_AxiStream2Mat_1_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_AxiStream2Mat_1_U0_empty_n : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_Axi2Mat_Block_entry3_proc IS
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
        rows : IN STD_LOGIC_VECTOR (31 downto 0);
        cols : IN STD_LOGIC_VECTOR (31 downto 0);
        rows_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        rows_c_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_c_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
        rows_c_full_n : IN STD_LOGIC;
        rows_c_write : OUT STD_LOGIC;
        cols_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        cols_c_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
        cols_c_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
        cols_c_full_n : IN STD_LOGIC;
        cols_c_write : OUT STD_LOGIC;
        ap_return_0 : OUT STD_LOGIC_VECTOR (15 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_2 : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component pp_pipeline_accel_Axi2AxiStream_1 IS
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
    end component;


    component pp_pipeline_accel_AxiStream2Mat_1 IS
    port (
        ldata1_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        ldata1_empty_n : IN STD_LOGIC;
        ldata1_read : OUT STD_LOGIC;
        imgInput_y_data81_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        imgInput_y_data81_full_n : IN STD_LOGIC;
        imgInput_y_data81_write : OUT STD_LOGIC;
        rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        rows_empty_n : IN STD_LOGIC;
        rows_read : OUT STD_LOGIC;
        cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
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


    component pp_pipeline_accel_fifo_w32_d3_S_x IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w16_d2_S IS
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


    component pp_pipeline_accel_fifo_w32_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w64_d2_S IS
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


    component pp_pipeline_accel_start_for_AxiStream2Mat_1_U0 IS
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
    Axi2Mat_Block_entry3_proc_U0 : component pp_pipeline_accel_Axi2Mat_Block_entry3_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Axi2Mat_Block_entry3_proc_U0_ap_start,
        start_full_n => start_for_AxiStream2Mat_1_U0_full_n,
        ap_done => Axi2Mat_Block_entry3_proc_U0_ap_done,
        ap_continue => Axi2Mat_Block_entry3_proc_U0_ap_continue,
        ap_idle => Axi2Mat_Block_entry3_proc_U0_ap_idle,
        ap_ready => Axi2Mat_Block_entry3_proc_U0_ap_ready,
        start_out => Axi2Mat_Block_entry3_proc_U0_start_out,
        start_write => Axi2Mat_Block_entry3_proc_U0_start_write,
        stride => stride,
        rows => rows,
        cols => cols,
        rows_c_din => Axi2Mat_Block_entry3_proc_U0_rows_c_din,
        rows_c_num_data_valid => rows_c_num_data_valid,
        rows_c_fifo_cap => rows_c_fifo_cap,
        rows_c_full_n => rows_c_full_n,
        rows_c_write => Axi2Mat_Block_entry3_proc_U0_rows_c_write,
        cols_c_din => Axi2Mat_Block_entry3_proc_U0_cols_c_din,
        cols_c_num_data_valid => cols_c_num_data_valid,
        cols_c_fifo_cap => cols_c_fifo_cap,
        cols_c_full_n => cols_c_full_n,
        cols_c_write => Axi2Mat_Block_entry3_proc_U0_cols_c_write,
        ap_return_0 => Axi2Mat_Block_entry3_proc_U0_ap_return_0,
        ap_return_1 => Axi2Mat_Block_entry3_proc_U0_ap_return_1,
        ap_return_2 => Axi2Mat_Block_entry3_proc_U0_ap_return_2);

    Axi2AxiStream_1_U0 : component pp_pipeline_accel_Axi2AxiStream_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Axi2AxiStream_1_U0_ap_start,
        ap_done => Axi2AxiStream_1_U0_ap_done,
        ap_continue => Axi2AxiStream_1_U0_ap_continue,
        ap_idle => Axi2AxiStream_1_U0_ap_idle,
        ap_ready => Axi2AxiStream_1_U0_ap_ready,
        m_axi_gmem1_AWVALID => Axi2AxiStream_1_U0_m_axi_gmem1_AWVALID,
        m_axi_gmem1_AWREADY => ap_const_logic_0,
        m_axi_gmem1_AWADDR => Axi2AxiStream_1_U0_m_axi_gmem1_AWADDR,
        m_axi_gmem1_AWID => Axi2AxiStream_1_U0_m_axi_gmem1_AWID,
        m_axi_gmem1_AWLEN => Axi2AxiStream_1_U0_m_axi_gmem1_AWLEN,
        m_axi_gmem1_AWSIZE => Axi2AxiStream_1_U0_m_axi_gmem1_AWSIZE,
        m_axi_gmem1_AWBURST => Axi2AxiStream_1_U0_m_axi_gmem1_AWBURST,
        m_axi_gmem1_AWLOCK => Axi2AxiStream_1_U0_m_axi_gmem1_AWLOCK,
        m_axi_gmem1_AWCACHE => Axi2AxiStream_1_U0_m_axi_gmem1_AWCACHE,
        m_axi_gmem1_AWPROT => Axi2AxiStream_1_U0_m_axi_gmem1_AWPROT,
        m_axi_gmem1_AWQOS => Axi2AxiStream_1_U0_m_axi_gmem1_AWQOS,
        m_axi_gmem1_AWREGION => Axi2AxiStream_1_U0_m_axi_gmem1_AWREGION,
        m_axi_gmem1_AWUSER => Axi2AxiStream_1_U0_m_axi_gmem1_AWUSER,
        m_axi_gmem1_WVALID => Axi2AxiStream_1_U0_m_axi_gmem1_WVALID,
        m_axi_gmem1_WREADY => ap_const_logic_0,
        m_axi_gmem1_WDATA => Axi2AxiStream_1_U0_m_axi_gmem1_WDATA,
        m_axi_gmem1_WSTRB => Axi2AxiStream_1_U0_m_axi_gmem1_WSTRB,
        m_axi_gmem1_WLAST => Axi2AxiStream_1_U0_m_axi_gmem1_WLAST,
        m_axi_gmem1_WID => Axi2AxiStream_1_U0_m_axi_gmem1_WID,
        m_axi_gmem1_WUSER => Axi2AxiStream_1_U0_m_axi_gmem1_WUSER,
        m_axi_gmem1_ARVALID => Axi2AxiStream_1_U0_m_axi_gmem1_ARVALID,
        m_axi_gmem1_ARREADY => m_axi_gmem1_ARREADY,
        m_axi_gmem1_ARADDR => Axi2AxiStream_1_U0_m_axi_gmem1_ARADDR,
        m_axi_gmem1_ARID => Axi2AxiStream_1_U0_m_axi_gmem1_ARID,
        m_axi_gmem1_ARLEN => Axi2AxiStream_1_U0_m_axi_gmem1_ARLEN,
        m_axi_gmem1_ARSIZE => Axi2AxiStream_1_U0_m_axi_gmem1_ARSIZE,
        m_axi_gmem1_ARBURST => Axi2AxiStream_1_U0_m_axi_gmem1_ARBURST,
        m_axi_gmem1_ARLOCK => Axi2AxiStream_1_U0_m_axi_gmem1_ARLOCK,
        m_axi_gmem1_ARCACHE => Axi2AxiStream_1_U0_m_axi_gmem1_ARCACHE,
        m_axi_gmem1_ARPROT => Axi2AxiStream_1_U0_m_axi_gmem1_ARPROT,
        m_axi_gmem1_ARQOS => Axi2AxiStream_1_U0_m_axi_gmem1_ARQOS,
        m_axi_gmem1_ARREGION => Axi2AxiStream_1_U0_m_axi_gmem1_ARREGION,
        m_axi_gmem1_ARUSER => Axi2AxiStream_1_U0_m_axi_gmem1_ARUSER,
        m_axi_gmem1_RVALID => m_axi_gmem1_RVALID,
        m_axi_gmem1_RREADY => Axi2AxiStream_1_U0_m_axi_gmem1_RREADY,
        m_axi_gmem1_RDATA => m_axi_gmem1_RDATA,
        m_axi_gmem1_RLAST => m_axi_gmem1_RLAST,
        m_axi_gmem1_RID => m_axi_gmem1_RID,
        m_axi_gmem1_RFIFONUM => m_axi_gmem1_RFIFONUM,
        m_axi_gmem1_RUSER => m_axi_gmem1_RUSER,
        m_axi_gmem1_RRESP => m_axi_gmem1_RRESP,
        m_axi_gmem1_BVALID => ap_const_logic_0,
        m_axi_gmem1_BREADY => Axi2AxiStream_1_U0_m_axi_gmem1_BREADY,
        m_axi_gmem1_BRESP => ap_const_lv2_0,
        m_axi_gmem1_BID => ap_const_lv1_0,
        m_axi_gmem1_BUSER => ap_const_lv1_0,
        din => din,
        ldata_din => Axi2AxiStream_1_U0_ldata_din,
        ldata_num_data_valid => ldata_num_data_valid,
        ldata_fifo_cap => ldata_fifo_cap,
        ldata_full_n => ldata_full_n,
        ldata_write => Axi2AxiStream_1_U0_ldata_write,
        p_read => rows_burst_loc_channel_dout,
        p_read1 => rows_stride_loc_channel_dout,
        p_read2 => cols_cast_loc_channel_dout,
        stride => stride);

    AxiStream2Mat_1_U0 : component pp_pipeline_accel_AxiStream2Mat_1
    port map (
        ldata1_dout => ldata_dout,
        ldata1_empty_n => ldata_empty_n,
        ldata1_read => AxiStream2Mat_1_U0_ldata1_read,
        imgInput_y_data81_din => AxiStream2Mat_1_U0_imgInput_y_data81_din,
        imgInput_y_data81_full_n => imgInput_y_data81_full_n,
        imgInput_y_data81_write => AxiStream2Mat_1_U0_imgInput_y_data81_write,
        rows_dout => rows_c_dout,
        rows_empty_n => rows_c_empty_n,
        rows_read => AxiStream2Mat_1_U0_rows_read,
        cols_dout => cols_c_dout,
        cols_empty_n => cols_c_empty_n,
        cols_read => AxiStream2Mat_1_U0_cols_read,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => AxiStream2Mat_1_U0_ap_start,
        ap_done => AxiStream2Mat_1_U0_ap_done,
        ap_ready => AxiStream2Mat_1_U0_ap_ready,
        ap_idle => AxiStream2Mat_1_U0_ap_idle,
        ap_continue => AxiStream2Mat_1_U0_ap_continue);

    rows_c_U : component pp_pipeline_accel_fifo_w32_d3_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2Mat_Block_entry3_proc_U0_rows_c_din,
        if_full_n => rows_c_full_n,
        if_write => Axi2Mat_Block_entry3_proc_U0_rows_c_write,
        if_dout => rows_c_dout,
        if_num_data_valid => rows_c_num_data_valid,
        if_fifo_cap => rows_c_fifo_cap,
        if_empty_n => rows_c_empty_n,
        if_read => AxiStream2Mat_1_U0_rows_read);

    cols_c_U : component pp_pipeline_accel_fifo_w32_d3_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2Mat_Block_entry3_proc_U0_cols_c_din,
        if_full_n => cols_c_full_n,
        if_write => Axi2Mat_Block_entry3_proc_U0_cols_c_write,
        if_dout => cols_c_dout,
        if_num_data_valid => cols_c_num_data_valid,
        if_fifo_cap => cols_c_fifo_cap,
        if_empty_n => cols_c_empty_n,
        if_read => AxiStream2Mat_1_U0_cols_read);

    rows_burst_loc_channel_U : component pp_pipeline_accel_fifo_w16_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2Mat_Block_entry3_proc_U0_ap_return_0,
        if_full_n => rows_burst_loc_channel_full_n,
        if_write => ap_channel_done_rows_burst_loc_channel,
        if_dout => rows_burst_loc_channel_dout,
        if_num_data_valid => rows_burst_loc_channel_num_data_valid,
        if_fifo_cap => rows_burst_loc_channel_fifo_cap,
        if_empty_n => rows_burst_loc_channel_empty_n,
        if_read => Axi2AxiStream_1_U0_ap_ready);

    rows_stride_loc_channel_U : component pp_pipeline_accel_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2Mat_Block_entry3_proc_U0_ap_return_1,
        if_full_n => rows_stride_loc_channel_full_n,
        if_write => ap_channel_done_rows_stride_loc_channel,
        if_dout => rows_stride_loc_channel_dout,
        if_num_data_valid => rows_stride_loc_channel_num_data_valid,
        if_fifo_cap => rows_stride_loc_channel_fifo_cap,
        if_empty_n => rows_stride_loc_channel_empty_n,
        if_read => Axi2AxiStream_1_U0_ap_ready);

    cols_cast_loc_channel_U : component pp_pipeline_accel_fifo_w16_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2Mat_Block_entry3_proc_U0_ap_return_2,
        if_full_n => cols_cast_loc_channel_full_n,
        if_write => ap_channel_done_cols_cast_loc_channel,
        if_dout => cols_cast_loc_channel_dout,
        if_num_data_valid => cols_cast_loc_channel_num_data_valid,
        if_fifo_cap => cols_cast_loc_channel_fifo_cap,
        if_empty_n => cols_cast_loc_channel_empty_n,
        if_read => Axi2AxiStream_1_U0_ap_ready);

    ldata_U : component pp_pipeline_accel_fifo_w64_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Axi2AxiStream_1_U0_ldata_din,
        if_full_n => ldata_full_n,
        if_write => Axi2AxiStream_1_U0_ldata_write,
        if_dout => ldata_dout,
        if_num_data_valid => ldata_num_data_valid,
        if_fifo_cap => ldata_fifo_cap,
        if_empty_n => ldata_empty_n,
        if_read => AxiStream2Mat_1_U0_ldata1_read);

    start_for_AxiStream2Mat_1_U0_U : component pp_pipeline_accel_start_for_AxiStream2Mat_1_U0
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_AxiStream2Mat_1_U0_din,
        if_full_n => start_for_AxiStream2Mat_1_U0_full_n,
        if_write => Axi2Mat_Block_entry3_proc_U0_start_write,
        if_dout => start_for_AxiStream2Mat_1_U0_dout,
        if_empty_n => start_for_AxiStream2Mat_1_U0_empty_n,
        if_read => AxiStream2Mat_1_U0_ap_ready);





    ap_sync_reg_Axi2AxiStream_1_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Axi2AxiStream_1_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Axi2AxiStream_1_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Axi2AxiStream_1_U0_ap_ready <= ap_sync_Axi2AxiStream_1_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_Axi2Mat_Block_entry3_proc_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Axi2Mat_Block_entry3_proc_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Axi2Mat_Block_entry3_proc_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Axi2Mat_Block_entry3_proc_U0_ap_ready <= ap_sync_Axi2Mat_Block_entry3_proc_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_cols_cast_loc_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_channel_write_cols_cast_loc_channel <= ap_const_logic_0;
            else
                if (((Axi2Mat_Block_entry3_proc_U0_ap_done and Axi2Mat_Block_entry3_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_cols_cast_loc_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_cols_cast_loc_channel <= ap_sync_channel_write_cols_cast_loc_channel;
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
                if (((Axi2Mat_Block_entry3_proc_U0_ap_done and Axi2Mat_Block_entry3_proc_U0_ap_continue) = ap_const_logic_1)) then 
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
                if (((Axi2Mat_Block_entry3_proc_U0_ap_done and Axi2Mat_Block_entry3_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_rows_stride_loc_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_rows_stride_loc_channel <= ap_sync_channel_write_rows_stride_loc_channel;
                end if; 
            end if;
        end if;
    end process;

    Axi2AxiStream_1_U0_ap_continue <= ap_const_logic_1;
    Axi2AxiStream_1_U0_ap_start <= (rows_stride_loc_channel_empty_n and rows_burst_loc_channel_empty_n and (ap_sync_reg_Axi2AxiStream_1_U0_ap_ready xor ap_const_logic_1) and cols_cast_loc_channel_empty_n and ap_start);
    Axi2Mat_Block_entry3_proc_U0_ap_continue <= (ap_sync_channel_write_rows_stride_loc_channel and ap_sync_channel_write_rows_burst_loc_channel and ap_sync_channel_write_cols_cast_loc_channel);
    Axi2Mat_Block_entry3_proc_U0_ap_start <= ((ap_sync_reg_Axi2Mat_Block_entry3_proc_U0_ap_ready xor ap_const_logic_1) and ap_start);
    AxiStream2Mat_1_U0_ap_continue <= ap_continue;
    AxiStream2Mat_1_U0_ap_start <= start_for_AxiStream2Mat_1_U0_empty_n;
    ap_channel_done_cols_cast_loc_channel <= ((ap_sync_reg_channel_write_cols_cast_loc_channel xor ap_const_logic_1) and Axi2Mat_Block_entry3_proc_U0_ap_done);
    ap_channel_done_rows_burst_loc_channel <= ((ap_sync_reg_channel_write_rows_burst_loc_channel xor ap_const_logic_1) and Axi2Mat_Block_entry3_proc_U0_ap_done);
    ap_channel_done_rows_stride_loc_channel <= ((ap_sync_reg_channel_write_rows_stride_loc_channel xor ap_const_logic_1) and Axi2Mat_Block_entry3_proc_U0_ap_done);
    ap_done <= AxiStream2Mat_1_U0_ap_done;
    ap_idle <= ((cols_cast_loc_channel_empty_n xor ap_const_logic_1) and (rows_stride_loc_channel_empty_n xor ap_const_logic_1) and (rows_burst_loc_channel_empty_n xor ap_const_logic_1) and AxiStream2Mat_1_U0_ap_idle and Axi2Mat_Block_entry3_proc_U0_ap_idle and Axi2AxiStream_1_U0_ap_idle);
    ap_ready <= ap_sync_ready;
    ap_sync_Axi2AxiStream_1_U0_ap_ready <= (ap_sync_reg_Axi2AxiStream_1_U0_ap_ready or Axi2AxiStream_1_U0_ap_ready);
    ap_sync_Axi2Mat_Block_entry3_proc_U0_ap_ready <= (ap_sync_reg_Axi2Mat_Block_entry3_proc_U0_ap_ready or Axi2Mat_Block_entry3_proc_U0_ap_ready);
    ap_sync_channel_write_cols_cast_loc_channel <= ((cols_cast_loc_channel_full_n and ap_channel_done_cols_cast_loc_channel) or ap_sync_reg_channel_write_cols_cast_loc_channel);
    ap_sync_channel_write_rows_burst_loc_channel <= ((rows_burst_loc_channel_full_n and ap_channel_done_rows_burst_loc_channel) or ap_sync_reg_channel_write_rows_burst_loc_channel);
    ap_sync_channel_write_rows_stride_loc_channel <= ((rows_stride_loc_channel_full_n and ap_channel_done_rows_stride_loc_channel) or ap_sync_reg_channel_write_rows_stride_loc_channel);
    ap_sync_ready <= (ap_sync_Axi2Mat_Block_entry3_proc_U0_ap_ready and ap_sync_Axi2AxiStream_1_U0_ap_ready);
    imgInput_y_data81_din <= AxiStream2Mat_1_U0_imgInput_y_data81_din;
    imgInput_y_data81_write <= AxiStream2Mat_1_U0_imgInput_y_data81_write;
    m_axi_gmem1_ARADDR <= Axi2AxiStream_1_U0_m_axi_gmem1_ARADDR;
    m_axi_gmem1_ARBURST <= Axi2AxiStream_1_U0_m_axi_gmem1_ARBURST;
    m_axi_gmem1_ARCACHE <= Axi2AxiStream_1_U0_m_axi_gmem1_ARCACHE;
    m_axi_gmem1_ARID <= Axi2AxiStream_1_U0_m_axi_gmem1_ARID;
    m_axi_gmem1_ARLEN <= Axi2AxiStream_1_U0_m_axi_gmem1_ARLEN;
    m_axi_gmem1_ARLOCK <= Axi2AxiStream_1_U0_m_axi_gmem1_ARLOCK;
    m_axi_gmem1_ARPROT <= Axi2AxiStream_1_U0_m_axi_gmem1_ARPROT;
    m_axi_gmem1_ARQOS <= Axi2AxiStream_1_U0_m_axi_gmem1_ARQOS;
    m_axi_gmem1_ARREGION <= Axi2AxiStream_1_U0_m_axi_gmem1_ARREGION;
    m_axi_gmem1_ARSIZE <= Axi2AxiStream_1_U0_m_axi_gmem1_ARSIZE;
    m_axi_gmem1_ARUSER <= Axi2AxiStream_1_U0_m_axi_gmem1_ARUSER;
    m_axi_gmem1_ARVALID <= Axi2AxiStream_1_U0_m_axi_gmem1_ARVALID;
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
    m_axi_gmem1_RREADY <= Axi2AxiStream_1_U0_m_axi_gmem1_RREADY;
    m_axi_gmem1_WDATA <= ap_const_lv64_0;
    m_axi_gmem1_WID <= ap_const_lv1_0;
    m_axi_gmem1_WLAST <= ap_const_logic_0;
    m_axi_gmem1_WSTRB <= ap_const_lv8_0;
    m_axi_gmem1_WUSER <= ap_const_lv1_0;
    m_axi_gmem1_WVALID <= ap_const_logic_0;
    start_for_AxiStream2Mat_1_U0_din <= (0=>ap_const_logic_1, others=>'-');
end behav;
