// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_entry_proc9 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rows_dout,
        rows_num_data_valid,
        rows_fifo_cap,
        rows_empty_n,
        rows_read,
        rows_c_din,
        rows_c_num_data_valid,
        rows_c_fifo_cap,
        rows_c_full_n,
        rows_c_write,
        cols_dout,
        cols_num_data_valid,
        cols_fifo_cap,
        cols_empty_n,
        cols_read,
        cols_c_din,
        cols_c_num_data_valid,
        cols_c_fifo_cap,
        cols_c_full_n,
        cols_c_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] rows_dout;
input  [2:0] rows_num_data_valid;
input  [2:0] rows_fifo_cap;
input   rows_empty_n;
output   rows_read;
output  [31:0] rows_c_din;
input  [2:0] rows_c_num_data_valid;
input  [2:0] rows_c_fifo_cap;
input   rows_c_full_n;
output   rows_c_write;
input  [31:0] cols_dout;
input  [2:0] cols_num_data_valid;
input  [2:0] cols_fifo_cap;
input   cols_empty_n;
output   cols_read;
output  [31:0] cols_c_din;
input  [2:0] cols_c_num_data_valid;
input  [2:0] cols_c_fifo_cap;
input   cols_c_full_n;
output   cols_c_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rows_read;
reg rows_c_write;
reg cols_read;
reg cols_c_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    rows_blk_n;
reg    rows_c_blk_n;
reg    cols_blk_n;
reg    cols_c_blk_n;
reg    ap_block_state1;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_blk_n = cols_empty_n;
    end else begin
        cols_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_c_blk_n = cols_c_full_n;
    end else begin
        cols_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_c_write = 1'b1;
    end else begin
        cols_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_read = 1'b1;
    end else begin
        cols_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_blk_n = rows_empty_n;
    end else begin
        rows_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_c_blk_n = rows_c_full_n;
    end else begin
        rows_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_c_write = 1'b1;
    end else begin
        rows_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_read = 1'b1;
    end else begin
        rows_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (cols_c_full_n == 1'b0) | (cols_empty_n == 1'b0) | (rows_c_full_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign cols_c_din = cols_dout;

assign rows_c_din = rows_dout;

endmodule //pp_pipeline_accel_entry_proc9
