// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_AxiStream2Mat (
        ldata1_dout,
        ldata1_empty_n,
        ldata1_read,
        imgInput_uv_data82_din,
        imgInput_uv_data82_full_n,
        imgInput_uv_data82_write,
        rows_dout,
        rows_empty_n,
        rows_read,
        cols_dout,
        cols_empty_n,
        cols_read,
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


input  [63:0] ldata1_dout;
input   ldata1_empty_n;
output   ldata1_read;
output  [15:0] imgInput_uv_data82_din;
input   imgInput_uv_data82_full_n;
output   imgInput_uv_data82_write;
input  [10:0] rows_dout;
input   rows_empty_n;
output   rows_read;
input  [10:0] cols_dout;
input   cols_empty_n;
output   cols_read;
input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

wire    entry_proc8_U0_ap_start;
wire    entry_proc8_U0_ap_done;
wire    entry_proc8_U0_ap_continue;
wire    entry_proc8_U0_ap_idle;
wire    entry_proc8_U0_ap_ready;
wire    entry_proc8_U0_rows_read;
wire   [10:0] entry_proc8_U0_rows_c_din;
wire    entry_proc8_U0_rows_c_write;
wire    entry_proc8_U0_cols_read;
wire   [10:0] entry_proc8_U0_cols_c_din;
wire    entry_proc8_U0_cols_c_write;
wire    last_blk_pxl_width_1_U0_ap_start;
wire    last_blk_pxl_width_1_U0_ap_done;
wire    last_blk_pxl_width_1_U0_ap_continue;
wire    last_blk_pxl_width_1_U0_ap_idle;
wire    last_blk_pxl_width_1_U0_ap_ready;
wire   [4:0] last_blk_pxl_width_1_U0_return_r;
wire    last_blk_width_channel_full_n;
wire    AxiStream2MatStream_2_U0_ap_start;
wire    AxiStream2MatStream_2_U0_ap_done;
wire    AxiStream2MatStream_2_U0_ap_continue;
wire    AxiStream2MatStream_2_U0_ap_idle;
wire    AxiStream2MatStream_2_U0_ap_ready;
wire    AxiStream2MatStream_2_U0_ldata1_read;
wire   [15:0] AxiStream2MatStream_2_U0_imgInput_uv_data82_din;
wire    AxiStream2MatStream_2_U0_imgInput_uv_data82_write;
wire    AxiStream2MatStream_2_U0_rows_read;
wire    AxiStream2MatStream_2_U0_cols_bound_per_npc_read;
wire    rows_c_full_n;
wire   [10:0] rows_c_dout;
wire   [2:0] rows_c_num_data_valid;
wire   [2:0] rows_c_fifo_cap;
wire    rows_c_empty_n;
wire    cols_c_full_n;
wire   [10:0] cols_c_dout;
wire   [2:0] cols_c_num_data_valid;
wire   [2:0] cols_c_fifo_cap;
wire    cols_c_empty_n;
wire   [4:0] last_blk_width_channel_dout;
wire   [1:0] last_blk_width_channel_num_data_valid;
wire   [1:0] last_blk_width_channel_fifo_cap;
wire    last_blk_width_channel_empty_n;
wire    ap_sync_ready;
reg    ap_sync_reg_entry_proc8_U0_ap_ready;
wire    ap_sync_entry_proc8_U0_ap_ready;
reg    ap_sync_reg_last_blk_pxl_width_1_U0_ap_ready;
wire    ap_sync_last_blk_pxl_width_1_U0_ap_ready;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_entry_proc8_U0_ap_ready = 1'b0;
#0 ap_sync_reg_last_blk_pxl_width_1_U0_ap_ready = 1'b0;
end

pp_pipeline_accel_entry_proc8 entry_proc8_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(entry_proc8_U0_ap_start),
    .ap_done(entry_proc8_U0_ap_done),
    .ap_continue(entry_proc8_U0_ap_continue),
    .ap_idle(entry_proc8_U0_ap_idle),
    .ap_ready(entry_proc8_U0_ap_ready),
    .rows_dout(rows_dout),
    .rows_num_data_valid(3'd0),
    .rows_fifo_cap(3'd0),
    .rows_empty_n(rows_empty_n),
    .rows_read(entry_proc8_U0_rows_read),
    .rows_c_din(entry_proc8_U0_rows_c_din),
    .rows_c_num_data_valid(rows_c_num_data_valid),
    .rows_c_fifo_cap(rows_c_fifo_cap),
    .rows_c_full_n(rows_c_full_n),
    .rows_c_write(entry_proc8_U0_rows_c_write),
    .cols_dout(cols_dout),
    .cols_num_data_valid(2'd0),
    .cols_fifo_cap(2'd0),
    .cols_empty_n(cols_empty_n),
    .cols_read(entry_proc8_U0_cols_read),
    .cols_c_din(entry_proc8_U0_cols_c_din),
    .cols_c_num_data_valid(cols_c_num_data_valid),
    .cols_c_fifo_cap(cols_c_fifo_cap),
    .cols_c_full_n(cols_c_full_n),
    .cols_c_write(entry_proc8_U0_cols_c_write)
);

pp_pipeline_accel_last_blk_pxl_width_1 last_blk_pxl_width_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(last_blk_pxl_width_1_U0_ap_start),
    .ap_done(last_blk_pxl_width_1_U0_ap_done),
    .ap_continue(last_blk_pxl_width_1_U0_ap_continue),
    .ap_idle(last_blk_pxl_width_1_U0_ap_idle),
    .ap_ready(last_blk_pxl_width_1_U0_ap_ready),
    .return_r(last_blk_pxl_width_1_U0_return_r)
);

pp_pipeline_accel_AxiStream2MatStream_2_s AxiStream2MatStream_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(AxiStream2MatStream_2_U0_ap_start),
    .ap_done(AxiStream2MatStream_2_U0_ap_done),
    .ap_continue(AxiStream2MatStream_2_U0_ap_continue),
    .ap_idle(AxiStream2MatStream_2_U0_ap_idle),
    .ap_ready(AxiStream2MatStream_2_U0_ap_ready),
    .ldata1_dout(ldata1_dout),
    .ldata1_num_data_valid(2'd0),
    .ldata1_fifo_cap(2'd0),
    .ldata1_empty_n(ldata1_empty_n),
    .ldata1_read(AxiStream2MatStream_2_U0_ldata1_read),
    .imgInput_uv_data82_din(AxiStream2MatStream_2_U0_imgInput_uv_data82_din),
    .imgInput_uv_data82_num_data_valid(2'd0),
    .imgInput_uv_data82_fifo_cap(2'd0),
    .imgInput_uv_data82_full_n(imgInput_uv_data82_full_n),
    .imgInput_uv_data82_write(AxiStream2MatStream_2_U0_imgInput_uv_data82_write),
    .rows_dout(rows_c_dout),
    .rows_num_data_valid(rows_c_num_data_valid),
    .rows_fifo_cap(rows_c_fifo_cap),
    .rows_empty_n(rows_c_empty_n),
    .rows_read(AxiStream2MatStream_2_U0_rows_read),
    .cols_bound_per_npc_dout(cols_c_dout),
    .cols_bound_per_npc_num_data_valid(cols_c_num_data_valid),
    .cols_bound_per_npc_fifo_cap(cols_c_fifo_cap),
    .cols_bound_per_npc_empty_n(cols_c_empty_n),
    .cols_bound_per_npc_read(AxiStream2MatStream_2_U0_cols_bound_per_npc_read),
    .last_blk_width(last_blk_width_channel_dout)
);

pp_pipeline_accel_fifo_w11_d3_S rows_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(entry_proc8_U0_rows_c_din),
    .if_full_n(rows_c_full_n),
    .if_write(entry_proc8_U0_rows_c_write),
    .if_dout(rows_c_dout),
    .if_num_data_valid(rows_c_num_data_valid),
    .if_fifo_cap(rows_c_fifo_cap),
    .if_empty_n(rows_c_empty_n),
    .if_read(AxiStream2MatStream_2_U0_rows_read)
);

pp_pipeline_accel_fifo_w11_d3_S cols_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(entry_proc8_U0_cols_c_din),
    .if_full_n(cols_c_full_n),
    .if_write(entry_proc8_U0_cols_c_write),
    .if_dout(cols_c_dout),
    .if_num_data_valid(cols_c_num_data_valid),
    .if_fifo_cap(cols_c_fifo_cap),
    .if_empty_n(cols_c_empty_n),
    .if_read(AxiStream2MatStream_2_U0_cols_bound_per_npc_read)
);

pp_pipeline_accel_fifo_w5_d2_S last_blk_width_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(last_blk_pxl_width_1_U0_return_r),
    .if_full_n(last_blk_width_channel_full_n),
    .if_write(last_blk_pxl_width_1_U0_ap_done),
    .if_dout(last_blk_width_channel_dout),
    .if_num_data_valid(last_blk_width_channel_num_data_valid),
    .if_fifo_cap(last_blk_width_channel_fifo_cap),
    .if_empty_n(last_blk_width_channel_empty_n),
    .if_read(AxiStream2MatStream_2_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_entry_proc8_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_entry_proc8_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_entry_proc8_U0_ap_ready <= ap_sync_entry_proc8_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_last_blk_pxl_width_1_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_last_blk_pxl_width_1_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_last_blk_pxl_width_1_U0_ap_ready <= ap_sync_last_blk_pxl_width_1_U0_ap_ready;
        end
    end
end

assign AxiStream2MatStream_2_U0_ap_continue = ap_continue;

assign AxiStream2MatStream_2_U0_ap_start = last_blk_width_channel_empty_n;

assign ap_done = AxiStream2MatStream_2_U0_ap_done;

assign ap_idle = (last_blk_pxl_width_1_U0_ap_idle & (last_blk_width_channel_empty_n ^ 1'b1) & entry_proc8_U0_ap_idle & AxiStream2MatStream_2_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_entry_proc8_U0_ap_ready = (entry_proc8_U0_ap_ready | ap_sync_reg_entry_proc8_U0_ap_ready);

assign ap_sync_last_blk_pxl_width_1_U0_ap_ready = (last_blk_pxl_width_1_U0_ap_ready | ap_sync_reg_last_blk_pxl_width_1_U0_ap_ready);

assign ap_sync_ready = (ap_sync_last_blk_pxl_width_1_U0_ap_ready & ap_sync_entry_proc8_U0_ap_ready);

assign cols_read = entry_proc8_U0_cols_read;

assign entry_proc8_U0_ap_continue = 1'b1;

assign entry_proc8_U0_ap_start = ((ap_sync_reg_entry_proc8_U0_ap_ready ^ 1'b1) & ap_start);

assign imgInput_uv_data82_din = AxiStream2MatStream_2_U0_imgInput_uv_data82_din;

assign imgInput_uv_data82_write = AxiStream2MatStream_2_U0_imgInput_uv_data82_write;

assign last_blk_pxl_width_1_U0_ap_continue = last_blk_width_channel_full_n;

assign last_blk_pxl_width_1_U0_ap_start = ((ap_sync_reg_last_blk_pxl_width_1_U0_ap_ready ^ 1'b1) & ap_start);

assign ldata1_read = AxiStream2MatStream_2_U0_ldata1_read;

assign rows_read = entry_proc8_U0_rows_read;

endmodule //pp_pipeline_accel_AxiStream2Mat
