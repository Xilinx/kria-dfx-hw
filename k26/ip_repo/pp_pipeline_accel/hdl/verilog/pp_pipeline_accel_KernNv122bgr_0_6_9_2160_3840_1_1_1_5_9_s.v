// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
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
        rgb_mat_data83_write,
        height,
        width
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
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
input  [15:0] height;
input  [15:0] width;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg imgInput_y_data81_read;
reg imgInput_uv_data82_read;
reg rgb_mat_data83_write;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] empty_fu_125_p1;
reg   [0:0] empty_reg_191;
wire   [0:0] empty_214_fu_129_p1;
reg   [0:0] empty_214_reg_201;
wire   [0:0] evenBlock_3_fu_152_p2;
reg   [0:0] evenBlock_3_reg_209;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln4194_fu_141_p2;
wire   [0:0] evenRow_1_fu_157_p2;
reg   [0:0] evenRow_1_reg_214;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_idle;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_ready;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_y_data81_read;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_uv_data82_read;
wire   [15:0] grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_din;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_write;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_read;
wire   [23:0] grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_din;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_write;
wire   [15:0] grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o_ap_vld;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_done;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_idle;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_ready;
wire    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_uvStream_read;
reg   [0:0] evenBlock_reg_78;
wire    ap_CS_fsm_state4;
reg   [0:0] evenRow_reg_90;
reg    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg;
wire    ap_CS_fsm_state3;
wire   [15:0] uvStream_dout;
wire    uvStream_empty_n;
reg    uvStream_read;
wire    uvStream_full_n;
reg    uvStream_write;
reg   [15:0] uvPacked_V_fu_54;
reg    grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
reg   [15:0] i_fu_58;
wire   [15:0] i_7_fu_146_p2;
reg    ap_block_state6_on_subcall_done;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg = 1'b0;
#0 grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg = 1'b0;
end

pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start),
    .ap_done(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done),
    .ap_idle(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_idle),
    .ap_ready(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_ready),
    .imgInput_y_data81_dout(imgInput_y_data81_dout),
    .imgInput_y_data81_num_data_valid(2'd0),
    .imgInput_y_data81_fifo_cap(2'd0),
    .imgInput_y_data81_empty_n(imgInput_y_data81_empty_n),
    .imgInput_y_data81_read(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_y_data81_read),
    .imgInput_uv_data82_dout(imgInput_uv_data82_dout),
    .imgInput_uv_data82_num_data_valid(2'd0),
    .imgInput_uv_data82_fifo_cap(2'd0),
    .imgInput_uv_data82_empty_n(imgInput_uv_data82_empty_n),
    .imgInput_uv_data82_read(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_uv_data82_read),
    .uvStream_din(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_din),
    .uvStream_full_n(uvStream_full_n),
    .uvStream_write(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_write),
    .uvStream_dout(uvStream_dout),
    .uvStream_empty_n(uvStream_empty_n),
    .uvStream_read(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_read),
    .rgb_mat_data83_din(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_din),
    .rgb_mat_data83_num_data_valid(2'd0),
    .rgb_mat_data83_fifo_cap(2'd0),
    .rgb_mat_data83_full_n(rgb_mat_data83_full_n),
    .rgb_mat_data83_write(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_write),
    .evenBlock(evenBlock_reg_78),
    .width(width),
    .evenRow(evenRow_reg_90),
    .uvPacked_V_1_out_i(uvPacked_V_fu_54),
    .uvPacked_V_1_out_o(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o),
    .uvPacked_V_1_out_o_ap_vld(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o_ap_vld)
);

pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1 grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start),
    .ap_done(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_done),
    .ap_idle(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_idle),
    .ap_ready(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_ready),
    .uvStream_dout(uvStream_dout),
    .uvStream_empty_n(uvStream_empty_n),
    .uvStream_read(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_uvStream_read),
    .width(width)
);

pp_pipeline_accel_fifo_w16_d3840_A uvStream_fifo_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_din),
    .if_full_n(uvStream_full_n),
    .if_write(uvStream_write),
    .if_dout(uvStream_dout),
    .if_empty_n(uvStream_empty_n),
    .if_read(uvStream_read)
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
        grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg <= 1'b1;
        end else if ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_ready == 1'b1)) begin
            grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg <= 1'b1;
        end else if ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_ready == 1'b1)) begin
            grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        evenBlock_reg_78 <= evenBlock_3_reg_209;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        evenBlock_reg_78 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        evenRow_reg_90 <= evenRow_1_reg_214;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        evenRow_reg_90 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_fu_58 <= 16'd0;
    end else if (((icmp_ln4194_fu_141_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        i_fu_58 <= i_7_fu_146_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        empty_214_reg_201 <= empty_214_fu_129_p1;
        empty_reg_191 <= empty_fu_125_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4194_fu_141_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        evenBlock_3_reg_209 <= evenBlock_3_fu_152_p2;
        evenRow_1_reg_214 <= evenRow_1_fu_157_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        uvPacked_V_fu_54 <= grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvPacked_V_1_out_o;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state6_on_subcall_done)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((1'b1 == ap_CS_fsm_state6) & (1'b0 == ap_block_state6_on_subcall_done)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) & (1'b0 == ap_block_state6_on_subcall_done))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        imgInput_uv_data82_read = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_uv_data82_read;
    end else begin
        imgInput_uv_data82_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        imgInput_y_data81_read = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_imgInput_y_data81_read;
    end else begin
        imgInput_y_data81_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        rgb_mat_data83_write = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_write;
    end else begin
        rgb_mat_data83_write = 1'b0;
    end
end

always @ (*) begin
    if (((empty_reg_191 == 1'd1) & (1'b1 == ap_CS_fsm_state6))) begin
        uvStream_read = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_uvStream_read;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        uvStream_read = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_read;
    end else begin
        uvStream_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        uvStream_write = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_uvStream_write;
    end else begin
        uvStream_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln4194_fu_141_p2 == 1'd1) & (empty_reg_191 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else if (((icmp_ln4194_fu_141_p2 == 1'd1) & (empty_reg_191 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (1'b0 == ap_block_state6_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state6_on_subcall_done = ((empty_reg_191 == 1'd1) & (grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_done == 1'b0));
end

assign empty_214_fu_129_p1 = width[0:0];

assign empty_fu_125_p1 = height[0:0];

assign evenBlock_3_fu_152_p2 = (evenBlock_reg_78 ^ empty_214_reg_201);

assign evenRow_1_fu_157_p2 = (evenRow_reg_90 ^ 1'd1);

assign grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_ap_start_reg;

assign grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_VITIS_LOOP_4244_1_fu_119_ap_start_reg;

assign i_7_fu_146_p2 = (i_fu_58 + 16'd1);

assign icmp_ln4194_fu_141_p2 = ((i_fu_58 == height) ? 1'b1 : 1'b0);

assign rgb_mat_data83_din = grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102_rgb_mat_data83_din;

endmodule //pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s
