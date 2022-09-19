// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1.0
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="testDec_testDec,hls_ip_2022_1_0,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu250-figd2104-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.291000,HLS_SYN_LAT=52,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=7305,HLS_SYN_LUT=8037,HLS_VERSION=2022_1_0}" *)

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

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [127:0] in_r_TDATA;
input   in_r_TVALID;
output   in_r_TREADY;
input  [191:0] key;
output  [127:0] out_r_TDATA;
output   out_r_TVALID;
input   out_r_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    in_r_TDATA_blk_n;
reg    out_r_TDATA_blk_n;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
reg   [127:0] in_r_read_reg_192;
reg   [127:0] decipher_key_list_V_reg_197;
wire    ap_CS_fsm_state2;
reg   [127:0] decipher_key_list_V_1_reg_202;
reg   [127:0] decipher_key_list_V_2_reg_207;
reg   [127:0] decipher_key_list_V_3_reg_212;
reg   [127:0] decipher_key_list_V_4_reg_217;
reg   [127:0] decipher_key_list_V_5_reg_222;
reg   [127:0] decipher_key_list_V_6_reg_227;
reg   [127:0] decipher_key_list_V_7_reg_232;
reg   [127:0] decipher_key_list_V_8_reg_237;
reg   [127:0] decipher_key_list_V_9_reg_242;
reg   [127:0] decipher_key_list_V_12_reg_247;
reg   [127:0] decipher_key_list_V_10_reg_252;
reg   [127:0] decipher_key_list_V_11_reg_257;
wire    grp_updateKey_fu_79_ap_start;
wire    grp_updateKey_fu_79_ap_done;
wire    grp_updateKey_fu_79_ap_idle;
wire    grp_updateKey_fu_79_ap_ready;
wire   [127:0] grp_updateKey_fu_79_ap_return_0;
wire   [127:0] grp_updateKey_fu_79_ap_return_1;
wire   [127:0] grp_updateKey_fu_79_ap_return_2;
wire   [127:0] grp_updateKey_fu_79_ap_return_3;
wire   [127:0] grp_updateKey_fu_79_ap_return_4;
wire   [127:0] grp_updateKey_fu_79_ap_return_5;
wire   [127:0] grp_updateKey_fu_79_ap_return_6;
wire   [127:0] grp_updateKey_fu_79_ap_return_7;
wire   [127:0] grp_updateKey_fu_79_ap_return_8;
wire   [127:0] grp_updateKey_fu_79_ap_return_9;
wire   [127:0] grp_updateKey_fu_79_ap_return_10;
wire   [127:0] grp_updateKey_fu_79_ap_return_11;
wire   [127:0] grp_updateKey_fu_79_ap_return_12;
wire    grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start;
wire    grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_done;
wire    grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_idle;
wire    grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_ready;
wire   [127:0] grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_outArr_V_0177_out;
wire    grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_outArr_V_0177_out_ap_vld;
reg    grp_updateKey_fu_79_ap_start_reg;
reg    ap_block_state1_ignore_call12;
reg    grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start_reg;
wire    ap_CS_fsm_state3;
reg    ap_block_state1;
wire    regslice_both_out_r_U_apdone_blk;
reg    ap_block_state5;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
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
#0 ap_CS_fsm = 5'd1;
#0 grp_updateKey_fu_79_ap_start_reg = 1'b0;
#0 grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start_reg = 1'b0;
end

testDec_updateKey grp_updateKey_fu_79(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_updateKey_fu_79_ap_start),
    .ap_done(grp_updateKey_fu_79_ap_done),
    .ap_idle(grp_updateKey_fu_79_ap_idle),
    .ap_ready(grp_updateKey_fu_79_ap_ready),
    .cipherkey(key),
    .ap_return_0(grp_updateKey_fu_79_ap_return_0),
    .ap_return_1(grp_updateKey_fu_79_ap_return_1),
    .ap_return_2(grp_updateKey_fu_79_ap_return_2),
    .ap_return_3(grp_updateKey_fu_79_ap_return_3),
    .ap_return_4(grp_updateKey_fu_79_ap_return_4),
    .ap_return_5(grp_updateKey_fu_79_ap_return_5),
    .ap_return_6(grp_updateKey_fu_79_ap_return_6),
    .ap_return_7(grp_updateKey_fu_79_ap_return_7),
    .ap_return_8(grp_updateKey_fu_79_ap_return_8),
    .ap_return_9(grp_updateKey_fu_79_ap_return_9),
    .ap_return_10(grp_updateKey_fu_79_ap_return_10),
    .ap_return_11(grp_updateKey_fu_79_ap_return_11),
    .ap_return_12(grp_updateKey_fu_79_ap_return_12)
);

testDec_testDec_Pipeline_VITIS_LOOP_27_1 grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start),
    .ap_done(grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_done),
    .ap_idle(grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_idle),
    .ap_ready(grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_ready),
    .decipher_key_list_V(decipher_key_list_V_reg_197),
    .decipher_key_list_V_1(decipher_key_list_V_1_reg_202),
    .decipher_key_list_V_2(decipher_key_list_V_2_reg_207),
    .decipher_key_list_V_3(decipher_key_list_V_3_reg_212),
    .decipher_key_list_V_4(decipher_key_list_V_4_reg_217),
    .decipher_key_list_V_5(decipher_key_list_V_5_reg_222),
    .decipher_key_list_V_6(decipher_key_list_V_6_reg_227),
    .decipher_key_list_V_7(decipher_key_list_V_7_reg_232),
    .decipher_key_list_V_8(decipher_key_list_V_8_reg_237),
    .decipher_key_list_V_9(decipher_key_list_V_9_reg_242),
    .decipher_key_list_V_12(decipher_key_list_V_12_reg_247),
    .decipher_key_list_V_10(decipher_key_list_V_10_reg_252),
    .decipher_key_list_V_11(decipher_key_list_V_11_reg_257),
    .agg_tmp4_0(in_r_read_reg_192),
    .outArr_V_0177_out(grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_outArr_V_0177_out),
    .outArr_V_0177_out_ap_vld(grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_outArr_V_0177_out_ap_vld)
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
    .data_in(grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_outArr_V_0177_out),
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
        grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start_reg <= 1'b0;
    end else begin
        if (((grp_updateKey_fu_79_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start_reg <= 1'b1;
        end else if ((grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_ready == 1'b1)) begin
            grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_updateKey_fu_79_ap_start_reg <= 1'b0;
    end else begin
        if ((~((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_updateKey_fu_79_ap_start_reg <= 1'b1;
        end else if ((grp_updateKey_fu_79_ap_ready == 1'b1)) begin
            grp_updateKey_fu_79_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        decipher_key_list_V_10_reg_252 <= grp_updateKey_fu_79_ap_return_11;
        decipher_key_list_V_11_reg_257 <= grp_updateKey_fu_79_ap_return_12;
        decipher_key_list_V_12_reg_247 <= grp_updateKey_fu_79_ap_return_10;
        decipher_key_list_V_1_reg_202 <= grp_updateKey_fu_79_ap_return_1;
        decipher_key_list_V_2_reg_207 <= grp_updateKey_fu_79_ap_return_2;
        decipher_key_list_V_3_reg_212 <= grp_updateKey_fu_79_ap_return_3;
        decipher_key_list_V_4_reg_217 <= grp_updateKey_fu_79_ap_return_4;
        decipher_key_list_V_5_reg_222 <= grp_updateKey_fu_79_ap_return_5;
        decipher_key_list_V_6_reg_227 <= grp_updateKey_fu_79_ap_return_6;
        decipher_key_list_V_7_reg_232 <= grp_updateKey_fu_79_ap_return_7;
        decipher_key_list_V_8_reg_237 <= grp_updateKey_fu_79_ap_return_8;
        decipher_key_list_V_9_reg_242 <= grp_updateKey_fu_79_ap_return_9;
        decipher_key_list_V_reg_197 <= grp_updateKey_fu_79_ap_return_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_r_read_reg_192 <= in_r_TDATA_int_regslice;
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
    if ((grp_updateKey_fu_79_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((out_r_TREADY_int_regslice == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1))) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state5))) begin
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
    if ((~((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state5))) begin
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
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        out_r_TDATA_blk_n = out_r_TREADY_int_regslice;
    end else begin
        out_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((out_r_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
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
            if (((grp_updateKey_fu_79_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((out_r_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if ((~((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state5))) begin
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

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state1_ignore_call12 = ((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state5 = ((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start = grp_testDec_Pipeline_VITIS_LOOP_27_1_fu_89_ap_start_reg;

assign grp_updateKey_fu_79_ap_start = grp_updateKey_fu_79_ap_start_reg;

assign in_r_TREADY = regslice_both_in_r_U_ack_in;

assign out_r_TVALID = regslice_both_out_r_U_vld_out;

endmodule //testDec
