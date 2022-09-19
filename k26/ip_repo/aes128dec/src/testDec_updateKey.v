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
        this_1_0,
        this_1_0_ap_vld,
        this_1_1,
        this_1_1_ap_vld,
        this_1_2,
        this_1_2_ap_vld,
        this_1_3,
        this_1_3_ap_vld,
        this_1_4,
        this_1_4_ap_vld,
        this_1_5,
        this_1_5_ap_vld,
        this_1_6,
        this_1_6_ap_vld,
        this_1_7,
        this_1_7_ap_vld,
        this_1_8,
        this_1_8_ap_vld,
        this_1_9,
        this_1_9_ap_vld,
        this_1_10,
        this_1_10_ap_vld,
        cipherkey
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [127:0] this_1_0;
output   this_1_0_ap_vld;
output  [127:0] this_1_1;
output   this_1_1_ap_vld;
output  [127:0] this_1_2;
output   this_1_2_ap_vld;
output  [127:0] this_1_3;
output   this_1_3_ap_vld;
output  [127:0] this_1_4;
output   this_1_4_ap_vld;
output  [127:0] this_1_5;
output   this_1_5_ap_vld;
output  [127:0] this_1_6;
output   this_1_6_ap_vld;
output  [127:0] this_1_7;
output   this_1_7_ap_vld;
output  [127:0] this_1_8;
output   this_1_8_ap_vld;
output  [127:0] this_1_9;
output   this_1_9_ap_vld;
output  [127:0] this_1_10;
output   this_1_10_ap_vld;
input  [127:0] cipherkey;

reg ap_idle;
reg this_1_0_ap_vld;
reg this_1_1_ap_vld;
reg this_1_2_ap_vld;
reg this_1_3_ap_vld;
reg this_1_4_ap_vld;
reg this_1_5_ap_vld;
reg this_1_6_ap_vld;
reg this_1_7_ap_vld;
reg this_1_8_ap_vld;
reg this_1_9_ap_vld;
reg this_1_10_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1073_fu_279_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
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
reg   [3:0] iter_V_reg_483;
reg   [127:0] p_Val2_load_reg_490;
reg   [31:0] round_tmp_V_reg_495;
reg   [31:0] tmp_s_reg_525;
reg   [31:0] tmp_3_reg_530;
wire   [63:0] zext_ln708_fu_318_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln587_fu_329_p1;
wire   [63:0] zext_ln708_1_fu_344_p1;
wire   [63:0] zext_ln708_2_fu_359_p1;
wire   [63:0] zext_ln708_3_fu_364_p1;
reg   [127:0] p_Val2_s_fu_112;
wire   [127:0] p_Result_1_fu_442_p5;
reg   [127:0] ap_sig_allocacmp_p_Val2_load;
wire    ap_loop_init;
reg   [3:0] lhs_fu_116;
wire   [3:0] add_ln886_fu_389_p2;
wire    ap_block_pp0_stage0_01001;
wire   [7:0] tmp_fu_308_p4;
wire   [3:0] ret_V_fu_323_p2;
wire   [7:0] tmp_2_fu_334_p4;
wire   [7:0] tmp_4_fu_349_p4;
wire   [7:0] tmp_1_fu_298_p4;
wire   [7:0] ret_V_1_fu_400_p2;
wire   [31:0] trunc_ln674_fu_418_p1;
wire   [31:0] p_Result_s_fu_406_p5;
wire   [31:0] xor_ln1545_fu_421_p2;
wire   [31:0] xor_ln1545_1_fu_427_p2;
wire   [31:0] xor_ln1545_2_fu_432_p2;
wire   [31:0] xor_ln1545_3_fu_437_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
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

testDec_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            lhs_fu_116 <= 4'd1;
        end else if (((icmp_ln1073_fu_279_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            lhs_fu_116 <= add_ln886_fu_389_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Val2_s_fu_112 <= cipherkey;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            p_Val2_s_fu_112 <= p_Result_1_fu_442_p5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iter_V_reg_483 <= lhs_fu_116;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1073_fu_279_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_Val2_load_reg_490 <= ap_sig_allocacmp_p_Val2_load;
        round_tmp_V_reg_495 <= {{ap_sig_allocacmp_p_Val2_load[127:96]}};
        tmp_3_reg_530 <= {{ap_sig_allocacmp_p_Val2_load[95:64]}};
        tmp_s_reg_525 <= {{ap_sig_allocacmp_p_Val2_load[63:32]}};
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        Rcon_ce0 = 1'b1;
    end else begin
        Rcon_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1073_fu_279_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_p_Val2_load = p_Result_1_fu_442_p5;
    end else begin
        ap_sig_allocacmp_p_Val2_load = p_Val2_s_fu_112;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        this_1_0_ap_vld = 1'b1;
    end else begin
        this_1_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & ((iter_V_reg_483 == 4'd0) | ((iter_V_reg_483 == 4'd10) | ((iter_V_reg_483 == 4'd11) | ((iter_V_reg_483 == 4'd12) | ((iter_V_reg_483 == 4'd13) | ((iter_V_reg_483 == 4'd14) | (iter_V_reg_483 == 4'd15))))))))) begin
        this_1_10_ap_vld = 1'b1;
    end else begin
        this_1_10_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd1))) begin
        this_1_1_ap_vld = 1'b1;
    end else begin
        this_1_1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd2))) begin
        this_1_2_ap_vld = 1'b1;
    end else begin
        this_1_2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd3))) begin
        this_1_3_ap_vld = 1'b1;
    end else begin
        this_1_3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd4))) begin
        this_1_4_ap_vld = 1'b1;
    end else begin
        this_1_4_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd5))) begin
        this_1_5_ap_vld = 1'b1;
    end else begin
        this_1_5_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd6))) begin
        this_1_6_ap_vld = 1'b1;
    end else begin
        this_1_6_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd7))) begin
        this_1_7_ap_vld = 1'b1;
    end else begin
        this_1_7_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd8))) begin
        this_1_8_ap_vld = 1'b1;
    end else begin
        this_1_8_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (iter_V_reg_483 == 4'd9))) begin
        this_1_9_ap_vld = 1'b1;
    end else begin
        this_1_9_ap_vld = 1'b0;
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

assign Rcon_address0 = zext_ln587_fu_329_p1;

assign add_ln886_fu_389_p2 = (lhs_fu_116 + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign decipher_0_ssbox_address0 = zext_ln708_3_fu_364_p1;

assign decipher_0_ssbox_address1 = zext_ln708_2_fu_359_p1;

assign decipher_0_ssbox_address2 = zext_ln708_1_fu_344_p1;

assign decipher_0_ssbox_address3 = zext_ln708_fu_318_p1;

assign icmp_ln1073_fu_279_p2 = ((lhs_fu_116 == 4'd11) ? 1'b1 : 1'b0);

assign p_Result_1_fu_442_p5 = {{{{xor_ln1545_3_fu_437_p2}, {xor_ln1545_2_fu_432_p2}}, {xor_ln1545_1_fu_427_p2}}, {xor_ln1545_fu_421_p2}};

assign p_Result_s_fu_406_p5 = {{{{decipher_0_ssbox_q0}, {decipher_0_ssbox_q1}}, {decipher_0_ssbox_q2}}, {ret_V_1_fu_400_p2}};

assign ret_V_1_fu_400_p2 = (decipher_0_ssbox_q3 ^ Rcon_q0);

assign ret_V_fu_323_p2 = (lhs_fu_116 + 4'd15);

assign this_1_0 = cipherkey;

assign this_1_1 = p_Result_1_fu_442_p5;

assign this_1_10 = p_Result_1_fu_442_p5;

assign this_1_2 = p_Result_1_fu_442_p5;

assign this_1_3 = p_Result_1_fu_442_p5;

assign this_1_4 = p_Result_1_fu_442_p5;

assign this_1_5 = p_Result_1_fu_442_p5;

assign this_1_6 = p_Result_1_fu_442_p5;

assign this_1_7 = p_Result_1_fu_442_p5;

assign this_1_8 = p_Result_1_fu_442_p5;

assign this_1_9 = p_Result_1_fu_442_p5;

assign tmp_1_fu_298_p4 = {{ap_sig_allocacmp_p_Val2_load[103:96]}};

assign tmp_2_fu_334_p4 = {{ap_sig_allocacmp_p_Val2_load[119:112]}};

assign tmp_4_fu_349_p4 = {{ap_sig_allocacmp_p_Val2_load[127:120]}};

assign tmp_fu_308_p4 = {{ap_sig_allocacmp_p_Val2_load[111:104]}};

assign trunc_ln674_fu_418_p1 = p_Val2_load_reg_490[31:0];

assign xor_ln1545_1_fu_427_p2 = (xor_ln1545_fu_421_p2 ^ tmp_s_reg_525);

assign xor_ln1545_2_fu_432_p2 = (xor_ln1545_1_fu_427_p2 ^ tmp_3_reg_530);

assign xor_ln1545_3_fu_437_p2 = (xor_ln1545_2_fu_432_p2 ^ round_tmp_V_reg_495);

assign xor_ln1545_fu_421_p2 = (trunc_ln674_fu_418_p1 ^ p_Result_s_fu_406_p5);

assign zext_ln587_fu_329_p1 = ret_V_fu_323_p2;

assign zext_ln708_1_fu_344_p1 = tmp_2_fu_334_p4;

assign zext_ln708_2_fu_359_p1 = tmp_4_fu_349_p4;

assign zext_ln708_3_fu_364_p1 = tmp_1_fu_298_p4;

assign zext_ln708_fu_318_p1 = tmp_fu_308_p4;

endmodule //testDec_updateKey
