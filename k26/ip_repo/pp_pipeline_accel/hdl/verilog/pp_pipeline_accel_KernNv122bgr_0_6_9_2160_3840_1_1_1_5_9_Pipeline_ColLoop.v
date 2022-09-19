// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        imgInput_y_data81_dout,
        imgInput_y_data81_num_data_valid,
        imgInput_y_data81_fifo_cap,
        imgInput_y_data81_empty_n,
        imgInput_y_data81_read,
        imgInput_uv_data82_dout,
        imgInput_uv_data82_num_data_valid,
        imgInput_uv_data82_fifo_cap,
        imgInput_uv_data82_empty_n,
        imgInput_uv_data82_read,
        uvStream_din,
        uvStream_full_n,
        uvStream_write,
        uvStream_dout,
        uvStream_empty_n,
        uvStream_read,
        rgb_mat_data83_din,
        rgb_mat_data83_num_data_valid,
        rgb_mat_data83_fifo_cap,
        rgb_mat_data83_full_n,
        rgb_mat_data83_write,
        evenBlock,
        width,
        evenRow,
        uvPacked_V_1_out_i,
        uvPacked_V_1_out_o,
        uvPacked_V_1_out_o_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] imgInput_y_data81_dout;
input  [1:0] imgInput_y_data81_num_data_valid;
input  [1:0] imgInput_y_data81_fifo_cap;
input   imgInput_y_data81_empty_n;
output   imgInput_y_data81_read;
input  [15:0] imgInput_uv_data82_dout;
input  [1:0] imgInput_uv_data82_num_data_valid;
input  [1:0] imgInput_uv_data82_fifo_cap;
input   imgInput_uv_data82_empty_n;
output   imgInput_uv_data82_read;
output  [15:0] uvStream_din;
input   uvStream_full_n;
output   uvStream_write;
input  [15:0] uvStream_dout;
input   uvStream_empty_n;
output   uvStream_read;
output  [23:0] rgb_mat_data83_din;
input  [1:0] rgb_mat_data83_num_data_valid;
input  [1:0] rgb_mat_data83_fifo_cap;
input   rgb_mat_data83_full_n;
output   rgb_mat_data83_write;
input  [0:0] evenBlock;
input  [15:0] width;
input  [0:0] evenRow;
input  [15:0] uvPacked_V_1_out_i;
output  [15:0] uvPacked_V_1_out_o;
output   uvPacked_V_1_out_o_ap_vld;

reg ap_idle;
reg imgInput_y_data81_read;
reg imgInput_uv_data82_read;
reg uvStream_write;
reg uvStream_read;
reg rgb_mat_data83_write;
reg[15:0] uvPacked_V_1_out_o;
reg uvPacked_V_1_out_o_ap_vld;

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
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] evenBlock_1_reg_177;
reg    ap_predicate_op36_read_state2;
reg    ap_predicate_op37_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] evenBlock_1_reg_177_pp0_iter1_reg;
reg    ap_predicate_op38_read_state3;
reg    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
reg   [0:0] icmp_ln4200_reg_637;
reg   [0:0] icmp_ln4200_reg_637_pp0_iter7_reg;
reg    ap_block_state9_pp0_stage0_iter8;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln4200_fu_196_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    rgb_mat_data83_blk_n;
wire    ap_block_pp0_stage0;
reg    imgInput_y_data81_blk_n;
reg    imgInput_uv_data82_blk_n;
reg    uvStream_o_blk_n;
reg    uvStream_i_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln4200_reg_637_pp0_iter1_reg;
reg   [0:0] icmp_ln4200_reg_637_pp0_iter2_reg;
reg   [0:0] icmp_ln4200_reg_637_pp0_iter3_reg;
reg   [0:0] icmp_ln4200_reg_637_pp0_iter4_reg;
reg   [0:0] icmp_ln4200_reg_637_pp0_iter5_reg;
reg   [0:0] icmp_ln4200_reg_637_pp0_iter6_reg;
wire   [0:0] evenBlock_2_fu_208_p2;
reg   [0:0] evenBlock_2_reg_641;
reg   [7:0] t_reg_646;
reg   [15:0] tmp_V_reg_652;
wire   [7:0] y1_fu_240_p3;
reg   [7:0] y1_reg_657;
reg   [7:0] y1_reg_657_pp0_iter3_reg;
reg   [7:0] y1_reg_657_pp0_iter4_reg;
reg   [7:0] y1_reg_657_pp0_iter5_reg;
reg   [7:0] y1_reg_657_pp0_iter6_reg;
wire  signed [7:0] v_fu_266_p2;
reg  signed [7:0] v_reg_670;
reg  signed [7:0] v_reg_670_pp0_iter4_reg;
reg  signed [7:0] v_reg_670_pp0_iter5_reg;
reg  signed [7:0] v_reg_670_pp0_iter6_reg;
wire  signed [7:0] u_fu_276_p2;
reg  signed [7:0] u_reg_677;
reg  signed [7:0] u_reg_677_pp0_iter4_reg;
reg  signed [7:0] u_reg_677_pp0_iter5_reg;
reg  signed [7:0] u_reg_677_pp0_iter6_reg;
wire   [22:0] zext_ln847_3_fu_300_p1;
wire   [9:0] zext_ln847_fu_303_p1;
reg   [9:0] zext_ln847_reg_714;
reg  signed [7:0] trunc_ln_reg_720;
reg  signed [6:0] trunc_ln759_3_reg_731;
wire   [9:0] add_ln874_fu_338_p2;
reg   [9:0] add_ln874_reg_737;
wire   [7:0] Value_uchar_6_fu_408_p3;
reg   [7:0] Value_uchar_6_reg_742;
wire   [7:0] Value_uchar_7_fu_486_p3;
reg   [7:0] Value_uchar_7_reg_747;
wire   [7:0] Value_uchar_8_fu_563_p3;
reg   [7:0] Value_uchar_8_reg_752;
reg   [0:0] ap_phi_mux_evenBlock_1_phi_fu_180_p4;
wire    ap_loop_init;
reg   [15:0] j_fu_122;
wire   [15:0] j_3_fu_202_p2;
reg   [15:0] ap_sig_allocacmp_j_2;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln4220_fu_230_p2;
wire   [7:0] add_ln4220_fu_235_p2;
wire   [7:0] tmp9_fu_256_p4;
wire   [7:0] trunc_ln714_fu_272_p1;
wire   [20:0] grp_fu_579_p3;
wire  signed [22:0] trunc_ln_fu_306_p1;
wire   [22:0] grp_fu_589_p3;
wire  signed [22:0] grp_fu_598_p3;
wire   [8:0] shl_ln_fu_318_p3;
wire  signed [21:0] grp_fu_607_p3;
wire  signed [9:0] sext_ln757_fu_325_p1;
wire  signed [9:0] sext_ln4224_fu_344_p1;
wire   [9:0] add_ln848_fu_350_p2;
wire  signed [9:0] sext_ln848_fu_347_p1;
wire   [9:0] Value_int_fu_355_p2;
wire   [1:0] tmp_fu_361_p4;
wire   [7:0] add_ln766_fu_385_p2;
wire   [0:0] icmp_ln761_fu_371_p2;
wire   [0:0] tmp_20_fu_377_p3;
wire   [0:0] or_ln761_fu_402_p2;
wire   [7:0] select_ln761_fu_394_p3;
wire   [7:0] Value_uchar_fu_389_p2;
wire  signed [23:0] grp_fu_616_p3;
wire   [8:0] trunc_ln759_1_fu_416_p4;
wire  signed [9:0] sext_ln759_fu_425_p1;
wire   [9:0] Value_int_1_fu_438_p2;
wire   [1:0] tmp_21_fu_443_p4;
wire   [7:0] trunc_ln759_2_fu_429_p4;
wire   [0:0] icmp_ln761_1_fu_453_p2;
wire   [0:0] tmp_22_fu_459_p3;
wire   [0:0] or_ln761_1_fu_480_p2;
wire   [7:0] select_ln761_2_fu_472_p3;
wire   [7:0] Value_uchar_2_fu_467_p2;
wire  signed [10:0] sext_ln759_1_fu_502_p1;
wire  signed [10:0] sext_ln874_fu_494_p1;
wire   [10:0] Value_int_2_fu_508_p2;
wire   [2:0] tmp_23_fu_514_p4;
wire  signed [7:0] sext_ln759_2_fu_505_p1;
wire   [7:0] add_ln766_3_fu_538_p2;
wire   [7:0] shl_ln874_fu_497_p2;
wire   [0:0] icmp_ln761_2_fu_524_p2;
wire   [0:0] tmp_24_fu_530_p3;
wire   [0:0] or_ln761_2_fu_557_p2;
wire   [7:0] select_ln761_4_fu_549_p3;
wire   [7:0] Value_uchar_4_fu_543_p2;
wire   [7:0] grp_fu_579_p0;
wire   [12:0] grp_fu_579_p1;
wire   [14:0] grp_fu_579_p2;
wire   [14:0] grp_fu_589_p1;
wire   [20:0] grp_fu_589_p2;
wire  signed [14:0] grp_fu_598_p1;
wire   [20:0] grp_fu_598_p2;
wire   [9:0] grp_fu_607_p1;
wire   [20:0] grp_fu_607_p2;
wire  signed [15:0] grp_fu_616_p1;
reg    grp_fu_579_ce;
reg    grp_fu_589_ce;
reg    grp_fu_598_ce;
reg    grp_fu_607_ce;
reg    grp_fu_616_ce;
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
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire   [20:0] grp_fu_579_p00;
wire   [21:0] grp_fu_607_p20;
reg    ap_condition_642;
reg    ap_condition_647;
reg    ap_condition_652;
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
#0 ap_done_reg = 1'b0;
end

pp_pipeline_accel_mac_muladd_8ns_13ns_15ns_21_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 13 ),
    .din2_WIDTH( 15 ),
    .dout_WIDTH( 21 ))
mac_muladd_8ns_13ns_15ns_21_4_1_U147(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_579_p0),
    .din1(grp_fu_579_p1),
    .din2(grp_fu_579_p2),
    .ce(grp_fu_579_ce),
    .dout(grp_fu_579_p3)
);

pp_pipeline_accel_mac_muladd_8s_15ns_21ns_23_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 15 ),
    .din2_WIDTH( 21 ),
    .dout_WIDTH( 23 ))
mac_muladd_8s_15ns_21ns_23_4_1_U148(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(v_fu_266_p2),
    .din1(grp_fu_589_p1),
    .din2(grp_fu_589_p2),
    .ce(grp_fu_589_ce),
    .dout(grp_fu_589_p3)
);

pp_pipeline_accel_mac_muladd_8s_15s_21ns_23_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 15 ),
    .din2_WIDTH( 21 ),
    .dout_WIDTH( 23 ))
mac_muladd_8s_15s_21ns_23_4_1_U149(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(u_fu_276_p2),
    .din1(grp_fu_598_p1),
    .din2(grp_fu_598_p2),
    .ce(grp_fu_598_ce),
    .dout(grp_fu_598_p3)
);

pp_pipeline_accel_mac_muladd_8s_10ns_21ns_22_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 10 ),
    .din2_WIDTH( 21 ),
    .dout_WIDTH( 22 ))
mac_muladd_8s_10ns_21ns_22_4_1_U150(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(u_fu_276_p2),
    .din1(grp_fu_607_p1),
    .din2(grp_fu_607_p2),
    .ce(grp_fu_607_ce),
    .dout(grp_fu_607_p3)
);

pp_pipeline_accel_mac_muladd_8s_16s_23s_24_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 23 ),
    .dout_WIDTH( 24 ))
mac_muladd_8s_16s_23s_24_4_1_U151(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(v_reg_670),
    .din1(grp_fu_616_p1),
    .din2(grp_fu_598_p3),
    .ce(grp_fu_616_ce),
    .dout(grp_fu_616_p3)
);

pp_pipeline_accel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready_pp0_iter7_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_647)) begin
            evenBlock_1_reg_177 <= evenBlock_2_reg_641;
        end else if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            evenBlock_1_reg_177 <= evenBlock;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln4200_fu_196_p2 == 1'd0))) begin
            j_fu_122 <= j_3_fu_202_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_122 <= 16'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4200_reg_637_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        Value_uchar_6_reg_742 <= Value_uchar_6_fu_408_p3;
        Value_uchar_7_reg_747 <= Value_uchar_7_fu_486_p3;
        Value_uchar_8_reg_752 <= Value_uchar_8_fu_563_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4200_reg_637_pp0_iter5_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln874_reg_737 <= add_ln874_fu_338_p2;
        trunc_ln759_3_reg_731 <= {{grp_fu_607_p3[21:15]}};
        trunc_ln_reg_720 <= {{trunc_ln_fu_306_p1[22:15]}};
        zext_ln847_reg_714[7 : 0] <= zext_ln847_fu_303_p1[7 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        evenBlock_1_reg_177_pp0_iter1_reg <= evenBlock_1_reg_177;
        icmp_ln4200_reg_637 <= icmp_ln4200_fu_196_p2;
        icmp_ln4200_reg_637_pp0_iter1_reg <= icmp_ln4200_reg_637;
        t_reg_646 <= imgInput_y_data81_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        icmp_ln4200_reg_637_pp0_iter2_reg <= icmp_ln4200_reg_637_pp0_iter1_reg;
        icmp_ln4200_reg_637_pp0_iter3_reg <= icmp_ln4200_reg_637_pp0_iter2_reg;
        icmp_ln4200_reg_637_pp0_iter4_reg <= icmp_ln4200_reg_637_pp0_iter3_reg;
        icmp_ln4200_reg_637_pp0_iter5_reg <= icmp_ln4200_reg_637_pp0_iter4_reg;
        icmp_ln4200_reg_637_pp0_iter6_reg <= icmp_ln4200_reg_637_pp0_iter5_reg;
        icmp_ln4200_reg_637_pp0_iter7_reg <= icmp_ln4200_reg_637_pp0_iter6_reg;
        u_reg_677_pp0_iter4_reg <= u_reg_677;
        u_reg_677_pp0_iter5_reg <= u_reg_677_pp0_iter4_reg;
        u_reg_677_pp0_iter6_reg <= u_reg_677_pp0_iter5_reg;
        v_reg_670_pp0_iter4_reg <= v_reg_670;
        v_reg_670_pp0_iter5_reg <= v_reg_670_pp0_iter4_reg;
        v_reg_670_pp0_iter6_reg <= v_reg_670_pp0_iter5_reg;
        y1_reg_657_pp0_iter3_reg <= y1_reg_657;
        y1_reg_657_pp0_iter4_reg <= y1_reg_657_pp0_iter3_reg;
        y1_reg_657_pp0_iter5_reg <= y1_reg_657_pp0_iter4_reg;
        y1_reg_657_pp0_iter6_reg <= y1_reg_657_pp0_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln4200_fu_196_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        evenBlock_2_reg_641 <= evenBlock_2_fu_208_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op36_read_state2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_V_reg_652 <= imgInput_uv_data82_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4200_reg_637_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        u_reg_677 <= u_fu_276_p2;
        v_reg_670 <= v_fu_266_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4200_reg_637_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        y1_reg_657 <= y1_fu_240_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln4200_fu_196_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter7_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_642)) begin
            ap_phi_mux_evenBlock_1_phi_fu_180_p4 = evenBlock_2_reg_641;
        end else if ((ap_loop_init == 1'b1)) begin
            ap_phi_mux_evenBlock_1_phi_fu_180_p4 = evenBlock;
        end else begin
            ap_phi_mux_evenBlock_1_phi_fu_180_p4 = evenBlock_2_reg_641;
        end
    end else begin
        ap_phi_mux_evenBlock_1_phi_fu_180_p4 = evenBlock_2_reg_641;
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
        ap_sig_allocacmp_j_2 = 16'd0;
    end else begin
        ap_sig_allocacmp_j_2 = j_fu_122;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_579_ce = 1'b1;
    end else begin
        grp_fu_579_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_589_ce = 1'b1;
    end else begin
        grp_fu_589_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_598_ce = 1'b1;
    end else begin
        grp_fu_598_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_607_ce = 1'b1;
    end else begin
        grp_fu_607_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_616_ce = 1'b1;
    end else begin
        grp_fu_616_ce = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op36_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        imgInput_uv_data82_blk_n = imgInput_uv_data82_empty_n;
    end else begin
        imgInput_uv_data82_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op36_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        imgInput_uv_data82_read = 1'b1;
    end else begin
        imgInput_uv_data82_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        imgInput_y_data81_blk_n = imgInput_y_data81_empty_n;
    end else begin
        imgInput_y_data81_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        imgInput_y_data81_read = 1'b1;
    end else begin
        imgInput_y_data81_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (icmp_ln4200_reg_637_pp0_iter7_reg == 1'd0))) begin
        rgb_mat_data83_blk_n = rgb_mat_data83_full_n;
    end else begin
        rgb_mat_data83_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln4200_reg_637_pp0_iter7_reg == 1'd0))) begin
        rgb_mat_data83_write = 1'b1;
    end else begin
        rgb_mat_data83_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_652)) begin
        if ((evenRow == 1'd1)) begin
            uvPacked_V_1_out_o = tmp_V_reg_652;
        end else if ((evenRow == 1'd0)) begin
            uvPacked_V_1_out_o = uvStream_dout;
        end else begin
            uvPacked_V_1_out_o = uvPacked_V_1_out_i;
        end
    end else begin
        uvPacked_V_1_out_o = uvPacked_V_1_out_i;
    end
end

always @ (*) begin
    if ((((evenBlock_1_reg_177_pp0_iter1_reg == 1'd1) & (evenRow == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((evenBlock_1_reg_177_pp0_iter1_reg == 1'd1) & (evenRow == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        uvPacked_V_1_out_o_ap_vld = 1'b1;
    end else begin
        uvPacked_V_1_out_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op38_read_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        uvStream_i_blk_n = uvStream_empty_n;
    end else begin
        uvStream_i_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op37_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        uvStream_o_blk_n = uvStream_full_n;
    end else begin
        uvStream_o_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op38_read_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        uvStream_read = 1'b1;
    end else begin
        uvStream_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op37_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        uvStream_write = 1'b1;
    end else begin
        uvStream_write = 1'b0;
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

assign Value_int_1_fu_438_p2 = ($signed(sext_ln759_fu_425_p1) + $signed(zext_ln847_reg_714));

assign Value_int_2_fu_508_p2 = ($signed(sext_ln759_1_fu_502_p1) + $signed(sext_ln874_fu_494_p1));

assign Value_int_fu_355_p2 = ($signed(add_ln848_fu_350_p2) + $signed(sext_ln848_fu_347_p1));

assign Value_uchar_2_fu_467_p2 = (trunc_ln759_2_fu_429_p4 + y1_reg_657_pp0_iter6_reg);

assign Value_uchar_4_fu_543_p2 = (add_ln766_3_fu_538_p2 + shl_ln874_fu_497_p2);

assign Value_uchar_6_fu_408_p3 = ((or_ln761_fu_402_p2[0:0] == 1'b1) ? select_ln761_fu_394_p3 : Value_uchar_fu_389_p2);

assign Value_uchar_7_fu_486_p3 = ((or_ln761_1_fu_480_p2[0:0] == 1'b1) ? select_ln761_2_fu_472_p3 : Value_uchar_2_fu_467_p2);

assign Value_uchar_8_fu_563_p3 = ((or_ln761_2_fu_557_p2[0:0] == 1'b1) ? select_ln761_4_fu_549_p3 : Value_uchar_4_fu_543_p2);

assign Value_uchar_fu_389_p2 = ($signed(add_ln766_fu_385_p2) + $signed(v_reg_670_pp0_iter6_reg));

assign add_ln4220_fu_235_p2 = ($signed(t_reg_646) + $signed(8'd240));

assign add_ln766_3_fu_538_p2 = ($signed(y1_reg_657_pp0_iter6_reg) + $signed(sext_ln759_2_fu_505_p1));

assign add_ln766_fu_385_p2 = ($signed(y1_reg_657_pp0_iter6_reg) + $signed(trunc_ln_reg_720));

assign add_ln848_fu_350_p2 = ($signed(sext_ln4224_fu_344_p1) + $signed(zext_ln847_reg_714));

assign add_ln874_fu_338_p2 = ($signed(sext_ln757_fu_325_p1) + $signed(zext_ln847_fu_303_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_predicate_op38_read_state3 == 1'b1) & (uvStream_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((imgInput_y_data81_empty_n == 1'b0) | ((ap_predicate_op37_write_state2 == 1'b1) & (uvStream_full_n == 1'b0)) | ((ap_predicate_op36_read_state2 == 1'b1) & (imgInput_uv_data82_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln4200_reg_637_pp0_iter7_reg == 1'd0) & (rgb_mat_data83_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_predicate_op38_read_state3 == 1'b1) & (uvStream_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((imgInput_y_data81_empty_n == 1'b0) | ((ap_predicate_op37_write_state2 == 1'b1) & (uvStream_full_n == 1'b0)) | ((ap_predicate_op36_read_state2 == 1'b1) & (imgInput_uv_data82_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln4200_reg_637_pp0_iter7_reg == 1'd0) & (rgb_mat_data83_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_predicate_op38_read_state3 == 1'b1) & (uvStream_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((imgInput_y_data81_empty_n == 1'b0) | ((ap_predicate_op37_write_state2 == 1'b1) & (uvStream_full_n == 1'b0)) | ((ap_predicate_op36_read_state2 == 1'b1) & (imgInput_uv_data82_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln4200_reg_637_pp0_iter7_reg == 1'd0) & (rgb_mat_data83_full_n == 1'b0)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((imgInput_y_data81_empty_n == 1'b0) | ((ap_predicate_op37_write_state2 == 1'b1) & (uvStream_full_n == 1'b0)) | ((ap_predicate_op36_read_state2 == 1'b1) & (imgInput_uv_data82_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((ap_predicate_op38_read_state3 == 1'b1) & (uvStream_empty_n == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state9_pp0_stage0_iter8 = ((icmp_ln4200_reg_637_pp0_iter7_reg == 1'd0) & (rgb_mat_data83_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_642 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (icmp_ln4200_reg_637 == 1'd0));
end

always @ (*) begin
    ap_condition_647 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln4200_reg_637 == 1'd0));
end

always @ (*) begin
    ap_condition_652 = ((evenBlock_1_reg_177_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

always @ (*) begin
    ap_predicate_op36_read_state2 = ((evenBlock_1_reg_177 == 1'd1) & (evenRow == 1'd1));
end

always @ (*) begin
    ap_predicate_op37_write_state2 = ((evenBlock_1_reg_177 == 1'd1) & (evenRow == 1'd1));
end

always @ (*) begin
    ap_predicate_op38_read_state3 = ((evenBlock_1_reg_177_pp0_iter1_reg == 1'd1) & (evenRow == 1'd0));
end

assign evenBlock_2_fu_208_p2 = (ap_phi_mux_evenBlock_1_phi_fu_180_p4 ^ 1'd1);

assign grp_fu_579_p0 = grp_fu_579_p00;

assign grp_fu_579_p00 = y1_fu_240_p3;

assign grp_fu_579_p1 = 21'd5374;

assign grp_fu_579_p2 = 21'd16384;

assign grp_fu_589_p1 = 23'd19530;

assign grp_fu_589_p2 = zext_ln847_3_fu_300_p1;

assign grp_fu_598_p1 = 23'd8375795;

assign grp_fu_598_p2 = zext_ln847_3_fu_300_p1;

assign grp_fu_607_p1 = 19'd590;

assign grp_fu_607_p2 = grp_fu_607_p20;

assign grp_fu_607_p20 = grp_fu_579_p3;

assign grp_fu_616_p1 = 24'd16750575;

assign icmp_ln4200_fu_196_p2 = ((ap_sig_allocacmp_j_2 == width) ? 1'b1 : 1'b0);

assign icmp_ln4220_fu_230_p2 = ((t_reg_646 > 8'd16) ? 1'b1 : 1'b0);

assign icmp_ln761_1_fu_453_p2 = ((tmp_21_fu_443_p4 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln761_2_fu_524_p2 = (($signed(tmp_23_fu_514_p4) > $signed(3'd0)) ? 1'b1 : 1'b0);

assign icmp_ln761_fu_371_p2 = ((tmp_fu_361_p4 == 2'd1) ? 1'b1 : 1'b0);

assign j_3_fu_202_p2 = (ap_sig_allocacmp_j_2 + 16'd1);

assign or_ln761_1_fu_480_p2 = (tmp_22_fu_459_p3 | icmp_ln761_1_fu_453_p2);

assign or_ln761_2_fu_557_p2 = (tmp_24_fu_530_p3 | icmp_ln761_2_fu_524_p2);

assign or_ln761_fu_402_p2 = (tmp_20_fu_377_p3 | icmp_ln761_fu_371_p2);

assign rgb_mat_data83_din = {{{Value_uchar_6_reg_742}, {Value_uchar_7_reg_747}}, {Value_uchar_8_reg_752}};

assign select_ln761_2_fu_472_p3 = ((icmp_ln761_1_fu_453_p2[0:0] == 1'b1) ? 8'd255 : 8'd0);

assign select_ln761_4_fu_549_p3 = ((icmp_ln761_2_fu_524_p2[0:0] == 1'b1) ? 8'd255 : 8'd0);

assign select_ln761_fu_394_p3 = ((icmp_ln761_fu_371_p2[0:0] == 1'b1) ? 8'd255 : 8'd0);

assign sext_ln4224_fu_344_p1 = v_reg_670_pp0_iter6_reg;

assign sext_ln757_fu_325_p1 = $signed(shl_ln_fu_318_p3);

assign sext_ln759_1_fu_502_p1 = $signed(add_ln874_reg_737);

assign sext_ln759_2_fu_505_p1 = trunc_ln759_3_reg_731;

assign sext_ln759_fu_425_p1 = $signed(trunc_ln759_1_fu_416_p4);

assign sext_ln848_fu_347_p1 = trunc_ln_reg_720;

assign sext_ln874_fu_494_p1 = trunc_ln759_3_reg_731;

assign shl_ln874_fu_497_p2 = u_reg_677_pp0_iter6_reg << 8'd1;

assign shl_ln_fu_318_p3 = {{u_reg_677_pp0_iter5_reg}, {1'd0}};

assign tmp9_fu_256_p4 = {{uvPacked_V_1_out_i[15:8]}};

assign tmp_20_fu_377_p3 = Value_int_fu_355_p2[32'd9];

assign tmp_21_fu_443_p4 = {{Value_int_1_fu_438_p2[9:8]}};

assign tmp_22_fu_459_p3 = Value_int_1_fu_438_p2[32'd9];

assign tmp_23_fu_514_p4 = {{Value_int_2_fu_508_p2[10:8]}};

assign tmp_24_fu_530_p3 = Value_int_2_fu_508_p2[32'd10];

assign tmp_fu_361_p4 = {{Value_int_fu_355_p2[9:8]}};

assign trunc_ln714_fu_272_p1 = uvPacked_V_1_out_i[7:0];

assign trunc_ln759_1_fu_416_p4 = {{grp_fu_616_p3[23:15]}};

assign trunc_ln759_2_fu_429_p4 = {{grp_fu_616_p3[22:15]}};

assign trunc_ln_fu_306_p1 = grp_fu_589_p3;

assign u_fu_276_p2 = (trunc_ln714_fu_272_p1 ^ 8'd128);

assign uvStream_din = imgInput_uv_data82_dout;

assign v_fu_266_p2 = (tmp9_fu_256_p4 ^ 8'd128);

assign y1_fu_240_p3 = ((icmp_ln4220_fu_230_p2[0:0] == 1'b1) ? add_ln4220_fu_235_p2 : 8'd0);

assign zext_ln847_3_fu_300_p1 = grp_fu_579_p3;

assign zext_ln847_fu_303_p1 = y1_reg_657_pp0_iter5_reg;

always @ (posedge ap_clk) begin
    zext_ln847_reg_714[9:8] <= 2'b00;
end

endmodule //pp_pipeline_accel_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop
