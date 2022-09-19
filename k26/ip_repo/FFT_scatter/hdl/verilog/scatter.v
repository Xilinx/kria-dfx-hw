// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2020.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="scatter_scatter,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu7ev-ffvc1156-2-e,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.276750,HLS_SYN_LAT=4099,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=222,HLS_SYN_LUT=213,HLS_VERSION=2020_1}" *)

module scatter (
        ap_clk,
        ap_rst_n,
        axis_in_TDATA,
        axis_in_TVALID,
        axis_in_TREADY,
        axis_in_TKEEP,
        axis_in_TSTRB,
        axis_in_TUSER,
        axis_in_TLAST,
        axis_in_TID,
        axis_in_TDEST,
        axis_out_TDATA,
        axis_out_TVALID,
        axis_out_TREADY,
        axis_out_TKEEP,
        axis_out_TSTRB,
        axis_out_TUSER,
        axis_out_TLAST,
        axis_out_TID,
        axis_out_TDEST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state5 = 3'd4;

input   ap_clk;
input   ap_rst_n;
input  [127:0] axis_in_TDATA;
input   axis_in_TVALID;
output   axis_in_TREADY;
input  [15:0] axis_in_TKEEP;
input  [15:0] axis_in_TSTRB;
input  [15:0] axis_in_TUSER;
input  [0:0] axis_in_TLAST;
input  [7:0] axis_in_TID;
input  [7:0] axis_in_TDEST;
output  [127:0] axis_out_TDATA;
output   axis_out_TVALID;
input   axis_out_TREADY;
output  [15:0] axis_out_TKEEP;
output  [15:0] axis_out_TSTRB;
output  [15:0] axis_out_TUSER;
output  [0:0] axis_out_TLAST;
output  [7:0] axis_out_TID;
output  [7:0] axis_out_TDEST;

 reg    ap_rst_n_inv;
reg    axis_in_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
wire   [0:0] icmp_ln284_fu_158_p2;
reg    axis_out_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter1;
reg   [0:0] icmp_ln284_reg_240;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] icmp_ln284_reg_240_pp0_iter1_reg;
reg   [12:0] indvar_flatten_reg_125;
reg   [2:0] i_reg_136;
reg   [10:0] j_reg_147;
reg    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
wire    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_11001;
wire   [12:0] add_ln284_fu_164_p2;
reg   [127:0] s_data_V_reg_249;
reg   [15:0] s_keep_V_reg_254;
reg   [15:0] s_strb_V_reg_259;
reg   [15:0] s_user_V_reg_264;
reg   [7:0] s_id_V_reg_269;
wire   [2:0] select_ln284_1_fu_210_p3;
reg   [2:0] select_ln284_1_reg_274;
wire   [10:0] j_1_fu_234_p2;
wire    ap_CS_fsm_state1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_condition_pp0_exit_iter1_state3;
reg   [2:0] ap_phi_mux_i_phi_fu_140_p4;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln286_fu_190_p2;
wire   [2:0] add_ln284_1_fu_204_p2;
wire   [1:0] s_dest_V_fu_218_p1;
wire   [10:0] select_ln284_fu_196_p3;
reg   [2:0] ap_NS_fsm;
wire    ap_CS_fsm_state5;
wire    regslice_both_axis_out_V_data_V_U_apdone_blk;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_axis_in_V_data_V_U_apdone_blk;
wire   [127:0] axis_in_TDATA_int_regslice;
wire    axis_in_TVALID_int_regslice;
reg    axis_in_TREADY_int_regslice;
wire    regslice_both_axis_in_V_data_V_U_ack_in;
wire    regslice_both_axis_in_V_keep_V_U_apdone_blk;
wire   [15:0] axis_in_TKEEP_int_regslice;
wire    regslice_both_axis_in_V_keep_V_U_vld_out;
wire    regslice_both_axis_in_V_keep_V_U_ack_in;
wire    regslice_both_axis_in_V_strb_V_U_apdone_blk;
wire   [15:0] axis_in_TSTRB_int_regslice;
wire    regslice_both_axis_in_V_strb_V_U_vld_out;
wire    regslice_both_axis_in_V_strb_V_U_ack_in;
wire    regslice_both_axis_in_V_user_V_U_apdone_blk;
wire   [15:0] axis_in_TUSER_int_regslice;
wire    regslice_both_axis_in_V_user_V_U_vld_out;
wire    regslice_both_axis_in_V_user_V_U_ack_in;
wire    regslice_both_axis_in_V_last_V_U_apdone_blk;
wire   [0:0] axis_in_TLAST_int_regslice;
wire    regslice_both_axis_in_V_last_V_U_vld_out;
wire    regslice_both_axis_in_V_last_V_U_ack_in;
wire    regslice_both_axis_in_V_id_V_U_apdone_blk;
wire   [7:0] axis_in_TID_int_regslice;
wire    regslice_both_axis_in_V_id_V_U_vld_out;
wire    regslice_both_axis_in_V_id_V_U_ack_in;
wire    regslice_both_axis_in_V_dest_V_U_apdone_blk;
wire   [7:0] axis_in_TDEST_int_regslice;
wire    regslice_both_axis_in_V_dest_V_U_vld_out;
wire    regslice_both_axis_in_V_dest_V_U_ack_in;
reg    axis_out_TVALID_int_regslice;
wire    axis_out_TREADY_int_regslice;
wire    regslice_both_axis_out_V_data_V_U_vld_out;
wire    regslice_both_axis_out_V_keep_V_U_apdone_blk;
wire    regslice_both_axis_out_V_keep_V_U_ack_in_dummy;
wire    regslice_both_axis_out_V_keep_V_U_vld_out;
wire    regslice_both_axis_out_V_strb_V_U_apdone_blk;
wire    regslice_both_axis_out_V_strb_V_U_ack_in_dummy;
wire    regslice_both_axis_out_V_strb_V_U_vld_out;
wire    regslice_both_axis_out_V_user_V_U_apdone_blk;
wire    regslice_both_axis_out_V_user_V_U_ack_in_dummy;
wire    regslice_both_axis_out_V_user_V_U_vld_out;
wire    regslice_both_axis_out_V_last_V_U_apdone_blk;
wire   [0:0] axis_out_TLAST_int_regslice;
wire    regslice_both_axis_out_V_last_V_U_ack_in_dummy;
wire    regslice_both_axis_out_V_last_V_U_vld_out;
wire    regslice_both_axis_out_V_id_V_U_apdone_blk;
wire    regslice_both_axis_out_V_id_V_U_ack_in_dummy;
wire    regslice_both_axis_out_V_id_V_U_vld_out;
wire    regslice_both_axis_out_V_dest_V_U_apdone_blk;
wire   [7:0] axis_out_TDEST_int_regslice;
wire    regslice_both_axis_out_V_dest_V_U_ack_in_dummy;
wire    regslice_both_axis_out_V_dest_V_U_vld_out;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

regslice_both #(
    .DataWidth( 128 ))
regslice_both_axis_in_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TDATA),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_data_V_U_ack_in),
    .data_out(axis_in_TDATA_int_regslice),
    .vld_out(axis_in_TVALID_int_regslice),
    .ack_out(axis_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in_V_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 16 ))
regslice_both_axis_in_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TKEEP),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_keep_V_U_ack_in),
    .data_out(axis_in_TKEEP_int_regslice),
    .vld_out(regslice_both_axis_in_V_keep_V_U_vld_out),
    .ack_out(axis_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in_V_keep_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 16 ))
regslice_both_axis_in_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TSTRB),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_strb_V_U_ack_in),
    .data_out(axis_in_TSTRB_int_regslice),
    .vld_out(regslice_both_axis_in_V_strb_V_U_vld_out),
    .ack_out(axis_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in_V_strb_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 16 ))
regslice_both_axis_in_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TUSER),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_user_V_U_ack_in),
    .data_out(axis_in_TUSER_int_regslice),
    .vld_out(regslice_both_axis_in_V_user_V_U_vld_out),
    .ack_out(axis_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in_V_user_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_axis_in_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TLAST),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_last_V_U_ack_in),
    .data_out(axis_in_TLAST_int_regslice),
    .vld_out(regslice_both_axis_in_V_last_V_U_vld_out),
    .ack_out(axis_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in_V_last_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 8 ))
regslice_both_axis_in_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TID),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_id_V_U_ack_in),
    .data_out(axis_in_TID_int_regslice),
    .vld_out(regslice_both_axis_in_V_id_V_U_vld_out),
    .ack_out(axis_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in_V_id_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 8 ))
regslice_both_axis_in_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in_TDEST),
    .vld_in(axis_in_TVALID),
    .ack_in(regslice_both_axis_in_V_dest_V_U_ack_in),
    .data_out(axis_in_TDEST_int_regslice),
    .vld_out(regslice_both_axis_in_V_dest_V_U_vld_out),
    .ack_out(axis_in_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in_V_dest_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 128 ))
regslice_both_axis_out_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(s_data_V_reg_249),
    .vld_in(axis_out_TVALID_int_regslice),
    .ack_in(axis_out_TREADY_int_regslice),
    .data_out(axis_out_TDATA),
    .vld_out(regslice_both_axis_out_V_data_V_U_vld_out),
    .ack_out(axis_out_TREADY),
    .apdone_blk(regslice_both_axis_out_V_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 16 ))
regslice_both_axis_out_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(s_keep_V_reg_254),
    .vld_in(axis_out_TVALID_int_regslice),
    .ack_in(regslice_both_axis_out_V_keep_V_U_ack_in_dummy),
    .data_out(axis_out_TKEEP),
    .vld_out(regslice_both_axis_out_V_keep_V_U_vld_out),
    .ack_out(axis_out_TREADY),
    .apdone_blk(regslice_both_axis_out_V_keep_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 16 ))
regslice_both_axis_out_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(s_strb_V_reg_259),
    .vld_in(axis_out_TVALID_int_regslice),
    .ack_in(regslice_both_axis_out_V_strb_V_U_ack_in_dummy),
    .data_out(axis_out_TSTRB),
    .vld_out(regslice_both_axis_out_V_strb_V_U_vld_out),
    .ack_out(axis_out_TREADY),
    .apdone_blk(regslice_both_axis_out_V_strb_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 16 ))
regslice_both_axis_out_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(s_user_V_reg_264),
    .vld_in(axis_out_TVALID_int_regslice),
    .ack_in(regslice_both_axis_out_V_user_V_U_ack_in_dummy),
    .data_out(axis_out_TUSER),
    .vld_out(regslice_both_axis_out_V_user_V_U_vld_out),
    .ack_out(axis_out_TREADY),
    .apdone_blk(regslice_both_axis_out_V_user_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_axis_out_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_out_TLAST_int_regslice),
    .vld_in(axis_out_TVALID_int_regslice),
    .ack_in(regslice_both_axis_out_V_last_V_U_ack_in_dummy),
    .data_out(axis_out_TLAST),
    .vld_out(regslice_both_axis_out_V_last_V_U_vld_out),
    .ack_out(axis_out_TREADY),
    .apdone_blk(regslice_both_axis_out_V_last_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 8 ))
regslice_both_axis_out_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(s_id_V_reg_269),
    .vld_in(axis_out_TVALID_int_regslice),
    .ack_in(regslice_both_axis_out_V_id_V_U_ack_in_dummy),
    .data_out(axis_out_TID),
    .vld_out(regslice_both_axis_out_V_id_V_U_vld_out),
    .ack_out(axis_out_TREADY),
    .apdone_blk(regslice_both_axis_out_V_id_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 8 ))
regslice_both_axis_out_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_out_TDEST_int_regslice),
    .vld_in(axis_out_TVALID_int_regslice),
    .ack_in(regslice_both_axis_out_V_dest_V_U_ack_in_dummy),
    .data_out(axis_out_TDEST),
    .vld_out(regslice_both_axis_out_V_dest_V_U_vld_out),
    .ack_out(axis_out_TREADY),
    .apdone_blk(regslice_both_axis_out_V_dest_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state1)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter1_state3)))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter1_state3))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b1 == ap_CS_fsm_state1)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln284_reg_240_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_reg_136 <= select_ln284_1_reg_274;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        i_reg_136 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln284_fu_158_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_125 <= add_ln284_fu_164_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        indvar_flatten_reg_125 <= 13'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln284_reg_240 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        j_reg_147 <= j_1_fu_234_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        j_reg_147 <= 11'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln284_reg_240 <= icmp_ln284_fu_158_p2;
        icmp_ln284_reg_240_pp0_iter1_reg <= icmp_ln284_reg_240;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln284_fu_158_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_data_V_reg_249 <= axis_in_TDATA_int_regslice;
        s_id_V_reg_269 <= axis_in_TID_int_regslice;
        s_keep_V_reg_254 <= axis_in_TKEEP_int_regslice;
        s_strb_V_reg_259 <= axis_in_TSTRB_int_regslice;
        s_user_V_reg_264 <= axis_in_TUSER_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln284_reg_240 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln284_1_reg_274 <= select_ln284_1_fu_210_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_condition_pp0_exit_iter1_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter1_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln284_fu_158_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln284_reg_240_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_i_phi_fu_140_p4 = select_ln284_1_reg_274;
    end else begin
        ap_phi_mux_i_phi_fu_140_p4 = i_reg_136;
    end
end

always @ (*) begin
    if (((icmp_ln284_fu_158_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        axis_in_TDATA_blk_n = axis_in_TVALID_int_regslice;
    end else begin
        axis_in_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln284_fu_158_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        axis_in_TREADY_int_regslice = 1'b1;
    end else begin
        axis_in_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln284_reg_240_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((icmp_ln284_reg_240 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        axis_out_TDATA_blk_n = axis_out_TREADY_int_regslice;
    end else begin
        axis_out_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln284_reg_240 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        axis_out_TVALID_int_regslice = 1'b1;
    end else begin
        axis_out_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((regslice_both_axis_out_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln284_1_fu_204_p2 = (3'd1 + ap_phi_mux_i_phi_fu_140_p4);

assign add_ln284_fu_164_p2 = (indvar_flatten_reg_125 + 13'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((icmp_ln284_fu_158_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (axis_in_TVALID_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state4_io)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io)) | ((icmp_ln284_fu_158_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (axis_in_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state4_io)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io)) | ((icmp_ln284_fu_158_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (axis_in_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter0 = ((icmp_ln284_fu_158_p2 == 1'd0) & (axis_in_TVALID_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3_io = ((icmp_ln284_reg_240 == 1'd0) & (axis_out_TREADY_int_regslice == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_io = ((icmp_ln284_reg_240_pp0_iter1_reg == 1'd0) & (axis_out_TREADY_int_regslice == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign axis_in_TREADY = regslice_both_axis_in_V_data_V_U_ack_in;

assign axis_out_TDEST_int_regslice = s_dest_V_fu_218_p1;

assign axis_out_TLAST_int_regslice = ((select_ln284_fu_196_p3 == 11'd1023) ? 1'b1 : 1'b0);

assign axis_out_TVALID = regslice_both_axis_out_V_data_V_U_vld_out;

assign icmp_ln284_fu_158_p2 = ((indvar_flatten_reg_125 == 13'd4096) ? 1'b1 : 1'b0);

assign icmp_ln286_fu_190_p2 = ((j_reg_147 == 11'd1024) ? 1'b1 : 1'b0);

assign j_1_fu_234_p2 = (11'd1 + select_ln284_fu_196_p3);

assign s_dest_V_fu_218_p1 = select_ln284_1_fu_210_p3[1:0];

assign select_ln284_1_fu_210_p3 = ((icmp_ln286_fu_190_p2[0:0] === 1'b1) ? add_ln284_1_fu_204_p2 : ap_phi_mux_i_phi_fu_140_p4);

assign select_ln284_fu_196_p3 = ((icmp_ln286_fu_190_p2[0:0] === 1'b1) ? 11'd0 : j_reg_147);

endmodule //scatter
