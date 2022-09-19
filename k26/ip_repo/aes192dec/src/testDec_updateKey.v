// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1.0
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module testDec_updateKey (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        cipherkey,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3,
        ap_return_4,
        ap_return_5,
        ap_return_6,
        ap_return_7,
        ap_return_8,
        ap_return_9,
        ap_return_10,
        ap_return_11,
        ap_return_12
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;
parameter    ap_const_lv128_lc_1 = 128'd0;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [191:0] cipherkey;
output  [127:0] ap_return_0;
output  [127:0] ap_return_1;
output  [127:0] ap_return_2;
output  [127:0] ap_return_3;
output  [127:0] ap_return_4;
output  [127:0] ap_return_5;
output  [127:0] ap_return_6;
output  [127:0] ap_return_7;
output  [127:0] ap_return_8;
output  [127:0] ap_return_9;
output  [127:0] ap_return_10;
output  [127:0] ap_return_11;
output  [127:0] ap_return_12;

reg ap_idle;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1073_fu_2323_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [7:0] decipher_0_ssbox_address0;
reg    decipher_0_ssbox_ce0;
wire   [7:0] decipher_0_ssbox_q0;
wire   [7:0] decipher_0_ssbox_address1;
reg    decipher_0_ssbox_ce1;
wire   [7:0] decipher_0_ssbox_q1;
wire   [7:0] decipher_0_ssbox_address2;
reg    decipher_0_ssbox_ce2;
wire   [7:0] decipher_0_ssbox_q2;
wire   [7:0] decipher_0_ssbox_address3;
reg    decipher_0_ssbox_ce3;
wire   [7:0] decipher_0_ssbox_q3;
wire   [3:0] Rcon_address0;
reg    Rcon_ce0;
wire   [7:0] Rcon_q0;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln1073_reg_3457;
reg   [0:0] icmp_ln1073_reg_3457_pp0_iter1_reg;
reg   [0:0] icmp_ln1073_reg_3457_pp0_iter2_reg;
reg   [191:0] p_Val2_load_reg_3466;
reg   [31:0] round_tmp_V_reg_3471;
reg   [7:0] rhs_V_reg_3481;
reg   [31:0] tmp_3_reg_3501;
reg   [31:0] tmp_5_reg_3506;
reg   [31:0] tmp_7_reg_3511;
reg   [31:0] tmp_9_reg_3516;
wire   [31:0] xor_ln1545_fu_2478_p2;
reg   [31:0] xor_ln1545_reg_3521;
wire   [31:0] xor_ln1545_1_fu_2484_p2;
reg   [31:0] xor_ln1545_1_reg_3527;
wire   [31:0] xor_ln1545_2_fu_2489_p2;
reg   [31:0] xor_ln1545_2_reg_3533;
wire   [31:0] xor_ln1545_3_fu_2494_p2;
reg   [31:0] xor_ln1545_3_reg_3539;
wire   [31:0] xor_ln1545_4_fu_2499_p2;
reg   [31:0] xor_ln1545_4_reg_3545;
wire   [31:0] xor_ln1545_5_fu_2504_p2;
reg   [31:0] xor_ln1545_5_reg_3551;
reg   [127:0] ap_phi_mux_this_1_2_2_phi_fu_269_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_2_2_reg_266;
wire   [0:0] trunc_ln819_fu_2997_p1;
wire   [3:0] tmp_s_fu_3001_p4;
wire   [127:0] tmp_11_fu_3011_p5;
reg   [127:0] ap_phi_mux_this_1_3_2_phi_fu_302_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_3_2_reg_299;
reg   [127:0] ap_phi_mux_this_1_4_2_phi_fu_335_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_4_2_reg_332;
reg   [127:0] ap_phi_mux_this_1_5_2_phi_fu_368_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_5_2_reg_365;
reg   [127:0] ap_phi_mux_this_1_6_2_phi_fu_401_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_6_2_reg_398;
reg   [127:0] ap_phi_mux_this_1_7_2_phi_fu_434_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_7_2_reg_431;
reg   [127:0] ap_phi_mux_this_1_8_2_phi_fu_467_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_8_2_reg_464;
reg   [127:0] ap_phi_mux_this_1_9_2_phi_fu_500_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_9_2_reg_497;
reg   [127:0] ap_phi_mux_this_1_10_2_phi_fu_533_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_10_2_reg_530;
reg   [127:0] ap_phi_mux_this_1_11_2_phi_fu_566_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_11_2_reg_563;
reg   [127:0] ap_phi_mux_this_1_1214_2_phi_fu_599_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_1214_2_reg_596;
reg   [127:0] ap_phi_mux_this_1_13_2_phi_fu_632_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_13_2_reg_629;
reg   [127:0] ap_phi_mux_empty_22_phi_fu_665_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_empty_22_reg_662;
reg   [127:0] ap_phi_mux_empty_23_phi_fu_698_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_empty_23_reg_695;
reg   [127:0] ap_phi_mux_mux_case_08_phi_fu_731_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_mux_case_08_reg_728;
reg   [127:0] ap_phi_mux_mux_case_117_phi_fu_764_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_mux_case_117_reg_761;
reg   [127:0] ap_phi_mux_this_1_2_1_phi_fu_797_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_2_1_reg_794;
wire   [127:0] p_Result_19_fu_3126_p5;
reg   [127:0] ap_phi_mux_this_1_3_1_phi_fu_830_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_3_1_reg_827;
reg   [127:0] ap_phi_mux_this_1_4_1_phi_fu_863_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_4_1_reg_860;
reg   [127:0] ap_phi_mux_this_1_5_1_phi_fu_896_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_5_1_reg_893;
reg   [127:0] ap_phi_mux_this_1_6_1_phi_fu_929_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_6_1_reg_926;
reg   [127:0] ap_phi_mux_this_1_7_1_phi_fu_962_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_7_1_reg_959;
reg   [127:0] ap_phi_mux_this_1_8_1_phi_fu_995_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_8_1_reg_992;
reg   [127:0] ap_phi_mux_this_1_9_1_phi_fu_1028_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_9_1_reg_1025;
reg   [127:0] ap_phi_mux_this_1_10_1_phi_fu_1061_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_10_1_reg_1058;
reg   [127:0] ap_phi_mux_this_1_11_1_phi_fu_1094_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_11_1_reg_1091;
reg   [127:0] ap_phi_mux_this_1_1214_1_phi_fu_1127_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_1214_1_reg_1124;
reg   [127:0] ap_phi_mux_this_1_13_1_phi_fu_1160_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_13_1_reg_1157;
reg   [127:0] ap_phi_mux_empty_20_phi_fu_1193_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_empty_20_reg_1190;
reg   [127:0] ap_phi_mux_empty_21_phi_fu_1226_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_empty_21_reg_1223;
reg   [127:0] ap_phi_mux_mux_case_010_phi_fu_1259_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_mux_case_010_reg_1256;
reg   [127:0] ap_phi_mux_mux_case_1174_phi_fu_1292_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_mux_case_1174_reg_1289;
reg   [127:0] ap_phi_mux_this_1_2_3_phi_fu_1325_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_2_3_reg_1322;
reg   [127:0] ap_phi_mux_this_1_3_3_phi_fu_1336_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_3_3_reg_1333;
reg   [127:0] ap_phi_mux_this_1_4_3_phi_fu_1347_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_4_3_reg_1344;
reg   [127:0] ap_phi_mux_this_1_5_3_phi_fu_1358_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_5_3_reg_1355;
reg   [127:0] ap_phi_mux_this_1_6_3_phi_fu_1369_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_6_3_reg_1366;
reg   [127:0] ap_phi_mux_this_1_7_3_phi_fu_1380_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_7_3_reg_1377;
reg   [127:0] ap_phi_mux_this_1_8_3_phi_fu_1391_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_8_3_reg_1388;
reg   [127:0] ap_phi_mux_this_1_9_3_phi_fu_1402_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_9_3_reg_1399;
reg   [127:0] ap_phi_mux_this_1_10_3_phi_fu_1413_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_10_3_reg_1410;
reg   [127:0] ap_phi_mux_this_1_11_3_phi_fu_1424_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_11_3_reg_1421;
reg   [127:0] ap_phi_mux_this_1_1214_3_phi_fu_1435_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_1214_3_reg_1432;
reg   [127:0] ap_phi_mux_this_1_13_3_phi_fu_1446_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_13_3_reg_1443;
reg   [127:0] ap_phi_mux_empty_24_phi_fu_1457_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_empty_24_reg_1454;
reg   [127:0] ap_phi_mux_empty_25_phi_fu_1468_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_empty_25_reg_1465;
reg   [127:0] ap_phi_mux_mux_case_07_phi_fu_1479_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_mux_case_07_reg_1476;
reg   [127:0] ap_phi_mux_mux_case_1173_phi_fu_1490_p4;
wire   [127:0] ap_phi_reg_pp0_iter3_mux_case_1173_reg_1487;
reg   [127:0] ap_phi_mux_storemerge_phi_fu_1501_p4;
wire   [127:0] p_Result_22_fu_3073_p5;
wire   [127:0] ap_phi_reg_pp0_iter3_storemerge_reg_1498;
wire   [127:0] tmp_fu_3154_p5;
reg   [127:0] ap_phi_mux_this_1_2_4_phi_fu_1510_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_2_4_reg_1507;
reg   [127:0] ap_phi_mux_this_1_3_4_phi_fu_1557_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_3_4_reg_1554;
reg   [127:0] ap_phi_mux_this_1_4_4_phi_fu_1604_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_4_4_reg_1601;
reg   [127:0] ap_phi_mux_this_1_5_4_phi_fu_1651_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_5_4_reg_1648;
reg   [127:0] ap_phi_mux_this_1_6_4_phi_fu_1698_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_6_4_reg_1695;
reg   [127:0] ap_phi_mux_this_1_7_4_phi_fu_1745_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_7_4_reg_1742;
reg   [127:0] ap_phi_mux_this_1_8_4_phi_fu_1792_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_8_4_reg_1789;
reg   [127:0] ap_phi_mux_this_1_9_4_phi_fu_1839_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_9_4_reg_1836;
reg   [127:0] ap_phi_mux_this_1_10_4_phi_fu_1886_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_10_4_reg_1883;
reg   [127:0] ap_phi_mux_this_1_11_4_phi_fu_1933_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_11_4_reg_1930;
reg   [127:0] ap_phi_mux_this_1_1214_4_phi_fu_1980_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_1214_4_reg_1977;
reg   [127:0] ap_phi_mux_this_1_13_4_phi_fu_2027_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_this_1_13_4_reg_2024;
reg   [127:0] ap_phi_mux_empty_26_phi_fu_2074_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_empty_26_reg_2071;
reg   [127:0] ap_phi_mux_empty_27_phi_fu_2121_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_empty_27_reg_2118;
reg   [127:0] ap_phi_mux_mux_case_06_phi_fu_2168_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_mux_case_06_reg_2165;
reg   [127:0] ap_phi_mux_mux_case_1172_phi_fu_2215_p28;
wire   [127:0] ap_phi_reg_pp0_iter3_mux_case_1172_reg_2212;
wire   [63:0] zext_ln1073_fu_2335_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln708_fu_2378_p1;
wire   [63:0] zext_ln708_1_fu_2393_p1;
wire   [63:0] zext_ln708_2_fu_2408_p1;
wire   [63:0] zext_ln708_3_fu_2413_p1;
reg   [191:0] p_Val2_s_fu_122;
wire   [191:0] p_Result_24_fu_2509_p7;
reg   [191:0] ap_sig_allocacmp_p_Val2_load;
wire    ap_loop_init;
reg   [3:0] rIter_V_fu_126;
wire   [3:0] add_ln886_fu_2329_p2;
reg   [3:0] ap_sig_allocacmp_rIter_V_1;
reg   [4:0] p_Val2_1_fu_130;
wire   [4:0] add_ln886_1_fu_3166_p2;
reg   [127:0] p_Result_s_fu_134;
wire   [127:0] p_Result_18_fu_2273_p5;
reg   [127:0] p_Result_1_fu_138;
wire   [127:0] trunc_ln674_fu_2259_p1;
reg   [127:0] p_Result_2_fu_142;
reg   [127:0] p_Result_3_fu_146;
reg   [127:0] p_Result_4_fu_150;
reg   [127:0] p_Result_5_fu_154;
reg   [127:0] p_Result_6_fu_158;
reg   [127:0] p_Result_9_fu_162;
reg   [127:0] p_Result_10_fu_166;
reg   [127:0] p_Result_11_fu_170;
reg   [127:0] p_Result_12_fu_174;
reg   [127:0] p_Result_13_fu_178;
reg   [127:0] p_Result_14_fu_182;
reg   [127:0] p_Result_15_fu_186;
reg   [127:0] p_Result_16_fu_190;
reg   [127:0] p_Result_17_fu_194;
wire   [63:0] tmp_1_fu_2263_p4;
wire   [7:0] tmp_4_fu_2368_p4;
wire   [7:0] tmp_6_fu_2383_p4;
wire   [7:0] tmp_8_fu_2398_p4;
wire   [7:0] tmp_2_fu_2358_p4;
wire   [7:0] ret_V_fu_2458_p2;
wire   [31:0] trunc_ln674_1_fu_2475_p1;
wire   [31:0] p_Result_23_fu_2463_p5;
wire   [3:0] p_Val2_4_fu_3041_p14;
wire   [127:0] p_Val2_4_fu_3041_p15;
wire   [63:0] tmp_13_fu_3035_p3;
wire   [3:0] p_Val2_2_fu_3092_p15;
wire   [127:0] p_Val2_2_fu_3092_p16;
wire   [63:0] tmp_10_fu_3086_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
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

testDec_updateKey_decipher_0_ssbox_ROM_NP_LUTRAM_1R #(
    .DataWidth( 8 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
decipher_0_ssbox_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(decipher_0_ssbox_address0),
    .ce0(decipher_0_ssbox_ce0),
    .q0(decipher_0_ssbox_q0),
    .address1(decipher_0_ssbox_address1),
    .ce1(decipher_0_ssbox_ce1),
    .q1(decipher_0_ssbox_q1),
    .address2(decipher_0_ssbox_address2),
    .ce2(decipher_0_ssbox_ce2),
    .q2(decipher_0_ssbox_q2),
    .address3(decipher_0_ssbox_address3),
    .ce3(decipher_0_ssbox_ce3),
    .q3(decipher_0_ssbox_q3)
);

testDec_updateKey_Rcon_ROM_AUTO_1R #(
    .DataWidth( 8 ),
    .AddressRange( 10 ),
    .AddressWidth( 4 ))
Rcon_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(Rcon_address0),
    .ce0(Rcon_ce0),
    .q0(Rcon_q0)
);

testDec_mux_134_128_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 128 ),
    .din1_WIDTH( 128 ),
    .din2_WIDTH( 128 ),
    .din3_WIDTH( 128 ),
    .din4_WIDTH( 128 ),
    .din5_WIDTH( 128 ),
    .din6_WIDTH( 128 ),
    .din7_WIDTH( 128 ),
    .din8_WIDTH( 128 ),
    .din9_WIDTH( 128 ),
    .din10_WIDTH( 128 ),
    .din11_WIDTH( 128 ),
    .din12_WIDTH( 128 ),
    .din13_WIDTH( 4 ),
    .dout_WIDTH( 128 ))
mux_134_128_1_1_U1(
    .din0(ap_phi_mux_mux_case_117_phi_fu_764_p28),
    .din1(ap_phi_mux_this_1_2_2_phi_fu_269_p28),
    .din2(ap_phi_mux_this_1_3_2_phi_fu_302_p28),
    .din3(ap_phi_mux_this_1_4_2_phi_fu_335_p28),
    .din4(ap_phi_mux_this_1_5_2_phi_fu_368_p28),
    .din5(ap_phi_mux_this_1_6_2_phi_fu_401_p28),
    .din6(ap_phi_mux_this_1_7_2_phi_fu_434_p28),
    .din7(ap_phi_mux_this_1_8_2_phi_fu_467_p28),
    .din8(ap_phi_mux_this_1_9_2_phi_fu_500_p28),
    .din9(ap_phi_mux_this_1_10_2_phi_fu_533_p28),
    .din10(ap_phi_mux_this_1_11_2_phi_fu_566_p28),
    .din11(ap_phi_mux_this_1_1214_2_phi_fu_599_p28),
    .din12(ap_phi_mux_this_1_13_2_phi_fu_632_p28),
    .din13(p_Val2_4_fu_3041_p14),
    .dout(p_Val2_4_fu_3041_p15)
);

testDec_mux_144_128_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 128 ),
    .din1_WIDTH( 128 ),
    .din2_WIDTH( 128 ),
    .din3_WIDTH( 128 ),
    .din4_WIDTH( 128 ),
    .din5_WIDTH( 128 ),
    .din6_WIDTH( 128 ),
    .din7_WIDTH( 128 ),
    .din8_WIDTH( 128 ),
    .din9_WIDTH( 128 ),
    .din10_WIDTH( 128 ),
    .din11_WIDTH( 128 ),
    .din12_WIDTH( 128 ),
    .din13_WIDTH( 128 ),
    .din14_WIDTH( 4 ),
    .dout_WIDTH( 128 ))
mux_144_128_1_1_U2(
    .din0(p_Result_1_fu_138),
    .din1(p_Result_s_fu_134),
    .din2(p_Result_17_fu_194),
    .din3(p_Result_16_fu_190),
    .din4(p_Result_15_fu_186),
    .din5(p_Result_14_fu_182),
    .din6(p_Result_13_fu_178),
    .din7(p_Result_12_fu_174),
    .din8(p_Result_11_fu_170),
    .din9(p_Result_10_fu_166),
    .din10(p_Result_9_fu_162),
    .din11(p_Result_6_fu_158),
    .din12(p_Result_5_fu_154),
    .din13(p_Result_4_fu_150),
    .din14(p_Val2_2_fu_3092_p15),
    .dout(p_Val2_2_fu_3092_p16)
);

testDec_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b0))) begin
        ap_loop_exit_ready_pp0_iter3_reg <= 1'b0;
    end else if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Result_1_fu_138 <= trunc_ln674_fu_2259_p1;
        end else if (((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            p_Result_1_fu_138 <= ap_phi_mux_mux_case_06_phi_fu_2168_p28;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Result_2_fu_142 <= p_Result_18_fu_2273_p5;
        end else if (((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            p_Result_2_fu_142 <= ap_phi_mux_empty_27_phi_fu_2121_p28;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Result_3_fu_146 <= trunc_ln674_fu_2259_p1;
        end else if (((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            p_Result_3_fu_146 <= ap_phi_mux_empty_26_phi_fu_2074_p28;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Result_s_fu_134 <= p_Result_18_fu_2273_p5;
        end else if (((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            p_Result_s_fu_134 <= ap_phi_mux_mux_case_1172_phi_fu_2215_p28;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Val2_1_fu_130 <= 5'd3;
        end else if (((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            p_Val2_1_fu_130 <= add_ln886_1_fu_3166_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Val2_s_fu_122 <= cipherkey;
        end else if (((icmp_ln1073_reg_3457_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            p_Val2_s_fu_122 <= p_Result_24_fu_2509_p7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1073_fu_2323_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            rIter_V_fu_126 <= add_ln886_fu_2329_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            rIter_V_fu_126 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln1073_reg_3457 <= icmp_ln1073_fu_2323_p2;
        icmp_ln1073_reg_3457_pp0_iter1_reg <= icmp_ln1073_reg_3457;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln1073_reg_3457_pp0_iter2_reg <= icmp_ln1073_reg_3457_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        p_Result_10_fu_166 <= ap_phi_mux_this_1_9_4_phi_fu_1839_p28;
        p_Result_11_fu_170 <= ap_phi_mux_this_1_8_4_phi_fu_1792_p28;
        p_Result_12_fu_174 <= ap_phi_mux_this_1_7_4_phi_fu_1745_p28;
        p_Result_13_fu_178 <= ap_phi_mux_this_1_6_4_phi_fu_1698_p28;
        p_Result_14_fu_182 <= ap_phi_mux_this_1_5_4_phi_fu_1651_p28;
        p_Result_15_fu_186 <= ap_phi_mux_this_1_4_4_phi_fu_1604_p28;
        p_Result_16_fu_190 <= ap_phi_mux_this_1_3_4_phi_fu_1557_p28;
        p_Result_17_fu_194 <= ap_phi_mux_this_1_2_4_phi_fu_1510_p28;
        p_Result_4_fu_150 <= ap_phi_mux_this_1_13_4_phi_fu_2027_p28;
        p_Result_5_fu_154 <= ap_phi_mux_this_1_1214_4_phi_fu_1980_p28;
        p_Result_6_fu_158 <= ap_phi_mux_this_1_11_4_phi_fu_1933_p28;
        p_Result_9_fu_162 <= ap_phi_mux_this_1_10_4_phi_fu_1886_p28;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_3457 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_Val2_load_reg_3466 <= ap_sig_allocacmp_p_Val2_load;
        rhs_V_reg_3481 <= Rcon_q0;
        round_tmp_V_reg_3471 <= {{ap_sig_allocacmp_p_Val2_load[191:160]}};
        tmp_3_reg_3501 <= {{ap_sig_allocacmp_p_Val2_load[63:32]}};
        tmp_5_reg_3506 <= {{ap_sig_allocacmp_p_Val2_load[95:64]}};
        tmp_7_reg_3511 <= {{ap_sig_allocacmp_p_Val2_load[127:96]}};
        tmp_9_reg_3516 <= {{ap_sig_allocacmp_p_Val2_load[159:128]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_3457_pp0_iter1_reg == 1'd0))) begin
        xor_ln1545_1_reg_3527 <= xor_ln1545_1_fu_2484_p2;
        xor_ln1545_2_reg_3533 <= xor_ln1545_2_fu_2489_p2;
        xor_ln1545_3_reg_3539 <= xor_ln1545_3_fu_2494_p2;
        xor_ln1545_4_reg_3545 <= xor_ln1545_4_fu_2499_p2;
        xor_ln1545_5_reg_3551 <= xor_ln1545_5_fu_2504_p2;
        xor_ln1545_reg_3521 <= xor_ln1545_fu_2478_p2;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        Rcon_ce0 = 1'b1;
    end else begin
        Rcon_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1073_fu_2323_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
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
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
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
    if (((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_empty_20_phi_fu_1193_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_empty_20_phi_fu_1193_p28 = p_Result_3_fu_146;
    end else begin
        ap_phi_mux_empty_20_phi_fu_1193_p28 = ap_phi_reg_pp0_iter3_empty_20_reg_1190;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_empty_21_phi_fu_1226_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_empty_21_phi_fu_1226_p28 = p_Result_2_fu_142;
    end else begin
        ap_phi_mux_empty_21_phi_fu_1226_p28 = ap_phi_reg_pp0_iter3_empty_21_reg_1223;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_empty_22_phi_fu_665_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_empty_22_phi_fu_665_p28 = p_Result_3_fu_146;
    end else begin
        ap_phi_mux_empty_22_phi_fu_665_p28 = ap_phi_reg_pp0_iter3_empty_22_reg_662;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_empty_23_phi_fu_698_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_empty_23_phi_fu_698_p28 = p_Result_2_fu_142;
    end else begin
        ap_phi_mux_empty_23_phi_fu_698_p28 = ap_phi_reg_pp0_iter3_empty_23_reg_695;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_empty_24_phi_fu_1457_p4 = ap_phi_mux_empty_20_phi_fu_1193_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_empty_24_phi_fu_1457_p4 = ap_phi_mux_empty_22_phi_fu_665_p28;
        end else begin
            ap_phi_mux_empty_24_phi_fu_1457_p4 = ap_phi_reg_pp0_iter3_empty_24_reg_1454;
        end
    end else begin
        ap_phi_mux_empty_24_phi_fu_1457_p4 = ap_phi_reg_pp0_iter3_empty_24_reg_1454;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_empty_25_phi_fu_1468_p4 = ap_phi_mux_empty_21_phi_fu_1226_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_empty_25_phi_fu_1468_p4 = ap_phi_mux_empty_23_phi_fu_698_p28;
        end else begin
            ap_phi_mux_empty_25_phi_fu_1468_p4 = ap_phi_reg_pp0_iter3_empty_25_reg_1465;
        end
    end else begin
        ap_phi_mux_empty_25_phi_fu_1468_p4 = ap_phi_reg_pp0_iter3_empty_25_reg_1465;
    end
end

always @ (*) begin
    if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_empty_26_phi_fu_2074_p28 = ap_phi_mux_empty_24_phi_fu_1457_p4;
    end else if (((((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_empty_26_phi_fu_2074_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else begin
        ap_phi_mux_empty_26_phi_fu_2074_p28 = ap_phi_reg_pp0_iter3_empty_26_reg_2071;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_empty_27_phi_fu_2121_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_empty_27_phi_fu_2121_p28 = ap_phi_mux_empty_25_phi_fu_1468_p4;
    end else begin
        ap_phi_mux_empty_27_phi_fu_2121_p28 = ap_phi_reg_pp0_iter3_empty_27_reg_2118;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_mux_case_010_phi_fu_1259_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_mux_case_010_phi_fu_1259_p28 = p_Result_1_fu_138;
    end else begin
        ap_phi_mux_mux_case_010_phi_fu_1259_p28 = ap_phi_reg_pp0_iter3_mux_case_010_reg_1256;
    end
end

always @ (*) begin
    if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_mux_case_06_phi_fu_2168_p28 = ap_phi_mux_mux_case_07_phi_fu_1479_p4;
    end else if (((((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_mux_case_06_phi_fu_2168_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else begin
        ap_phi_mux_mux_case_06_phi_fu_2168_p28 = ap_phi_reg_pp0_iter3_mux_case_06_reg_2165;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_mux_case_07_phi_fu_1479_p4 = ap_phi_mux_mux_case_010_phi_fu_1259_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_mux_case_07_phi_fu_1479_p4 = ap_phi_mux_mux_case_08_phi_fu_731_p28;
        end else begin
            ap_phi_mux_mux_case_07_phi_fu_1479_p4 = ap_phi_reg_pp0_iter3_mux_case_07_reg_1476;
        end
    end else begin
        ap_phi_mux_mux_case_07_phi_fu_1479_p4 = ap_phi_reg_pp0_iter3_mux_case_07_reg_1476;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_mux_case_08_phi_fu_731_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_mux_case_08_phi_fu_731_p28 = p_Result_1_fu_138;
    end else begin
        ap_phi_mux_mux_case_08_phi_fu_731_p28 = ap_phi_reg_pp0_iter3_mux_case_08_reg_728;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_mux_case_1172_phi_fu_2215_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_mux_case_1172_phi_fu_2215_p28 = ap_phi_mux_mux_case_1173_phi_fu_1490_p4;
    end else begin
        ap_phi_mux_mux_case_1172_phi_fu_2215_p28 = ap_phi_reg_pp0_iter3_mux_case_1172_reg_2212;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_mux_case_1173_phi_fu_1490_p4 = ap_phi_mux_mux_case_1174_phi_fu_1292_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_mux_case_1173_phi_fu_1490_p4 = ap_phi_mux_mux_case_117_phi_fu_764_p28;
        end else begin
            ap_phi_mux_mux_case_1173_phi_fu_1490_p4 = ap_phi_reg_pp0_iter3_mux_case_1173_reg_1487;
        end
    end else begin
        ap_phi_mux_mux_case_1173_phi_fu_1490_p4 = ap_phi_reg_pp0_iter3_mux_case_1173_reg_1487;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_mux_case_1174_phi_fu_1292_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_mux_case_1174_phi_fu_1292_p28 = p_Result_s_fu_134;
    end else begin
        ap_phi_mux_mux_case_1174_phi_fu_1292_p28 = ap_phi_reg_pp0_iter3_mux_case_1174_reg_1289;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_mux_case_117_phi_fu_764_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_mux_case_117_phi_fu_764_p28 = p_Result_s_fu_134;
    end else begin
        ap_phi_mux_mux_case_117_phi_fu_764_p28 = ap_phi_reg_pp0_iter3_mux_case_117_reg_761;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_storemerge_phi_fu_1501_p4 = tmp_fu_3154_p5;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_storemerge_phi_fu_1501_p4 = p_Result_22_fu_3073_p5;
        end else begin
            ap_phi_mux_storemerge_phi_fu_1501_p4 = ap_phi_reg_pp0_iter3_storemerge_reg_1498;
        end
    end else begin
        ap_phi_mux_storemerge_phi_fu_1501_p4 = ap_phi_reg_pp0_iter3_storemerge_reg_1498;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_10_1_phi_fu_1061_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_10_1_phi_fu_1061_p28 = p_Result_9_fu_162;
    end else begin
        ap_phi_mux_this_1_10_1_phi_fu_1061_p28 = ap_phi_reg_pp0_iter3_this_1_10_1_reg_1058;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_10_2_phi_fu_533_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_10_2_phi_fu_533_p28 = p_Result_9_fu_162;
    end else begin
        ap_phi_mux_this_1_10_2_phi_fu_533_p28 = ap_phi_reg_pp0_iter3_this_1_10_2_reg_530;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_10_3_phi_fu_1413_p4 = ap_phi_mux_this_1_10_1_phi_fu_1061_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_10_3_phi_fu_1413_p4 = ap_phi_mux_this_1_10_2_phi_fu_533_p28;
        end else begin
            ap_phi_mux_this_1_10_3_phi_fu_1413_p4 = ap_phi_reg_pp0_iter3_this_1_10_3_reg_1410;
        end
    end else begin
        ap_phi_mux_this_1_10_3_phi_fu_1413_p4 = ap_phi_reg_pp0_iter3_this_1_10_3_reg_1410;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_10_4_phi_fu_1886_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_10_4_phi_fu_1886_p28 = ap_phi_mux_this_1_10_3_phi_fu_1413_p4;
    end else begin
        ap_phi_mux_this_1_10_4_phi_fu_1886_p28 = ap_phi_reg_pp0_iter3_this_1_10_4_reg_1883;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_11_1_phi_fu_1094_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_11_1_phi_fu_1094_p28 = p_Result_6_fu_158;
    end else begin
        ap_phi_mux_this_1_11_1_phi_fu_1094_p28 = ap_phi_reg_pp0_iter3_this_1_11_1_reg_1091;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_11_2_phi_fu_566_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_11_2_phi_fu_566_p28 = p_Result_6_fu_158;
    end else begin
        ap_phi_mux_this_1_11_2_phi_fu_566_p28 = ap_phi_reg_pp0_iter3_this_1_11_2_reg_563;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_11_3_phi_fu_1424_p4 = ap_phi_mux_this_1_11_1_phi_fu_1094_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_11_3_phi_fu_1424_p4 = ap_phi_mux_this_1_11_2_phi_fu_566_p28;
        end else begin
            ap_phi_mux_this_1_11_3_phi_fu_1424_p4 = ap_phi_reg_pp0_iter3_this_1_11_3_reg_1421;
        end
    end else begin
        ap_phi_mux_this_1_11_3_phi_fu_1424_p4 = ap_phi_reg_pp0_iter3_this_1_11_3_reg_1421;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_11_4_phi_fu_1933_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_11_4_phi_fu_1933_p28 = ap_phi_mux_this_1_11_3_phi_fu_1424_p4;
    end else begin
        ap_phi_mux_this_1_11_4_phi_fu_1933_p28 = ap_phi_reg_pp0_iter3_this_1_11_4_reg_1930;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_1214_1_phi_fu_1127_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_1214_1_phi_fu_1127_p28 = p_Result_5_fu_154;
    end else begin
        ap_phi_mux_this_1_1214_1_phi_fu_1127_p28 = ap_phi_reg_pp0_iter3_this_1_1214_1_reg_1124;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_1214_2_phi_fu_599_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_1214_2_phi_fu_599_p28 = p_Result_5_fu_154;
    end else begin
        ap_phi_mux_this_1_1214_2_phi_fu_599_p28 = ap_phi_reg_pp0_iter3_this_1_1214_2_reg_596;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_1214_3_phi_fu_1435_p4 = ap_phi_mux_this_1_1214_1_phi_fu_1127_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_1214_3_phi_fu_1435_p4 = ap_phi_mux_this_1_1214_2_phi_fu_599_p28;
        end else begin
            ap_phi_mux_this_1_1214_3_phi_fu_1435_p4 = ap_phi_reg_pp0_iter3_this_1_1214_3_reg_1432;
        end
    end else begin
        ap_phi_mux_this_1_1214_3_phi_fu_1435_p4 = ap_phi_reg_pp0_iter3_this_1_1214_3_reg_1432;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_1214_4_phi_fu_1980_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_1214_4_phi_fu_1980_p28 = ap_phi_mux_this_1_1214_3_phi_fu_1435_p4;
    end else begin
        ap_phi_mux_this_1_1214_4_phi_fu_1980_p28 = ap_phi_reg_pp0_iter3_this_1_1214_4_reg_1977;
    end
end

always @ (*) begin
    if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_13_1_phi_fu_1160_p28 = p_Result_4_fu_150;
    end else if (((((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_13_1_phi_fu_1160_p28 = p_Result_19_fu_3126_p5;
    end else begin
        ap_phi_mux_this_1_13_1_phi_fu_1160_p28 = ap_phi_reg_pp0_iter3_this_1_13_1_reg_1157;
    end
end

always @ (*) begin
    if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_13_2_phi_fu_632_p28 = p_Result_4_fu_150;
    end else if (((((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_13_2_phi_fu_632_p28 = tmp_11_fu_3011_p5;
    end else begin
        ap_phi_mux_this_1_13_2_phi_fu_632_p28 = ap_phi_reg_pp0_iter3_this_1_13_2_reg_629;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_13_3_phi_fu_1446_p4 = ap_phi_mux_this_1_13_1_phi_fu_1160_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_13_3_phi_fu_1446_p4 = ap_phi_mux_this_1_13_2_phi_fu_632_p28;
        end else begin
            ap_phi_mux_this_1_13_3_phi_fu_1446_p4 = ap_phi_reg_pp0_iter3_this_1_13_3_reg_1443;
        end
    end else begin
        ap_phi_mux_this_1_13_3_phi_fu_1446_p4 = ap_phi_reg_pp0_iter3_this_1_13_3_reg_1443;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_13_4_phi_fu_2027_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_13_4_phi_fu_2027_p28 = ap_phi_mux_this_1_13_3_phi_fu_1446_p4;
    end else begin
        ap_phi_mux_this_1_13_4_phi_fu_2027_p28 = ap_phi_reg_pp0_iter3_this_1_13_4_reg_2024;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_2_1_phi_fu_797_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_2_1_phi_fu_797_p28 = p_Result_17_fu_194;
    end else begin
        ap_phi_mux_this_1_2_1_phi_fu_797_p28 = ap_phi_reg_pp0_iter3_this_1_2_1_reg_794;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_2_2_phi_fu_269_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_2_2_phi_fu_269_p28 = p_Result_17_fu_194;
    end else begin
        ap_phi_mux_this_1_2_2_phi_fu_269_p28 = ap_phi_reg_pp0_iter3_this_1_2_2_reg_266;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_2_3_phi_fu_1325_p4 = ap_phi_mux_this_1_2_1_phi_fu_797_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_2_3_phi_fu_1325_p4 = ap_phi_mux_this_1_2_2_phi_fu_269_p28;
        end else begin
            ap_phi_mux_this_1_2_3_phi_fu_1325_p4 = ap_phi_reg_pp0_iter3_this_1_2_3_reg_1322;
        end
    end else begin
        ap_phi_mux_this_1_2_3_phi_fu_1325_p4 = ap_phi_reg_pp0_iter3_this_1_2_3_reg_1322;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_2_4_phi_fu_1510_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_2_4_phi_fu_1510_p28 = ap_phi_mux_this_1_2_3_phi_fu_1325_p4;
    end else begin
        ap_phi_mux_this_1_2_4_phi_fu_1510_p28 = ap_phi_reg_pp0_iter3_this_1_2_4_reg_1507;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_3_1_phi_fu_830_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_3_1_phi_fu_830_p28 = p_Result_16_fu_190;
    end else begin
        ap_phi_mux_this_1_3_1_phi_fu_830_p28 = ap_phi_reg_pp0_iter3_this_1_3_1_reg_827;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_3_2_phi_fu_302_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_3_2_phi_fu_302_p28 = p_Result_16_fu_190;
    end else begin
        ap_phi_mux_this_1_3_2_phi_fu_302_p28 = ap_phi_reg_pp0_iter3_this_1_3_2_reg_299;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_3_3_phi_fu_1336_p4 = ap_phi_mux_this_1_3_1_phi_fu_830_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_3_3_phi_fu_1336_p4 = ap_phi_mux_this_1_3_2_phi_fu_302_p28;
        end else begin
            ap_phi_mux_this_1_3_3_phi_fu_1336_p4 = ap_phi_reg_pp0_iter3_this_1_3_3_reg_1333;
        end
    end else begin
        ap_phi_mux_this_1_3_3_phi_fu_1336_p4 = ap_phi_reg_pp0_iter3_this_1_3_3_reg_1333;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_3_4_phi_fu_1557_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_3_4_phi_fu_1557_p28 = ap_phi_mux_this_1_3_3_phi_fu_1336_p4;
    end else begin
        ap_phi_mux_this_1_3_4_phi_fu_1557_p28 = ap_phi_reg_pp0_iter3_this_1_3_4_reg_1554;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_4_1_phi_fu_863_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_4_1_phi_fu_863_p28 = p_Result_15_fu_186;
    end else begin
        ap_phi_mux_this_1_4_1_phi_fu_863_p28 = ap_phi_reg_pp0_iter3_this_1_4_1_reg_860;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_4_2_phi_fu_335_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_4_2_phi_fu_335_p28 = p_Result_15_fu_186;
    end else begin
        ap_phi_mux_this_1_4_2_phi_fu_335_p28 = ap_phi_reg_pp0_iter3_this_1_4_2_reg_332;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_4_3_phi_fu_1347_p4 = ap_phi_mux_this_1_4_1_phi_fu_863_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_4_3_phi_fu_1347_p4 = ap_phi_mux_this_1_4_2_phi_fu_335_p28;
        end else begin
            ap_phi_mux_this_1_4_3_phi_fu_1347_p4 = ap_phi_reg_pp0_iter3_this_1_4_3_reg_1344;
        end
    end else begin
        ap_phi_mux_this_1_4_3_phi_fu_1347_p4 = ap_phi_reg_pp0_iter3_this_1_4_3_reg_1344;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_4_4_phi_fu_1604_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_4_4_phi_fu_1604_p28 = ap_phi_mux_this_1_4_3_phi_fu_1347_p4;
    end else begin
        ap_phi_mux_this_1_4_4_phi_fu_1604_p28 = ap_phi_reg_pp0_iter3_this_1_4_4_reg_1601;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_5_1_phi_fu_896_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_5_1_phi_fu_896_p28 = p_Result_14_fu_182;
    end else begin
        ap_phi_mux_this_1_5_1_phi_fu_896_p28 = ap_phi_reg_pp0_iter3_this_1_5_1_reg_893;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_5_2_phi_fu_368_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_5_2_phi_fu_368_p28 = p_Result_14_fu_182;
    end else begin
        ap_phi_mux_this_1_5_2_phi_fu_368_p28 = ap_phi_reg_pp0_iter3_this_1_5_2_reg_365;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_5_3_phi_fu_1358_p4 = ap_phi_mux_this_1_5_1_phi_fu_896_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_5_3_phi_fu_1358_p4 = ap_phi_mux_this_1_5_2_phi_fu_368_p28;
        end else begin
            ap_phi_mux_this_1_5_3_phi_fu_1358_p4 = ap_phi_reg_pp0_iter3_this_1_5_3_reg_1355;
        end
    end else begin
        ap_phi_mux_this_1_5_3_phi_fu_1358_p4 = ap_phi_reg_pp0_iter3_this_1_5_3_reg_1355;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_5_4_phi_fu_1651_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_5_4_phi_fu_1651_p28 = ap_phi_mux_this_1_5_3_phi_fu_1358_p4;
    end else begin
        ap_phi_mux_this_1_5_4_phi_fu_1651_p28 = ap_phi_reg_pp0_iter3_this_1_5_4_reg_1648;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_6_1_phi_fu_929_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_6_1_phi_fu_929_p28 = p_Result_13_fu_178;
    end else begin
        ap_phi_mux_this_1_6_1_phi_fu_929_p28 = ap_phi_reg_pp0_iter3_this_1_6_1_reg_926;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_6_2_phi_fu_401_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_6_2_phi_fu_401_p28 = p_Result_13_fu_178;
    end else begin
        ap_phi_mux_this_1_6_2_phi_fu_401_p28 = ap_phi_reg_pp0_iter3_this_1_6_2_reg_398;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_6_3_phi_fu_1369_p4 = ap_phi_mux_this_1_6_1_phi_fu_929_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_6_3_phi_fu_1369_p4 = ap_phi_mux_this_1_6_2_phi_fu_401_p28;
        end else begin
            ap_phi_mux_this_1_6_3_phi_fu_1369_p4 = ap_phi_reg_pp0_iter3_this_1_6_3_reg_1366;
        end
    end else begin
        ap_phi_mux_this_1_6_3_phi_fu_1369_p4 = ap_phi_reg_pp0_iter3_this_1_6_3_reg_1366;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_6_4_phi_fu_1698_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_6_4_phi_fu_1698_p28 = ap_phi_mux_this_1_6_3_phi_fu_1369_p4;
    end else begin
        ap_phi_mux_this_1_6_4_phi_fu_1698_p28 = ap_phi_reg_pp0_iter3_this_1_6_4_reg_1695;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_7_1_phi_fu_962_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_7_1_phi_fu_962_p28 = p_Result_12_fu_174;
    end else begin
        ap_phi_mux_this_1_7_1_phi_fu_962_p28 = ap_phi_reg_pp0_iter3_this_1_7_1_reg_959;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_7_2_phi_fu_434_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_7_2_phi_fu_434_p28 = p_Result_12_fu_174;
    end else begin
        ap_phi_mux_this_1_7_2_phi_fu_434_p28 = ap_phi_reg_pp0_iter3_this_1_7_2_reg_431;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_7_3_phi_fu_1380_p4 = ap_phi_mux_this_1_7_1_phi_fu_962_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_7_3_phi_fu_1380_p4 = ap_phi_mux_this_1_7_2_phi_fu_434_p28;
        end else begin
            ap_phi_mux_this_1_7_3_phi_fu_1380_p4 = ap_phi_reg_pp0_iter3_this_1_7_3_reg_1377;
        end
    end else begin
        ap_phi_mux_this_1_7_3_phi_fu_1380_p4 = ap_phi_reg_pp0_iter3_this_1_7_3_reg_1377;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_7_4_phi_fu_1745_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_7_4_phi_fu_1745_p28 = ap_phi_mux_this_1_7_3_phi_fu_1380_p4;
    end else begin
        ap_phi_mux_this_1_7_4_phi_fu_1745_p28 = ap_phi_reg_pp0_iter3_this_1_7_4_reg_1742;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_8_1_phi_fu_995_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_8_1_phi_fu_995_p28 = p_Result_11_fu_170;
    end else begin
        ap_phi_mux_this_1_8_1_phi_fu_995_p28 = ap_phi_reg_pp0_iter3_this_1_8_1_reg_992;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_8_2_phi_fu_467_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_8_2_phi_fu_467_p28 = p_Result_11_fu_170;
    end else begin
        ap_phi_mux_this_1_8_2_phi_fu_467_p28 = ap_phi_reg_pp0_iter3_this_1_8_2_reg_464;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_8_3_phi_fu_1391_p4 = ap_phi_mux_this_1_8_1_phi_fu_995_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_8_3_phi_fu_1391_p4 = ap_phi_mux_this_1_8_2_phi_fu_467_p28;
        end else begin
            ap_phi_mux_this_1_8_3_phi_fu_1391_p4 = ap_phi_reg_pp0_iter3_this_1_8_3_reg_1388;
        end
    end else begin
        ap_phi_mux_this_1_8_3_phi_fu_1391_p4 = ap_phi_reg_pp0_iter3_this_1_8_3_reg_1388;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_8_4_phi_fu_1792_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_8_4_phi_fu_1792_p28 = ap_phi_mux_this_1_8_3_phi_fu_1391_p4;
    end else begin
        ap_phi_mux_this_1_8_4_phi_fu_1792_p28 = ap_phi_reg_pp0_iter3_this_1_8_4_reg_1789;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_9_1_phi_fu_1028_p28 = p_Result_19_fu_3126_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_9_1_phi_fu_1028_p28 = p_Result_10_fu_166;
    end else begin
        ap_phi_mux_this_1_9_1_phi_fu_1028_p28 = ap_phi_reg_pp0_iter3_this_1_9_1_reg_1025;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd9) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_9_2_phi_fu_500_p28 = tmp_11_fu_3011_p5;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd8) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (trunc_ln819_fu_2997_p1 == 1'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_9_2_phi_fu_500_p28 = p_Result_10_fu_166;
    end else begin
        ap_phi_mux_this_1_9_2_phi_fu_500_p28 = ap_phi_reg_pp0_iter3_this_1_9_2_reg_497;
    end
end

always @ (*) begin
    if ((icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) begin
        if ((trunc_ln819_fu_2997_p1 == 1'd1)) begin
            ap_phi_mux_this_1_9_3_phi_fu_1402_p4 = ap_phi_mux_this_1_9_1_phi_fu_1028_p28;
        end else if ((trunc_ln819_fu_2997_p1 == 1'd0)) begin
            ap_phi_mux_this_1_9_3_phi_fu_1402_p4 = ap_phi_mux_this_1_9_2_phi_fu_500_p28;
        end else begin
            ap_phi_mux_this_1_9_3_phi_fu_1402_p4 = ap_phi_reg_pp0_iter3_this_1_9_3_reg_1399;
        end
    end else begin
        ap_phi_mux_this_1_9_3_phi_fu_1402_p4 = ap_phi_reg_pp0_iter3_this_1_9_3_reg_1399;
    end
end

always @ (*) begin
    if (((tmp_s_fu_3001_p4 == 4'd8) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0))) begin
        ap_phi_mux_this_1_9_4_phi_fu_1839_p28 = ap_phi_mux_storemerge_phi_fu_1501_p4;
    end else if ((((tmp_s_fu_3001_p4 == 4'd0) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd1) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd2) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd3) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd4) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd5) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd6) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd7) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd9) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd10) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd11) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd12) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd13) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd14) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)) | ((tmp_s_fu_3001_p4 == 4'd15) & (icmp_ln1073_reg_3457_pp0_iter2_reg == 1'd0)))) begin
        ap_phi_mux_this_1_9_4_phi_fu_1839_p28 = ap_phi_mux_this_1_9_3_phi_fu_1402_p4;
    end else begin
        ap_phi_mux_this_1_9_4_phi_fu_1839_p28 = ap_phi_reg_pp0_iter3_this_1_9_4_reg_1836;
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
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln1073_reg_3457_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_p_Val2_load = p_Result_24_fu_2509_p7;
    end else begin
        ap_sig_allocacmp_p_Val2_load = p_Val2_s_fu_122;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_rIter_V_1 = 4'd0;
    end else begin
        ap_sig_allocacmp_rIter_V_1 = rIter_V_fu_126;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        decipher_0_ssbox_ce0 = 1'b1;
    end else begin
        decipher_0_ssbox_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        decipher_0_ssbox_ce1 = 1'b1;
    end else begin
        decipher_0_ssbox_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        decipher_0_ssbox_ce2 = 1'b1;
    end else begin
        decipher_0_ssbox_ce2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        decipher_0_ssbox_ce3 = 1'b1;
    end else begin
        decipher_0_ssbox_ce3 = 1'b0;
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

assign Rcon_address0 = zext_ln1073_fu_2335_p1;

assign add_ln886_1_fu_3166_p2 = (p_Val2_1_fu_130 + 5'd3);

assign add_ln886_fu_2329_p2 = (ap_sig_allocacmp_rIter_V_1 + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_phi_reg_pp0_iter3_empty_20_reg_1190 = 'bx;

assign ap_phi_reg_pp0_iter3_empty_21_reg_1223 = 'bx;

assign ap_phi_reg_pp0_iter3_empty_22_reg_662 = 'bx;

assign ap_phi_reg_pp0_iter3_empty_23_reg_695 = 'bx;

assign ap_phi_reg_pp0_iter3_empty_24_reg_1454 = 'bx;

assign ap_phi_reg_pp0_iter3_empty_25_reg_1465 = 'bx;

assign ap_phi_reg_pp0_iter3_empty_26_reg_2071 = 'bx;

assign ap_phi_reg_pp0_iter3_empty_27_reg_2118 = 'bx;

assign ap_phi_reg_pp0_iter3_mux_case_010_reg_1256 = 'bx;

assign ap_phi_reg_pp0_iter3_mux_case_06_reg_2165 = 'bx;

assign ap_phi_reg_pp0_iter3_mux_case_07_reg_1476 = 'bx;

assign ap_phi_reg_pp0_iter3_mux_case_08_reg_728 = 'bx;

assign ap_phi_reg_pp0_iter3_mux_case_1172_reg_2212 = 'bx;

assign ap_phi_reg_pp0_iter3_mux_case_1173_reg_1487 = 'bx;

assign ap_phi_reg_pp0_iter3_mux_case_1174_reg_1289 = 'bx;

assign ap_phi_reg_pp0_iter3_mux_case_117_reg_761 = 'bx;

assign ap_phi_reg_pp0_iter3_storemerge_reg_1498 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_10_1_reg_1058 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_10_2_reg_530 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_10_3_reg_1410 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_10_4_reg_1883 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_11_1_reg_1091 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_11_2_reg_563 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_11_3_reg_1421 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_11_4_reg_1930 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_1214_1_reg_1124 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_1214_2_reg_596 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_1214_3_reg_1432 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_1214_4_reg_1977 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_13_1_reg_1157 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_13_2_reg_629 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_13_3_reg_1443 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_13_4_reg_2024 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_2_1_reg_794 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_2_2_reg_266 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_2_3_reg_1322 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_2_4_reg_1507 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_3_1_reg_827 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_3_2_reg_299 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_3_3_reg_1333 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_3_4_reg_1554 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_4_1_reg_860 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_4_2_reg_332 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_4_3_reg_1344 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_4_4_reg_1601 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_5_1_reg_893 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_5_2_reg_365 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_5_3_reg_1355 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_5_4_reg_1648 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_6_1_reg_926 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_6_2_reg_398 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_6_3_reg_1366 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_6_4_reg_1695 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_7_1_reg_959 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_7_2_reg_431 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_7_3_reg_1377 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_7_4_reg_1742 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_8_1_reg_992 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_8_2_reg_464 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_8_3_reg_1388 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_8_4_reg_1789 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_9_1_reg_1025 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_9_2_reg_497 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_9_3_reg_1399 = 'bx;

assign ap_phi_reg_pp0_iter3_this_1_9_4_reg_1836 = 'bx;

assign ap_return_0 = p_Result_3_fu_146;

assign ap_return_1 = p_Result_2_fu_142;

assign ap_return_10 = p_Result_9_fu_162;

assign ap_return_11 = p_Result_6_fu_158;

assign ap_return_12 = p_Result_5_fu_154;

assign ap_return_2 = p_Result_17_fu_194;

assign ap_return_3 = p_Result_16_fu_190;

assign ap_return_4 = p_Result_15_fu_186;

assign ap_return_5 = p_Result_14_fu_182;

assign ap_return_6 = p_Result_13_fu_178;

assign ap_return_7 = p_Result_12_fu_174;

assign ap_return_8 = p_Result_11_fu_170;

assign ap_return_9 = p_Result_10_fu_166;

assign decipher_0_ssbox_address0 = zext_ln708_3_fu_2413_p1;

assign decipher_0_ssbox_address1 = zext_ln708_2_fu_2408_p1;

assign decipher_0_ssbox_address2 = zext_ln708_1_fu_2393_p1;

assign decipher_0_ssbox_address3 = zext_ln708_fu_2378_p1;

assign icmp_ln1073_fu_2323_p2 = ((ap_sig_allocacmp_rIter_V_1 == 4'd8) ? 1'b1 : 1'b0);

assign p_Result_18_fu_2273_p5 = {{ap_const_lv128_lc_1[127:64]}, {tmp_1_fu_2263_p4}};

assign p_Result_19_fu_3126_p5 = {{tmp_10_fu_3086_p3}, {p_Val2_2_fu_3092_p16[63:0]}};

assign p_Result_22_fu_3073_p5 = {{p_Val2_4_fu_3041_p15[127:64]}, {tmp_13_fu_3035_p3}};

assign p_Result_23_fu_2463_p5 = {{{{decipher_0_ssbox_q0}, {decipher_0_ssbox_q1}}, {decipher_0_ssbox_q2}}, {ret_V_fu_2458_p2}};

assign p_Result_24_fu_2509_p7 = {{{{{{xor_ln1545_5_fu_2504_p2}, {xor_ln1545_4_fu_2499_p2}}, {xor_ln1545_3_fu_2494_p2}}, {xor_ln1545_2_fu_2489_p2}}, {xor_ln1545_1_fu_2484_p2}}, {xor_ln1545_fu_2478_p2}};

assign p_Val2_2_fu_3092_p15 = {{p_Val2_1_fu_130[4:1]}};

assign p_Val2_4_fu_3041_p14 = {{p_Val2_1_fu_130[4:1]}};

assign ret_V_fu_2458_p2 = (rhs_V_reg_3481 ^ decipher_0_ssbox_q3);

assign tmp_10_fu_3086_p3 = {{xor_ln1545_1_reg_3527}, {xor_ln1545_reg_3521}};

assign tmp_11_fu_3011_p5 = {{{{xor_ln1545_3_reg_3539}, {xor_ln1545_2_reg_3533}}, {xor_ln1545_1_reg_3527}}, {xor_ln1545_reg_3521}};

assign tmp_13_fu_3035_p3 = {{xor_ln1545_5_reg_3551}, {xor_ln1545_4_reg_3545}};

assign tmp_1_fu_2263_p4 = {{cipherkey[191:128]}};

assign tmp_2_fu_2358_p4 = {{ap_sig_allocacmp_p_Val2_load[167:160]}};

assign tmp_4_fu_2368_p4 = {{ap_sig_allocacmp_p_Val2_load[175:168]}};

assign tmp_6_fu_2383_p4 = {{ap_sig_allocacmp_p_Val2_load[183:176]}};

assign tmp_8_fu_2398_p4 = {{ap_sig_allocacmp_p_Val2_load[191:184]}};

assign tmp_fu_3154_p5 = {{{{xor_ln1545_5_reg_3551}, {xor_ln1545_4_reg_3545}}, {xor_ln1545_3_reg_3539}}, {xor_ln1545_2_reg_3533}};

assign tmp_s_fu_3001_p4 = {{p_Val2_1_fu_130[4:1]}};

assign trunc_ln674_1_fu_2475_p1 = p_Val2_load_reg_3466[31:0];

assign trunc_ln674_fu_2259_p1 = cipherkey[127:0];

assign trunc_ln819_fu_2997_p1 = p_Val2_1_fu_130[0:0];

assign xor_ln1545_1_fu_2484_p2 = (xor_ln1545_fu_2478_p2 ^ tmp_3_reg_3501);

assign xor_ln1545_2_fu_2489_p2 = (xor_ln1545_1_fu_2484_p2 ^ tmp_5_reg_3506);

assign xor_ln1545_3_fu_2494_p2 = (xor_ln1545_2_fu_2489_p2 ^ tmp_7_reg_3511);

assign xor_ln1545_4_fu_2499_p2 = (xor_ln1545_3_fu_2494_p2 ^ tmp_9_reg_3516);

assign xor_ln1545_5_fu_2504_p2 = (xor_ln1545_4_fu_2499_p2 ^ round_tmp_V_reg_3471);

assign xor_ln1545_fu_2478_p2 = (trunc_ln674_1_fu_2475_p1 ^ p_Result_23_fu_2463_p5);

assign zext_ln1073_fu_2335_p1 = ap_sig_allocacmp_rIter_V_1;

assign zext_ln708_1_fu_2393_p1 = tmp_6_fu_2383_p4;

assign zext_ln708_2_fu_2408_p1 = tmp_8_fu_2398_p4;

assign zext_ln708_3_fu_2413_p1 = tmp_2_fu_2358_p4;

assign zext_ln708_fu_2378_p1 = tmp_4_fu_2368_p4;

endmodule //testDec_updateKey
