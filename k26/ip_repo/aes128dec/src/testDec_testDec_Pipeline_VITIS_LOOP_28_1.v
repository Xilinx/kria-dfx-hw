// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1.0
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module testDec_testDec_Pipeline_VITIS_LOOP_28_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        decipher_key_list_V_load,
        decipher_key_list_V_1_load,
        decipher_key_list_V_2_load,
        decipher_key_list_V_3_load,
        decipher_key_list_V_4_load,
        decipher_key_list_V_5_load,
        decipher_key_list_V_6_load,
        decipher_key_list_V_7_load,
        decipher_key_list_V_8_load,
        decipher_key_list_V_9_load,
        decipher_key_list_V_10_load,
        agg_tmp4_0,
        outArr_V_0141_out,
        outArr_V_0141_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [127:0] decipher_key_list_V_load;
input  [127:0] decipher_key_list_V_1_load;
input  [127:0] decipher_key_list_V_2_load;
input  [127:0] decipher_key_list_V_3_load;
input  [127:0] decipher_key_list_V_4_load;
input  [127:0] decipher_key_list_V_5_load;
input  [127:0] decipher_key_list_V_6_load;
input  [127:0] decipher_key_list_V_7_load;
input  [127:0] decipher_key_list_V_8_load;
input  [127:0] decipher_key_list_V_9_load;
input  [127:0] decipher_key_list_V_10_load;
input  [127:0] agg_tmp4_0;
output  [127:0] outArr_V_0141_out;
output   outArr_V_0141_out_ap_vld;

reg ap_idle;
reg outArr_V_0141_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_enable_reg_pp0_iter15;
reg    ap_enable_reg_pp0_iter16;
reg    ap_enable_reg_pp0_iter17;
reg    ap_enable_reg_pp0_iter18;
reg    ap_enable_reg_pp0_iter19;
reg    ap_enable_reg_pp0_iter20;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
wire    ap_block_state9_pp0_stage0_iter8;
wire    ap_block_state10_pp0_stage0_iter9;
wire    ap_block_state11_pp0_stage0_iter10;
wire    ap_block_state12_pp0_stage0_iter11;
wire    ap_block_state13_pp0_stage0_iter12;
wire    ap_block_state14_pp0_stage0_iter13;
wire    ap_block_state15_pp0_stage0_iter14;
wire    ap_block_state16_pp0_stage0_iter15;
wire    ap_block_state17_pp0_stage0_iter16;
wire    ap_block_state18_pp0_stage0_iter17;
wire    ap_block_state19_pp0_stage0_iter18;
wire    ap_block_state20_pp0_stage0_iter19;
wire    ap_block_state21_pp0_stage0_iter20;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln28_fu_173_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln28_reg_278;
reg   [0:0] icmp_ln28_reg_278_pp0_iter1_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter2_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter3_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter4_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter5_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter6_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter7_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter8_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter9_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter10_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter11_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter12_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter13_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter14_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter15_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter16_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter17_reg;
reg   [0:0] icmp_ln28_reg_278_pp0_iter18_reg;
wire   [0:0] icmp_ln30_fu_185_p2;
reg   [0:0] icmp_ln30_reg_282;
reg   [0:0] icmp_ln30_reg_282_pp0_iter1_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter2_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter3_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter4_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter5_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter6_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter7_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter8_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter9_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter10_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter11_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter12_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter13_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter14_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter15_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter16_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter17_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter18_reg;
reg   [0:0] icmp_ln30_reg_282_pp0_iter19_reg;
wire    grp_process_r_fu_145_ap_start;
wire    grp_process_r_fu_145_ap_done;
wire    grp_process_r_fu_145_ap_idle;
wire    grp_process_r_fu_145_ap_ready;
wire   [127:0] grp_process_r_fu_145_ap_return;
reg    grp_process_r_fu_145_ap_start_reg;
wire    ap_block_pp0_stage0;
reg   [3:0] i_fu_58;
wire   [3:0] add_ln28_fu_179_p2;
wire    ap_loop_init;
reg   [3:0] ap_sig_allocacmp_i_1;
reg   [127:0] outArr_V_1_fu_62;
wire    ap_block_pp0_stage0_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg    ap_loop_exit_ready_pp0_iter10_reg;
reg    ap_loop_exit_ready_pp0_iter11_reg;
reg    ap_loop_exit_ready_pp0_iter12_reg;
reg    ap_loop_exit_ready_pp0_iter13_reg;
reg    ap_loop_exit_ready_pp0_iter14_reg;
reg    ap_loop_exit_ready_pp0_iter15_reg;
reg    ap_loop_exit_ready_pp0_iter16_reg;
reg    ap_loop_exit_ready_pp0_iter17_reg;
reg    ap_loop_exit_ready_pp0_iter18_reg;
reg    ap_loop_exit_ready_pp0_iter19_reg;
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
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_enable_reg_pp0_iter15 = 1'b0;
#0 ap_enable_reg_pp0_iter16 = 1'b0;
#0 ap_enable_reg_pp0_iter17 = 1'b0;
#0 ap_enable_reg_pp0_iter18 = 1'b0;
#0 ap_enable_reg_pp0_iter19 = 1'b0;
#0 ap_enable_reg_pp0_iter20 = 1'b0;
#0 grp_process_r_fu_145_ap_start_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

testDec_process_r grp_process_r_fu_145(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_process_r_fu_145_ap_start),
    .ap_done(grp_process_r_fu_145_ap_done),
    .ap_idle(grp_process_r_fu_145_ap_idle),
    .ap_ready(grp_process_r_fu_145_ap_ready),
    .p_read(decipher_key_list_V_load),
    .p_read1(decipher_key_list_V_1_load),
    .p_read2(decipher_key_list_V_2_load),
    .p_read3(decipher_key_list_V_3_load),
    .p_read4(decipher_key_list_V_4_load),
    .p_read5(decipher_key_list_V_5_load),
    .p_read6(decipher_key_list_V_6_load),
    .p_read7(decipher_key_list_V_7_load),
    .p_read8(decipher_key_list_V_8_load),
    .p_read9(decipher_key_list_V_9_load),
    .p_read10(decipher_key_list_V_10_load),
    .ciphertext(agg_tmp4_0),
    .ap_return(grp_process_r_fu_145_ap_return)
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
        end else if (((ap_loop_exit_ready_pp0_iter19_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter15 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter16 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter16 <= ap_enable_reg_pp0_iter15;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter17 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter17 <= ap_enable_reg_pp0_iter16;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter18 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter18 <= ap_enable_reg_pp0_iter17;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter19 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter19 <= ap_enable_reg_pp0_iter18;
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
        ap_enable_reg_pp0_iter20 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter20 <= ap_enable_reg_pp0_iter19;
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_process_r_fu_145_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln30_fu_185_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
            grp_process_r_fu_145_ap_start_reg <= 1'b1;
        end else if ((grp_process_r_fu_145_ap_ready == 1'b1)) begin
            grp_process_r_fu_145_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln28_fu_173_p2 == 1'd0))) begin
            i_fu_58 <= add_ln28_fu_179_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_58 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
        ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
        ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
        ap_loop_exit_ready_pp0_iter13_reg <= ap_loop_exit_ready_pp0_iter12_reg;
        ap_loop_exit_ready_pp0_iter14_reg <= ap_loop_exit_ready_pp0_iter13_reg;
        ap_loop_exit_ready_pp0_iter15_reg <= ap_loop_exit_ready_pp0_iter14_reg;
        ap_loop_exit_ready_pp0_iter16_reg <= ap_loop_exit_ready_pp0_iter15_reg;
        ap_loop_exit_ready_pp0_iter17_reg <= ap_loop_exit_ready_pp0_iter16_reg;
        ap_loop_exit_ready_pp0_iter18_reg <= ap_loop_exit_ready_pp0_iter17_reg;
        ap_loop_exit_ready_pp0_iter19_reg <= ap_loop_exit_ready_pp0_iter18_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
        icmp_ln28_reg_278_pp0_iter10_reg <= icmp_ln28_reg_278_pp0_iter9_reg;
        icmp_ln28_reg_278_pp0_iter11_reg <= icmp_ln28_reg_278_pp0_iter10_reg;
        icmp_ln28_reg_278_pp0_iter12_reg <= icmp_ln28_reg_278_pp0_iter11_reg;
        icmp_ln28_reg_278_pp0_iter13_reg <= icmp_ln28_reg_278_pp0_iter12_reg;
        icmp_ln28_reg_278_pp0_iter14_reg <= icmp_ln28_reg_278_pp0_iter13_reg;
        icmp_ln28_reg_278_pp0_iter15_reg <= icmp_ln28_reg_278_pp0_iter14_reg;
        icmp_ln28_reg_278_pp0_iter16_reg <= icmp_ln28_reg_278_pp0_iter15_reg;
        icmp_ln28_reg_278_pp0_iter17_reg <= icmp_ln28_reg_278_pp0_iter16_reg;
        icmp_ln28_reg_278_pp0_iter18_reg <= icmp_ln28_reg_278_pp0_iter17_reg;
        icmp_ln28_reg_278_pp0_iter2_reg <= icmp_ln28_reg_278_pp0_iter1_reg;
        icmp_ln28_reg_278_pp0_iter3_reg <= icmp_ln28_reg_278_pp0_iter2_reg;
        icmp_ln28_reg_278_pp0_iter4_reg <= icmp_ln28_reg_278_pp0_iter3_reg;
        icmp_ln28_reg_278_pp0_iter5_reg <= icmp_ln28_reg_278_pp0_iter4_reg;
        icmp_ln28_reg_278_pp0_iter6_reg <= icmp_ln28_reg_278_pp0_iter5_reg;
        icmp_ln28_reg_278_pp0_iter7_reg <= icmp_ln28_reg_278_pp0_iter6_reg;
        icmp_ln28_reg_278_pp0_iter8_reg <= icmp_ln28_reg_278_pp0_iter7_reg;
        icmp_ln28_reg_278_pp0_iter9_reg <= icmp_ln28_reg_278_pp0_iter8_reg;
        icmp_ln30_reg_282_pp0_iter10_reg <= icmp_ln30_reg_282_pp0_iter9_reg;
        icmp_ln30_reg_282_pp0_iter11_reg <= icmp_ln30_reg_282_pp0_iter10_reg;
        icmp_ln30_reg_282_pp0_iter12_reg <= icmp_ln30_reg_282_pp0_iter11_reg;
        icmp_ln30_reg_282_pp0_iter13_reg <= icmp_ln30_reg_282_pp0_iter12_reg;
        icmp_ln30_reg_282_pp0_iter14_reg <= icmp_ln30_reg_282_pp0_iter13_reg;
        icmp_ln30_reg_282_pp0_iter15_reg <= icmp_ln30_reg_282_pp0_iter14_reg;
        icmp_ln30_reg_282_pp0_iter16_reg <= icmp_ln30_reg_282_pp0_iter15_reg;
        icmp_ln30_reg_282_pp0_iter17_reg <= icmp_ln30_reg_282_pp0_iter16_reg;
        icmp_ln30_reg_282_pp0_iter18_reg <= icmp_ln30_reg_282_pp0_iter17_reg;
        icmp_ln30_reg_282_pp0_iter19_reg <= icmp_ln30_reg_282_pp0_iter18_reg;
        icmp_ln30_reg_282_pp0_iter2_reg <= icmp_ln30_reg_282_pp0_iter1_reg;
        icmp_ln30_reg_282_pp0_iter3_reg <= icmp_ln30_reg_282_pp0_iter2_reg;
        icmp_ln30_reg_282_pp0_iter4_reg <= icmp_ln30_reg_282_pp0_iter3_reg;
        icmp_ln30_reg_282_pp0_iter5_reg <= icmp_ln30_reg_282_pp0_iter4_reg;
        icmp_ln30_reg_282_pp0_iter6_reg <= icmp_ln30_reg_282_pp0_iter5_reg;
        icmp_ln30_reg_282_pp0_iter7_reg <= icmp_ln30_reg_282_pp0_iter6_reg;
        icmp_ln30_reg_282_pp0_iter8_reg <= icmp_ln30_reg_282_pp0_iter7_reg;
        icmp_ln30_reg_282_pp0_iter9_reg <= icmp_ln30_reg_282_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln28_reg_278 <= icmp_ln28_fu_173_p2;
        icmp_ln28_reg_278_pp0_iter1_reg <= icmp_ln28_reg_278;
        icmp_ln30_reg_282_pp0_iter1_reg <= icmp_ln30_reg_282;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln28_fu_173_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln30_reg_282 <= icmp_ln30_fu_185_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter20 == 1'b1) & (icmp_ln30_reg_282_pp0_iter19_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        outArr_V_1_fu_62 <= grp_process_r_fu_145_ap_return;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln28_fu_173_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter19_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter20 == 1'b0) & (ap_enable_reg_pp0_iter19 == 1'b0) & (ap_enable_reg_pp0_iter18 == 1'b0) & (ap_enable_reg_pp0_iter17 == 1'b0) & (ap_enable_reg_pp0_iter16 == 1'b0) & (ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_i_1 = 4'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_58;
    end
end

always @ (*) begin
    if (((icmp_ln28_reg_278_pp0_iter18_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        outArr_V_0141_out_ap_vld = 1'b1;
    end else begin
        outArr_V_0141_out_ap_vld = 1'b0;
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

assign add_ln28_fu_179_p2 = (ap_sig_allocacmp_i_1 + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter11 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter12 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter13 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter14 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter15 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage0_iter16 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage0_iter17 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage0_iter18 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage0_iter19 = ~(1'b1 == 1'b1);

assign ap_block_state21_pp0_stage0_iter20 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign grp_process_r_fu_145_ap_start = grp_process_r_fu_145_ap_start_reg;

assign icmp_ln28_fu_173_p2 = ((ap_sig_allocacmp_i_1 == 4'd10) ? 1'b1 : 1'b0);

assign icmp_ln30_fu_185_p2 = ((ap_sig_allocacmp_i_1 == 4'd0) ? 1'b1 : 1'b0);

assign outArr_V_0141_out = outArr_V_1_fu_62;

endmodule //testDec_testDec_Pipeline_VITIS_LOOP_28_1
