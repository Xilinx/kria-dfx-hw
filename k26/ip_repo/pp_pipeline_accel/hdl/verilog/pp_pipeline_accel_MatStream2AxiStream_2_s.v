// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_MatStream2AxiStream_2_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        out_mat_data85_dout,
        out_mat_data85_num_data_valid,
        out_mat_data85_fifo_cap,
        out_mat_data85_empty_n,
        out_mat_data85_read,
        ldata1_din,
        ldata1_num_data_valid,
        ldata1_fifo_cap,
        ldata1_full_n,
        ldata1_write,
        rows_dout,
        rows_num_data_valid,
        rows_fifo_cap,
        rows_empty_n,
        rows_read,
        cols_bound_per_npc_dout,
        cols_bound_per_npc_num_data_valid,
        cols_bound_per_npc_fifo_cap,
        cols_bound_per_npc_empty_n,
        cols_bound_per_npc_read,
        last_blk_width
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [23:0] out_mat_data85_dout;
input  [1:0] out_mat_data85_num_data_valid;
input  [1:0] out_mat_data85_fifo_cap;
input   out_mat_data85_empty_n;
output   out_mat_data85_read;
output  [63:0] ldata1_din;
input  [1:0] ldata1_num_data_valid;
input  [1:0] ldata1_fifo_cap;
input   ldata1_full_n;
output   ldata1_write;
input  [15:0] rows_dout;
input  [2:0] rows_num_data_valid;
input  [2:0] rows_fifo_cap;
input   rows_empty_n;
output   rows_read;
input  [31:0] cols_bound_per_npc_dout;
input  [2:0] cols_bound_per_npc_num_data_valid;
input  [2:0] cols_bound_per_npc_fifo_cap;
input   cols_bound_per_npc_empty_n;
output   cols_bound_per_npc_read;
input  [3:0] last_blk_width;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_mat_data85_read;
reg[63:0] ldata1_din;
reg ldata1_write;
reg rows_read;
reg cols_bound_per_npc_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ldata1_blk_n;
wire    ap_CS_fsm_state6;
wire   [0:0] icmp_ln1069_fu_119_p2;
reg    rows_blk_n;
reg    cols_bound_per_npc_blk_n;
reg   [31:0] cols_bound_per_npc_read_reg_144;
wire   [15:0] empty_fu_94_p1;
reg   [15:0] empty_reg_150;
reg   [3:0] last_blk_width_read_reg_165;
wire    ap_CS_fsm_state3;
wire   [31:0] op2_assign_fu_106_p2;
reg   [31:0] op2_assign_reg_170;
wire    ap_CS_fsm_state4;
wire  signed [31:0] grp_fu_125_p2;
reg   [31:0] bound_reg_175;
wire    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start;
wire    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done;
wire    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_idle;
wire    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_ready;
wire    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_out_mat_data85_read;
wire   [63:0] grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din;
wire    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_write;
wire   [63:0] grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out;
wire    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out_ap_vld;
wire   [6:0] grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out;
wire    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out_ap_vld;
reg    grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg;
wire    ap_CS_fsm_state5;
reg    ap_block_state1;
reg    ap_block_state6;
wire   [15:0] grp_fu_125_p0;
wire   [15:0] grp_fu_125_p1;
reg    grp_fu_125_ce;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire   [31:0] grp_fu_125_p00;
wire   [31:0] grp_fu_125_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 6'd1;
#0 grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg = 1'b0;
end

pp_pipeline_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start),
    .ap_done(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done),
    .ap_idle(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_idle),
    .ap_ready(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_ready),
    .out_mat_data85_dout(out_mat_data85_dout),
    .out_mat_data85_num_data_valid(2'd0),
    .out_mat_data85_fifo_cap(2'd0),
    .out_mat_data85_empty_n(out_mat_data85_empty_n),
    .out_mat_data85_read(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_out_mat_data85_read),
    .ldata1_din(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din),
    .ldata1_num_data_valid(2'd0),
    .ldata1_fifo_cap(2'd0),
    .ldata1_full_n(ldata1_full_n),
    .ldata1_write(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_write),
    .bound(bound_reg_175),
    .cols_bound_per_npc_cast(empty_reg_150),
    .op2_assign(op2_assign_reg_170),
    .last_blk_width_load(last_blk_width_read_reg_165),
    .cols_bound_per_npc_load(cols_bound_per_npc_read_reg_144),
    .localbuffer_V_3_out(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out),
    .localbuffer_V_3_out_ap_vld(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out_ap_vld),
    .filled_V_1_out(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out),
    .filled_V_1_out_ap_vld(grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out_ap_vld)
);

pp_pipeline_accel_mul_mul_16ns_16ns_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_mul_16ns_16ns_32_4_1_U305(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_125_p0),
    .din1(grp_fu_125_p1),
    .ce(grp_fu_125_ce),
    .dout(grp_fu_125_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((icmp_ln1069_fu_119_p2 == 1'd0) & (ldata1_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state6))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg <= 1'b1;
        end else if ((grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_ready == 1'b1)) begin
            grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        bound_reg_175 <= grp_fu_125_p2;
        op2_assign_reg_170 <= op2_assign_fu_106_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        cols_bound_per_npc_read_reg_144 <= cols_bound_per_npc_dout;
        empty_reg_150 <= empty_fu_94_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        last_blk_width_read_reg_165 <= last_blk_width;
    end
end

always @ (*) begin
    if (((cols_bound_per_npc_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1069_fu_119_p2 == 1'd0) & (ldata1_full_n == 1'b0))) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((icmp_ln1069_fu_119_p2 == 1'd0) & (ldata1_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if ((~((icmp_ln1069_fu_119_p2 == 1'd0) & (ldata1_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_bound_per_npc_blk_n = cols_bound_per_npc_empty_n;
    end else begin
        cols_bound_per_npc_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((cols_bound_per_npc_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_bound_per_npc_read = 1'b1;
    end else begin
        cols_bound_per_npc_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | ((1'b1 == ap_CS_fsm_state1) & ((cols_bound_per_npc_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0))))) begin
        grp_fu_125_ce = 1'b0;
    end else begin
        grp_fu_125_ce = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln1069_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        ldata1_blk_n = ldata1_full_n;
    end else begin
        ldata1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((icmp_ln1069_fu_119_p2 == 1'd0) & (ldata1_full_n == 1'b0)) & (icmp_ln1069_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        ldata1_din = grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_localbuffer_V_3_out;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ldata1_din = grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din;
    end else begin
        ldata1_din = grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_din;
    end
end

always @ (*) begin
    if ((~((icmp_ln1069_fu_119_p2 == 1'd0) & (ldata1_full_n == 1'b0)) & (icmp_ln1069_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        ldata1_write = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ldata1_write = grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ldata1_write;
    end else begin
        ldata1_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        out_mat_data85_read = grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_out_mat_data85_read;
    end else begin
        out_mat_data85_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_blk_n = rows_empty_n;
    end else begin
        rows_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((cols_bound_per_npc_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_read = 1'b1;
    end else begin
        rows_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((cols_bound_per_npc_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if ((~((icmp_ln1069_fu_119_p2 == 1'd0) & (ldata1_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state6))) begin
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

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state1 = ((cols_bound_per_npc_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state6 = ((icmp_ln1069_fu_119_p2 == 1'd0) & (ldata1_full_n == 1'b0));
end

assign empty_fu_94_p1 = cols_bound_per_npc_dout[15:0];

assign grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start = grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_ap_start_reg;

assign grp_fu_125_p0 = grp_fu_125_p00;

assign grp_fu_125_p00 = rows_dout;

assign grp_fu_125_p1 = grp_fu_125_p10;

assign grp_fu_125_p10 = empty_fu_94_p1;

assign icmp_ln1069_fu_119_p2 = ((grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79_filled_V_1_out == 7'd0) ? 1'b1 : 1'b0);

assign op2_assign_fu_106_p2 = ($signed(cols_bound_per_npc_read_reg_144) + $signed(32'd4294967295));

endmodule //pp_pipeline_accel_MatStream2AxiStream_2_s
