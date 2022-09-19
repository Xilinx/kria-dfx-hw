// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        bound,
        p_read1,
        line_buffer_V_1_address0,
        line_buffer_V_1_ce0,
        line_buffer_V_1_we0,
        line_buffer_V_1_d0,
        line_buffer_V_address0,
        line_buffer_V_ce0,
        line_buffer_V_we0,
        line_buffer_V_d0,
        rgb_mat_data83_dout,
        rgb_mat_data83_num_data_valid,
        rgb_mat_data83_fifo_cap,
        rgb_mat_data83_empty_n,
        rgb_mat_data83_read
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [32:0] bound;
input  [31:0] p_read1;
output  [11:0] line_buffer_V_1_address0;
output   line_buffer_V_1_ce0;
output   line_buffer_V_1_we0;
output  [23:0] line_buffer_V_1_d0;
output  [11:0] line_buffer_V_address0;
output   line_buffer_V_ce0;
output   line_buffer_V_we0;
output  [23:0] line_buffer_V_d0;
input  [23:0] rgb_mat_data83_dout;
input  [1:0] rgb_mat_data83_num_data_valid;
input  [1:0] rgb_mat_data83_fifo_cap;
input   rgb_mat_data83_empty_n;
output   rgb_mat_data83_read;

reg ap_idle;
reg line_buffer_V_1_ce0;
reg line_buffer_V_1_we0;
reg line_buffer_V_ce0;
reg line_buffer_V_we0;
reg rgb_mat_data83_read;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state4_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln337_fu_128_p2;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    rgb_mat_data83_blk_n;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln337_reg_231;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire    ap_block_pp0_stage1_11001;
wire   [32:0] add_ln337_fu_133_p2;
reg   [32:0] add_ln337_reg_235;
reg   [31:0] j_load_reg_240;
wire   [0:0] icmp_ln342_fu_145_p2;
reg   [0:0] icmp_ln342_reg_245;
wire   [0:0] trunc_ln337_fu_164_p1;
reg   [0:0] trunc_ln337_reg_250;
reg   [23:0] tmp_V_reg_254;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [63:0] zext_ln342_fu_183_p1;
wire    ap_block_pp0_stage1;
reg   [31:0] j_fu_54;
wire   [31:0] add_ln342_fu_189_p2;
wire    ap_loop_init;
reg   [1:0] i_fu_58;
wire   [1:0] select_ln337_1_fu_156_p3;
reg   [32:0] indvar_flatten_fu_62;
wire   [1:0] add_ln337_1_fu_150_p2;
wire   [31:0] select_ln337_fu_177_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

pp_pipeline_accel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_58 <= 2'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln337_reg_231 == 1'd0))) begin
            i_fu_58 <= select_ln337_1_fu_156_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_62 <= 33'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln337_reg_231 == 1'd0))) begin
            indvar_flatten_fu_62 <= add_ln337_reg_235;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        j_fu_54 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        j_fu_54 <= add_ln342_fu_189_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln337_reg_235 <= add_ln337_fu_133_p2;
        icmp_ln337_reg_231 <= icmp_ln337_fu_128_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln337_reg_231 == 1'd0))) begin
        icmp_ln342_reg_245 <= icmp_ln342_fu_145_p2;
        j_load_reg_240 <= j_fu_54;
        tmp_V_reg_254 <= rgb_mat_data83_dout;
        trunc_ln337_reg_250 <= trunc_ln337_fu_164_p1;
    end
end

always @ (*) begin
    if (((icmp_ln337_fu_128_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        line_buffer_V_1_ce0 = 1'b1;
    end else begin
        line_buffer_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (trunc_ln337_reg_250 == 1'd1))) begin
        line_buffer_V_1_we0 = 1'b1;
    end else begin
        line_buffer_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        line_buffer_V_ce0 = 1'b1;
    end else begin
        line_buffer_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (trunc_ln337_reg_250 == 1'd0))) begin
        line_buffer_V_we0 = 1'b1;
    end else begin
        line_buffer_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln337_reg_231 == 1'd0))) begin
        rgb_mat_data83_blk_n = rgb_mat_data83_empty_n;
    end else begin
        rgb_mat_data83_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln337_reg_231 == 1'd0))) begin
        rgb_mat_data83_read = 1'b1;
    end else begin
        rgb_mat_data83_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln337_1_fu_150_p2 = (i_fu_58 + 2'd1);

assign add_ln337_fu_133_p2 = (indvar_flatten_fu_62 + 33'd1);

assign add_ln342_fu_189_p2 = (select_ln337_fu_177_p3 + 32'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln337_reg_231 == 1'd0) & (rgb_mat_data83_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln337_reg_231 == 1'd0) & (rgb_mat_data83_empty_n == 1'b0));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = ((icmp_ln337_reg_231 == 1'd0) & (rgb_mat_data83_empty_n == 1'b0));
end

assign ap_block_state4_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign icmp_ln337_fu_128_p2 = ((indvar_flatten_fu_62 == bound) ? 1'b1 : 1'b0);

assign icmp_ln342_fu_145_p2 = ((j_fu_54 == p_read1) ? 1'b1 : 1'b0);

assign line_buffer_V_1_address0 = zext_ln342_fu_183_p1;

assign line_buffer_V_1_d0 = tmp_V_reg_254;

assign line_buffer_V_address0 = zext_ln342_fu_183_p1;

assign line_buffer_V_d0 = tmp_V_reg_254;

assign select_ln337_1_fu_156_p3 = ((icmp_ln342_fu_145_p2[0:0] == 1'b1) ? add_ln337_1_fu_150_p2 : i_fu_58);

assign select_ln337_fu_177_p3 = ((icmp_ln342_reg_245[0:0] == 1'b1) ? 32'd0 : j_load_reg_240);

assign trunc_ln337_fu_164_p1 = select_ln337_1_fu_156_p3[0:0];

assign zext_ln342_fu_183_p1 = select_ln337_fu_177_p3;

endmodule //pp_pipeline_accel_resizeNNBilinear_Pipeline_VITIS_LOOP_337_1_VITIS_LOOP_342_2
