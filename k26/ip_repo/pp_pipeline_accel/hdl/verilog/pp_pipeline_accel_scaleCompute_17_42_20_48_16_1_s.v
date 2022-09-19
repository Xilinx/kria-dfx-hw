// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_scaleCompute_17_42_20_48_16_1_s (
        ap_clk,
        ap_rst,
        currindex,
        inscale,
        ap_return,
        ap_ce
);


input   ap_clk;
input   ap_rst;
input  [31:0] currindex;
input  [47:0] inscale;
output  [41:0] ap_return;
input   ap_ce;

reg[41:0] ap_return;

wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_pp0_stage0_11001;
wire   [73:0] grp_fu_60_p2;
reg   [73:0] r_V_1_reg_91;
wire    ap_block_pp0_stage0;
wire   [19:0] trunc_ln884_fu_34_p1;
wire   [41:0] lhs_fu_38_p3;
wire  signed [41:0] ret_V_2_fu_46_p2;
wire   [47:0] grp_fu_60_p0;
wire   [73:0] ret_V_fu_66_p2;
reg    grp_fu_60_ce;
reg    ap_ce_reg;
reg   [31:0] currindex_int_reg;
reg   [47:0] inscale_int_reg;
reg   [41:0] ap_return_int_reg;
wire   [73:0] grp_fu_60_p00;

pp_pipeline_accel_mul_48ns_42s_74_5_0 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 48 ),
    .din1_WIDTH( 42 ),
    .dout_WIDTH( 74 ))
mul_48ns_42s_74_5_0_U187(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_60_p0),
    .din1(ret_V_2_fu_46_p2),
    .ce(grp_fu_60_ce),
    .dout(grp_fu_60_p2)
);

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_int_reg <= {{ret_V_fu_66_p2[73:32]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        currindex_int_reg <= currindex;
        inscale_int_reg <= inscale;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        r_V_1_reg_91 <= grp_fu_60_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return = ap_return_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return = {{ret_V_fu_66_p2[73:32]}};
    end else begin
        ap_return = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_60_ce = 1'b1;
    end else begin
        grp_fu_60_ce = 1'b0;
    end
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign grp_fu_60_p0 = grp_fu_60_p00;

assign grp_fu_60_p00 = inscale_int_reg;

assign lhs_fu_38_p3 = {{trunc_ln884_fu_34_p1}, {22'd0}};

assign ret_V_2_fu_46_p2 = (lhs_fu_38_p3 | 42'd2097152);

assign ret_V_fu_66_p2 = ($signed(r_V_1_reg_91) + $signed(74'd18889456924279326113792));

assign trunc_ln884_fu_34_p1 = currindex_int_reg[19:0];

endmodule //pp_pipeline_accel_scaleCompute_17_42_20_48_16_1_s
