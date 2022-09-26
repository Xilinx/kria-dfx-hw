// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="add_sub_add_sub,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=3.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.443000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2,HLS_SYN_LUT=413,HLS_VERSION=2022_1}" *)

module add_sub (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        axis_in1_TDATA,
        axis_in1_TVALID,
        axis_in1_TREADY,
        axis_in2_TDATA,
        axis_in2_TVALID,
        axis_in2_TREADY,
        axis_out_TDATA,
        axis_out_TVALID,
        axis_out_TREADY,
        op
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [127:0] axis_in1_TDATA;
input   axis_in1_TVALID;
output   axis_in1_TREADY;
input  [127:0] axis_in2_TDATA;
input   axis_in2_TVALID;
output   axis_in2_TREADY;
output  [127:0] axis_out_TDATA;
output   axis_out_TVALID;
input   axis_out_TREADY;
input  [0:0] op;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    axis_in1_TDATA_blk_n;
reg    axis_in2_TDATA_blk_n;
reg    axis_out_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire   [31:0] axis_out_int4_V_fu_230_p2;
reg   [31:0] ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4;
reg    ap_block_state1;
wire   [0:0] op_read_read_fu_52_p2;
wire   [31:0] axis_out_int4_V_1_fu_202_p2;
wire   [31:0] axis_out_int3_V_fu_223_p2;
reg   [31:0] ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4;
wire   [31:0] axis_out_int3_V_1_fu_195_p2;
wire   [31:0] axis_out_int2_V_fu_216_p2;
reg   [31:0] ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4;
wire   [31:0] axis_out_int2_V_1_fu_188_p2;
wire   [31:0] axis_out_int1_V_fu_209_p2;
reg   [31:0] ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4;
wire   [31:0] axis_out_int1_V_1_fu_181_p2;
wire   [31:0] trunc_ln357_fu_173_p1;
wire   [31:0] trunc_ln357_1_fu_177_p1;
wire   [31:0] grp_fu_113_p4;
wire   [31:0] grp_fu_123_p4;
wire   [31:0] grp_fu_133_p4;
wire   [31:0] grp_fu_143_p4;
wire   [31:0] grp_fu_153_p4;
wire   [31:0] grp_fu_163_p4;
wire    regslice_both_axis_out_U_apdone_blk;
reg    ap_block_state2;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    regslice_both_axis_in1_U_apdone_blk;
wire   [127:0] axis_in1_TDATA_int_regslice;
wire    axis_in1_TVALID_int_regslice;
reg    axis_in1_TREADY_int_regslice;
wire    regslice_both_axis_in1_U_ack_in;
wire    regslice_both_axis_in2_U_apdone_blk;
wire   [127:0] axis_in2_TDATA_int_regslice;
wire    axis_in2_TVALID_int_regslice;
reg    axis_in2_TREADY_int_regslice;
wire    regslice_both_axis_in2_U_ack_in;
wire   [127:0] axis_out_TDATA_int_regslice;
reg    axis_out_TVALID_int_regslice;
wire    axis_out_TREADY_int_regslice;
wire    regslice_both_axis_out_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

add_sub_regslice_both #(
    .DataWidth( 128 ))
regslice_both_axis_in1_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in1_TDATA),
    .vld_in(axis_in1_TVALID),
    .ack_in(regslice_both_axis_in1_U_ack_in),
    .data_out(axis_in1_TDATA_int_regslice),
    .vld_out(axis_in1_TVALID_int_regslice),
    .ack_out(axis_in1_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in1_U_apdone_blk)
);

add_sub_regslice_both #(
    .DataWidth( 128 ))
regslice_both_axis_in2_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_in2_TDATA),
    .vld_in(axis_in2_TVALID),
    .ack_in(regslice_both_axis_in2_U_ack_in),
    .data_out(axis_in2_TDATA_int_regslice),
    .vld_out(axis_in2_TVALID_int_regslice),
    .ack_out(axis_in2_TREADY_int_regslice),
    .apdone_blk(regslice_both_axis_in2_U_apdone_blk)
);

add_sub_regslice_both #(
    .DataWidth( 128 ))
regslice_both_axis_out_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(axis_out_TDATA_int_regslice),
    .vld_in(axis_out_TVALID_int_regslice),
    .ack_in(axis_out_TREADY_int_regslice),
    .data_out(axis_out_TDATA),
    .vld_out(regslice_both_axis_out_U_vld_out),
    .ack_out(axis_out_TREADY),
    .apdone_blk(regslice_both_axis_out_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (axis_out_TREADY_int_regslice == 1'b0) | (axis_in2_TVALID_int_regslice == 1'b0) | (axis_in1_TVALID_int_regslice == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((axis_out_TREADY_int_regslice == 1'b0) | (regslice_both_axis_out_U_apdone_blk == 1'b1))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((axis_out_TREADY_int_regslice == 1'b0) | (regslice_both_axis_out_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
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
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((op_read_read_fu_52_p2 == 1'd0)) begin
            ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 = axis_out_int1_V_1_fu_181_p2;
        end else if ((op_read_read_fu_52_p2 == 1'd1)) begin
            ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 = axis_out_int1_V_fu_209_p2;
        end else begin
            ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((op_read_read_fu_52_p2 == 1'd0)) begin
            ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 = axis_out_int2_V_1_fu_188_p2;
        end else if ((op_read_read_fu_52_p2 == 1'd1)) begin
            ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 = axis_out_int2_V_fu_216_p2;
        end else begin
            ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((op_read_read_fu_52_p2 == 1'd0)) begin
            ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 = axis_out_int3_V_1_fu_195_p2;
        end else if ((op_read_read_fu_52_p2 == 1'd1)) begin
            ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 = axis_out_int3_V_fu_223_p2;
        end else begin
            ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((op_read_read_fu_52_p2 == 1'd0)) begin
            ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 = axis_out_int4_V_1_fu_202_p2;
        end else if ((op_read_read_fu_52_p2 == 1'd1)) begin
            ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 = axis_out_int4_V_fu_230_p2;
        end else begin
            ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 = 'bx;
    end
end

always @ (*) begin
    if ((~((axis_out_TREADY_int_regslice == 1'b0) | (regslice_both_axis_out_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        axis_in1_TDATA_blk_n = axis_in1_TVALID_int_regslice;
    end else begin
        axis_in1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (axis_out_TREADY_int_regslice == 1'b0) | (axis_in2_TVALID_int_regslice == 1'b0) | (axis_in1_TVALID_int_regslice == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        axis_in1_TREADY_int_regslice = 1'b1;
    end else begin
        axis_in1_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        axis_in2_TDATA_blk_n = axis_in2_TVALID_int_regslice;
    end else begin
        axis_in2_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (axis_out_TREADY_int_regslice == 1'b0) | (axis_in2_TVALID_int_regslice == 1'b0) | (axis_in1_TVALID_int_regslice == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        axis_in2_TREADY_int_regslice = 1'b1;
    end else begin
        axis_in2_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        axis_out_TDATA_blk_n = axis_out_TREADY_int_regslice;
    end else begin
        axis_out_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (axis_out_TREADY_int_regslice == 1'b0) | (axis_in2_TVALID_int_regslice == 1'b0) | (axis_in1_TVALID_int_regslice == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        axis_out_TVALID_int_regslice = 1'b1;
    end else begin
        axis_out_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (axis_out_TREADY_int_regslice == 1'b0) | (axis_in2_TVALID_int_regslice == 1'b0) | (axis_in1_TVALID_int_regslice == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((axis_out_TREADY_int_regslice == 1'b0) | (regslice_both_axis_out_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state2))) begin
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
    ap_block_state1 = ((ap_start == 1'b0) | (axis_out_TREADY_int_regslice == 1'b0) | (axis_in2_TVALID_int_regslice == 1'b0) | (axis_in1_TVALID_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state2 = ((axis_out_TREADY_int_regslice == 1'b0) | (regslice_both_axis_out_U_apdone_blk == 1'b1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign axis_in1_TREADY = regslice_both_axis_in1_U_ack_in;

assign axis_in2_TREADY = regslice_both_axis_in2_U_ack_in;

assign axis_out_TDATA_int_regslice = {{{{ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4}, {ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4}}, {ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4}}, {ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4}};

assign axis_out_TVALID = regslice_both_axis_out_U_vld_out;

assign axis_out_int1_V_1_fu_181_p2 = (trunc_ln357_fu_173_p1 - trunc_ln357_1_fu_177_p1);

assign axis_out_int1_V_fu_209_p2 = (trunc_ln357_1_fu_177_p1 + trunc_ln357_fu_173_p1);

assign axis_out_int2_V_1_fu_188_p2 = (grp_fu_113_p4 - grp_fu_123_p4);

assign axis_out_int2_V_fu_216_p2 = (grp_fu_123_p4 + grp_fu_113_p4);

assign axis_out_int3_V_1_fu_195_p2 = (grp_fu_133_p4 - grp_fu_143_p4);

assign axis_out_int3_V_fu_223_p2 = (grp_fu_143_p4 + grp_fu_133_p4);

assign axis_out_int4_V_1_fu_202_p2 = (grp_fu_153_p4 - grp_fu_163_p4);

assign axis_out_int4_V_fu_230_p2 = (grp_fu_163_p4 + grp_fu_153_p4);

assign grp_fu_113_p4 = {{axis_in1_TDATA_int_regslice[63:32]}};

assign grp_fu_123_p4 = {{axis_in2_TDATA_int_regslice[63:32]}};

assign grp_fu_133_p4 = {{axis_in1_TDATA_int_regslice[95:64]}};

assign grp_fu_143_p4 = {{axis_in2_TDATA_int_regslice[95:64]}};

assign grp_fu_153_p4 = {{axis_in1_TDATA_int_regslice[127:96]}};

assign grp_fu_163_p4 = {{axis_in2_TDATA_int_regslice[127:96]}};

assign op_read_read_fu_52_p2 = op;

assign trunc_ln357_1_fu_177_p1 = axis_in2_TDATA_int_regslice[31:0];

assign trunc_ln357_fu_173_p1 = axis_in1_TDATA_int_regslice[31:0];


reg find_kernel_block = 0;
// synthesis translate_off
`include "add_sub_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //add_sub

