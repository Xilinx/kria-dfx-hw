// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_entry_proc11 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        img_out,
        img_out_c_din,
        img_out_c_num_data_valid,
        img_out_c_fifo_cap,
        img_out_c_full_n,
        img_out_c_write,
        out_img_linestride,
        out_img_linestride_c_din,
        out_img_linestride_c_num_data_valid,
        out_img_linestride_c_fifo_cap,
        out_img_linestride_c_full_n,
        out_img_linestride_c_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [63:0] img_out;
output  [63:0] img_out_c_din;
input  [3:0] img_out_c_num_data_valid;
input  [3:0] img_out_c_fifo_cap;
input   img_out_c_full_n;
output   img_out_c_write;
input  [31:0] out_img_linestride;
output  [31:0] out_img_linestride_c_din;
input  [3:0] out_img_linestride_c_num_data_valid;
input  [3:0] out_img_linestride_c_fifo_cap;
input   out_img_linestride_c_full_n;
output   out_img_linestride_c_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg img_out_c_write;
reg out_img_linestride_c_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    img_out_c_blk_n;
reg    out_img_linestride_c_blk_n;
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
        end else if ((~((ap_start == 1'b0) | (out_img_linestride_c_full_n == 1'b0) | (img_out_c_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (out_img_linestride_c_full_n == 1'b0) | (img_out_c_full_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (out_img_linestride_c_full_n == 1'b0) | (img_out_c_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (out_img_linestride_c_full_n == 1'b0) | (img_out_c_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_out_c_blk_n = img_out_c_full_n;
    end else begin
        img_out_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (out_img_linestride_c_full_n == 1'b0) | (img_out_c_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        img_out_c_write = 1'b1;
    end else begin
        img_out_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_img_linestride_c_blk_n = out_img_linestride_c_full_n;
    end else begin
        out_img_linestride_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (out_img_linestride_c_full_n == 1'b0) | (img_out_c_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_img_linestride_c_write = 1'b1;
    end else begin
        out_img_linestride_c_write = 1'b0;
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
    ap_block_state1 = ((ap_start == 1'b0) | (out_img_linestride_c_full_n == 1'b0) | (img_out_c_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign img_out_c_din = img_out;

assign out_img_linestride_c_din = out_img_linestride;

endmodule //pp_pipeline_accel_entry_proc11
