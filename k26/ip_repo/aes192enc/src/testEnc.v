// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1.0
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="testEnc_testEnc,hls_ip_2022_1_0,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu250-figd2104-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.291000,HLS_SYN_LAT=53,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=8826,HLS_SYN_LUT=8071,HLS_VERSION=2022_1_0}" *)

module testEnc (
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
input  [191:0] key;
output  [127:0] out_r_TDATA;
output   out_r_TVALID;
input   out_r_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] cipher_0_ssbox_address0;
reg    cipher_0_ssbox_ce0;
wire   [7:0] cipher_0_ssbox_q0;
reg   [7:0] cipher_0_ssbox_address1;
reg    cipher_0_ssbox_ce1;
wire   [7:0] cipher_0_ssbox_q1;
reg   [7:0] cipher_0_ssbox_address2;
reg    cipher_0_ssbox_ce2;
wire   [7:0] cipher_0_ssbox_q2;
reg   [7:0] cipher_0_ssbox_address3;
reg    cipher_0_ssbox_ce3;
wire   [7:0] cipher_0_ssbox_q3;
wire   [7:0] cipher_0_ssbox_q4;
wire   [7:0] cipher_0_ssbox_q5;
wire   [7:0] cipher_0_ssbox_q6;
wire   [7:0] cipher_0_ssbox_q7;
wire   [7:0] cipher_0_ssbox_q8;
wire   [7:0] cipher_0_ssbox_q9;
wire   [7:0] cipher_0_ssbox_q10;
wire   [7:0] cipher_0_ssbox_q11;
wire   [7:0] cipher_0_ssbox_q12;
wire   [7:0] cipher_0_ssbox_q13;
wire   [7:0] cipher_0_ssbox_q14;
wire   [7:0] cipher_0_ssbox_q15;
wire   [7:0] cipher_0_ssbox_q16;
wire   [7:0] cipher_0_ssbox_q17;
wire   [7:0] cipher_0_ssbox_q18;
wire   [7:0] cipher_0_ssbox_q19;
wire   [7:0] cipher_0_ssbox_q20;
wire   [7:0] cipher_0_ssbox_q21;
wire   [7:0] cipher_0_ssbox_q22;
wire   [7:0] cipher_0_ssbox_q23;
wire   [7:0] cipher_0_ssbox_q24;
wire   [7:0] cipher_0_ssbox_q25;
wire   [7:0] cipher_0_ssbox_q26;
wire   [7:0] cipher_0_ssbox_q27;
wire   [7:0] cipher_0_ssbox_q28;
wire   [7:0] cipher_0_ssbox_q29;
wire   [7:0] cipher_0_ssbox_q30;
wire   [7:0] cipher_0_ssbox_q31;
wire   [7:0] cipher_0_ssbox_q32;
wire   [7:0] cipher_0_ssbox_q33;
wire   [7:0] cipher_0_ssbox_q34;
wire   [7:0] cipher_0_ssbox_q35;
wire   [7:0] cipher_0_ssbox_q36;
wire   [7:0] cipher_0_ssbox_q37;
wire   [7:0] cipher_0_ssbox_q38;
wire   [7:0] cipher_0_ssbox_q39;
wire   [7:0] cipher_0_ssbox_q40;
wire   [7:0] cipher_0_ssbox_q41;
wire   [7:0] cipher_0_ssbox_q42;
wire   [7:0] cipher_0_ssbox_q43;
wire   [7:0] cipher_0_ssbox_q44;
wire   [7:0] cipher_0_ssbox_q45;
wire   [7:0] cipher_0_ssbox_q46;
wire   [7:0] cipher_0_ssbox_q47;
wire   [7:0] cipher_0_ssbox_q48;
wire   [7:0] cipher_0_ssbox_q49;
wire   [7:0] cipher_0_ssbox_q50;
wire   [7:0] cipher_0_ssbox_q51;
wire   [7:0] cipher_0_ssbox_q52;
wire   [7:0] cipher_0_ssbox_q53;
wire   [7:0] cipher_0_ssbox_q54;
wire   [7:0] cipher_0_ssbox_q55;
wire   [7:0] cipher_0_ssbox_q56;
wire   [7:0] cipher_0_ssbox_q57;
wire   [7:0] cipher_0_ssbox_q58;
wire   [7:0] cipher_0_ssbox_q59;
wire   [7:0] cipher_0_ssbox_q60;
wire   [7:0] cipher_0_ssbox_q61;
wire   [7:0] cipher_0_ssbox_q62;
wire   [7:0] cipher_0_ssbox_q63;
wire   [7:0] cipher_0_ssbox_q64;
wire   [7:0] cipher_0_ssbox_q65;
wire   [7:0] cipher_0_ssbox_q66;
wire   [7:0] cipher_0_ssbox_q67;
wire   [7:0] cipher_0_ssbox_q68;
wire   [7:0] cipher_0_ssbox_q69;
wire   [7:0] cipher_0_ssbox_q70;
wire   [7:0] cipher_0_ssbox_q71;
wire   [7:0] cipher_0_ssbox_q72;
wire   [7:0] cipher_0_ssbox_q73;
wire   [7:0] cipher_0_ssbox_q74;
wire   [7:0] cipher_0_ssbox_q75;
wire   [7:0] cipher_0_ssbox_q76;
wire   [7:0] cipher_0_ssbox_q77;
wire   [7:0] cipher_0_ssbox_q78;
wire   [7:0] cipher_0_ssbox_q79;
wire   [7:0] cipher_0_ssbox_q80;
wire   [7:0] cipher_0_ssbox_q81;
wire   [7:0] cipher_0_ssbox_q82;
wire   [7:0] cipher_0_ssbox_q83;
wire   [7:0] cipher_0_ssbox_q84;
wire   [7:0] cipher_0_ssbox_q85;
wire   [7:0] cipher_0_ssbox_q86;
wire   [7:0] cipher_0_ssbox_q87;
wire   [7:0] cipher_0_ssbox_q88;
wire   [7:0] cipher_0_ssbox_q89;
wire   [7:0] cipher_0_ssbox_q90;
wire   [7:0] cipher_0_ssbox_q91;
wire   [7:0] cipher_0_ssbox_q92;
wire   [7:0] cipher_0_ssbox_q93;
wire   [7:0] cipher_0_ssbox_q94;
wire   [7:0] cipher_0_ssbox_q95;
wire   [7:0] cipher_0_ssbox_q96;
wire   [7:0] cipher_0_ssbox_q97;
wire   [7:0] cipher_0_ssbox_q98;
wire   [7:0] cipher_0_ssbox_q99;
wire   [7:0] cipher_0_ssbox_q100;
wire   [7:0] cipher_0_ssbox_q101;
wire   [7:0] cipher_0_ssbox_q102;
wire   [7:0] cipher_0_ssbox_q103;
wire   [7:0] cipher_0_ssbox_q104;
wire   [7:0] cipher_0_ssbox_q105;
wire   [7:0] cipher_0_ssbox_q106;
wire   [7:0] cipher_0_ssbox_q107;
wire   [7:0] cipher_0_ssbox_q108;
wire   [7:0] cipher_0_ssbox_q109;
wire   [7:0] cipher_0_ssbox_q110;
wire   [7:0] cipher_0_ssbox_q111;
wire   [7:0] cipher_0_ssbox_q112;
wire   [7:0] cipher_0_ssbox_q113;
wire   [7:0] cipher_0_ssbox_q114;
wire   [7:0] cipher_0_ssbox_q115;
wire   [7:0] cipher_0_ssbox_q116;
wire   [7:0] cipher_0_ssbox_q117;
wire   [7:0] cipher_0_ssbox_q118;
wire   [7:0] cipher_0_ssbox_q119;
wire   [7:0] cipher_0_ssbox_q120;
wire   [7:0] cipher_0_ssbox_q121;
wire   [7:0] cipher_0_ssbox_q122;
wire   [7:0] cipher_0_ssbox_q123;
wire   [7:0] cipher_0_ssbox_q124;
wire   [7:0] cipher_0_ssbox_q125;
wire   [7:0] cipher_0_ssbox_q126;
wire   [7:0] cipher_0_ssbox_q127;
wire   [7:0] cipher_0_ssbox_q128;
wire   [7:0] cipher_0_ssbox_q129;
wire   [7:0] cipher_0_ssbox_q130;
wire   [7:0] cipher_0_ssbox_q131;
wire   [7:0] cipher_0_ssbox_q132;
wire   [7:0] cipher_0_ssbox_q133;
wire   [7:0] cipher_0_ssbox_q134;
wire   [7:0] cipher_0_ssbox_q135;
wire   [7:0] cipher_0_ssbox_q136;
wire   [7:0] cipher_0_ssbox_q137;
wire   [7:0] cipher_0_ssbox_q138;
wire   [7:0] cipher_0_ssbox_q139;
wire   [7:0] cipher_0_ssbox_q140;
wire   [7:0] cipher_0_ssbox_q141;
wire   [7:0] cipher_0_ssbox_q142;
wire   [7:0] cipher_0_ssbox_q143;
wire   [7:0] cipher_0_ssbox_q144;
wire   [7:0] cipher_0_ssbox_q145;
wire   [7:0] cipher_0_ssbox_q146;
wire   [7:0] cipher_0_ssbox_q147;
wire   [7:0] cipher_0_ssbox_q148;
wire   [7:0] cipher_0_ssbox_q149;
wire   [7:0] cipher_0_ssbox_q150;
wire   [7:0] cipher_0_ssbox_q151;
wire   [7:0] cipher_0_ssbox_q152;
wire   [7:0] cipher_0_ssbox_q153;
wire   [7:0] cipher_0_ssbox_q154;
wire   [7:0] cipher_0_ssbox_q155;
wire   [7:0] cipher_0_ssbox_q156;
wire   [7:0] cipher_0_ssbox_q157;
wire   [7:0] cipher_0_ssbox_q158;
wire   [7:0] cipher_0_ssbox_q159;
wire   [7:0] cipher_0_ssbox_q160;
wire   [7:0] cipher_0_ssbox_q161;
wire   [7:0] cipher_0_ssbox_q162;
wire   [7:0] cipher_0_ssbox_q163;
wire   [7:0] cipher_0_ssbox_q164;
wire   [7:0] cipher_0_ssbox_q165;
wire   [7:0] cipher_0_ssbox_q166;
wire   [7:0] cipher_0_ssbox_q167;
wire   [7:0] cipher_0_ssbox_q168;
wire   [7:0] cipher_0_ssbox_q169;
wire   [7:0] cipher_0_ssbox_q170;
wire   [7:0] cipher_0_ssbox_q171;
wire   [7:0] cipher_0_ssbox_q172;
wire   [7:0] cipher_0_ssbox_q173;
wire   [7:0] cipher_0_ssbox_q174;
wire   [7:0] cipher_0_ssbox_q175;
wire   [7:0] cipher_0_ssbox_q176;
wire   [7:0] cipher_0_ssbox_q177;
wire   [7:0] cipher_0_ssbox_q178;
wire   [7:0] cipher_0_ssbox_q179;
wire   [7:0] cipher_0_ssbox_q180;
wire   [7:0] cipher_0_ssbox_q181;
wire   [7:0] cipher_0_ssbox_q182;
wire   [7:0] cipher_0_ssbox_q183;
wire   [7:0] cipher_0_ssbox_q184;
wire   [7:0] cipher_0_ssbox_q185;
wire   [7:0] cipher_0_ssbox_q186;
wire   [7:0] cipher_0_ssbox_q187;
wire   [7:0] cipher_0_ssbox_q188;
wire   [7:0] cipher_0_ssbox_q189;
wire   [7:0] cipher_0_ssbox_q190;
wire   [7:0] cipher_0_ssbox_q191;
reg    in_r_TDATA_blk_n;
reg    out_r_TDATA_blk_n;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
reg   [127:0] in_r_read_reg_177;
reg   [127:0] cipher_key_list_V_reg_182;
wire    ap_CS_fsm_state2;
reg   [127:0] cipher_key_list_V_1_reg_187;
reg   [127:0] cipher_key_list_V_2_reg_192;
reg   [127:0] cipher_key_list_V_3_reg_197;
reg   [127:0] cipher_key_list_V_4_reg_202;
reg   [127:0] cipher_key_list_V_5_reg_207;
reg   [127:0] cipher_key_list_V_6_reg_212;
reg   [127:0] cipher_key_list_V_7_reg_217;
reg   [127:0] cipher_key_list_V_8_reg_222;
reg   [127:0] cipher_key_list_V_9_reg_227;
reg   [127:0] cipher_key_list_V_12_reg_232;
reg   [127:0] cipher_key_list_V_10_reg_237;
reg   [127:0] cipher_key_list_V_11_reg_242;
wire    grp_updateKey_fu_77_ap_start;
wire    grp_updateKey_fu_77_ap_done;
wire    grp_updateKey_fu_77_ap_idle;
wire    grp_updateKey_fu_77_ap_ready;
wire   [7:0] grp_updateKey_fu_77_cipher_0_ssbox_address0;
wire    grp_updateKey_fu_77_cipher_0_ssbox_ce0;
wire   [7:0] grp_updateKey_fu_77_cipher_0_ssbox_address1;
wire    grp_updateKey_fu_77_cipher_0_ssbox_ce1;
wire   [7:0] grp_updateKey_fu_77_cipher_0_ssbox_address2;
wire    grp_updateKey_fu_77_cipher_0_ssbox_ce2;
wire   [7:0] grp_updateKey_fu_77_cipher_0_ssbox_address3;
wire    grp_updateKey_fu_77_cipher_0_ssbox_ce3;
wire   [127:0] grp_updateKey_fu_77_ap_return_0;
wire   [127:0] grp_updateKey_fu_77_ap_return_1;
wire   [127:0] grp_updateKey_fu_77_ap_return_2;
wire   [127:0] grp_updateKey_fu_77_ap_return_3;
wire   [127:0] grp_updateKey_fu_77_ap_return_4;
wire   [127:0] grp_updateKey_fu_77_ap_return_5;
wire   [127:0] grp_updateKey_fu_77_ap_return_6;
wire   [127:0] grp_updateKey_fu_77_ap_return_7;
wire   [127:0] grp_updateKey_fu_77_ap_return_8;
wire   [127:0] grp_updateKey_fu_77_ap_return_9;
wire   [127:0] grp_updateKey_fu_77_ap_return_10;
wire   [127:0] grp_updateKey_fu_77_ap_return_11;
wire   [127:0] grp_updateKey_fu_77_ap_return_12;
wire    grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start;
wire    grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_done;
wire    grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_idle;
wire    grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_ready;
wire   [127:0] grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_outArr_V_0177_out;
wire    grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_outArr_V_0177_out_ap_vld;
reg    grp_updateKey_fu_77_ap_start_reg;
reg    ap_block_state1_ignore_call11;
reg    grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start_reg;
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
#0 grp_updateKey_fu_77_ap_start_reg = 1'b0;
#0 grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start_reg = 1'b0;
end

testEnc_process_r_cipher_0_ssbox_ROM_NP_LUTRAM_1R #(
    .DataWidth( 8 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
cipher_0_ssbox_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(cipher_0_ssbox_address0),
    .ce0(cipher_0_ssbox_ce0),
    .q0(cipher_0_ssbox_q0),
    .address1(cipher_0_ssbox_address1),
    .ce1(cipher_0_ssbox_ce1),
    .q1(cipher_0_ssbox_q1),
    .address2(cipher_0_ssbox_address2),
    .ce2(cipher_0_ssbox_ce2),
    .q2(cipher_0_ssbox_q2),
    .address3(cipher_0_ssbox_address3),
    .ce3(cipher_0_ssbox_ce3),
    .q3(cipher_0_ssbox_q3),
    .address4(8'd0),
    .ce4(1'b0),
    .q4(cipher_0_ssbox_q4),
    .address5(8'd0),
    .ce5(1'b0),
    .q5(cipher_0_ssbox_q5),
    .address6(8'd0),
    .ce6(1'b0),
    .q6(cipher_0_ssbox_q6),
    .address7(8'd0),
    .ce7(1'b0),
    .q7(cipher_0_ssbox_q7),
    .address8(8'd0),
    .ce8(1'b0),
    .q8(cipher_0_ssbox_q8),
    .address9(8'd0),
    .ce9(1'b0),
    .q9(cipher_0_ssbox_q9),
    .address10(8'd0),
    .ce10(1'b0),
    .q10(cipher_0_ssbox_q10),
    .address11(8'd0),
    .ce11(1'b0),
    .q11(cipher_0_ssbox_q11),
    .address12(8'd0),
    .ce12(1'b0),
    .q12(cipher_0_ssbox_q12),
    .address13(8'd0),
    .ce13(1'b0),
    .q13(cipher_0_ssbox_q13),
    .address14(8'd0),
    .ce14(1'b0),
    .q14(cipher_0_ssbox_q14),
    .address15(8'd0),
    .ce15(1'b0),
    .q15(cipher_0_ssbox_q15),
    .address16(8'd0),
    .ce16(1'b0),
    .q16(cipher_0_ssbox_q16),
    .address17(8'd0),
    .ce17(1'b0),
    .q17(cipher_0_ssbox_q17),
    .address18(8'd0),
    .ce18(1'b0),
    .q18(cipher_0_ssbox_q18),
    .address19(8'd0),
    .ce19(1'b0),
    .q19(cipher_0_ssbox_q19),
    .address20(8'd0),
    .ce20(1'b0),
    .q20(cipher_0_ssbox_q20),
    .address21(8'd0),
    .ce21(1'b0),
    .q21(cipher_0_ssbox_q21),
    .address22(8'd0),
    .ce22(1'b0),
    .q22(cipher_0_ssbox_q22),
    .address23(8'd0),
    .ce23(1'b0),
    .q23(cipher_0_ssbox_q23),
    .address24(8'd0),
    .ce24(1'b0),
    .q24(cipher_0_ssbox_q24),
    .address25(8'd0),
    .ce25(1'b0),
    .q25(cipher_0_ssbox_q25),
    .address26(8'd0),
    .ce26(1'b0),
    .q26(cipher_0_ssbox_q26),
    .address27(8'd0),
    .ce27(1'b0),
    .q27(cipher_0_ssbox_q27),
    .address28(8'd0),
    .ce28(1'b0),
    .q28(cipher_0_ssbox_q28),
    .address29(8'd0),
    .ce29(1'b0),
    .q29(cipher_0_ssbox_q29),
    .address30(8'd0),
    .ce30(1'b0),
    .q30(cipher_0_ssbox_q30),
    .address31(8'd0),
    .ce31(1'b0),
    .q31(cipher_0_ssbox_q31),
    .address32(8'd0),
    .ce32(1'b0),
    .q32(cipher_0_ssbox_q32),
    .address33(8'd0),
    .ce33(1'b0),
    .q33(cipher_0_ssbox_q33),
    .address34(8'd0),
    .ce34(1'b0),
    .q34(cipher_0_ssbox_q34),
    .address35(8'd0),
    .ce35(1'b0),
    .q35(cipher_0_ssbox_q35),
    .address36(8'd0),
    .ce36(1'b0),
    .q36(cipher_0_ssbox_q36),
    .address37(8'd0),
    .ce37(1'b0),
    .q37(cipher_0_ssbox_q37),
    .address38(8'd0),
    .ce38(1'b0),
    .q38(cipher_0_ssbox_q38),
    .address39(8'd0),
    .ce39(1'b0),
    .q39(cipher_0_ssbox_q39),
    .address40(8'd0),
    .ce40(1'b0),
    .q40(cipher_0_ssbox_q40),
    .address41(8'd0),
    .ce41(1'b0),
    .q41(cipher_0_ssbox_q41),
    .address42(8'd0),
    .ce42(1'b0),
    .q42(cipher_0_ssbox_q42),
    .address43(8'd0),
    .ce43(1'b0),
    .q43(cipher_0_ssbox_q43),
    .address44(8'd0),
    .ce44(1'b0),
    .q44(cipher_0_ssbox_q44),
    .address45(8'd0),
    .ce45(1'b0),
    .q45(cipher_0_ssbox_q45),
    .address46(8'd0),
    .ce46(1'b0),
    .q46(cipher_0_ssbox_q46),
    .address47(8'd0),
    .ce47(1'b0),
    .q47(cipher_0_ssbox_q47),
    .address48(8'd0),
    .ce48(1'b0),
    .q48(cipher_0_ssbox_q48),
    .address49(8'd0),
    .ce49(1'b0),
    .q49(cipher_0_ssbox_q49),
    .address50(8'd0),
    .ce50(1'b0),
    .q50(cipher_0_ssbox_q50),
    .address51(8'd0),
    .ce51(1'b0),
    .q51(cipher_0_ssbox_q51),
    .address52(8'd0),
    .ce52(1'b0),
    .q52(cipher_0_ssbox_q52),
    .address53(8'd0),
    .ce53(1'b0),
    .q53(cipher_0_ssbox_q53),
    .address54(8'd0),
    .ce54(1'b0),
    .q54(cipher_0_ssbox_q54),
    .address55(8'd0),
    .ce55(1'b0),
    .q55(cipher_0_ssbox_q55),
    .address56(8'd0),
    .ce56(1'b0),
    .q56(cipher_0_ssbox_q56),
    .address57(8'd0),
    .ce57(1'b0),
    .q57(cipher_0_ssbox_q57),
    .address58(8'd0),
    .ce58(1'b0),
    .q58(cipher_0_ssbox_q58),
    .address59(8'd0),
    .ce59(1'b0),
    .q59(cipher_0_ssbox_q59),
    .address60(8'd0),
    .ce60(1'b0),
    .q60(cipher_0_ssbox_q60),
    .address61(8'd0),
    .ce61(1'b0),
    .q61(cipher_0_ssbox_q61),
    .address62(8'd0),
    .ce62(1'b0),
    .q62(cipher_0_ssbox_q62),
    .address63(8'd0),
    .ce63(1'b0),
    .q63(cipher_0_ssbox_q63),
    .address64(8'd0),
    .ce64(1'b0),
    .q64(cipher_0_ssbox_q64),
    .address65(8'd0),
    .ce65(1'b0),
    .q65(cipher_0_ssbox_q65),
    .address66(8'd0),
    .ce66(1'b0),
    .q66(cipher_0_ssbox_q66),
    .address67(8'd0),
    .ce67(1'b0),
    .q67(cipher_0_ssbox_q67),
    .address68(8'd0),
    .ce68(1'b0),
    .q68(cipher_0_ssbox_q68),
    .address69(8'd0),
    .ce69(1'b0),
    .q69(cipher_0_ssbox_q69),
    .address70(8'd0),
    .ce70(1'b0),
    .q70(cipher_0_ssbox_q70),
    .address71(8'd0),
    .ce71(1'b0),
    .q71(cipher_0_ssbox_q71),
    .address72(8'd0),
    .ce72(1'b0),
    .q72(cipher_0_ssbox_q72),
    .address73(8'd0),
    .ce73(1'b0),
    .q73(cipher_0_ssbox_q73),
    .address74(8'd0),
    .ce74(1'b0),
    .q74(cipher_0_ssbox_q74),
    .address75(8'd0),
    .ce75(1'b0),
    .q75(cipher_0_ssbox_q75),
    .address76(8'd0),
    .ce76(1'b0),
    .q76(cipher_0_ssbox_q76),
    .address77(8'd0),
    .ce77(1'b0),
    .q77(cipher_0_ssbox_q77),
    .address78(8'd0),
    .ce78(1'b0),
    .q78(cipher_0_ssbox_q78),
    .address79(8'd0),
    .ce79(1'b0),
    .q79(cipher_0_ssbox_q79),
    .address80(8'd0),
    .ce80(1'b0),
    .q80(cipher_0_ssbox_q80),
    .address81(8'd0),
    .ce81(1'b0),
    .q81(cipher_0_ssbox_q81),
    .address82(8'd0),
    .ce82(1'b0),
    .q82(cipher_0_ssbox_q82),
    .address83(8'd0),
    .ce83(1'b0),
    .q83(cipher_0_ssbox_q83),
    .address84(8'd0),
    .ce84(1'b0),
    .q84(cipher_0_ssbox_q84),
    .address85(8'd0),
    .ce85(1'b0),
    .q85(cipher_0_ssbox_q85),
    .address86(8'd0),
    .ce86(1'b0),
    .q86(cipher_0_ssbox_q86),
    .address87(8'd0),
    .ce87(1'b0),
    .q87(cipher_0_ssbox_q87),
    .address88(8'd0),
    .ce88(1'b0),
    .q88(cipher_0_ssbox_q88),
    .address89(8'd0),
    .ce89(1'b0),
    .q89(cipher_0_ssbox_q89),
    .address90(8'd0),
    .ce90(1'b0),
    .q90(cipher_0_ssbox_q90),
    .address91(8'd0),
    .ce91(1'b0),
    .q91(cipher_0_ssbox_q91),
    .address92(8'd0),
    .ce92(1'b0),
    .q92(cipher_0_ssbox_q92),
    .address93(8'd0),
    .ce93(1'b0),
    .q93(cipher_0_ssbox_q93),
    .address94(8'd0),
    .ce94(1'b0),
    .q94(cipher_0_ssbox_q94),
    .address95(8'd0),
    .ce95(1'b0),
    .q95(cipher_0_ssbox_q95),
    .address96(8'd0),
    .ce96(1'b0),
    .q96(cipher_0_ssbox_q96),
    .address97(8'd0),
    .ce97(1'b0),
    .q97(cipher_0_ssbox_q97),
    .address98(8'd0),
    .ce98(1'b0),
    .q98(cipher_0_ssbox_q98),
    .address99(8'd0),
    .ce99(1'b0),
    .q99(cipher_0_ssbox_q99),
    .address100(8'd0),
    .ce100(1'b0),
    .q100(cipher_0_ssbox_q100),
    .address101(8'd0),
    .ce101(1'b0),
    .q101(cipher_0_ssbox_q101),
    .address102(8'd0),
    .ce102(1'b0),
    .q102(cipher_0_ssbox_q102),
    .address103(8'd0),
    .ce103(1'b0),
    .q103(cipher_0_ssbox_q103),
    .address104(8'd0),
    .ce104(1'b0),
    .q104(cipher_0_ssbox_q104),
    .address105(8'd0),
    .ce105(1'b0),
    .q105(cipher_0_ssbox_q105),
    .address106(8'd0),
    .ce106(1'b0),
    .q106(cipher_0_ssbox_q106),
    .address107(8'd0),
    .ce107(1'b0),
    .q107(cipher_0_ssbox_q107),
    .address108(8'd0),
    .ce108(1'b0),
    .q108(cipher_0_ssbox_q108),
    .address109(8'd0),
    .ce109(1'b0),
    .q109(cipher_0_ssbox_q109),
    .address110(8'd0),
    .ce110(1'b0),
    .q110(cipher_0_ssbox_q110),
    .address111(8'd0),
    .ce111(1'b0),
    .q111(cipher_0_ssbox_q111),
    .address112(8'd0),
    .ce112(1'b0),
    .q112(cipher_0_ssbox_q112),
    .address113(8'd0),
    .ce113(1'b0),
    .q113(cipher_0_ssbox_q113),
    .address114(8'd0),
    .ce114(1'b0),
    .q114(cipher_0_ssbox_q114),
    .address115(8'd0),
    .ce115(1'b0),
    .q115(cipher_0_ssbox_q115),
    .address116(8'd0),
    .ce116(1'b0),
    .q116(cipher_0_ssbox_q116),
    .address117(8'd0),
    .ce117(1'b0),
    .q117(cipher_0_ssbox_q117),
    .address118(8'd0),
    .ce118(1'b0),
    .q118(cipher_0_ssbox_q118),
    .address119(8'd0),
    .ce119(1'b0),
    .q119(cipher_0_ssbox_q119),
    .address120(8'd0),
    .ce120(1'b0),
    .q120(cipher_0_ssbox_q120),
    .address121(8'd0),
    .ce121(1'b0),
    .q121(cipher_0_ssbox_q121),
    .address122(8'd0),
    .ce122(1'b0),
    .q122(cipher_0_ssbox_q122),
    .address123(8'd0),
    .ce123(1'b0),
    .q123(cipher_0_ssbox_q123),
    .address124(8'd0),
    .ce124(1'b0),
    .q124(cipher_0_ssbox_q124),
    .address125(8'd0),
    .ce125(1'b0),
    .q125(cipher_0_ssbox_q125),
    .address126(8'd0),
    .ce126(1'b0),
    .q126(cipher_0_ssbox_q126),
    .address127(8'd0),
    .ce127(1'b0),
    .q127(cipher_0_ssbox_q127),
    .address128(8'd0),
    .ce128(1'b0),
    .q128(cipher_0_ssbox_q128),
    .address129(8'd0),
    .ce129(1'b0),
    .q129(cipher_0_ssbox_q129),
    .address130(8'd0),
    .ce130(1'b0),
    .q130(cipher_0_ssbox_q130),
    .address131(8'd0),
    .ce131(1'b0),
    .q131(cipher_0_ssbox_q131),
    .address132(8'd0),
    .ce132(1'b0),
    .q132(cipher_0_ssbox_q132),
    .address133(8'd0),
    .ce133(1'b0),
    .q133(cipher_0_ssbox_q133),
    .address134(8'd0),
    .ce134(1'b0),
    .q134(cipher_0_ssbox_q134),
    .address135(8'd0),
    .ce135(1'b0),
    .q135(cipher_0_ssbox_q135),
    .address136(8'd0),
    .ce136(1'b0),
    .q136(cipher_0_ssbox_q136),
    .address137(8'd0),
    .ce137(1'b0),
    .q137(cipher_0_ssbox_q137),
    .address138(8'd0),
    .ce138(1'b0),
    .q138(cipher_0_ssbox_q138),
    .address139(8'd0),
    .ce139(1'b0),
    .q139(cipher_0_ssbox_q139),
    .address140(8'd0),
    .ce140(1'b0),
    .q140(cipher_0_ssbox_q140),
    .address141(8'd0),
    .ce141(1'b0),
    .q141(cipher_0_ssbox_q141),
    .address142(8'd0),
    .ce142(1'b0),
    .q142(cipher_0_ssbox_q142),
    .address143(8'd0),
    .ce143(1'b0),
    .q143(cipher_0_ssbox_q143),
    .address144(8'd0),
    .ce144(1'b0),
    .q144(cipher_0_ssbox_q144),
    .address145(8'd0),
    .ce145(1'b0),
    .q145(cipher_0_ssbox_q145),
    .address146(8'd0),
    .ce146(1'b0),
    .q146(cipher_0_ssbox_q146),
    .address147(8'd0),
    .ce147(1'b0),
    .q147(cipher_0_ssbox_q147),
    .address148(8'd0),
    .ce148(1'b0),
    .q148(cipher_0_ssbox_q148),
    .address149(8'd0),
    .ce149(1'b0),
    .q149(cipher_0_ssbox_q149),
    .address150(8'd0),
    .ce150(1'b0),
    .q150(cipher_0_ssbox_q150),
    .address151(8'd0),
    .ce151(1'b0),
    .q151(cipher_0_ssbox_q151),
    .address152(8'd0),
    .ce152(1'b0),
    .q152(cipher_0_ssbox_q152),
    .address153(8'd0),
    .ce153(1'b0),
    .q153(cipher_0_ssbox_q153),
    .address154(8'd0),
    .ce154(1'b0),
    .q154(cipher_0_ssbox_q154),
    .address155(8'd0),
    .ce155(1'b0),
    .q155(cipher_0_ssbox_q155),
    .address156(8'd0),
    .ce156(1'b0),
    .q156(cipher_0_ssbox_q156),
    .address157(8'd0),
    .ce157(1'b0),
    .q157(cipher_0_ssbox_q157),
    .address158(8'd0),
    .ce158(1'b0),
    .q158(cipher_0_ssbox_q158),
    .address159(8'd0),
    .ce159(1'b0),
    .q159(cipher_0_ssbox_q159),
    .address160(8'd0),
    .ce160(1'b0),
    .q160(cipher_0_ssbox_q160),
    .address161(8'd0),
    .ce161(1'b0),
    .q161(cipher_0_ssbox_q161),
    .address162(8'd0),
    .ce162(1'b0),
    .q162(cipher_0_ssbox_q162),
    .address163(8'd0),
    .ce163(1'b0),
    .q163(cipher_0_ssbox_q163),
    .address164(8'd0),
    .ce164(1'b0),
    .q164(cipher_0_ssbox_q164),
    .address165(8'd0),
    .ce165(1'b0),
    .q165(cipher_0_ssbox_q165),
    .address166(8'd0),
    .ce166(1'b0),
    .q166(cipher_0_ssbox_q166),
    .address167(8'd0),
    .ce167(1'b0),
    .q167(cipher_0_ssbox_q167),
    .address168(8'd0),
    .ce168(1'b0),
    .q168(cipher_0_ssbox_q168),
    .address169(8'd0),
    .ce169(1'b0),
    .q169(cipher_0_ssbox_q169),
    .address170(8'd0),
    .ce170(1'b0),
    .q170(cipher_0_ssbox_q170),
    .address171(8'd0),
    .ce171(1'b0),
    .q171(cipher_0_ssbox_q171),
    .address172(8'd0),
    .ce172(1'b0),
    .q172(cipher_0_ssbox_q172),
    .address173(8'd0),
    .ce173(1'b0),
    .q173(cipher_0_ssbox_q173),
    .address174(8'd0),
    .ce174(1'b0),
    .q174(cipher_0_ssbox_q174),
    .address175(8'd0),
    .ce175(1'b0),
    .q175(cipher_0_ssbox_q175),
    .address176(8'd0),
    .ce176(1'b0),
    .q176(cipher_0_ssbox_q176),
    .address177(8'd0),
    .ce177(1'b0),
    .q177(cipher_0_ssbox_q177),
    .address178(8'd0),
    .ce178(1'b0),
    .q178(cipher_0_ssbox_q178),
    .address179(8'd0),
    .ce179(1'b0),
    .q179(cipher_0_ssbox_q179),
    .address180(8'd0),
    .ce180(1'b0),
    .q180(cipher_0_ssbox_q180),
    .address181(8'd0),
    .ce181(1'b0),
    .q181(cipher_0_ssbox_q181),
    .address182(8'd0),
    .ce182(1'b0),
    .q182(cipher_0_ssbox_q182),
    .address183(8'd0),
    .ce183(1'b0),
    .q183(cipher_0_ssbox_q183),
    .address184(8'd0),
    .ce184(1'b0),
    .q184(cipher_0_ssbox_q184),
    .address185(8'd0),
    .ce185(1'b0),
    .q185(cipher_0_ssbox_q185),
    .address186(8'd0),
    .ce186(1'b0),
    .q186(cipher_0_ssbox_q186),
    .address187(8'd0),
    .ce187(1'b0),
    .q187(cipher_0_ssbox_q187),
    .address188(8'd0),
    .ce188(1'b0),
    .q188(cipher_0_ssbox_q188),
    .address189(8'd0),
    .ce189(1'b0),
    .q189(cipher_0_ssbox_q189),
    .address190(8'd0),
    .ce190(1'b0),
    .q190(cipher_0_ssbox_q190),
    .address191(8'd0),
    .ce191(1'b0),
    .q191(cipher_0_ssbox_q191)
);

testEnc_updateKey grp_updateKey_fu_77(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_updateKey_fu_77_ap_start),
    .ap_done(grp_updateKey_fu_77_ap_done),
    .ap_idle(grp_updateKey_fu_77_ap_idle),
    .ap_ready(grp_updateKey_fu_77_ap_ready),
    .cipherkey(key),
    .cipher_0_ssbox_address0(grp_updateKey_fu_77_cipher_0_ssbox_address0),
    .cipher_0_ssbox_ce0(grp_updateKey_fu_77_cipher_0_ssbox_ce0),
    .cipher_0_ssbox_q0(cipher_0_ssbox_q0),
    .cipher_0_ssbox_address1(grp_updateKey_fu_77_cipher_0_ssbox_address1),
    .cipher_0_ssbox_ce1(grp_updateKey_fu_77_cipher_0_ssbox_ce1),
    .cipher_0_ssbox_q1(cipher_0_ssbox_q1),
    .cipher_0_ssbox_address2(grp_updateKey_fu_77_cipher_0_ssbox_address2),
    .cipher_0_ssbox_ce2(grp_updateKey_fu_77_cipher_0_ssbox_ce2),
    .cipher_0_ssbox_q2(cipher_0_ssbox_q2),
    .cipher_0_ssbox_address3(grp_updateKey_fu_77_cipher_0_ssbox_address3),
    .cipher_0_ssbox_ce3(grp_updateKey_fu_77_cipher_0_ssbox_ce3),
    .cipher_0_ssbox_q3(cipher_0_ssbox_q3),
    .ap_return_0(grp_updateKey_fu_77_ap_return_0),
    .ap_return_1(grp_updateKey_fu_77_ap_return_1),
    .ap_return_2(grp_updateKey_fu_77_ap_return_2),
    .ap_return_3(grp_updateKey_fu_77_ap_return_3),
    .ap_return_4(grp_updateKey_fu_77_ap_return_4),
    .ap_return_5(grp_updateKey_fu_77_ap_return_5),
    .ap_return_6(grp_updateKey_fu_77_ap_return_6),
    .ap_return_7(grp_updateKey_fu_77_ap_return_7),
    .ap_return_8(grp_updateKey_fu_77_ap_return_8),
    .ap_return_9(grp_updateKey_fu_77_ap_return_9),
    .ap_return_10(grp_updateKey_fu_77_ap_return_10),
    .ap_return_11(grp_updateKey_fu_77_ap_return_11),
    .ap_return_12(grp_updateKey_fu_77_ap_return_12)
);

testEnc_testEnc_Pipeline_VITIS_LOOP_27_1 grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start),
    .ap_done(grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_done),
    .ap_idle(grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_idle),
    .ap_ready(grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_ready),
    .cipher_key_list_V(cipher_key_list_V_reg_182),
    .cipher_key_list_V_1(cipher_key_list_V_1_reg_187),
    .cipher_key_list_V_2(cipher_key_list_V_2_reg_192),
    .cipher_key_list_V_3(cipher_key_list_V_3_reg_197),
    .cipher_key_list_V_4(cipher_key_list_V_4_reg_202),
    .cipher_key_list_V_5(cipher_key_list_V_5_reg_207),
    .cipher_key_list_V_6(cipher_key_list_V_6_reg_212),
    .cipher_key_list_V_7(cipher_key_list_V_7_reg_217),
    .cipher_key_list_V_8(cipher_key_list_V_8_reg_222),
    .cipher_key_list_V_9(cipher_key_list_V_9_reg_227),
    .cipher_key_list_V_12(cipher_key_list_V_12_reg_232),
    .cipher_key_list_V_10(cipher_key_list_V_10_reg_237),
    .cipher_key_list_V_11(cipher_key_list_V_11_reg_242),
    .agg_tmp4_0(in_r_read_reg_177),
    .outArr_V_0177_out(grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_outArr_V_0177_out),
    .outArr_V_0177_out_ap_vld(grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_outArr_V_0177_out_ap_vld)
);

testEnc_regslice_both #(
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

testEnc_regslice_both #(
    .DataWidth( 128 ))
regslice_both_out_r_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_outArr_V_0177_out),
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
        grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start_reg <= 1'b1;
        end else if ((grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_ready == 1'b1)) begin
            grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_updateKey_fu_77_ap_start_reg <= 1'b0;
    end else begin
        if ((~((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_updateKey_fu_77_ap_start_reg <= 1'b1;
        end else if ((grp_updateKey_fu_77_ap_ready == 1'b1)) begin
            grp_updateKey_fu_77_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_key_list_V_10_reg_237 <= grp_updateKey_fu_77_ap_return_11;
        cipher_key_list_V_11_reg_242 <= grp_updateKey_fu_77_ap_return_12;
        cipher_key_list_V_12_reg_232 <= grp_updateKey_fu_77_ap_return_10;
        cipher_key_list_V_1_reg_187 <= grp_updateKey_fu_77_ap_return_1;
        cipher_key_list_V_2_reg_192 <= grp_updateKey_fu_77_ap_return_2;
        cipher_key_list_V_3_reg_197 <= grp_updateKey_fu_77_ap_return_3;
        cipher_key_list_V_4_reg_202 <= grp_updateKey_fu_77_ap_return_4;
        cipher_key_list_V_5_reg_207 <= grp_updateKey_fu_77_ap_return_5;
        cipher_key_list_V_6_reg_212 <= grp_updateKey_fu_77_ap_return_6;
        cipher_key_list_V_7_reg_217 <= grp_updateKey_fu_77_ap_return_7;
        cipher_key_list_V_8_reg_222 <= grp_updateKey_fu_77_ap_return_8;
        cipher_key_list_V_9_reg_227 <= grp_updateKey_fu_77_ap_return_9;
        cipher_key_list_V_reg_182 <= grp_updateKey_fu_77_ap_return_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_r_read_reg_177 <= in_r_TDATA_int_regslice;
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
    if ((grp_updateKey_fu_77_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_done == 1'b0)) begin
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
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cipher_0_ssbox_address0 = 8'd0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_0_ssbox_address0 = grp_updateKey_fu_77_cipher_0_ssbox_address0;
    end else begin
        cipher_0_ssbox_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cipher_0_ssbox_address1 = 8'd0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_0_ssbox_address1 = grp_updateKey_fu_77_cipher_0_ssbox_address1;
    end else begin
        cipher_0_ssbox_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cipher_0_ssbox_address2 = 8'd0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_0_ssbox_address2 = grp_updateKey_fu_77_cipher_0_ssbox_address2;
    end else begin
        cipher_0_ssbox_address2 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cipher_0_ssbox_address3 = 8'd0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_0_ssbox_address3 = grp_updateKey_fu_77_cipher_0_ssbox_address3;
    end else begin
        cipher_0_ssbox_address3 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cipher_0_ssbox_ce0 = 1'b0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_0_ssbox_ce0 = grp_updateKey_fu_77_cipher_0_ssbox_ce0;
    end else begin
        cipher_0_ssbox_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cipher_0_ssbox_ce1 = 1'b0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_0_ssbox_ce1 = grp_updateKey_fu_77_cipher_0_ssbox_ce1;
    end else begin
        cipher_0_ssbox_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cipher_0_ssbox_ce2 = 1'b0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_0_ssbox_ce2 = grp_updateKey_fu_77_cipher_0_ssbox_ce2;
    end else begin
        cipher_0_ssbox_ce2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cipher_0_ssbox_ce3 = 1'b0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        cipher_0_ssbox_ce3 = grp_updateKey_fu_77_cipher_0_ssbox_ce3;
    end else begin
        cipher_0_ssbox_ce3 = 1'b0;
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
            if (((grp_updateKey_fu_77_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
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
    ap_block_state1_ignore_call11 = ((in_r_TVALID_int_regslice == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state6 = ((out_r_TREADY_int_regslice == 1'b0) | (regslice_both_out_r_U_apdone_blk == 1'b1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start = grp_testEnc_Pipeline_VITIS_LOOP_27_1_fu_87_ap_start_reg;

assign grp_updateKey_fu_77_ap_start = grp_updateKey_fu_77_ap_start_reg;

assign in_r_TREADY = regslice_both_in_r_U_ack_in;

assign out_r_TVALID = regslice_both_out_r_U_vld_out;

endmodule //testEnc
