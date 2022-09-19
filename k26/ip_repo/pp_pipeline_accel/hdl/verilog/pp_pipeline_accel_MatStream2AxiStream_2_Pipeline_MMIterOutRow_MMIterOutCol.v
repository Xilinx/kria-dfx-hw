// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        out_mat_data85_dout,
        out_mat_data85_num_data_valid,
        out_mat_data85_fifo_cap,
        out_mat_data85_empty_n,
        out_mat_data85_read,
        ldata1_din,
        ldata1_num_data_valid,
        ldata1_fifo_cap,
        ldata1_full_n,
        ldata1_write,
        bound,
        cols_bound_per_npc_cast,
        op2_assign,
        last_blk_width_load,
        cols_bound_per_npc_load,
        localbuffer_V_3_out,
        localbuffer_V_3_out_ap_vld,
        filled_V_1_out,
        filled_V_1_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [23:0] out_mat_data85_dout;
input  [1:0] out_mat_data85_num_data_valid;
input  [1:0] out_mat_data85_fifo_cap;
input   out_mat_data85_empty_n;
output   out_mat_data85_read;
output  [63:0] ldata1_din;
input  [1:0] ldata1_num_data_valid;
input  [1:0] ldata1_fifo_cap;
input   ldata1_full_n;
output   ldata1_write;
input  [31:0] bound;
input  [15:0] cols_bound_per_npc_cast;
input  [31:0] op2_assign;
input  [3:0] last_blk_width_load;
input  [31:0] cols_bound_per_npc_load;
output  [63:0] localbuffer_V_3_out;
output   localbuffer_V_3_out_ap_vld;
output  [6:0] filled_V_1_out;
output   filled_V_1_out_ap_vld;

reg ap_idle;
reg out_mat_data85_read;
reg ldata1_write;
reg localbuffer_V_3_out_ap_vld;
reg filled_V_1_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
reg   [0:0] icmp_ln1309_reg_465;
reg   [0:0] icmp_ln1309_reg_465_pp0_iter2_reg;
reg   [0:0] icmp_ln1073_reg_480;
reg    ap_predicate_op44_read_state4;
reg    ap_block_state4_pp0_stage0_iter3;
reg   [0:0] icmp_ln1309_reg_465_pp0_iter3_reg;
reg   [0:0] icmp_ln1073_1_reg_494;
reg    ap_predicate_op67_write_state5;
reg    ap_block_state5_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1309_fu_202_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    out_mat_data85_blk_n;
wire    ap_block_pp0_stage0;
reg    ldata1_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [15:0] select_ln1302_fu_221_p3;
reg   [15:0] select_ln1302_reg_469;
wire   [0:0] bLast_fu_237_p2;
reg   [0:0] bLast_reg_475;
wire   [0:0] icmp_ln1073_fu_242_p2;
reg   [6:0] filled_V_load_1_reg_489;
wire   [0:0] icmp_ln1073_1_fu_281_p2;
wire   [7:0] ret_V_28_fu_291_p2;
reg   [7:0] ret_V_28_reg_498;
wire   [5:0] trunc_ln984_fu_297_p1;
reg   [5:0] trunc_ln984_reg_504;
reg   [6:0] ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4;
wire   [6:0] or_ln_fu_301_p3;
wire   [6:0] ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159;
wire   [6:0] zext_ln1321_fu_267_p1;
wire   [23:0] ap_phi_reg_pp0_iter0_val_V_1_reg_168;
reg   [23:0] ap_phi_reg_pp0_iter1_val_V_1_reg_168;
reg   [23:0] ap_phi_reg_pp0_iter2_val_V_1_reg_168;
reg   [23:0] ap_phi_reg_pp0_iter3_val_V_1_reg_168;
reg   [23:0] ap_phi_reg_pp0_iter4_val_V_1_reg_168;
reg   [6:0] filled_V_fu_86;
wire   [6:0] filled_next_fu_313_p2;
wire    ap_loop_init;
reg   [63:0] localbuffer_V_fu_90;
wire   [63:0] localbuffer_V_3_fu_382_p3;
wire   [63:0] ret_V_fu_340_p2;
reg   [15:0] j_V_fu_94;
wire   [15:0] j_V_1_fu_247_p2;
reg   [15:0] ap_sig_allocacmp_j_V_load;
reg   [31:0] indvar_flatten_fu_98;
wire   [31:0] add_ln1309_fu_207_p2;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln1314_fu_216_p2;
wire   [31:0] zext_ln1073_fu_234_p1;
wire   [3:0] xf_bits_per_clock_fu_257_p3;
wire  signed [4:0] sext_ln1321_fu_263_p1;
wire   [6:0] sub_ln1332_fu_275_p2;
wire   [7:0] zext_ln1542_fu_287_p1;
wire   [63:0] zext_ln1322_fu_327_p1;
wire   [63:0] zext_ln976_fu_331_p1;
wire   [63:0] r_V_30_fu_334_p2;
wire   [5:0] sub_ln599_fu_357_p2;
wire   [63:0] zext_ln976_1_fu_362_p1;
wire   [6:0] trunc_ln501_fu_354_p1;
wire   [63:0] zext_ln994_fu_372_p1;
wire   [0:0] p_Result_s_fu_347_p3;
wire   [63:0] r_V_fu_366_p2;
wire   [63:0] r_V_29_fu_376_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_406;
reg    ap_condition_409;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
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
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        if (((icmp_ln1309_reg_465 == 1'd0) & (icmp_ln1073_fu_242_p2 == 1'd0))) begin
            ap_phi_reg_pp0_iter3_val_V_1_reg_168 <= 24'd0;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter3_val_V_1_reg_168 <= ap_phi_reg_pp0_iter2_val_V_1_reg_168;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        if (((icmp_ln1073_reg_480 == 1'd1) & (icmp_ln1309_reg_465_pp0_iter2_reg == 1'd0))) begin
            ap_phi_reg_pp0_iter4_val_V_1_reg_168 <= out_mat_data85_dout;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter4_val_V_1_reg_168 <= ap_phi_reg_pp0_iter3_val_V_1_reg_168;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            filled_V_fu_86 <= 7'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            filled_V_fu_86 <= filled_next_fu_313_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_98 <= 32'd0;
        end else if (((icmp_ln1309_fu_202_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            indvar_flatten_fu_98 <= add_ln1309_fu_207_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            j_V_fu_94 <= 16'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            j_V_fu_94 <= j_V_1_fu_247_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            localbuffer_V_fu_90 <= 64'd0;
        end else if ((1'b1 == ap_condition_409)) begin
            localbuffer_V_fu_90 <= ret_V_fu_340_p2;
        end else if ((1'b1 == ap_condition_406)) begin
            localbuffer_V_fu_90 <= localbuffer_V_3_fu_382_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
        icmp_ln1309_reg_465 <= icmp_ln1309_fu_202_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        filled_V_load_1_reg_489 <= filled_V_fu_86;
        icmp_ln1073_1_reg_494 <= icmp_ln1073_1_fu_281_p2;
        icmp_ln1309_reg_465_pp0_iter2_reg <= icmp_ln1309_reg_465;
        icmp_ln1309_reg_465_pp0_iter3_reg <= icmp_ln1309_reg_465_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter1_val_V_1_reg_168 <= ap_phi_reg_pp0_iter0_val_V_1_reg_168;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter2_val_V_1_reg_168 <= ap_phi_reg_pp0_iter1_val_V_1_reg_168;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1309_reg_465 == 1'd0))) begin
        bLast_reg_475 <= bLast_fu_237_p2;
        icmp_ln1073_reg_480 <= icmp_ln1073_fu_242_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1309_reg_465_pp0_iter2_reg == 1'd0) & (icmp_ln1073_1_fu_281_p2 == 1'd0))) begin
        ret_V_28_reg_498 <= ret_V_28_fu_291_p2;
        trunc_ln984_reg_504 <= trunc_ln984_fu_297_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1309_fu_202_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln1302_reg_469 <= select_ln1302_fu_221_p3;
    end
end

always @ (*) begin
    if (((icmp_ln1309_fu_202_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln1309_reg_465_pp0_iter2_reg == 1'd0)) begin
        if ((icmp_ln1073_1_fu_281_p2 == 1'd1)) begin
            ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 = zext_ln1321_fu_267_p1;
        end else if ((icmp_ln1073_1_fu_281_p2 == 1'd0)) begin
            ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 = or_ln_fu_301_p3;
        end else begin
            ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 = ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159;
        end
    end else begin
        ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 = ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159;
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_j_V_load = j_V_1_fu_247_p2;
    end else begin
        ap_sig_allocacmp_j_V_load = j_V_fu_94;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1309_reg_465_pp0_iter2_reg == 1'd1))) begin
        filled_V_1_out_ap_vld = 1'b1;
    end else begin
        filled_V_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op67_write_state5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ldata1_blk_n = ldata1_full_n;
    end else begin
        ldata1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op67_write_state5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ldata1_write = 1'b1;
    end else begin
        ldata1_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1309_reg_465_pp0_iter2_reg == 1'd1))) begin
        localbuffer_V_3_out_ap_vld = 1'b1;
    end else begin
        localbuffer_V_3_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op44_read_state4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        out_mat_data85_blk_n = out_mat_data85_empty_n;
    end else begin
        out_mat_data85_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op44_read_state4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        out_mat_data85_read = 1'b1;
    end else begin
        out_mat_data85_read = 1'b0;
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

assign add_ln1309_fu_207_p2 = (indvar_flatten_fu_98 + 32'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_predicate_op67_write_state5 == 1'b1) & (ldata1_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((ap_predicate_op44_read_state4 == 1'b1) & (out_mat_data85_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_predicate_op67_write_state5 == 1'b1) & (ldata1_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((ap_predicate_op44_read_state4 == 1'b1) & (out_mat_data85_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_predicate_op67_write_state5 == 1'b1) & (ldata1_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((ap_predicate_op44_read_state4 == 1'b1) & (out_mat_data85_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = ((ap_predicate_op44_read_state4 == 1'b1) & (out_mat_data85_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state5_pp0_stage0_iter4 = ((ap_predicate_op67_write_state5 == 1'b1) & (ldata1_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_406 = ((icmp_ln1073_1_reg_494 == 1'd0) & (icmp_ln1309_reg_465_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1));
end

always @ (*) begin
    ap_condition_409 = ((icmp_ln1073_1_reg_494 == 1'd1) & (icmp_ln1309_reg_465_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_phi_reg_pp0_iter0_val_V_1_reg_168 = 'bx;

assign ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159 = 'bx;

always @ (*) begin
    ap_predicate_op44_read_state4 = ((icmp_ln1073_reg_480 == 1'd1) & (icmp_ln1309_reg_465_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op67_write_state5 = ((icmp_ln1073_1_reg_494 == 1'd0) & (icmp_ln1309_reg_465_pp0_iter3_reg == 1'd0));
end

assign bLast_fu_237_p2 = ((zext_ln1073_fu_234_p1 == op2_assign) ? 1'b1 : 1'b0);

assign filled_V_1_out = filled_V_fu_86;

assign filled_next_fu_313_p2 = (ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 + filled_V_fu_86);

assign icmp_ln1073_1_fu_281_p2 = ((sub_ln1332_fu_275_p2 > filled_V_fu_86) ? 1'b1 : 1'b0);

assign icmp_ln1073_fu_242_p2 = (($signed(zext_ln1073_fu_234_p1) < $signed(cols_bound_per_npc_load)) ? 1'b1 : 1'b0);

assign icmp_ln1309_fu_202_p2 = ((indvar_flatten_fu_98 == bound) ? 1'b1 : 1'b0);

assign icmp_ln1314_fu_216_p2 = ((ap_sig_allocacmp_j_V_load == cols_bound_per_npc_cast) ? 1'b1 : 1'b0);

assign j_V_1_fu_247_p2 = (select_ln1302_reg_469 + 16'd1);

assign ldata1_din = (r_V_30_fu_334_p2 | localbuffer_V_fu_90);

assign localbuffer_V_3_fu_382_p3 = ((p_Result_s_fu_347_p3[0:0] == 1'b1) ? r_V_fu_366_p2 : r_V_29_fu_376_p2);

assign localbuffer_V_3_out = localbuffer_V_fu_90;

assign or_ln_fu_301_p3 = {{2'd2}, {sext_ln1321_fu_263_p1}};

assign p_Result_s_fu_347_p3 = ret_V_28_reg_498[32'd7];

assign r_V_29_fu_376_p2 = zext_ln1322_fu_327_p1 >> zext_ln994_fu_372_p1;

assign r_V_30_fu_334_p2 = zext_ln1322_fu_327_p1 << zext_ln976_fu_331_p1;

assign r_V_fu_366_p2 = zext_ln1322_fu_327_p1 << zext_ln976_1_fu_362_p1;

assign ret_V_28_fu_291_p2 = (8'd64 - zext_ln1542_fu_287_p1);

assign ret_V_fu_340_p2 = (r_V_30_fu_334_p2 | localbuffer_V_fu_90);

assign select_ln1302_fu_221_p3 = ((icmp_ln1314_fu_216_p2[0:0] == 1'b1) ? 16'd0 : ap_sig_allocacmp_j_V_load);

assign sext_ln1321_fu_263_p1 = $signed(xf_bits_per_clock_fu_257_p3);

assign sub_ln1332_fu_275_p2 = ($signed(7'd64) - $signed(zext_ln1321_fu_267_p1));

assign sub_ln599_fu_357_p2 = (6'd0 - trunc_ln984_reg_504);

assign trunc_ln501_fu_354_p1 = ret_V_28_reg_498[6:0];

assign trunc_ln984_fu_297_p1 = ret_V_28_fu_291_p2[5:0];

assign xf_bits_per_clock_fu_257_p3 = ((bLast_reg_475[0:0] == 1'b1) ? last_blk_width_load : 4'd8);

assign zext_ln1073_fu_234_p1 = select_ln1302_reg_469;

assign zext_ln1321_fu_267_p1 = $unsigned(sext_ln1321_fu_263_p1);

assign zext_ln1322_fu_327_p1 = ap_phi_reg_pp0_iter4_val_V_1_reg_168;

assign zext_ln1542_fu_287_p1 = filled_V_fu_86;

assign zext_ln976_1_fu_362_p1 = sub_ln599_fu_357_p2;

assign zext_ln976_fu_331_p1 = filled_V_load_1_reg_489;

assign zext_ln994_fu_372_p1 = trunc_ln501_fu_354_p1;

endmodule //pp_pipeline_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol
