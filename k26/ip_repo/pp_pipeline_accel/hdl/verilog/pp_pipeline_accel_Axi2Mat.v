// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_Axi2Mat (
        m_axi_gmem2_AWVALID,
        m_axi_gmem2_AWREADY,
        m_axi_gmem2_AWADDR,
        m_axi_gmem2_AWID,
        m_axi_gmem2_AWLEN,
        m_axi_gmem2_AWSIZE,
        m_axi_gmem2_AWBURST,
        m_axi_gmem2_AWLOCK,
        m_axi_gmem2_AWCACHE,
        m_axi_gmem2_AWPROT,
        m_axi_gmem2_AWQOS,
        m_axi_gmem2_AWREGION,
        m_axi_gmem2_AWUSER,
        m_axi_gmem2_WVALID,
        m_axi_gmem2_WREADY,
        m_axi_gmem2_WDATA,
        m_axi_gmem2_WSTRB,
        m_axi_gmem2_WLAST,
        m_axi_gmem2_WID,
        m_axi_gmem2_WUSER,
        m_axi_gmem2_ARVALID,
        m_axi_gmem2_ARREADY,
        m_axi_gmem2_ARADDR,
        m_axi_gmem2_ARID,
        m_axi_gmem2_ARLEN,
        m_axi_gmem2_ARSIZE,
        m_axi_gmem2_ARBURST,
        m_axi_gmem2_ARLOCK,
        m_axi_gmem2_ARCACHE,
        m_axi_gmem2_ARPROT,
        m_axi_gmem2_ARQOS,
        m_axi_gmem2_ARREGION,
        m_axi_gmem2_ARUSER,
        m_axi_gmem2_RVALID,
        m_axi_gmem2_RREADY,
        m_axi_gmem2_RDATA,
        m_axi_gmem2_RLAST,
        m_axi_gmem2_RID,
        m_axi_gmem2_RFIFONUM,
        m_axi_gmem2_RUSER,
        m_axi_gmem2_RRESP,
        m_axi_gmem2_BVALID,
        m_axi_gmem2_BREADY,
        m_axi_gmem2_BRESP,
        m_axi_gmem2_BID,
        m_axi_gmem2_BUSER,
        din,
        imgInput_uv_data82_din,
        imgInput_uv_data82_full_n,
        imgInput_uv_data82_write,
        rows,
        cols,
        stride,
        ap_clk,
        ap_rst,
        stride_ap_vld,
        rows_ap_vld,
        ap_start,
        din_ap_vld,
        cols_ap_vld,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


output   m_axi_gmem2_AWVALID;
input   m_axi_gmem2_AWREADY;
output  [63:0] m_axi_gmem2_AWADDR;
output  [0:0] m_axi_gmem2_AWID;
output  [31:0] m_axi_gmem2_AWLEN;
output  [2:0] m_axi_gmem2_AWSIZE;
output  [1:0] m_axi_gmem2_AWBURST;
output  [1:0] m_axi_gmem2_AWLOCK;
output  [3:0] m_axi_gmem2_AWCACHE;
output  [2:0] m_axi_gmem2_AWPROT;
output  [3:0] m_axi_gmem2_AWQOS;
output  [3:0] m_axi_gmem2_AWREGION;
output  [0:0] m_axi_gmem2_AWUSER;
output   m_axi_gmem2_WVALID;
input   m_axi_gmem2_WREADY;
output  [63:0] m_axi_gmem2_WDATA;
output  [7:0] m_axi_gmem2_WSTRB;
output   m_axi_gmem2_WLAST;
output  [0:0] m_axi_gmem2_WID;
output  [0:0] m_axi_gmem2_WUSER;
output   m_axi_gmem2_ARVALID;
input   m_axi_gmem2_ARREADY;
output  [63:0] m_axi_gmem2_ARADDR;
output  [0:0] m_axi_gmem2_ARID;
output  [31:0] m_axi_gmem2_ARLEN;
output  [2:0] m_axi_gmem2_ARSIZE;
output  [1:0] m_axi_gmem2_ARBURST;
output  [1:0] m_axi_gmem2_ARLOCK;
output  [3:0] m_axi_gmem2_ARCACHE;
output  [2:0] m_axi_gmem2_ARPROT;
output  [3:0] m_axi_gmem2_ARQOS;
output  [3:0] m_axi_gmem2_ARREGION;
output  [0:0] m_axi_gmem2_ARUSER;
input   m_axi_gmem2_RVALID;
output   m_axi_gmem2_RREADY;
input  [63:0] m_axi_gmem2_RDATA;
input   m_axi_gmem2_RLAST;
input  [0:0] m_axi_gmem2_RID;
input  [8:0] m_axi_gmem2_RFIFONUM;
input  [0:0] m_axi_gmem2_RUSER;
input  [1:0] m_axi_gmem2_RRESP;
input   m_axi_gmem2_BVALID;
output   m_axi_gmem2_BREADY;
input  [1:0] m_axi_gmem2_BRESP;
input  [0:0] m_axi_gmem2_BID;
input  [0:0] m_axi_gmem2_BUSER;
input  [63:0] din;
output  [15:0] imgInput_uv_data82_din;
input   imgInput_uv_data82_full_n;
output   imgInput_uv_data82_write;
input  [10:0] rows;
input  [10:0] cols;
input  [31:0] stride;
input   ap_clk;
input   ap_rst;
input   stride_ap_vld;
input   rows_ap_vld;
input   ap_start;
input   din_ap_vld;
input   cols_ap_vld;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

wire    Axi2Mat_Block_entry1_proc_U0_ap_start;
wire    Axi2Mat_Block_entry1_proc_U0_ap_done;
wire    Axi2Mat_Block_entry1_proc_U0_ap_continue;
wire    Axi2Mat_Block_entry1_proc_U0_ap_idle;
wire    Axi2Mat_Block_entry1_proc_U0_ap_ready;
wire    Axi2Mat_Block_entry1_proc_U0_start_out;
wire    Axi2Mat_Block_entry1_proc_U0_start_write;
wire   [10:0] Axi2Mat_Block_entry1_proc_U0_rows_c_din;
wire    Axi2Mat_Block_entry1_proc_U0_rows_c_write;
wire   [10:0] Axi2Mat_Block_entry1_proc_U0_ap_return_0;
wire   [10:0] Axi2Mat_Block_entry1_proc_U0_ap_return_1;
wire    ap_channel_done_rows_stride_loc_channel;
wire    rows_stride_loc_channel_full_n;
reg    ap_sync_reg_channel_write_rows_stride_loc_channel;
wire    ap_sync_channel_write_rows_stride_loc_channel;
wire    ap_channel_done_rows_burst_loc_channel;
wire    rows_burst_loc_channel_full_n;
reg    ap_sync_reg_channel_write_rows_burst_loc_channel;
wire    ap_sync_channel_write_rows_burst_loc_channel;
wire    Axi2AxiStream_U0_ap_start;
wire    Axi2AxiStream_U0_ap_done;
wire    Axi2AxiStream_U0_ap_continue;
wire    Axi2AxiStream_U0_ap_idle;
wire    Axi2AxiStream_U0_ap_ready;
wire    Axi2AxiStream_U0_m_axi_gmem2_AWVALID;
wire   [63:0] Axi2AxiStream_U0_m_axi_gmem2_AWADDR;
wire   [0:0] Axi2AxiStream_U0_m_axi_gmem2_AWID;
wire   [31:0] Axi2AxiStream_U0_m_axi_gmem2_AWLEN;
wire   [2:0] Axi2AxiStream_U0_m_axi_gmem2_AWSIZE;
wire   [1:0] Axi2AxiStream_U0_m_axi_gmem2_AWBURST;
wire   [1:0] Axi2AxiStream_U0_m_axi_gmem2_AWLOCK;
wire   [3:0] Axi2AxiStream_U0_m_axi_gmem2_AWCACHE;
wire   [2:0] Axi2AxiStream_U0_m_axi_gmem2_AWPROT;
wire   [3:0] Axi2AxiStream_U0_m_axi_gmem2_AWQOS;
wire   [3:0] Axi2AxiStream_U0_m_axi_gmem2_AWREGION;
wire   [0:0] Axi2AxiStream_U0_m_axi_gmem2_AWUSER;
wire    Axi2AxiStream_U0_m_axi_gmem2_WVALID;
wire   [63:0] Axi2AxiStream_U0_m_axi_gmem2_WDATA;
wire   [7:0] Axi2AxiStream_U0_m_axi_gmem2_WSTRB;
wire    Axi2AxiStream_U0_m_axi_gmem2_WLAST;
wire   [0:0] Axi2AxiStream_U0_m_axi_gmem2_WID;
wire   [0:0] Axi2AxiStream_U0_m_axi_gmem2_WUSER;
wire    Axi2AxiStream_U0_m_axi_gmem2_ARVALID;
wire   [63:0] Axi2AxiStream_U0_m_axi_gmem2_ARADDR;
wire   [0:0] Axi2AxiStream_U0_m_axi_gmem2_ARID;
wire   [31:0] Axi2AxiStream_U0_m_axi_gmem2_ARLEN;
wire   [2:0] Axi2AxiStream_U0_m_axi_gmem2_ARSIZE;
wire   [1:0] Axi2AxiStream_U0_m_axi_gmem2_ARBURST;
wire   [1:0] Axi2AxiStream_U0_m_axi_gmem2_ARLOCK;
wire   [3:0] Axi2AxiStream_U0_m_axi_gmem2_ARCACHE;
wire   [2:0] Axi2AxiStream_U0_m_axi_gmem2_ARPROT;
wire   [3:0] Axi2AxiStream_U0_m_axi_gmem2_ARQOS;
wire   [3:0] Axi2AxiStream_U0_m_axi_gmem2_ARREGION;
wire   [0:0] Axi2AxiStream_U0_m_axi_gmem2_ARUSER;
wire    Axi2AxiStream_U0_m_axi_gmem2_RREADY;
wire    Axi2AxiStream_U0_m_axi_gmem2_BREADY;
wire   [63:0] Axi2AxiStream_U0_ldata_din;
wire    Axi2AxiStream_U0_ldata_write;
wire   [10:0] Axi2AxiStream_U0_cols_c_din;
wire    Axi2AxiStream_U0_cols_c_write;
wire    AxiStream2Mat_U0_ldata1_read;
wire   [15:0] AxiStream2Mat_U0_imgInput_uv_data82_din;
wire    AxiStream2Mat_U0_imgInput_uv_data82_write;
wire    AxiStream2Mat_U0_rows_read;
wire    AxiStream2Mat_U0_cols_read;
wire    AxiStream2Mat_U0_ap_start;
wire    AxiStream2Mat_U0_ap_done;
wire    AxiStream2Mat_U0_ap_ready;
wire    AxiStream2Mat_U0_ap_idle;
wire    AxiStream2Mat_U0_ap_continue;
wire    rows_c_full_n;
wire   [10:0] rows_c_dout;
wire   [2:0] rows_c_num_data_valid;
wire   [2:0] rows_c_fifo_cap;
wire    rows_c_empty_n;
wire   [10:0] rows_burst_loc_channel_dout;
wire   [1:0] rows_burst_loc_channel_num_data_valid;
wire   [1:0] rows_burst_loc_channel_fifo_cap;
wire    rows_burst_loc_channel_empty_n;
wire   [10:0] rows_stride_loc_channel_dout;
wire   [1:0] rows_stride_loc_channel_num_data_valid;
wire   [1:0] rows_stride_loc_channel_fifo_cap;
wire    rows_stride_loc_channel_empty_n;
wire    ldata_full_n;
wire   [63:0] ldata_dout;
wire   [1:0] ldata_num_data_valid;
wire   [1:0] ldata_fifo_cap;
wire    ldata_empty_n;
wire    cols_c_full_n;
wire   [10:0] cols_c_dout;
wire   [1:0] cols_c_num_data_valid;
wire   [1:0] cols_c_fifo_cap;
wire    cols_c_empty_n;
wire    ap_sync_ready;
reg    ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready;
wire    ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready;
reg    ap_sync_reg_Axi2AxiStream_U0_ap_ready;
wire    ap_sync_Axi2AxiStream_U0_ap_ready;
wire   [0:0] start_for_AxiStream2Mat_U0_din;
wire    start_for_AxiStream2Mat_U0_full_n;
wire   [0:0] start_for_AxiStream2Mat_U0_dout;
wire    start_for_AxiStream2Mat_U0_empty_n;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_channel_write_rows_stride_loc_channel = 1'b0;
#0 ap_sync_reg_channel_write_rows_burst_loc_channel = 1'b0;
#0 ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready = 1'b0;
#0 ap_sync_reg_Axi2AxiStream_U0_ap_ready = 1'b0;
end

pp_pipeline_accel_Axi2Mat_Block_entry1_proc Axi2Mat_Block_entry1_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Axi2Mat_Block_entry1_proc_U0_ap_start),
    .start_full_n(start_for_AxiStream2Mat_U0_full_n),
    .ap_done(Axi2Mat_Block_entry1_proc_U0_ap_done),
    .ap_continue(Axi2Mat_Block_entry1_proc_U0_ap_continue),
    .ap_idle(Axi2Mat_Block_entry1_proc_U0_ap_idle),
    .ap_ready(Axi2Mat_Block_entry1_proc_U0_ap_ready),
    .start_out(Axi2Mat_Block_entry1_proc_U0_start_out),
    .start_write(Axi2Mat_Block_entry1_proc_U0_start_write),
    .stride(stride),
    .rows(rows),
    .rows_c_din(Axi2Mat_Block_entry1_proc_U0_rows_c_din),
    .rows_c_num_data_valid(rows_c_num_data_valid),
    .rows_c_fifo_cap(rows_c_fifo_cap),
    .rows_c_full_n(rows_c_full_n),
    .rows_c_write(Axi2Mat_Block_entry1_proc_U0_rows_c_write),
    .ap_return_0(Axi2Mat_Block_entry1_proc_U0_ap_return_0),
    .ap_return_1(Axi2Mat_Block_entry1_proc_U0_ap_return_1)
);

pp_pipeline_accel_Axi2AxiStream Axi2AxiStream_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Axi2AxiStream_U0_ap_start),
    .ap_done(Axi2AxiStream_U0_ap_done),
    .ap_continue(Axi2AxiStream_U0_ap_continue),
    .ap_idle(Axi2AxiStream_U0_ap_idle),
    .ap_ready(Axi2AxiStream_U0_ap_ready),
    .m_axi_gmem2_AWVALID(Axi2AxiStream_U0_m_axi_gmem2_AWVALID),
    .m_axi_gmem2_AWREADY(1'b0),
    .m_axi_gmem2_AWADDR(Axi2AxiStream_U0_m_axi_gmem2_AWADDR),
    .m_axi_gmem2_AWID(Axi2AxiStream_U0_m_axi_gmem2_AWID),
    .m_axi_gmem2_AWLEN(Axi2AxiStream_U0_m_axi_gmem2_AWLEN),
    .m_axi_gmem2_AWSIZE(Axi2AxiStream_U0_m_axi_gmem2_AWSIZE),
    .m_axi_gmem2_AWBURST(Axi2AxiStream_U0_m_axi_gmem2_AWBURST),
    .m_axi_gmem2_AWLOCK(Axi2AxiStream_U0_m_axi_gmem2_AWLOCK),
    .m_axi_gmem2_AWCACHE(Axi2AxiStream_U0_m_axi_gmem2_AWCACHE),
    .m_axi_gmem2_AWPROT(Axi2AxiStream_U0_m_axi_gmem2_AWPROT),
    .m_axi_gmem2_AWQOS(Axi2AxiStream_U0_m_axi_gmem2_AWQOS),
    .m_axi_gmem2_AWREGION(Axi2AxiStream_U0_m_axi_gmem2_AWREGION),
    .m_axi_gmem2_AWUSER(Axi2AxiStream_U0_m_axi_gmem2_AWUSER),
    .m_axi_gmem2_WVALID(Axi2AxiStream_U0_m_axi_gmem2_WVALID),
    .m_axi_gmem2_WREADY(1'b0),
    .m_axi_gmem2_WDATA(Axi2AxiStream_U0_m_axi_gmem2_WDATA),
    .m_axi_gmem2_WSTRB(Axi2AxiStream_U0_m_axi_gmem2_WSTRB),
    .m_axi_gmem2_WLAST(Axi2AxiStream_U0_m_axi_gmem2_WLAST),
    .m_axi_gmem2_WID(Axi2AxiStream_U0_m_axi_gmem2_WID),
    .m_axi_gmem2_WUSER(Axi2AxiStream_U0_m_axi_gmem2_WUSER),
    .m_axi_gmem2_ARVALID(Axi2AxiStream_U0_m_axi_gmem2_ARVALID),
    .m_axi_gmem2_ARREADY(m_axi_gmem2_ARREADY),
    .m_axi_gmem2_ARADDR(Axi2AxiStream_U0_m_axi_gmem2_ARADDR),
    .m_axi_gmem2_ARID(Axi2AxiStream_U0_m_axi_gmem2_ARID),
    .m_axi_gmem2_ARLEN(Axi2AxiStream_U0_m_axi_gmem2_ARLEN),
    .m_axi_gmem2_ARSIZE(Axi2AxiStream_U0_m_axi_gmem2_ARSIZE),
    .m_axi_gmem2_ARBURST(Axi2AxiStream_U0_m_axi_gmem2_ARBURST),
    .m_axi_gmem2_ARLOCK(Axi2AxiStream_U0_m_axi_gmem2_ARLOCK),
    .m_axi_gmem2_ARCACHE(Axi2AxiStream_U0_m_axi_gmem2_ARCACHE),
    .m_axi_gmem2_ARPROT(Axi2AxiStream_U0_m_axi_gmem2_ARPROT),
    .m_axi_gmem2_ARQOS(Axi2AxiStream_U0_m_axi_gmem2_ARQOS),
    .m_axi_gmem2_ARREGION(Axi2AxiStream_U0_m_axi_gmem2_ARREGION),
    .m_axi_gmem2_ARUSER(Axi2AxiStream_U0_m_axi_gmem2_ARUSER),
    .m_axi_gmem2_RVALID(m_axi_gmem2_RVALID),
    .m_axi_gmem2_RREADY(Axi2AxiStream_U0_m_axi_gmem2_RREADY),
    .m_axi_gmem2_RDATA(m_axi_gmem2_RDATA),
    .m_axi_gmem2_RLAST(m_axi_gmem2_RLAST),
    .m_axi_gmem2_RID(m_axi_gmem2_RID),
    .m_axi_gmem2_RFIFONUM(m_axi_gmem2_RFIFONUM),
    .m_axi_gmem2_RUSER(m_axi_gmem2_RUSER),
    .m_axi_gmem2_RRESP(m_axi_gmem2_RRESP),
    .m_axi_gmem2_BVALID(1'b0),
    .m_axi_gmem2_BREADY(Axi2AxiStream_U0_m_axi_gmem2_BREADY),
    .m_axi_gmem2_BRESP(2'd0),
    .m_axi_gmem2_BID(1'd0),
    .m_axi_gmem2_BUSER(1'd0),
    .din(din),
    .ldata_din(Axi2AxiStream_U0_ldata_din),
    .ldata_num_data_valid(ldata_num_data_valid),
    .ldata_fifo_cap(ldata_fifo_cap),
    .ldata_full_n(ldata_full_n),
    .ldata_write(Axi2AxiStream_U0_ldata_write),
    .p_read(rows_burst_loc_channel_dout),
    .p_read1(rows_stride_loc_channel_dout),
    .cols(cols),
    .stride(stride),
    .cols_c_din(Axi2AxiStream_U0_cols_c_din),
    .cols_c_num_data_valid(cols_c_num_data_valid),
    .cols_c_fifo_cap(cols_c_fifo_cap),
    .cols_c_full_n(cols_c_full_n),
    .cols_c_write(Axi2AxiStream_U0_cols_c_write)
);

pp_pipeline_accel_AxiStream2Mat AxiStream2Mat_U0(
    .ldata1_dout(ldata_dout),
    .ldata1_empty_n(ldata_empty_n),
    .ldata1_read(AxiStream2Mat_U0_ldata1_read),
    .imgInput_uv_data82_din(AxiStream2Mat_U0_imgInput_uv_data82_din),
    .imgInput_uv_data82_full_n(imgInput_uv_data82_full_n),
    .imgInput_uv_data82_write(AxiStream2Mat_U0_imgInput_uv_data82_write),
    .rows_dout(rows_c_dout),
    .rows_empty_n(rows_c_empty_n),
    .rows_read(AxiStream2Mat_U0_rows_read),
    .cols_dout(cols_c_dout),
    .cols_empty_n(cols_c_empty_n),
    .cols_read(AxiStream2Mat_U0_cols_read),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(AxiStream2Mat_U0_ap_start),
    .ap_done(AxiStream2Mat_U0_ap_done),
    .ap_ready(AxiStream2Mat_U0_ap_ready),
    .ap_idle(AxiStream2Mat_U0_ap_idle),
    .ap_continue(AxiStream2Mat_U0_ap_continue)
);

pp_pipeline_accel_fifo_w11_d3_S_x rows_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Axi2Mat_Block_entry1_proc_U0_rows_c_din),
    .if_full_n(rows_c_full_n),
    .if_write(Axi2Mat_Block_entry1_proc_U0_rows_c_write),
    .if_dout(rows_c_dout),
    .if_num_data_valid(rows_c_num_data_valid),
    .if_fifo_cap(rows_c_fifo_cap),
    .if_empty_n(rows_c_empty_n),
    .if_read(AxiStream2Mat_U0_rows_read)
);

pp_pipeline_accel_fifo_w11_d2_S rows_burst_loc_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Axi2Mat_Block_entry1_proc_U0_ap_return_0),
    .if_full_n(rows_burst_loc_channel_full_n),
    .if_write(ap_channel_done_rows_burst_loc_channel),
    .if_dout(rows_burst_loc_channel_dout),
    .if_num_data_valid(rows_burst_loc_channel_num_data_valid),
    .if_fifo_cap(rows_burst_loc_channel_fifo_cap),
    .if_empty_n(rows_burst_loc_channel_empty_n),
    .if_read(Axi2AxiStream_U0_ap_ready)
);

pp_pipeline_accel_fifo_w11_d2_S rows_stride_loc_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Axi2Mat_Block_entry1_proc_U0_ap_return_1),
    .if_full_n(rows_stride_loc_channel_full_n),
    .if_write(ap_channel_done_rows_stride_loc_channel),
    .if_dout(rows_stride_loc_channel_dout),
    .if_num_data_valid(rows_stride_loc_channel_num_data_valid),
    .if_fifo_cap(rows_stride_loc_channel_fifo_cap),
    .if_empty_n(rows_stride_loc_channel_empty_n),
    .if_read(Axi2AxiStream_U0_ap_ready)
);

pp_pipeline_accel_fifo_w64_d2_S_x ldata_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Axi2AxiStream_U0_ldata_din),
    .if_full_n(ldata_full_n),
    .if_write(Axi2AxiStream_U0_ldata_write),
    .if_dout(ldata_dout),
    .if_num_data_valid(ldata_num_data_valid),
    .if_fifo_cap(ldata_fifo_cap),
    .if_empty_n(ldata_empty_n),
    .if_read(AxiStream2Mat_U0_ldata1_read)
);

pp_pipeline_accel_fifo_w11_d2_S cols_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Axi2AxiStream_U0_cols_c_din),
    .if_full_n(cols_c_full_n),
    .if_write(Axi2AxiStream_U0_cols_c_write),
    .if_dout(cols_c_dout),
    .if_num_data_valid(cols_c_num_data_valid),
    .if_fifo_cap(cols_c_fifo_cap),
    .if_empty_n(cols_c_empty_n),
    .if_read(AxiStream2Mat_U0_cols_read)
);

pp_pipeline_accel_start_for_AxiStream2Mat_U0 start_for_AxiStream2Mat_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_AxiStream2Mat_U0_din),
    .if_full_n(start_for_AxiStream2Mat_U0_full_n),
    .if_write(Axi2Mat_Block_entry1_proc_U0_start_write),
    .if_dout(start_for_AxiStream2Mat_U0_dout),
    .if_empty_n(start_for_AxiStream2Mat_U0_empty_n),
    .if_read(AxiStream2Mat_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_Axi2AxiStream_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Axi2AxiStream_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Axi2AxiStream_U0_ap_ready <= ap_sync_Axi2AxiStream_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready <= ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_rows_burst_loc_channel <= 1'b0;
    end else begin
        if (((Axi2Mat_Block_entry1_proc_U0_ap_done & Axi2Mat_Block_entry1_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_rows_burst_loc_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_rows_burst_loc_channel <= ap_sync_channel_write_rows_burst_loc_channel;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_rows_stride_loc_channel <= 1'b0;
    end else begin
        if (((Axi2Mat_Block_entry1_proc_U0_ap_done & Axi2Mat_Block_entry1_proc_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_rows_stride_loc_channel <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_rows_stride_loc_channel <= ap_sync_channel_write_rows_stride_loc_channel;
        end
    end
end

assign Axi2AxiStream_U0_ap_continue = 1'b1;

assign Axi2AxiStream_U0_ap_start = (rows_stride_loc_channel_empty_n & rows_burst_loc_channel_empty_n & (ap_sync_reg_Axi2AxiStream_U0_ap_ready ^ 1'b1) & ap_start);

assign Axi2Mat_Block_entry1_proc_U0_ap_continue = (ap_sync_channel_write_rows_stride_loc_channel & ap_sync_channel_write_rows_burst_loc_channel);

assign Axi2Mat_Block_entry1_proc_U0_ap_start = ((ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready ^ 1'b1) & ap_start);

assign AxiStream2Mat_U0_ap_continue = ap_continue;

assign AxiStream2Mat_U0_ap_start = start_for_AxiStream2Mat_U0_empty_n;

assign ap_channel_done_rows_burst_loc_channel = ((ap_sync_reg_channel_write_rows_burst_loc_channel ^ 1'b1) & Axi2Mat_Block_entry1_proc_U0_ap_done);

assign ap_channel_done_rows_stride_loc_channel = ((ap_sync_reg_channel_write_rows_stride_loc_channel ^ 1'b1) & Axi2Mat_Block_entry1_proc_U0_ap_done);

assign ap_done = AxiStream2Mat_U0_ap_done;

assign ap_idle = ((rows_stride_loc_channel_empty_n ^ 1'b1) & (rows_burst_loc_channel_empty_n ^ 1'b1) & AxiStream2Mat_U0_ap_idle & Axi2Mat_Block_entry1_proc_U0_ap_idle & Axi2AxiStream_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_Axi2AxiStream_U0_ap_ready = (ap_sync_reg_Axi2AxiStream_U0_ap_ready | Axi2AxiStream_U0_ap_ready);

assign ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready = (ap_sync_reg_Axi2Mat_Block_entry1_proc_U0_ap_ready | Axi2Mat_Block_entry1_proc_U0_ap_ready);

assign ap_sync_channel_write_rows_burst_loc_channel = ((rows_burst_loc_channel_full_n & ap_channel_done_rows_burst_loc_channel) | ap_sync_reg_channel_write_rows_burst_loc_channel);

assign ap_sync_channel_write_rows_stride_loc_channel = ((rows_stride_loc_channel_full_n & ap_channel_done_rows_stride_loc_channel) | ap_sync_reg_channel_write_rows_stride_loc_channel);

assign ap_sync_ready = (ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready & ap_sync_Axi2AxiStream_U0_ap_ready);

assign imgInput_uv_data82_din = AxiStream2Mat_U0_imgInput_uv_data82_din;

assign imgInput_uv_data82_write = AxiStream2Mat_U0_imgInput_uv_data82_write;

assign m_axi_gmem2_ARADDR = Axi2AxiStream_U0_m_axi_gmem2_ARADDR;

assign m_axi_gmem2_ARBURST = Axi2AxiStream_U0_m_axi_gmem2_ARBURST;

assign m_axi_gmem2_ARCACHE = Axi2AxiStream_U0_m_axi_gmem2_ARCACHE;

assign m_axi_gmem2_ARID = Axi2AxiStream_U0_m_axi_gmem2_ARID;

assign m_axi_gmem2_ARLEN = Axi2AxiStream_U0_m_axi_gmem2_ARLEN;

assign m_axi_gmem2_ARLOCK = Axi2AxiStream_U0_m_axi_gmem2_ARLOCK;

assign m_axi_gmem2_ARPROT = Axi2AxiStream_U0_m_axi_gmem2_ARPROT;

assign m_axi_gmem2_ARQOS = Axi2AxiStream_U0_m_axi_gmem2_ARQOS;

assign m_axi_gmem2_ARREGION = Axi2AxiStream_U0_m_axi_gmem2_ARREGION;

assign m_axi_gmem2_ARSIZE = Axi2AxiStream_U0_m_axi_gmem2_ARSIZE;

assign m_axi_gmem2_ARUSER = Axi2AxiStream_U0_m_axi_gmem2_ARUSER;

assign m_axi_gmem2_ARVALID = Axi2AxiStream_U0_m_axi_gmem2_ARVALID;

assign m_axi_gmem2_AWADDR = 64'd0;

assign m_axi_gmem2_AWBURST = 2'd0;

assign m_axi_gmem2_AWCACHE = 4'd0;

assign m_axi_gmem2_AWID = 1'd0;

assign m_axi_gmem2_AWLEN = 32'd0;

assign m_axi_gmem2_AWLOCK = 2'd0;

assign m_axi_gmem2_AWPROT = 3'd0;

assign m_axi_gmem2_AWQOS = 4'd0;

assign m_axi_gmem2_AWREGION = 4'd0;

assign m_axi_gmem2_AWSIZE = 3'd0;

assign m_axi_gmem2_AWUSER = 1'd0;

assign m_axi_gmem2_AWVALID = 1'b0;

assign m_axi_gmem2_BREADY = 1'b0;

assign m_axi_gmem2_RREADY = Axi2AxiStream_U0_m_axi_gmem2_RREADY;

assign m_axi_gmem2_WDATA = 64'd0;

assign m_axi_gmem2_WID = 1'd0;

assign m_axi_gmem2_WLAST = 1'b0;

assign m_axi_gmem2_WSTRB = 8'd0;

assign m_axi_gmem2_WUSER = 1'd0;

assign m_axi_gmem2_WVALID = 1'b0;

assign start_for_AxiStream2Mat_U0_din = 1'b1;

endmodule //pp_pipeline_accel_Axi2Mat
