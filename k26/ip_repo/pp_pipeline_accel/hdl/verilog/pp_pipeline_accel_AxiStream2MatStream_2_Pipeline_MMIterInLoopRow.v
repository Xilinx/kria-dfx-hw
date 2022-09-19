// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow (
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
        imgInput_uv_data82_din,
        imgInput_uv_data82_num_data_valid,
        imgInput_uv_data82_fifo_cap,
        imgInput_uv_data82_full_n,
        imgInput_uv_data82_write,
        mul_ln1062,
        sext_ln1082,
        cols_bound_per_npc_cast3,
        sub_cast,
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
output  [15:0] imgInput_uv_data82_din;
input  [1:0] imgInput_uv_data82_num_data_valid;
input  [1:0] imgInput_uv_data82_fifo_cap;
input   imgInput_uv_data82_full_n;
output   imgInput_uv_data82_write;
input  [21:0] mul_ln1062;
input  [5:0] sext_ln1082;
input  [10:0] cols_bound_per_npc_cast3;
input  [11:0] sub_cast;
input  [4:0] last_blk_width_load;
input  [6:0] sub3;
input  [6:0] add_ln1082;

reg ap_idle;
reg ldata1_read;
reg imgInput_uv_data82_write;

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
reg   [0:0] icmp_ln1062_reg_839;
reg   [0:0] icmp_ln1062_reg_839_pp0_iter2_reg;
reg   [0:0] icmp_ln1073_reg_855;
reg    ap_predicate_op101_read_state4;
reg    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
reg   [0:0] icmp_ln1093_reg_851;
reg   [0:0] icmp_ln1093_reg_851_pp0_iter4_reg;
reg    ap_block_state6_pp0_stage0_iter5;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1062_fu_225_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    ldata1_blk_n;
wire    ap_block_pp0_stage0;
reg    imgInput_uv_data82_blk_n;
reg    ap_block_pp0_stage0_11001;
wire  signed [31:0] sub_cast_cast_fu_194_p1;
reg  signed [31:0] sub_cast_cast_reg_829;
wire   [31:0] cols_bound_per_npc_cast3_cast_fu_198_p1;
reg   [31:0] cols_bound_per_npc_cast3_cast_reg_834;
reg   [0:0] icmp_ln1062_reg_839_pp0_iter3_reg;
wire   [0:0] bLast_width_fu_239_p2;
reg   [0:0] bLast_width_reg_843;
reg   [0:0] bLast_width_reg_843_pp0_iter2_reg;
reg   [0:0] bLast_width_reg_843_pp0_iter3_reg;
reg   [0:0] bLast_width_reg_843_pp0_iter4_reg;
wire   [0:0] icmp_ln1093_fu_247_p2;
reg   [0:0] icmp_ln1093_reg_851_pp0_iter2_reg;
reg   [0:0] icmp_ln1093_reg_851_pp0_iter3_reg;
wire   [0:0] icmp_ln1073_fu_307_p2;
reg   [0:0] icmp_ln1073_reg_855_pp0_iter3_reg;
wire   [0:0] icmp_ln674_1_fu_329_p2;
reg   [0:0] icmp_ln674_1_reg_859;
wire   [6:0] trunc_ln674_4_fu_335_p1;
reg   [6:0] trunc_ln674_4_reg_866;
wire   [6:0] trunc_ln674_5_fu_339_p1;
reg   [6:0] trunc_ln674_5_reg_874;
wire   [0:0] icmp_ln1074_fu_354_p2;
reg   [0:0] icmp_ln1074_reg_880;
reg   [0:0] icmp_ln1074_reg_880_pp0_iter3_reg;
wire   [4:0] trunc_ln1075_fu_360_p1;
reg   [4:0] trunc_ln1075_reg_885;
reg   [4:0] trunc_ln1075_reg_885_pp0_iter3_reg;
wire   [0:0] icmp_ln674_fu_374_p2;
reg   [0:0] icmp_ln674_reg_890;
wire   [6:0] trunc_ln674_fu_380_p1;
reg   [6:0] trunc_ln674_reg_897;
wire   [6:0] add_ln674_1_fu_408_p2;
reg   [6:0] add_ln674_1_reg_904;
wire   [0:0] icmp_ln414_fu_414_p2;
reg   [0:0] icmp_ln414_reg_909;
reg   [0:0] icmp_ln414_reg_909_pp0_iter3_reg;
wire   [4:0] trunc_ln414_fu_420_p1;
reg   [4:0] trunc_ln414_reg_917;
reg   [4:0] trunc_ln414_reg_917_pp0_iter3_reg;
wire   [4:0] trunc_ln414_1_fu_424_p1;
reg   [4:0] trunc_ln414_1_reg_925;
reg   [4:0] trunc_ln414_1_reg_925_pp0_iter3_reg;
wire   [6:0] sub_ln674_7_fu_485_p2;
reg   [6:0] sub_ln674_7_reg_931;
wire   [63:0] lshr_ln674_3_fu_495_p2;
reg   [63:0] lshr_ln674_3_reg_936;
wire   [6:0] sub_ln674_2_fu_536_p2;
reg   [6:0] sub_ln674_2_reg_941;
wire   [63:0] lshr_ln674_fu_546_p2;
reg   [63:0] lshr_ln674_reg_946;
wire   [4:0] sub_ln414_2_fu_587_p2;
reg   [4:0] sub_ln414_2_reg_951;
wire   [15:0] shl_ln414_fu_597_p2;
reg   [15:0] shl_ln414_reg_956;
wire   [15:0] localbuffer_V_6_fu_622_p1;
wire   [15:0] p_Result_15_fu_735_p2;
wire   [4:0] sub_ln674_8_fu_744_p2;
reg   [4:0] sub_ln674_8_reg_972;
wire   [15:0] ap_phi_reg_pp0_iter0_localbuffer_V_8_reg_175;
reg   [15:0] ap_phi_reg_pp0_iter1_localbuffer_V_8_reg_175;
reg   [15:0] ap_phi_reg_pp0_iter2_localbuffer_V_8_reg_175;
reg   [15:0] ap_phi_reg_pp0_iter3_localbuffer_V_8_reg_175;
reg   [15:0] ap_phi_reg_pp0_iter4_localbuffer_V_8_reg_175;
reg   [15:0] ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175;
reg   [31:0] rem_fu_104;
wire   [31:0] rem_2_fu_343_p2;
wire   [31:0] rem_1_fu_428_p2;
wire    ap_loop_init;
reg   [21:0] i_fu_108;
wire   [21:0] i_9_fu_230_p2;
reg   [31:0] j_fu_112;
wire   [31:0] j_4_fu_261_p3;
reg   [63:0] p_Val2_s_fu_116;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] add_ln1094_fu_255_p2;
wire   [4:0] xf_bits_per_clock_fu_283_p3;
wire   [6:0] ptr_width_minus_fu_297_p3;
wire   [31:0] zext_ln1068_fu_289_p1;
wire   [6:0] select_ln1082_fu_313_p3;
wire   [31:0] zext_ln1082_fu_319_p1;
wire   [31:0] grp_fu_184_p2;
wire   [31:0] sub_ln1082_fu_323_p2;
wire   [25:0] tmp_fu_364_p4;
wire   [5:0] zext_ln1068_1_fu_293_p1;
wire  signed [5:0] add_ln1079_fu_384_p2;
wire   [6:0] trunc_ln1079_fu_398_p1;
wire  signed [6:0] sext_ln1079_1_fu_394_p1;
wire   [6:0] sub_ln674_3_fu_402_p2;
wire  signed [31:0] sext_ln1079_fu_390_p1;
wire   [31:0] zext_ln1069_fu_303_p1;
wire   [6:0] sub_ln674_4_fu_452_p2;
wire   [6:0] sub_ln674_6_fu_461_p2;
reg   [63:0] tmp_31_fu_442_p4;
wire   [6:0] sub_ln674_5_fu_456_p2;
wire   [6:0] select_ln674_3_fu_465_p3;
wire   [6:0] select_ln674_5_fu_479_p3;
wire   [63:0] select_ln674_4_fu_472_p3;
wire   [63:0] zext_ln674_3_fu_491_p1;
wire   [6:0] add_ln674_fu_511_p2;
wire   [6:0] grp_fu_189_p2;
reg   [63:0] tmp_26_fu_501_p4;
wire   [6:0] select_ln674_fu_516_p3;
wire   [6:0] select_ln674_2_fu_530_p3;
wire   [63:0] select_ln674_1_fu_523_p3;
wire   [63:0] zext_ln674_fu_542_p1;
wire   [63:0] zext_ln674_2_fu_552_p1;
wire   [63:0] lshr_ln674_2_fu_555_p2;
wire   [63:0] p_Result_14_fu_561_p2;
wire   [4:0] sub_ln414_1_fu_571_p2;
wire   [4:0] select_ln414_fu_576_p3;
wire   [4:0] select_ln414_2_fu_581_p3;
wire   [15:0] tmp_34_fu_567_p1;
wire   [15:0] zext_ln414_1_fu_593_p1;
wire   [63:0] zext_ln674_4_fu_608_p1;
wire   [63:0] lshr_ln674_4_fu_611_p2;
wire   [63:0] p_Result_16_fu_617_p2;
wire   [63:0] zext_ln674_1_fu_626_p1;
wire   [63:0] lshr_ln674_1_fu_629_p2;
wire   [63:0] p_Result_s_fu_635_p2;
wire   [4:0] sub_ln414_fu_644_p2;
wire   [15:0] zext_ln414_fu_649_p1;
wire   [15:0] tmp_32_fu_640_p1;
wire   [15:0] lshr_ln414_fu_653_p2;
wire   [15:0] p_Result_13_fu_659_p2;
wire   [4:0] select_ln414_1_fu_672_p3;
reg   [15:0] tmp_30_fu_684_p4;
wire   [15:0] zext_ln414_2_fu_677_p1;
wire   [15:0] zext_ln414_3_fu_681_p1;
wire   [15:0] shl_ln414_1_fu_699_p2;
wire   [15:0] lshr_ln414_1_fu_705_p2;
wire   [15:0] and_ln414_fu_711_p2;
wire   [15:0] localbuffer_V_fu_665_p3;
wire   [15:0] xor_ln414_fu_717_p2;
wire   [15:0] select_ln414_3_fu_693_p3;
wire   [15:0] and_ln414_1_fu_723_p2;
wire   [15:0] and_ln414_2_fu_729_p2;
wire   [4:0] trunc_ln674_6_fu_741_p1;
wire   [15:0] zext_ln674_5_fu_750_p1;
wire   [15:0] lshr_ln674_5_fu_753_p2;
wire   [15:0] select_ln1067_fu_759_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_731;
reg    ap_condition_735;
reg    ap_condition_738;
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
        if (((icmp_ln1073_reg_855_pp0_iter3_reg == 1'd0) & (icmp_ln1062_reg_839_pp0_iter3_reg == 1'd0))) begin
            ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175 <= localbuffer_V_6_fu_622_p1;
        end else if (((icmp_ln1073_reg_855_pp0_iter3_reg == 1'd1) & (icmp_ln1062_reg_839_pp0_iter3_reg == 1'd0))) begin
            ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175 <= p_Result_15_fu_735_p2;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter4_localbuffer_V_8_reg_175;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_108 <= 22'd0;
        end else if (((icmp_ln1062_fu_225_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_108 <= i_9_fu_230_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            j_fu_112 <= 32'd0;
        end else if (((icmp_ln1062_fu_225_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            j_fu_112 <= j_4_fu_261_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            p_Val2_s_fu_116 <= 64'd0;
        end else if ((1'b1 == ap_condition_731)) begin
            p_Val2_s_fu_116 <= ldata1_dout;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            rem_fu_104 <= 32'd0;
        end else if ((1'b1 == ap_condition_738)) begin
            rem_fu_104 <= rem_1_fu_428_p2;
        end else if ((1'b1 == ap_condition_735)) begin
            rem_fu_104 <= rem_2_fu_343_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1062_reg_839 == 1'd0) & (icmp_ln1073_fu_307_p2 == 1'd1))) begin
        add_ln674_1_reg_904 <= add_ln674_1_fu_408_p2;
        icmp_ln1074_reg_880 <= icmp_ln1074_fu_354_p2;
        icmp_ln414_reg_909 <= icmp_ln414_fu_414_p2;
        icmp_ln674_reg_890 <= icmp_ln674_fu_374_p2;
        trunc_ln1075_reg_885 <= trunc_ln1075_fu_360_p1;
        trunc_ln414_1_reg_925 <= trunc_ln414_1_fu_424_p1;
        trunc_ln414_reg_917 <= trunc_ln414_fu_420_p1;
        trunc_ln674_reg_897 <= trunc_ln674_fu_380_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
        cols_bound_per_npc_cast3_cast_reg_834[10 : 0] <= cols_bound_per_npc_cast3_cast_fu_198_p1[10 : 0];
        icmp_ln1062_reg_839 <= icmp_ln1062_fu_225_p2;
        sub_cast_cast_reg_829 <= sub_cast_cast_fu_194_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        bLast_width_reg_843_pp0_iter2_reg <= bLast_width_reg_843;
        bLast_width_reg_843_pp0_iter3_reg <= bLast_width_reg_843_pp0_iter2_reg;
        bLast_width_reg_843_pp0_iter4_reg <= bLast_width_reg_843_pp0_iter3_reg;
        icmp_ln1062_reg_839_pp0_iter2_reg <= icmp_ln1062_reg_839;
        icmp_ln1062_reg_839_pp0_iter3_reg <= icmp_ln1062_reg_839_pp0_iter2_reg;
        icmp_ln1073_reg_855_pp0_iter3_reg <= icmp_ln1073_reg_855;
        icmp_ln1074_reg_880_pp0_iter3_reg <= icmp_ln1074_reg_880;
        icmp_ln1093_reg_851_pp0_iter2_reg <= icmp_ln1093_reg_851;
        icmp_ln1093_reg_851_pp0_iter3_reg <= icmp_ln1093_reg_851_pp0_iter2_reg;
        icmp_ln1093_reg_851_pp0_iter4_reg <= icmp_ln1093_reg_851_pp0_iter3_reg;
        icmp_ln414_reg_909_pp0_iter3_reg <= icmp_ln414_reg_909;
        trunc_ln1075_reg_885_pp0_iter3_reg <= trunc_ln1075_reg_885;
        trunc_ln414_1_reg_925_pp0_iter3_reg <= trunc_ln414_1_reg_925;
        trunc_ln414_reg_917_pp0_iter3_reg <= trunc_ln414_reg_917;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter1_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter0_localbuffer_V_8_reg_175;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter2_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter1_localbuffer_V_8_reg_175;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_reg_pp0_iter3_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter2_localbuffer_V_8_reg_175;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_phi_reg_pp0_iter4_localbuffer_V_8_reg_175 <= ap_phi_reg_pp0_iter3_localbuffer_V_8_reg_175;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1062_fu_225_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        bLast_width_reg_843 <= bLast_width_fu_239_p2;
        icmp_ln1093_reg_851 <= icmp_ln1093_fu_247_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1062_reg_839 == 1'd0))) begin
        icmp_ln1073_reg_855 <= icmp_ln1073_fu_307_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1062_reg_839 == 1'd0) & (icmp_ln1073_fu_307_p2 == 1'd0))) begin
        icmp_ln674_1_reg_859 <= icmp_ln674_1_fu_329_p2;
        trunc_ln674_4_reg_866 <= trunc_ln674_4_fu_335_p1;
        trunc_ln674_5_reg_874 <= trunc_ln674_5_fu_339_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_855 == 1'd0) & (icmp_ln1062_reg_839_pp0_iter2_reg == 1'd0))) begin
        lshr_ln674_3_reg_936 <= lshr_ln674_3_fu_495_p2;
        sub_ln674_7_reg_931 <= sub_ln674_7_fu_485_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_855 == 1'd1) & (icmp_ln1062_reg_839_pp0_iter2_reg == 1'd0) & (icmp_ln1074_reg_880 == 1'd0))) begin
        lshr_ln674_reg_946 <= lshr_ln674_fu_546_p2;
        sub_ln674_2_reg_941 <= sub_ln674_2_fu_536_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1073_reg_855 == 1'd1) & (icmp_ln1062_reg_839_pp0_iter2_reg == 1'd0))) begin
        shl_ln414_reg_956 <= shl_ln414_fu_597_p2;
        sub_ln414_2_reg_951 <= sub_ln414_2_fu_587_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (bLast_width_reg_843_pp0_iter3_reg == 1'd1))) begin
        sub_ln674_8_reg_972 <= sub_ln674_8_fu_744_p2;
    end
end

always @ (*) begin
    if (((icmp_ln1062_fu_225_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln1093_reg_851_pp0_iter4_reg == 1'd1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        imgInput_uv_data82_blk_n = imgInput_uv_data82_full_n;
    end else begin
        imgInput_uv_data82_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1093_reg_851_pp0_iter4_reg == 1'd1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        imgInput_uv_data82_write = 1'b1;
    end else begin
        imgInput_uv_data82_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op101_read_state4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ldata1_blk_n = ldata1_empty_n;
    end else begin
        ldata1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op101_read_state4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
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

assign add_ln1079_fu_384_p2 = ($signed(zext_ln1068_1_fu_293_p1) + $signed(6'd63));

assign add_ln1094_fu_255_p2 = (j_fu_112 + 32'd1);

assign add_ln674_1_fu_408_p2 = (sub_ln674_3_fu_402_p2 + 7'd63);

assign add_ln674_fu_511_p2 = ($signed(trunc_ln674_reg_897) + $signed(7'd65));

assign and_ln414_1_fu_723_p2 = (xor_ln414_fu_717_p2 & localbuffer_V_fu_665_p3);

assign and_ln414_2_fu_729_p2 = (select_ln414_3_fu_693_p3 & and_ln414_fu_711_p2);

assign and_ln414_fu_711_p2 = (shl_ln414_1_fu_699_p2 & lshr_ln414_1_fu_705_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((icmp_ln1093_reg_851_pp0_iter4_reg == 1'd1) & (imgInput_uv_data82_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)) | ((ap_predicate_op101_read_state4 == 1'b1) & (ldata1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((icmp_ln1093_reg_851_pp0_iter4_reg == 1'd1) & (imgInput_uv_data82_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)) | ((ap_predicate_op101_read_state4 == 1'b1) & (ldata1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((icmp_ln1093_reg_851_pp0_iter4_reg == 1'd1) & (imgInput_uv_data82_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)) | ((ap_predicate_op101_read_state4 == 1'b1) & (ldata1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = ((ap_predicate_op101_read_state4 == 1'b1) & (ldata1_empty_n == 1'b0));
end

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state6_pp0_stage0_iter5 = ((icmp_ln1093_reg_851_pp0_iter4_reg == 1'd1) & (imgInput_uv_data82_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_731 = ((icmp_ln1073_reg_855 == 1'd1) & (icmp_ln1062_reg_839_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1));
end

always @ (*) begin
    ap_condition_735 = ((icmp_ln1062_reg_839 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1073_fu_307_p2 == 1'd0));
end

always @ (*) begin
    ap_condition_738 = ((icmp_ln1062_reg_839 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1073_fu_307_p2 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_phi_reg_pp0_iter0_localbuffer_V_8_reg_175 = 'bx;

always @ (*) begin
    ap_predicate_op101_read_state4 = ((icmp_ln1073_reg_855 == 1'd1) & (icmp_ln1062_reg_839_pp0_iter2_reg == 1'd0));
end

assign bLast_width_fu_239_p2 = ((j_fu_112 == sub_cast_cast_reg_829) ? 1'b1 : 1'b0);

assign cols_bound_per_npc_cast3_cast_fu_198_p1 = cols_bound_per_npc_cast3;

assign grp_fu_184_p2 = (32'd64 - rem_fu_104);

assign grp_fu_189_p2 = (7'd63 - trunc_ln674_reg_897);

assign i_9_fu_230_p2 = (i_fu_108 + 22'd1);

assign icmp_ln1062_fu_225_p2 = ((i_fu_108 == mul_ln1062) ? 1'b1 : 1'b0);

assign icmp_ln1073_fu_307_p2 = (($signed(zext_ln1068_fu_289_p1) > $signed(rem_fu_104)) ? 1'b1 : 1'b0);

assign icmp_ln1074_fu_354_p2 = ((rem_fu_104 == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln1093_fu_247_p2 = (($signed(j_fu_112) < $signed(cols_bound_per_npc_cast3_cast_reg_834)) ? 1'b1 : 1'b0);

assign icmp_ln414_fu_414_p2 = ((rem_fu_104 > sext_ln1079_fu_390_p1) ? 1'b1 : 1'b0);

assign icmp_ln674_1_fu_329_p2 = ((grp_fu_184_p2 > sub_ln1082_fu_323_p2) ? 1'b1 : 1'b0);

assign icmp_ln674_fu_374_p2 = ((tmp_fu_364_p4 != 26'd0) ? 1'b1 : 1'b0);

assign imgInput_uv_data82_din = (select_ln1067_fu_759_p3 & ap_phi_reg_pp0_iter5_localbuffer_V_8_reg_175);

assign j_4_fu_261_p3 = ((bLast_width_fu_239_p2[0:0] == 1'b1) ? 32'd0 : add_ln1094_fu_255_p2);

assign localbuffer_V_6_fu_622_p1 = p_Result_16_fu_617_p2[15:0];

assign localbuffer_V_fu_665_p3 = ((icmp_ln1074_reg_880_pp0_iter3_reg[0:0] == 1'b1) ? 16'd0 : p_Result_13_fu_659_p2);

assign lshr_ln414_1_fu_705_p2 = 16'd65535 >> zext_ln414_3_fu_681_p1;

assign lshr_ln414_fu_653_p2 = 16'd65535 >> zext_ln414_fu_649_p1;

assign lshr_ln674_1_fu_629_p2 = 64'd18446744073709551615 >> zext_ln674_1_fu_626_p1;

assign lshr_ln674_2_fu_555_p2 = 64'd18446744073709551615 >> zext_ln674_2_fu_552_p1;

assign lshr_ln674_3_fu_495_p2 = select_ln674_4_fu_472_p3 >> zext_ln674_3_fu_491_p1;

assign lshr_ln674_4_fu_611_p2 = 64'd18446744073709551615 >> zext_ln674_4_fu_608_p1;

assign lshr_ln674_5_fu_753_p2 = 16'd65535 >> zext_ln674_5_fu_750_p1;

assign lshr_ln674_fu_546_p2 = select_ln674_1_fu_523_p3 >> zext_ln674_fu_542_p1;

assign p_Result_13_fu_659_p2 = (tmp_32_fu_640_p1 & lshr_ln414_fu_653_p2);

assign p_Result_14_fu_561_p2 = (lshr_ln674_2_fu_555_p2 & ldata1_dout);

assign p_Result_15_fu_735_p2 = (and_ln414_2_fu_729_p2 | and_ln414_1_fu_723_p2);

assign p_Result_16_fu_617_p2 = (lshr_ln674_4_fu_611_p2 & lshr_ln674_3_reg_936);

assign p_Result_s_fu_635_p2 = (lshr_ln674_reg_946 & lshr_ln674_1_fu_629_p2);

assign ptr_width_minus_fu_297_p3 = ((bLast_width_reg_843[0:0] == 1'b1) ? sub3 : 7'd48);

assign rem_1_fu_428_p2 = (rem_fu_104 + zext_ln1069_fu_303_p1);

assign rem_2_fu_343_p2 = (rem_fu_104 - zext_ln1068_fu_289_p1);

assign select_ln1067_fu_759_p3 = ((bLast_width_reg_843_pp0_iter4_reg[0:0] == 1'b1) ? lshr_ln674_5_fu_753_p2 : 16'd65535);

assign select_ln1082_fu_313_p3 = ((bLast_width_reg_843[0:0] == 1'b1) ? add_ln1082 : 7'd79);

assign select_ln414_1_fu_672_p3 = ((icmp_ln414_reg_909_pp0_iter3_reg[0:0] == 1'b1) ? trunc_ln414_1_reg_925_pp0_iter3_reg : trunc_ln414_reg_917_pp0_iter3_reg);

assign select_ln414_2_fu_581_p3 = ((icmp_ln414_reg_909[0:0] == 1'b1) ? sub_ln414_1_fu_571_p2 : trunc_ln414_reg_917);

assign select_ln414_3_fu_693_p3 = ((icmp_ln414_reg_909_pp0_iter3_reg[0:0] == 1'b1) ? tmp_30_fu_684_p4 : shl_ln414_reg_956);

assign select_ln414_fu_576_p3 = ((icmp_ln414_reg_909[0:0] == 1'b1) ? trunc_ln414_reg_917 : trunc_ln414_1_reg_925);

assign select_ln674_1_fu_523_p3 = ((icmp_ln674_reg_890[0:0] == 1'b1) ? tmp_26_fu_501_p4 : p_Val2_s_fu_116);

assign select_ln674_2_fu_530_p3 = ((icmp_ln674_reg_890[0:0] == 1'b1) ? grp_fu_189_p2 : trunc_ln674_reg_897);

assign select_ln674_3_fu_465_p3 = ((icmp_ln674_1_reg_859[0:0] == 1'b1) ? sub_ln674_4_fu_452_p2 : sub_ln674_6_fu_461_p2);

assign select_ln674_4_fu_472_p3 = ((icmp_ln674_1_reg_859[0:0] == 1'b1) ? tmp_31_fu_442_p4 : p_Val2_s_fu_116);

assign select_ln674_5_fu_479_p3 = ((icmp_ln674_1_reg_859[0:0] == 1'b1) ? sub_ln674_5_fu_456_p2 : trunc_ln674_4_reg_866);

assign select_ln674_fu_516_p3 = ((icmp_ln674_reg_890[0:0] == 1'b1) ? add_ln674_fu_511_p2 : grp_fu_189_p2);

assign sext_ln1079_1_fu_394_p1 = add_ln1079_fu_384_p2;

assign sext_ln1079_fu_390_p1 = add_ln1079_fu_384_p2;

assign shl_ln414_1_fu_699_p2 = 16'd65535 << zext_ln414_2_fu_677_p1;

assign shl_ln414_fu_597_p2 = tmp_34_fu_567_p1 << zext_ln414_1_fu_593_p1;

assign sub_cast_cast_fu_194_p1 = $signed(sub_cast);

assign sub_ln1082_fu_323_p2 = (zext_ln1082_fu_319_p1 - rem_fu_104);

assign sub_ln414_1_fu_571_p2 = (5'd15 - trunc_ln414_reg_917);

assign sub_ln414_2_fu_587_p2 = (5'd15 - select_ln414_fu_576_p3);

assign sub_ln414_fu_644_p2 = ($signed(5'd16) - $signed(trunc_ln1075_reg_885_pp0_iter3_reg));

assign sub_ln674_2_fu_536_p2 = (7'd63 - select_ln674_fu_516_p3);

assign sub_ln674_3_fu_402_p2 = ($signed(trunc_ln1079_fu_398_p1) - $signed(sext_ln1079_1_fu_394_p1));

assign sub_ln674_4_fu_452_p2 = (trunc_ln674_4_reg_866 - trunc_ln674_5_reg_874);

assign sub_ln674_5_fu_456_p2 = (7'd63 - trunc_ln674_4_reg_866);

assign sub_ln674_6_fu_461_p2 = (trunc_ln674_5_reg_874 - trunc_ln674_4_reg_866);

assign sub_ln674_7_fu_485_p2 = (7'd63 - select_ln674_3_fu_465_p3);

assign sub_ln674_8_fu_744_p2 = (5'd15 - trunc_ln674_6_fu_741_p1);

integer ap_tvar_int_0;

always @ (p_Val2_s_fu_116) begin
    for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_26_fu_501_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_26_fu_501_p4[ap_tvar_int_0] = p_Val2_s_fu_116[63 - ap_tvar_int_0];
        end
    end
end

integer ap_tvar_int_1;

always @ (shl_ln414_reg_956) begin
    for (ap_tvar_int_1 = 16 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
        if (ap_tvar_int_1 > 15 - 0) begin
            tmp_30_fu_684_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_30_fu_684_p4[ap_tvar_int_1] = shl_ln414_reg_956[15 - ap_tvar_int_1];
        end
    end
end

integer ap_tvar_int_2;

always @ (p_Val2_s_fu_116) begin
    for (ap_tvar_int_2 = 64 - 1; ap_tvar_int_2 >= 0; ap_tvar_int_2 = ap_tvar_int_2 - 1) begin
        if (ap_tvar_int_2 > 63 - 0) begin
            tmp_31_fu_442_p4[ap_tvar_int_2] = 1'b0;
        end else begin
            tmp_31_fu_442_p4[ap_tvar_int_2] = p_Val2_s_fu_116[63 - ap_tvar_int_2];
        end
    end
end

assign tmp_32_fu_640_p1 = p_Result_s_fu_635_p2[15:0];

assign tmp_34_fu_567_p1 = p_Result_14_fu_561_p2[15:0];

assign tmp_fu_364_p4 = {{grp_fu_184_p2[31:6]}};

assign trunc_ln1075_fu_360_p1 = rem_fu_104[4:0];

assign trunc_ln1079_fu_398_p1 = rem_fu_104[6:0];

assign trunc_ln414_1_fu_424_p1 = add_ln1079_fu_384_p2[4:0];

assign trunc_ln414_fu_420_p1 = rem_fu_104[4:0];

assign trunc_ln674_4_fu_335_p1 = grp_fu_184_p2[6:0];

assign trunc_ln674_5_fu_339_p1 = sub_ln1082_fu_323_p2[6:0];

assign trunc_ln674_6_fu_741_p1 = sext_ln1082[4:0];

assign trunc_ln674_fu_380_p1 = grp_fu_184_p2[6:0];

assign xf_bits_per_clock_fu_283_p3 = ((bLast_width_reg_843[0:0] == 1'b1) ? last_blk_width_load : 5'd16);

assign xor_ln414_fu_717_p2 = (16'd65535 ^ and_ln414_fu_711_p2);

assign zext_ln1068_1_fu_293_p1 = xf_bits_per_clock_fu_283_p3;

assign zext_ln1068_fu_289_p1 = xf_bits_per_clock_fu_283_p3;

assign zext_ln1069_fu_303_p1 = ptr_width_minus_fu_297_p3;

assign zext_ln1082_fu_319_p1 = select_ln1082_fu_313_p3;

assign zext_ln414_1_fu_593_p1 = select_ln414_2_fu_581_p3;

assign zext_ln414_2_fu_677_p1 = select_ln414_1_fu_672_p3;

assign zext_ln414_3_fu_681_p1 = sub_ln414_2_reg_951;

assign zext_ln414_fu_649_p1 = sub_ln414_fu_644_p2;

assign zext_ln674_1_fu_626_p1 = sub_ln674_2_reg_941;

assign zext_ln674_2_fu_552_p1 = add_ln674_1_reg_904;

assign zext_ln674_3_fu_491_p1 = select_ln674_5_fu_479_p3;

assign zext_ln674_4_fu_608_p1 = sub_ln674_7_reg_931;

assign zext_ln674_5_fu_750_p1 = sub_ln674_8_reg_972;

assign zext_ln674_fu_542_p1 = select_ln674_2_fu_530_p3;

always @ (posedge ap_clk) begin
    cols_bound_per_npc_cast3_cast_reg_834[31:11] <= 21'b000000000000000000000;
end

endmodule //pp_pipeline_accel_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow
