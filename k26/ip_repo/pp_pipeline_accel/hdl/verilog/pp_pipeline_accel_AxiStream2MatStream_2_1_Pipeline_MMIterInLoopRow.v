// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_AxiStream2MatStream_2_1_Pipeline_MMIterInLoopRow (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ldata1_dout,
        ldata1_num_data_valid,
        ldata1_fifo_cap,
        ldata1_empty_n,
        ldata1_read,
        imgInput_y_data81_din,
        imgInput_y_data81_num_data_valid,
        imgInput_y_data81_fifo_cap,
        imgInput_y_data81_full_n,
        imgInput_y_data81_write,
        bound,
        sext_ln1082,
        cols_bound_per_npc_load,
        sub,
        last_blk_width_load,
        sub3,
        add_ln1082
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] ldata1_dout;
input  [1:0] ldata1_num_data_valid;
input  [1:0] ldata1_fifo_cap;
input   ldata1_empty_n;
output   ldata1_read;
output  [7:0] imgInput_y_data81_din;
input  [1:0] imgInput_y_data81_num_data_valid;
input  [1:0] imgInput_y_data81_fifo_cap;
input   imgInput_y_data81_full_n;
output   imgInput_y_data81_write;
input  [31:0] bound;
input  [4:0] sext_ln1082;
input  [31:0] cols_bound_per_npc_load;
input  [31:0] sub;
input  [3:0] last_blk_width_load;
input  [6:0] sub3;
input  [6:0] add_ln1082;

reg ap_idle;
reg ldata1_read;
reg imgInput_y_data81_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
reg   [0:0] icmp_ln1062_reg_831;
reg   [0:0] icmp_ln1062_reg_831_pp0_iter2_reg;
reg   [0:0] icmp_ln1073_reg_847;
reg    ap_predicate_op100_read_state4;
reg    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
reg   [0:0] icmp_ln1093_reg_843;
reg   [0:0] icmp_ln1093_reg_843_pp0_iter4_reg;
reg    ap_block_state6_pp0_stage0_iter5;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1062_fu_217_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    ldata1_blk_n;
wire    ap_block_pp0_stage0;
reg    imgInput_y_data81_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln1062_reg_831_pp0_iter3_reg;
wire   [0:0] bLast_width_fu_231_p2;
reg   [0:0] bLast_width_reg_835;
reg   [0:0] bLast_width_reg_835_pp0_iter2_reg;
reg   [0:0] bLast_width_reg_835_pp0_iter3_reg;
reg   [0:0] bLast_width_reg_835_pp0_iter4_reg;
wire   [0:0] icmp_ln1093_fu_239_p2;
reg   [0:0] icmp_ln1093_reg_843_pp0_iter2_reg;
reg   [0:0] icmp_ln1093_reg_843_pp0_iter3_reg;
wire   [0:0] icmp_ln1073_fu_299_p2;
reg   [0:0] icmp_ln1073_reg_847_pp0_iter3_reg;
wire   [0:0] icmp_ln674_2_fu_321_p2;
reg   [0:0] icmp_ln674_2_reg_851;
wire   [6:0] trunc_ln674_7_fu_327_p1;
reg   [6:0] trunc_ln674_7_reg_858;
wire   [6:0] trunc_ln674_8_fu_331_p1;
reg   [6:0] trunc_ln674_8_reg_866;
wire   [0:0] icmp_ln1074_fu_346_p2;
reg   [0:0] icmp_ln1074_reg_872;
reg   [0:0] icmp_ln1074_reg_872_pp0_iter3_reg;
wire   [3:0] trunc_ln1075_fu_352_p1;
reg   [3:0] trunc_ln1075_reg_877;
reg   [3:0] trunc_ln1075_reg_877_pp0_iter3_reg;
wire   [0:0] icmp_ln674_fu_366_p2;
reg   [0:0] icmp_ln674_reg_882;
wire   [6:0] trunc_ln674_fu_372_p1;
reg   [6:0] trunc_ln674_reg_889;
wire   [6:0] add_ln674_2_fu_400_p2;
reg   [6:0] add_ln674_2_reg_896;
wire   [0:0] icmp_ln414_fu_406_p2;
reg   [0:0] icmp_ln414_reg_901;
reg   [0:0] icmp_ln414_reg_901_pp0_iter3_reg;
wire   [3:0] trunc_ln414_fu_412_p1;
reg   [3:0] trunc_ln414_reg_909;
reg   [3:0] trunc_ln414_reg_909_pp0_iter3_reg;
wire   [3:0] trunc_ln414_2_fu_416_p1;
reg   [3:0] trunc_ln414_2_reg_917;
reg   [3:0] trunc_ln414_2_reg_917_pp0_iter3_reg;
wire   [6:0] sub_ln674_15_fu_477_p2;
reg   [6:0] sub_ln674_15_reg_923;
wire   [63:0] lshr_ln674_8_fu_487_p2;
reg   [63:0] lshr_ln674_8_reg_928;
wire   [6:0] sub_ln674_10_fu_528_p2;
reg   [6:0] sub_ln674_10_reg_933;
wire   [63:0] lshr_ln674_fu_538_p2;
reg   [63:0] lshr_ln674_reg_938;
wire   [3:0] sub_ln414_4_fu_579_p2;
reg   [3:0] sub_ln414_4_reg_943;
wire   [7:0] shl_ln414_fu_589_p2;
reg   [7:0] shl_ln414_reg_948;
wire   [7:0] localbuffer_V_12_fu_614_p1;
wire   [7:0] p_Result_19_fu_727_p2;
wire   [3:0] sub_ln674_16_fu_736_p2;
reg   [3:0] sub_ln674_16_reg_964;
wire   [7:0] ap_phi_reg_pp0_iter0_localbuffer_V_13_reg_171;
reg   [7:0] ap_phi_reg_pp0_iter1_localbuffer_V_13_reg_171;
reg   [7:0] ap_phi_reg_pp0_iter2_localbuffer_V_13_reg_171;
reg   [7:0] ap_phi_reg_pp0_iter3_localbuffer_V_13_reg_171;
reg   [7:0] ap_phi_reg_pp0_iter4_localbuffer_V_13_reg_171;
reg   [7:0] ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171;
reg   [31:0] rem_fu_100;
wire   [31:0] rem_5_fu_335_p2;
wire   [31:0] rem_4_fu_420_p2;
wire    ap_loop_init;
reg   [30:0] i_fu_104;
wire   [30:0] add_ln1062_fu_222_p2;
reg   [31:0] j_fu_108;
wire   [31:0] j_5_fu_253_p3;
reg   [63:0] p_Val2_s_fu_112;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] zext_ln1062_fu_213_p1;
wire   [31:0] add_ln1094_fu_247_p2;
wire   [3:0] xf_bits_per_clock_fu_275_p3;
wire   [6:0] ptr_width_minus_fu_289_p3;
wire   [31:0] zext_ln1068_fu_281_p1;
wire   [6:0] select_ln1082_fu_305_p3;
wire   [31:0] zext_ln1082_fu_311_p1;
wire   [31:0] grp_fu_180_p2;
wire   [31:0] sub_ln1082_fu_315_p2;
wire   [25:0] tmp_fu_356_p4;
wire   [4:0] zext_ln1068_1_fu_285_p1;
wire  signed [4:0] add_ln1079_fu_376_p2;
wire   [6:0] trunc_ln1079_fu_390_p1;
wire  signed [6:0] sext_ln1079_2_fu_386_p1;
wire   [6:0] sub_ln674_11_fu_394_p2;
wire  signed [31:0] sext_ln1079_fu_382_p1;
wire   [31:0] zext_ln1069_fu_295_p1;
wire   [6:0] sub_ln674_12_fu_444_p2;
wire   [6:0] sub_ln674_14_fu_453_p2;
reg   [63:0] tmp_40_fu_434_p4;
wire   [6:0] sub_ln674_13_fu_448_p2;
wire   [6:0] select_ln674_8_fu_457_p3;
wire   [6:0] select_ln674_10_fu_471_p3;
wire   [63:0] select_ln674_9_fu_464_p3;
wire   [63:0] zext_ln674_8_fu_483_p1;
wire   [6:0] add_ln674_fu_503_p2;
wire   [6:0] grp_fu_185_p2;
reg   [63:0] tmp_35_fu_493_p4;
wire   [6:0] select_ln674_fu_508_p3;
wire   [6:0] select_ln674_7_fu_522_p3;
wire   [63:0] select_ln674_6_fu_515_p3;
wire   [63:0] zext_ln674_fu_534_p1;
wire   [63:0] zext_ln674_7_fu_544_p1;
wire   [63:0] lshr_ln674_7_fu_547_p2;
wire   [63:0] p_Result_18_fu_553_p2;
wire   [3:0] sub_ln414_3_fu_563_p2;
wire   [3:0] select_ln414_fu_568_p3;
wire   [3:0] select_ln414_5_fu_573_p3;
wire   [7:0] tmp_43_fu_559_p1;
wire   [7:0] zext_ln414_4_fu_585_p1;
wire   [63:0] zext_ln674_9_fu_600_p1;
wire   [63:0] lshr_ln674_9_fu_603_p2;
wire   [63:0] p_Result_20_fu_609_p2;
wire   [63:0] zext_ln674_6_fu_618_p1;
wire   [63:0] lshr_ln674_6_fu_621_p2;
wire   [63:0] p_Result_s_fu_627_p2;
wire   [3:0] sub_ln414_fu_636_p2;
wire   [7:0] zext_ln414_fu_641_p1;
wire   [7:0] tmp_41_fu_632_p1;
wire   [7:0] lshr_ln414_fu_645_p2;
wire   [7:0] p_Result_17_fu_651_p2;
wire   [3:0] select_ln414_4_fu_664_p3;
reg   [7:0] tmp_39_fu_676_p4;
wire   [7:0] zext_ln414_5_fu_669_p1;
wire   [7:0] zext_ln414_6_fu_673_p1;
wire   [7:0] shl_ln414_2_fu_691_p2;
wire   [7:0] lshr_ln414_2_fu_697_p2;
wire   [7:0] and_ln414_fu_703_p2;
wire   [7:0] localbuffer_V_fu_657_p3;
wire   [7:0] xor_ln414_fu_709_p2;
wire   [7:0] select_ln414_6_fu_685_p3;
wire   [7:0] and_ln414_3_fu_715_p2;
wire   [7:0] and_ln414_4_fu_721_p2;
wire   [3:0] trunc_ln674_9_fu_733_p1;
wire   [7:0] zext_ln674_10_fu_742_p1;
wire   [7:0] lshr_ln674_10_fu_745_p2;
wire   [7:0] select_ln1067_fu_751_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_728;
reg    ap_condition_732;
reg    ap_condition_735;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b1))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        if (((icmp_ln1073_reg_847_pp0_iter3_reg == 1'd0) & (icmp_ln1062_reg_831_pp0_iter3_reg == 1'd1))) begin
            ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171 <= localbuffer_V_12_fu_614_p1;
        end else if (((icmp_ln1073_reg_847_pp0_iter3_reg == 1'd1) & (icmp_ln1062_reg_831_pp0_iter3_reg == 1'd1))) begin
            ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171 <= p_Result_19_fu_727_p2;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter4_localbuffer_V_13_reg_171;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_104 <= 31'd0;
        end else if (((icmp_ln1062_fu_217_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_104 <= add_ln1062_fu_222_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            j_fu_108 <= 32'd0;
        end else if (((icmp_ln1062_fu_217_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            j_fu_108 <= j_5_fu_253_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            p_Val2_s_fu_112 <= 64'd0;
        end else if ((1'b1 == ap_condition_728)) begin
            p_Val2_s_fu_112 <= ldata1_dout;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            rem_fu_100 <= 32'd0;
        end else if ((1'b1 == ap_condition_735)) begin
            rem_fu_100 <= rem_4_fu_420_p2;
        end else if ((1'b1 == ap_condition_732)) begin
            rem_fu_100 <= rem_5_fu_335_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1062_reg_831 == 1'd1) & (icmp_ln1073_fu_299_p2 == 1'd1))) begin
        add_ln674_2_reg_896 <= add_ln674_2_fu_400_p2;
        icmp_ln1074_reg_872 <= icmp_ln1074_fu_346_p2;
        icmp_ln414_reg_901 <= icmp_ln414_fu_406_p2;
        icmp_ln674_reg_882 <= icmp_ln674_fu_366_p2;
        trunc_ln1075_reg_877 <= trunc_ln1075_fu_352_p1;
        trunc_ln414_2_reg_917 <= trunc_ln414_2_fu_416_p1;
        trunc_ln414_reg_909 <= trunc_ln414_fu_412_p1;
        trunc_ln674_reg_889 <= trunc_ln674_fu_372_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
        icmp_ln1062_reg_831 <= icmp_ln1062_fu_217_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        bLast_width_reg_835_pp0_iter2_reg <= bLast_width_reg_835;
        bLast_width_reg_835_pp0_iter3_reg <= bLast_width_reg_835_pp0_iter2_reg;
        bLast_width_reg_835_pp0_iter4_reg <= bLast_width_reg_835_pp0_iter3_reg;
        icmp_ln1062_reg_831_pp0_iter2_reg <= icmp_ln1062_reg_831;
        icmp_ln1062_reg_831_pp0_iter3_reg <= icmp_ln1062_reg_831_pp0_iter2_reg;
        icmp_ln1073_reg_847_pp0_iter3_reg <= icmp_ln1073_reg_847;
        icmp_ln1074_reg_872_pp0_iter3_reg <= icmp_ln1074_reg_872;
        icmp_ln1093_reg_843_pp0_iter2_reg <= icmp_ln1093_reg_843;
        icmp_ln1093_reg_843_pp0_iter3_reg <= icmp_ln1093_reg_843_pp0_iter2_reg;
        icmp_ln1093_reg_843_pp0_iter4_reg <= icmp_ln1093_reg_843_pp0_iter3_reg;
        icmp_ln414_reg_901_pp0_iter3_reg <= icmp_ln414_reg_901;
        trunc_ln1075_reg_877_pp0_iter3_reg <= trunc_ln1075_reg_877;
        trunc_ln414_2_reg_917_pp0_iter3_reg <= trunc_ln414_2_reg_917;
        trunc_ln414_reg_909_pp0_iter3_reg <= trunc_ln414_reg_909;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter1_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter0_localbuffer_V_13_reg_171;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter2_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter1_localbuffer_V_13_reg_171;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_reg_pp0_iter3_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter2_localbuffer_V_13_reg_171;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_phi_reg_pp0_iter4_localbuffer_V_13_reg_171 <= ap_phi_reg_pp0_iter3_localbuffer_V_13_reg_171;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1062_fu_217_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        bLast_width_reg_835 <= bLast_width_fu_231_p2;
        icmp_ln1093_reg_843 <= icmp_ln1093_fu_239_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1062_reg_831 == 1'd1))) begin
        icmp_ln1073_reg_847 <= icmp_ln1073_fu_299_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1062_reg_831 == 1'd1) & (icmp_ln1073_fu_299_p2 == 1'd0))) begin
        icmp_ln674_2_reg_851 <= icmp_ln674_2_fu_321_p2;
        trunc_ln674_7_reg_858 <= trunc_ln674_7_fu_327_p1;
        trunc_ln674_8_reg_866 <= trunc_ln674_8_fu_331_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_847 == 1'd0) & (icmp_ln1062_reg_831_pp0_iter2_reg == 1'd1))) begin
        lshr_ln674_8_reg_928 <= lshr_ln674_8_fu_487_p2;
        sub_ln674_15_reg_923 <= sub_ln674_15_fu_477_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_847 == 1'd1) & (icmp_ln1062_reg_831_pp0_iter2_reg == 1'd1) & (icmp_ln1074_reg_872 == 1'd0))) begin
        lshr_ln674_reg_938 <= lshr_ln674_fu_538_p2;
        sub_ln674_10_reg_933 <= sub_ln674_10_fu_528_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_847 == 1'd1) & (icmp_ln1062_reg_831_pp0_iter2_reg == 1'd1))) begin
        shl_ln414_reg_948 <= shl_ln414_fu_589_p2;
        sub_ln414_4_reg_943 <= sub_ln414_4_fu_579_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (bLast_width_reg_835_pp0_iter3_reg == 1'd1))) begin
        sub_ln674_16_reg_964 <= sub_ln674_16_fu_736_p2;
    end
end

always @ (*) begin
    if (((icmp_ln1062_fu_217_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b1))) begin
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
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln1093_reg_843_pp0_iter4_reg == 1'd1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        imgInput_y_data81_blk_n = imgInput_y_data81_full_n;
    end else begin
        imgInput_y_data81_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1093_reg_843_pp0_iter4_reg == 1'd1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        imgInput_y_data81_write = 1'b1;
    end else begin
        imgInput_y_data81_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op100_read_state4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ldata1_blk_n = ldata1_empty_n;
    end else begin
        ldata1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op100_read_state4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ldata1_read = 1'b1;
    end else begin
        ldata1_read = 1'b0;
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

assign add_ln1062_fu_222_p2 = (i_fu_104 + 31'd1);

assign add_ln1079_fu_376_p2 = ($signed(zext_ln1068_1_fu_285_p1) + $signed(5'd31));

assign add_ln1094_fu_247_p2 = (j_fu_108 + 32'd1);

assign add_ln674_2_fu_400_p2 = (sub_ln674_11_fu_394_p2 + 7'd63);

assign add_ln674_fu_503_p2 = ($signed(trunc_ln674_reg_889) + $signed(7'd65));

assign and_ln414_3_fu_715_p2 = (xor_ln414_fu_709_p2 & localbuffer_V_fu_657_p3);

assign and_ln414_4_fu_721_p2 = (select_ln414_6_fu_685_p3 & and_ln414_fu_703_p2);

assign and_ln414_fu_703_p2 = (shl_ln414_2_fu_691_p2 & lshr_ln414_2_fu_697_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((icmp_ln1093_reg_843_pp0_iter4_reg == 1'd1) & (imgInput_y_data81_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)) | ((ap_predicate_op100_read_state4 == 1'b1) & (ldata1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((icmp_ln1093_reg_843_pp0_iter4_reg == 1'd1) & (imgInput_y_data81_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)) | ((ap_predicate_op100_read_state4 == 1'b1) & (ldata1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((icmp_ln1093_reg_843_pp0_iter4_reg == 1'd1) & (imgInput_y_data81_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)) | ((ap_predicate_op100_read_state4 == 1'b1) & (ldata1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = ((ap_predicate_op100_read_state4 == 1'b1) & (ldata1_empty_n == 1'b0));
end

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state6_pp0_stage0_iter5 = ((icmp_ln1093_reg_843_pp0_iter4_reg == 1'd1) & (imgInput_y_data81_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_728 = ((icmp_ln1073_reg_847 == 1'd1) & (icmp_ln1062_reg_831_pp0_iter2_reg == 1'd1) & (ap_enable_reg_pp0_iter3 == 1'b1));
end

always @ (*) begin
    ap_condition_732 = ((icmp_ln1062_reg_831 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1073_fu_299_p2 == 1'd0));
end

always @ (*) begin
    ap_condition_735 = ((icmp_ln1062_reg_831 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1073_fu_299_p2 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_phi_reg_pp0_iter0_localbuffer_V_13_reg_171 = 'bx;

always @ (*) begin
    ap_predicate_op100_read_state4 = ((icmp_ln1073_reg_847 == 1'd1) & (icmp_ln1062_reg_831_pp0_iter2_reg == 1'd1));
end

assign bLast_width_fu_231_p2 = ((j_fu_108 == sub) ? 1'b1 : 1'b0);

assign grp_fu_180_p2 = (32'd64 - rem_fu_100);

assign grp_fu_185_p2 = (7'd63 - trunc_ln674_reg_889);

assign icmp_ln1062_fu_217_p2 = (($signed(zext_ln1062_fu_213_p1) < $signed(bound)) ? 1'b1 : 1'b0);

assign icmp_ln1073_fu_299_p2 = (($signed(zext_ln1068_fu_281_p1) > $signed(rem_fu_100)) ? 1'b1 : 1'b0);

assign icmp_ln1074_fu_346_p2 = ((rem_fu_100 == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln1093_fu_239_p2 = (($signed(j_fu_108) < $signed(cols_bound_per_npc_load)) ? 1'b1 : 1'b0);

assign icmp_ln414_fu_406_p2 = ((rem_fu_100 > sext_ln1079_fu_382_p1) ? 1'b1 : 1'b0);

assign icmp_ln674_2_fu_321_p2 = ((grp_fu_180_p2 > sub_ln1082_fu_315_p2) ? 1'b1 : 1'b0);

assign icmp_ln674_fu_366_p2 = ((tmp_fu_356_p4 != 26'd0) ? 1'b1 : 1'b0);

assign imgInput_y_data81_din = (select_ln1067_fu_751_p3 & ap_phi_reg_pp0_iter5_localbuffer_V_13_reg_171);

assign j_5_fu_253_p3 = ((bLast_width_fu_231_p2[0:0] == 1'b1) ? 32'd0 : add_ln1094_fu_247_p2);

assign localbuffer_V_12_fu_614_p1 = p_Result_20_fu_609_p2[7:0];

assign localbuffer_V_fu_657_p3 = ((icmp_ln1074_reg_872_pp0_iter3_reg[0:0] == 1'b1) ? 8'd0 : p_Result_17_fu_651_p2);

assign lshr_ln414_2_fu_697_p2 = 8'd255 >> zext_ln414_6_fu_673_p1;

assign lshr_ln414_fu_645_p2 = 8'd255 >> zext_ln414_fu_641_p1;

assign lshr_ln674_10_fu_745_p2 = 8'd255 >> zext_ln674_10_fu_742_p1;

assign lshr_ln674_6_fu_621_p2 = 64'd18446744073709551615 >> zext_ln674_6_fu_618_p1;

assign lshr_ln674_7_fu_547_p2 = 64'd18446744073709551615 >> zext_ln674_7_fu_544_p1;

assign lshr_ln674_8_fu_487_p2 = select_ln674_9_fu_464_p3 >> zext_ln674_8_fu_483_p1;

assign lshr_ln674_9_fu_603_p2 = 64'd18446744073709551615 >> zext_ln674_9_fu_600_p1;

assign lshr_ln674_fu_538_p2 = select_ln674_6_fu_515_p3 >> zext_ln674_fu_534_p1;

assign p_Result_17_fu_651_p2 = (tmp_41_fu_632_p1 & lshr_ln414_fu_645_p2);

assign p_Result_18_fu_553_p2 = (lshr_ln674_7_fu_547_p2 & ldata1_dout);

assign p_Result_19_fu_727_p2 = (and_ln414_4_fu_721_p2 | and_ln414_3_fu_715_p2);

assign p_Result_20_fu_609_p2 = (lshr_ln674_9_fu_603_p2 & lshr_ln674_8_reg_928);

assign p_Result_s_fu_627_p2 = (lshr_ln674_reg_938 & lshr_ln674_6_fu_621_p2);

assign ptr_width_minus_fu_289_p3 = ((bLast_width_reg_835[0:0] == 1'b1) ? sub3 : 7'd56);

assign rem_4_fu_420_p2 = (rem_fu_100 + zext_ln1069_fu_295_p1);

assign rem_5_fu_335_p2 = (rem_fu_100 - zext_ln1068_fu_281_p1);

assign select_ln1067_fu_751_p3 = ((bLast_width_reg_835_pp0_iter4_reg[0:0] == 1'b1) ? lshr_ln674_10_fu_745_p2 : 8'd255);

assign select_ln1082_fu_305_p3 = ((bLast_width_reg_835[0:0] == 1'b1) ? add_ln1082 : 7'd71);

assign select_ln414_4_fu_664_p3 = ((icmp_ln414_reg_901_pp0_iter3_reg[0:0] == 1'b1) ? trunc_ln414_2_reg_917_pp0_iter3_reg : trunc_ln414_reg_909_pp0_iter3_reg);

assign select_ln414_5_fu_573_p3 = ((icmp_ln414_reg_901[0:0] == 1'b1) ? sub_ln414_3_fu_563_p2 : trunc_ln414_reg_909);

assign select_ln414_6_fu_685_p3 = ((icmp_ln414_reg_901_pp0_iter3_reg[0:0] == 1'b1) ? tmp_39_fu_676_p4 : shl_ln414_reg_948);

assign select_ln414_fu_568_p3 = ((icmp_ln414_reg_901[0:0] == 1'b1) ? trunc_ln414_reg_909 : trunc_ln414_2_reg_917);

assign select_ln674_10_fu_471_p3 = ((icmp_ln674_2_reg_851[0:0] == 1'b1) ? sub_ln674_13_fu_448_p2 : trunc_ln674_7_reg_858);

assign select_ln674_6_fu_515_p3 = ((icmp_ln674_reg_882[0:0] == 1'b1) ? tmp_35_fu_493_p4 : p_Val2_s_fu_112);

assign select_ln674_7_fu_522_p3 = ((icmp_ln674_reg_882[0:0] == 1'b1) ? grp_fu_185_p2 : trunc_ln674_reg_889);

assign select_ln674_8_fu_457_p3 = ((icmp_ln674_2_reg_851[0:0] == 1'b1) ? sub_ln674_12_fu_444_p2 : sub_ln674_14_fu_453_p2);

assign select_ln674_9_fu_464_p3 = ((icmp_ln674_2_reg_851[0:0] == 1'b1) ? tmp_40_fu_434_p4 : p_Val2_s_fu_112);

assign select_ln674_fu_508_p3 = ((icmp_ln674_reg_882[0:0] == 1'b1) ? add_ln674_fu_503_p2 : grp_fu_185_p2);

assign sext_ln1079_2_fu_386_p1 = add_ln1079_fu_376_p2;

assign sext_ln1079_fu_382_p1 = add_ln1079_fu_376_p2;

assign shl_ln414_2_fu_691_p2 = 8'd255 << zext_ln414_5_fu_669_p1;

assign shl_ln414_fu_589_p2 = tmp_43_fu_559_p1 << zext_ln414_4_fu_585_p1;

assign sub_ln1082_fu_315_p2 = (zext_ln1082_fu_311_p1 - rem_fu_100);

assign sub_ln414_3_fu_563_p2 = (4'd7 - trunc_ln414_reg_909);

assign sub_ln414_4_fu_579_p2 = (4'd7 - select_ln414_fu_568_p3);

assign sub_ln414_fu_636_p2 = ($signed(4'd8) - $signed(trunc_ln1075_reg_877_pp0_iter3_reg));

assign sub_ln674_10_fu_528_p2 = (7'd63 - select_ln674_fu_508_p3);

assign sub_ln674_11_fu_394_p2 = ($signed(trunc_ln1079_fu_390_p1) - $signed(sext_ln1079_2_fu_386_p1));

assign sub_ln674_12_fu_444_p2 = (trunc_ln674_7_reg_858 - trunc_ln674_8_reg_866);

assign sub_ln674_13_fu_448_p2 = (7'd63 - trunc_ln674_7_reg_858);

assign sub_ln674_14_fu_453_p2 = (trunc_ln674_8_reg_866 - trunc_ln674_7_reg_858);

assign sub_ln674_15_fu_477_p2 = (7'd63 - select_ln674_8_fu_457_p3);

assign sub_ln674_16_fu_736_p2 = (4'd7 - trunc_ln674_9_fu_733_p1);

integer ap_tvar_int_0;

always @ (p_Val2_s_fu_112) begin
    for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_35_fu_493_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_35_fu_493_p4[ap_tvar_int_0] = p_Val2_s_fu_112[63 - ap_tvar_int_0];
        end
    end
end

integer ap_tvar_int_1;

always @ (shl_ln414_reg_948) begin
    for (ap_tvar_int_1 = 8 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
        if (ap_tvar_int_1 > 7 - 0) begin
            tmp_39_fu_676_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_39_fu_676_p4[ap_tvar_int_1] = shl_ln414_reg_948[7 - ap_tvar_int_1];
        end
    end
end

integer ap_tvar_int_2;

always @ (p_Val2_s_fu_112) begin
    for (ap_tvar_int_2 = 64 - 1; ap_tvar_int_2 >= 0; ap_tvar_int_2 = ap_tvar_int_2 - 1) begin
        if (ap_tvar_int_2 > 63 - 0) begin
            tmp_40_fu_434_p4[ap_tvar_int_2] = 1'b0;
        end else begin
            tmp_40_fu_434_p4[ap_tvar_int_2] = p_Val2_s_fu_112[63 - ap_tvar_int_2];
        end
    end
end

assign tmp_41_fu_632_p1 = p_Result_s_fu_627_p2[7:0];

assign tmp_43_fu_559_p1 = p_Result_18_fu_553_p2[7:0];

assign tmp_fu_356_p4 = {{grp_fu_180_p2[31:6]}};

assign trunc_ln1075_fu_352_p1 = rem_fu_100[3:0];

assign trunc_ln1079_fu_390_p1 = rem_fu_100[6:0];

assign trunc_ln414_2_fu_416_p1 = add_ln1079_fu_376_p2[3:0];

assign trunc_ln414_fu_412_p1 = rem_fu_100[3:0];

assign trunc_ln674_7_fu_327_p1 = grp_fu_180_p2[6:0];

assign trunc_ln674_8_fu_331_p1 = sub_ln1082_fu_315_p2[6:0];

assign trunc_ln674_9_fu_733_p1 = sext_ln1082[3:0];

assign trunc_ln674_fu_372_p1 = grp_fu_180_p2[6:0];

assign xf_bits_per_clock_fu_275_p3 = ((bLast_width_reg_835[0:0] == 1'b1) ? last_blk_width_load : 4'd8);

assign xor_ln414_fu_709_p2 = (8'd255 ^ and_ln414_fu_703_p2);

assign zext_ln1062_fu_213_p1 = i_fu_104;

assign zext_ln1068_1_fu_285_p1 = xf_bits_per_clock_fu_275_p3;

assign zext_ln1068_fu_281_p1 = xf_bits_per_clock_fu_275_p3;

assign zext_ln1069_fu_295_p1 = ptr_width_minus_fu_289_p3;

assign zext_ln1082_fu_311_p1 = select_ln1082_fu_305_p3;

assign zext_ln414_4_fu_585_p1 = select_ln414_5_fu_573_p3;

assign zext_ln414_5_fu_669_p1 = select_ln414_4_fu_664_p3;

assign zext_ln414_6_fu_673_p1 = sub_ln414_4_reg_943;

assign zext_ln414_fu_641_p1 = sub_ln414_fu_636_p2;

assign zext_ln674_10_fu_742_p1 = sub_ln674_16_reg_964;

assign zext_ln674_6_fu_618_p1 = sub_ln674_10_reg_933;

assign zext_ln674_7_fu_544_p1 = add_ln674_2_reg_896;

assign zext_ln674_8_fu_483_p1 = select_ln674_10_fu_471_p3;

assign zext_ln674_9_fu_600_p1 = sub_ln674_15_reg_923;

assign zext_ln674_fu_534_p1 = select_ln674_7_fu_522_p3;

endmodule //pp_pipeline_accel_AxiStream2MatStream_2_1_Pipeline_MMIterInLoopRow
