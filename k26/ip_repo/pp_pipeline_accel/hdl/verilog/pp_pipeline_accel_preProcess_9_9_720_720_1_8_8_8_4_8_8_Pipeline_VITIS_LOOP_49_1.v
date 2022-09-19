// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        resize_out_mat_data84_dout,
        resize_out_mat_data84_num_data_valid,
        resize_out_mat_data84_fifo_cap,
        resize_out_mat_data84_empty_n,
        resize_out_mat_data84_read,
        out_mat_data85_din,
        out_mat_data85_num_data_valid,
        out_mat_data85_fifo_cap,
        out_mat_data85_full_n,
        out_mat_data85_write,
        loop_count,
        rhs,
        sext_ln1319,
        rhs_1,
        sext_ln1319_1,
        rhs_2,
        sext_ln1319_2
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [23:0] resize_out_mat_data84_dout;
input  [1:0] resize_out_mat_data84_num_data_valid;
input  [1:0] resize_out_mat_data84_fifo_cap;
input   resize_out_mat_data84_empty_n;
output   resize_out_mat_data84_read;
output  [23:0] out_mat_data85_din;
input  [1:0] out_mat_data85_num_data_valid;
input  [1:0] out_mat_data85_fifo_cap;
input   out_mat_data85_full_n;
output   out_mat_data85_write;
input  [31:0] loop_count;
input  [7:0] rhs;
input  [7:0] sext_ln1319;
input  [7:0] rhs_1;
input  [7:0] sext_ln1319_1;
input  [7:0] rhs_2;
input  [7:0] sext_ln1319_2;

reg ap_idle;
reg resize_out_mat_data84_read;
reg out_mat_data85_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln49_fu_173_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    resize_out_mat_data84_blk_n;
wire    ap_block_pp0_stage0;
reg    out_mat_data85_blk_n;
wire  signed [16:0] sext_ln1319_2_cast_fu_137_p1;
reg  signed [16:0] sext_ln1319_2_cast_reg_361;
reg    ap_block_pp0_stage0_11001;
wire   [8:0] rhs_2_cast_fu_141_p1;
reg   [8:0] rhs_2_cast_reg_366;
wire  signed [16:0] sext_ln1319_1_cast_fu_145_p1;
reg  signed [16:0] sext_ln1319_1_cast_reg_371;
wire   [8:0] rhs_1_cast_fu_149_p1;
reg   [8:0] rhs_1_cast_reg_376;
wire  signed [16:0] sext_ln1319_cast_fu_153_p1;
reg  signed [16:0] sext_ln1319_cast_reg_381;
wire   [8:0] rhs_cast_fu_157_p1;
reg   [8:0] rhs_cast_reg_386;
wire   [8:0] ret_V_fu_198_p2;
reg  signed [8:0] ret_V_reg_395;
wire   [8:0] ret_V_24_fu_217_p2;
reg  signed [8:0] ret_V_24_reg_400;
wire   [8:0] ret_V_25_fu_236_p2;
reg  signed [8:0] ret_V_25_reg_405;
reg   [7:0] trunc_ln6_reg_410;
reg   [0:0] tmp_reg_415;
reg   [7:0] trunc_ln864_1_reg_420;
reg   [0:0] tmp_16_reg_425;
reg   [7:0] trunc_ln864_2_reg_430;
reg   [0:0] tmp_17_reg_435;
reg   [30:0] k_fu_78;
wire   [30:0] add_ln49_fu_179_p2;
wire    ap_loop_init;
reg   [30:0] ap_sig_allocacmp_k_load;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] zext_ln49_fu_169_p1;
wire   [7:0] x_1pix_V_fu_190_p1;
wire   [8:0] zext_ln859_fu_194_p1;
wire   [7:0] x_1pix_V_1_fu_203_p4;
wire   [8:0] zext_ln859_1_fu_213_p1;
wire   [7:0] x_1pix_V_2_fu_222_p4;
wire   [8:0] zext_ln859_2_fu_232_p1;
wire  signed [7:0] r_V_fu_244_p1;
wire   [16:0] r_V_fu_244_p2;
wire  signed [7:0] r_V_25_fu_270_p1;
wire   [16:0] r_V_25_fu_270_p2;
wire  signed [7:0] r_V_26_fu_296_p1;
wire   [16:0] r_V_26_fu_296_p2;
wire   [7:0] zext_ln423_fu_319_p1;
wire   [7:0] zext_ln423_1_fu_327_p1;
wire   [7:0] zext_ln423_2_fu_335_p1;
wire   [7:0] out_1pix_V_2_fu_338_p2;
wire   [7:0] out_1pix_V_1_fu_330_p2;
wire   [7:0] out_1pix_V_fu_322_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

pp_pipeline_accel_mul_9s_8s_17_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 9 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 17 ))
mul_9s_8s_17_1_1_U259(
    .din0(ret_V_reg_395),
    .din1(r_V_fu_244_p1),
    .dout(r_V_fu_244_p2)
);

pp_pipeline_accel_mul_9s_8s_17_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 9 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 17 ))
mul_9s_8s_17_1_1_U260(
    .din0(ret_V_24_reg_400),
    .din1(r_V_25_fu_270_p1),
    .dout(r_V_25_fu_270_p2)
);

pp_pipeline_accel_mul_9s_8s_17_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 9 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 17 ))
mul_9s_8s_17_1_1_U261(
    .din0(ret_V_25_reg_405),
    .din1(r_V_26_fu_296_p1),
    .dout(r_V_26_fu_296_p2)
);

pp_pipeline_accel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln49_fu_173_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            k_fu_78 <= add_ln49_fu_179_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            k_fu_78 <= 31'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        ret_V_24_reg_400 <= ret_V_24_fu_217_p2;
        ret_V_25_reg_405 <= ret_V_25_fu_236_p2;
        ret_V_reg_395 <= ret_V_fu_198_p2;
        rhs_1_cast_reg_376[7 : 0] <= rhs_1_cast_fu_149_p1[7 : 0];
        rhs_2_cast_reg_366[7 : 0] <= rhs_2_cast_fu_141_p1[7 : 0];
        rhs_cast_reg_386[7 : 0] <= rhs_cast_fu_157_p1[7 : 0];
        sext_ln1319_1_cast_reg_371 <= sext_ln1319_1_cast_fu_145_p1;
        sext_ln1319_2_cast_reg_361 <= sext_ln1319_2_cast_fu_137_p1;
        sext_ln1319_cast_reg_381 <= sext_ln1319_cast_fu_153_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        tmp_16_reg_425 <= r_V_25_fu_270_p2[32'd3];
        tmp_17_reg_435 <= r_V_26_fu_296_p2[32'd3];
        tmp_reg_415 <= r_V_fu_244_p2[32'd3];
        trunc_ln6_reg_410 <= {{r_V_fu_244_p2[11:4]}};
        trunc_ln864_1_reg_420 <= {{r_V_25_fu_270_p2[11:4]}};
        trunc_ln864_2_reg_430 <= {{r_V_26_fu_296_p2[11:4]}};
    end
end

always @ (*) begin
    if (((icmp_ln49_fu_173_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_k_load = 31'd0;
    end else begin
        ap_sig_allocacmp_k_load = k_fu_78;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        out_mat_data85_blk_n = out_mat_data85_full_n;
    end else begin
        out_mat_data85_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        out_mat_data85_write = 1'b1;
    end else begin
        out_mat_data85_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        resize_out_mat_data84_blk_n = resize_out_mat_data84_empty_n;
    end else begin
        resize_out_mat_data84_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        resize_out_mat_data84_read = 1'b1;
    end else begin
        resize_out_mat_data84_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln49_fu_179_p2 = (ap_sig_allocacmp_k_load + 31'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((out_mat_data85_full_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((resize_out_mat_data84_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((out_mat_data85_full_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((resize_out_mat_data84_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((out_mat_data85_full_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((resize_out_mat_data84_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (resize_out_mat_data84_empty_n == 1'b0);
end

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = (out_mat_data85_full_n == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln49_fu_173_p2 = (($signed(zext_ln49_fu_169_p1) < $signed(loop_count)) ? 1'b1 : 1'b0);

assign out_1pix_V_1_fu_330_p2 = (trunc_ln864_1_reg_420 + zext_ln423_1_fu_327_p1);

assign out_1pix_V_2_fu_338_p2 = (trunc_ln864_2_reg_430 + zext_ln423_2_fu_335_p1);

assign out_1pix_V_fu_322_p2 = (trunc_ln6_reg_410 + zext_ln423_fu_319_p1);

assign out_mat_data85_din = {{{out_1pix_V_2_fu_338_p2}, {out_1pix_V_1_fu_330_p2}}, {out_1pix_V_fu_322_p2}};

assign r_V_25_fu_270_p1 = sext_ln1319_1_cast_reg_371;

assign r_V_26_fu_296_p1 = sext_ln1319_2_cast_reg_361;

assign r_V_fu_244_p1 = sext_ln1319_cast_reg_381;

assign ret_V_24_fu_217_p2 = (zext_ln859_1_fu_213_p1 - rhs_1_cast_reg_376);

assign ret_V_25_fu_236_p2 = (zext_ln859_2_fu_232_p1 - rhs_2_cast_reg_366);

assign ret_V_fu_198_p2 = (zext_ln859_fu_194_p1 - rhs_cast_reg_386);

assign rhs_1_cast_fu_149_p1 = rhs_1;

assign rhs_2_cast_fu_141_p1 = rhs_2;

assign rhs_cast_fu_157_p1 = rhs;

assign sext_ln1319_1_cast_fu_145_p1 = $signed(sext_ln1319_1);

assign sext_ln1319_2_cast_fu_137_p1 = $signed(sext_ln1319_2);

assign sext_ln1319_cast_fu_153_p1 = $signed(sext_ln1319);

assign x_1pix_V_1_fu_203_p4 = {{resize_out_mat_data84_dout[15:8]}};

assign x_1pix_V_2_fu_222_p4 = {{resize_out_mat_data84_dout[23:16]}};

assign x_1pix_V_fu_190_p1 = resize_out_mat_data84_dout[7:0];

assign zext_ln423_1_fu_327_p1 = tmp_16_reg_425;

assign zext_ln423_2_fu_335_p1 = tmp_17_reg_435;

assign zext_ln423_fu_319_p1 = tmp_reg_415;

assign zext_ln49_fu_169_p1 = ap_sig_allocacmp_k_load;

assign zext_ln859_1_fu_213_p1 = x_1pix_V_1_fu_203_p4;

assign zext_ln859_2_fu_232_p1 = x_1pix_V_2_fu_222_p4;

assign zext_ln859_fu_194_p1 = x_1pix_V_fu_190_p1;

always @ (posedge ap_clk) begin
    rhs_2_cast_reg_366[8] <= 1'b0;
    rhs_1_cast_reg_376[8] <= 1'b0;
    rhs_cast_reg_386[8] <= 1'b0;
end

endmodule //pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1
