// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_nv122bgr_0_6_9_2160_3840_1_1_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        src_y_rows_dout,
        src_y_rows_num_data_valid,
        src_y_rows_fifo_cap,
        src_y_rows_empty_n,
        src_y_rows_read,
        src_y_cols_dout,
        src_y_cols_num_data_valid,
        src_y_cols_fifo_cap,
        src_y_cols_empty_n,
        src_y_cols_read,
        imgInput_y_data81_dout,
        imgInput_y_data81_num_data_valid,
        imgInput_y_data81_fifo_cap,
        imgInput_y_data81_empty_n,
        imgInput_y_data81_read,
        imgInput_uv_data82_dout,
        imgInput_uv_data82_num_data_valid,
        imgInput_uv_data82_fifo_cap,
        imgInput_uv_data82_empty_n,
        imgInput_uv_data82_read,
        rgb_mat_data83_din,
        rgb_mat_data83_num_data_valid,
        rgb_mat_data83_fifo_cap,
        rgb_mat_data83_full_n,
        rgb_mat_data83_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] src_y_rows_dout;
input  [1:0] src_y_rows_num_data_valid;
input  [1:0] src_y_rows_fifo_cap;
input   src_y_rows_empty_n;
output   src_y_rows_read;
input  [31:0] src_y_cols_dout;
input  [1:0] src_y_cols_num_data_valid;
input  [1:0] src_y_cols_fifo_cap;
input   src_y_cols_empty_n;
output   src_y_cols_read;
input  [7:0] imgInput_y_data81_dout;
input  [1:0] imgInput_y_data81_num_data_valid;
input  [1:0] imgInput_y_data81_fifo_cap;
input   imgInput_y_data81_empty_n;
output   imgInput_y_data81_read;
input  [15:0] imgInput_uv_data82_dout;
input  [1:0] imgInput_uv_data82_num_data_valid;
input  [1:0] imgInput_uv_data82_fifo_cap;
input   imgInput_uv_data82_empty_n;
output   imgInput_uv_data82_read;
output  [23:0] rgb_mat_data83_din;
input  [1:0] rgb_mat_data83_num_data_valid;
input  [1:0] rgb_mat_data83_fifo_cap;
input   rgb_mat_data83_full_n;
output   rgb_mat_data83_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg src_y_rows_read;
reg src_y_cols_read;
reg imgInput_y_data81_read;
reg imgInput_uv_data82_read;
reg rgb_mat_data83_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    src_y_rows_blk_n;
reg    src_y_cols_blk_n;
wire   [15:0] height_fu_58_p1;
reg   [15:0] height_reg_68;
wire   [15:0] width_fu_63_p1;
reg   [15:0] width_reg_73;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_idle;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_ready;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_y_data81_read;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_uv_data82_read;
wire   [23:0] grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_din;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_write;
reg    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg;
reg    ap_block_state1_ignore_call9;
wire    ap_CS_fsm_state2;
reg    ap_block_state1;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
#0 grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg = 1'b0;
end

pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start),
    .ap_done(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done),
    .ap_idle(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_idle),
    .ap_ready(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_ready),
    .imgInput_y_data81_dout(imgInput_y_data81_dout),
    .imgInput_y_data81_num_data_valid(2'd0),
    .imgInput_y_data81_fifo_cap(2'd0),
    .imgInput_y_data81_empty_n(imgInput_y_data81_empty_n),
    .imgInput_y_data81_read(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_y_data81_read),
    .imgInput_uv_data82_dout(imgInput_uv_data82_dout),
    .imgInput_uv_data82_num_data_valid(2'd0),
    .imgInput_uv_data82_fifo_cap(2'd0),
    .imgInput_uv_data82_empty_n(imgInput_uv_data82_empty_n),
    .imgInput_uv_data82_read(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_uv_data82_read),
    .rgb_mat_data83_din(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_din),
    .rgb_mat_data83_num_data_valid(2'd0),
    .rgb_mat_data83_fifo_cap(2'd0),
    .rgb_mat_data83_full_n(rgb_mat_data83_full_n),
    .rgb_mat_data83_write(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_write),
    .height(height_reg_68),
    .width(width_reg_73)
);

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
        end else if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg <= 1'b0;
    end else begin
        if ((~((ap_start == 1'b0) | (src_y_cols_empty_n == 1'b0) | (src_y_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg <= 1'b1;
        end else if ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_ready == 1'b1)) begin
            grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        height_reg_68 <= height_fu_58_p1;
        width_reg_73 <= width_fu_63_p1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (src_y_cols_empty_n == 1'b0) | (src_y_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        imgInput_uv_data82_read = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_uv_data82_read;
    end else begin
        imgInput_uv_data82_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        imgInput_y_data81_read = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_imgInput_y_data81_read;
    end else begin
        imgInput_y_data81_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        rgb_mat_data83_write = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_write;
    end else begin
        rgb_mat_data83_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_y_cols_blk_n = src_y_cols_empty_n;
    end else begin
        src_y_cols_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (src_y_cols_empty_n == 1'b0) | (src_y_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_y_cols_read = 1'b1;
    end else begin
        src_y_cols_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_y_rows_blk_n = src_y_rows_empty_n;
    end else begin
        src_y_rows_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (src_y_cols_empty_n == 1'b0) | (src_y_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_y_rows_read = 1'b1;
    end else begin
        src_y_rows_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (src_y_cols_empty_n == 1'b0) | (src_y_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (src_y_cols_empty_n == 1'b0) | (src_y_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state1_ignore_call9 = ((ap_start == 1'b0) | (src_y_cols_empty_n == 1'b0) | (src_y_rows_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_ap_start_reg;

assign height_fu_58_p1 = src_y_rows_dout[15:0];

assign rgb_mat_data83_din = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46_rgb_mat_data83_din;

assign width_fu_63_p1 = src_y_cols_dout[15:0];

endmodule //pp_pipeline_accel_nv122bgr_0_6_9_2160_3840_1_1_s
