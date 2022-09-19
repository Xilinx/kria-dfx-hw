// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1.0
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="testDec_testDec,hls_ip_2022_1_0,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu250-figd2104-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.912000,HLS_SYN_LAT=48,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=4144,HLS_SYN_LUT=5774,HLS_VERSION=2022_1_0}" *)

module testDec (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in_r_TDATA,
        in_r_TVALID,
        in_r_TREADY,
        key,
        out_r_TDATA,
        out_r_TVALID,
        out_r_TREADY
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [127:0] in_r_TDATA;
input   in_r_TVALID;
output   in_r_TREADY;
input  [127:0] key;
output  [127:0] out_r_TDATA;
output   out_r_TVALID;
input   out_r_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    in_r_TDATA_blk_n;
reg    out_r_TDATA_blk_n;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
reg   [127:0] in_r_read_reg_290;
wire    grp_updateKey_fu_123_ap_start;
wire    grp_updateKey_fu_123_ap_done;
wire    grp_updateKey_fu_123_ap_idle;
wire    grp_updateKey_fu_123_ap_ready;
wire   [127:0] grp_updateKey_fu_123_this_1_0;
wire    grp_updateKey_fu_123_this_1_0_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_1;
wire    grp_updateKey_fu_123_this_1_1_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_2;
wire    grp_updateKey_fu_123_this_1_2_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_3;
wire    grp_updateKey_fu_123_this_1_3_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_4;
wire    grp_updateKey_fu_123_this_1_4_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_5;
wire    grp_updateKey_fu_123_this_1_5_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_6;
wire    grp_updateKey_fu_123_this_1_6_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_7;
wire    grp_updateKey_fu_123_this_1_7_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_8;
wire    grp_updateKey_fu_123_this_1_8_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_9;
wire    grp_updateKey_fu_123_this_1_9_ap_vld;
wire   [127:0] grp_updateKey_fu_123_this_1_10;
wire    grp_updateKey_fu_123_this_1_10_ap_vld;
wire    grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start;
wire    grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_done;
wire    grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_idle;
wire    grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_ready;
wire   [127:0] grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_outArr_V_0141_out;
wire    grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_outArr_V_0141_out_ap_vld;
reg    grp_updateKey_fu_123_ap_start_reg;
reg    ap_block_state1_ignore_call23;
reg   [127:0] decipher_key_list_V_fu_60;
wire    ap_CS_fsm_state2;
reg   [127:0] decipher_key_list_V_1_fu_64;
reg   [127:0] decipher_key_list_V_2_fu_68;
reg   [127:0] decipher_key_list_V_3_fu_72;
reg   [127:0] decipher_key_list_V_4_fu_76;
reg   [127:0] decipher_key_list_V_5_fu_80;
reg   [127:0] decipher_key_list_V_6_fu_84;
reg   [127:0] decipher_key_list_V_7_fu_88;
reg   [127:0] decipher_key_list_V_8_fu_92;
reg   [127:0] decipher_key_list_V_9_fu_96;
reg   [127:0] decipher_key_list_V_10_fu_100;
reg    grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    ap_block_state1;
wire    regslice_both_out_r_U_apdone_blk;
reg    ap_block_state6;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    regslice_both_in_r_U_apdone_blk;
wire   [127:0] in_r_TDATA_int_regslice;
wire    in_r_TVALID_int_regslice;
reg    in_r_TREADY_int_regslice;
wire    regslice_both_in_r_U_ack_in;
reg    out_r_TVALID_int_regslice;
wire    out_r_TREADY_int_regslice;
wire    regslice_both_out_r_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_updateKey_fu_123_ap_start_reg = 1'b0;
#0 grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start_reg = 1'b0;
end

testDec_updateKey grp_updateKey_fu_123(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_updateKey_fu_123_ap_start),
    .ap_done(grp_updateKey_fu_123_ap_done),
    .ap_idle(grp_updateKey_fu_123_ap_idle),
    .ap_ready(grp_updateKey_fu_123_ap_ready),
    .this_1_0(grp_updateKey_fu_123_this_1_0),
    .this_1_0_ap_vld(grp_updateKey_fu_123_this_1_0_ap_vld),
    .this_1_1(grp_updateKey_fu_123_this_1_1),
    .this_1_1_ap_vld(grp_updateKey_fu_123_this_1_1_ap_vld),
    .this_1_2(grp_updateKey_fu_123_this_1_2),
    .this_1_2_ap_vld(grp_updateKey_fu_123_this_1_2_ap_vld),
    .this_1_3(grp_updateKey_fu_123_this_1_3),
    .this_1_3_ap_vld(grp_updateKey_fu_123_this_1_3_ap_vld),
    .this_1_4(grp_updateKey_fu_123_this_1_4),
    .this_1_4_ap_vld(grp_updateKey_fu_123_this_1_4_ap_vld),
    .this_1_5(grp_updateKey_fu_123_this_1_5),
    .this_1_5_ap_vld(grp_updateKey_fu_123_this_1_5_ap_vld),
    .this_1_6(grp_updateKey_fu_123_this_1_6),
    .this_1_6_ap_vld(grp_updateKey_fu_123_this_1_6_ap_vld),
    .this_1_7(grp_updateKey_fu_123_this_1_7),
    .this_1_7_ap_vld(grp_updateKey_fu_123_this_1_7_ap_vld),
    .this_1_8(grp_updateKey_fu_123_this_1_8),
    .this_1_8_ap_vld(grp_updateKey_fu_123_this_1_8_ap_vld),
    .this_1_9(grp_updateKey_fu_123_this_1_9),
    .this_1_9_ap_vld(grp_updateKey_fu_123_this_1_9_ap_vld),
    .this_1_10(grp_updateKey_fu_123_this_1_10),
    .this_1_10_ap_vld(grp_updateKey_fu_123_this_1_10_ap_vld),
    .cipherkey(key)
);

testDec_testDec_Pipeline_VITIS_LOOP_28_1 grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start),
    .ap_done(grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_done),
    .ap_idle(grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_idle),
    .ap_ready(grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_ready),
    .decipher_key_list_V_load(decipher_key_list_V_fu_60),
    .decipher_key_list_V_1_load(decipher_key_list_V_1_fu_64),
    .decipher_key_list_V_2_load(decipher_key_list_V_2_fu_68),
    .decipher_key_list_V_3_load(decipher_key_list_V_3_fu_72),
    .decipher_key_list_V_4_load(decipher_key_list_V_4_fu_76),
    .decipher_key_list_V_5_load(decipher_key_list_V_5_fu_80),
    .decipher_key_list_V_6_load(decipher_key_list_V_6_fu_84),
    .decipher_key_list_V_7_load(decipher_key_list_V_7_fu_88),
    .decipher_key_list_V_8_load(decipher_key_list_V_8_fu_92),
    .decipher_key_list_V_9_load(decipher_key_list_V_9_fu_96),
    .decipher_key_list_V_10_load(decipher_key_list_V_10_fu_100),
    .agg_tmp4_0(in_r_read_reg_290),
    .outArr_V_0141_out(grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_outArr_V_0141_out),
    .outArr_V_0141_out_ap_vld(grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_outArr_V_0141_out_ap_vld)
);

testDec_regslice_both #(
    .DataWidth( 128 ))
regslice_both_in_r_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_r_TDATA),
    .vld_in(in_r_TVALID),
    .ack_in(regslice_both_in_r_U_ack_in),
    .data_out(in_r_TDATA_int_regslice),
    .vld_out(in_r_TVALID_int_regslice),
    .ack_out(in_r_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_r_U_apdone_blk)
);

testDec_regslice_both #(
    .DataWidth( 128 ))
regslice_both_out_r_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_outArr_V_0141_out),
    .vld_in(out_r_TVALID_int_regslice),
    .ack_in(out_r_TREADY_int_regslice),
    .data_out(out_r_TDATA),
    .vld_out(regslice_both_out_r_U_vld_out),
    .ack_out(out_r_TREADY),
    .apdone_blk(regslice_both_out_r_U_apdone_blk)
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
        grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start_reg <= 1'b1;
        end else if ((grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_ready == 1'b1)) begin
            grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_updateKey_fu_123_ap_start_reg <= 1'b0;
    end else begin
        if ((~((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_updateKey_fu_123_ap_start_reg <= 1'b1;
        end else if ((grp_updateKey_fu_123_ap_ready == 1'b1)) begin
            grp_updateKey_fu_123_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_10_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_10_fu_100 <= grp_updateKey_fu_123_this_1_10;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_1_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_1_fu_64 <= grp_updateKey_fu_123_this_1_1;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_2_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_2_fu_68 <= grp_updateKey_fu_123_this_1_2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_3_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_3_fu_72 <= grp_updateKey_fu_123_this_1_3;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_4_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_4_fu_76 <= grp_updateKey_fu_123_this_1_4;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_5_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_5_fu_80 <= grp_updateKey_fu_123_this_1_5;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_6_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_6_fu_84 <= grp_updateKey_fu_123_this_1_6;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_7_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_7_fu_88 <= grp_updateKey_fu_123_this_1_7;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_8_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_8_fu_92 <= grp_updateKey_fu_123_this_1_8;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_9_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_9_fu_96 <= grp_updateKey_fu_123_this_1_9;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_updateKey_fu_123_this_1_0_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        decipher_key_list_V_fu_60 <= grp_updateKey_fu_123_this_1_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_r_read_reg_290 <= in_r_TDATA_int_regslice;
    end
end

always @ (*) begin
    if (((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_updateKey_fu_123_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((out_r_TREADY_int_regslice == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1))) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state6))) begin
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
    if ((~((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        in_r_TDATA_blk_n = in_r_TVALID_int_regslice;
    end else begin
        in_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_r_TREADY_int_regslice = 1'b1;
    end else begin
        in_r_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5))) begin
        out_r_TDATA_blk_n = out_r_TREADY_int_regslice;
    end else begin
        out_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((out_r_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        out_r_TVALID_int_regslice = 1'b1;
    end else begin
        out_r_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_updateKey_fu_123_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((out_r_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if ((~((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state6))) begin
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
    ap_block_state1 = ((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state1_ignore_call23 = ((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state6 = ((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start = grp_testDec_Pipeline_VITIS_LOOP_28_1_fu_144_ap_start_reg;

assign grp_updateKey_fu_123_ap_start = grp_updateKey_fu_123_ap_start_reg;

assign in_r_TREADY = regslice_both_in_r_U_ack_in;

assign out_r_TVALID = regslice_both_out_r_U_vld_out;

endmodule //testDec
