// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_AxiStream2MatStream_2_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
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

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
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
input  [10:0] rows_dout;
input  [2:0] rows_num_data_valid;
input  [2:0] rows_fifo_cap;
input   rows_empty_n;
output   rows_read;
input  [10:0] cols_bound_per_npc_dout;
input  [2:0] cols_bound_per_npc_num_data_valid;
input  [2:0] cols_bound_per_npc_fifo_cap;
input   cols_bound_per_npc_empty_n;
output   cols_bound_per_npc_read;
input  [4:0] last_blk_width;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ldata1_read;
reg imgInput_uv_data82_write;
reg rows_read;
reg cols_bound_per_npc_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    rows_blk_n;
reg    cols_bound_per_npc_blk_n;
reg   [10:0] cols_bound_per_npc_read_reg_131;
reg   [4:0] last_blk_width_read_reg_147;
wire    ap_CS_fsm_state3;
wire   [11:0] sub_fu_96_p2;
reg   [11:0] sub_reg_154;
wire    ap_CS_fsm_state4;
wire   [6:0] sub3_fu_103_p2;
reg   [6:0] sub3_reg_159;
wire   [5:0] sub38_fu_110_p2;
reg   [5:0] sub38_reg_164;
wire   [6:0] add_ln1082_fu_117_p2;
reg   [6:0] add_ln1082_reg_169;
wire  signed [21:0] grp_fu_124_p2;
reg   [21:0] mul_ln1062_reg_174;
wire    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start;
wire    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done;
wire    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_idle;
wire    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_ready;
wire    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ldata1_read;
wire   [15:0] grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_din;
wire    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_write;
reg    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg;
wire    ap_CS_fsm_state5;
reg    ap_block_state1;
wire   [11:0] cols_bound_per_npc_cast5_fu_93_p1;
wire   [6:0] last_blk_width_cast2_fu_87_p1;
wire   [5:0] last_blk_width_cast7_fu_90_p1;
wire   [10:0] grp_fu_124_p0;
wire   [10:0] grp_fu_124_p1;
reg    grp_fu_124_ce;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire   [21:0] grp_fu_124_p00;
wire   [21:0] grp_fu_124_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg = 1'b0;
end

pp_pipeline_accel_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start),
    .ap_done(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done),
    .ap_idle(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_idle),
    .ap_ready(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_ready),
    .ldata1_dout(ldata1_dout),
    .ldata1_num_data_valid(2'd0),
    .ldata1_fifo_cap(2'd0),
    .ldata1_empty_n(ldata1_empty_n),
    .ldata1_read(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ldata1_read),
    .imgInput_uv_data82_din(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_din),
    .imgInput_uv_data82_num_data_valid(2'd0),
    .imgInput_uv_data82_fifo_cap(2'd0),
    .imgInput_uv_data82_full_n(imgInput_uv_data82_full_n),
    .imgInput_uv_data82_write(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_write),
    .mul_ln1062(mul_ln1062_reg_174),
    .sext_ln1082(sub38_reg_164),
    .cols_bound_per_npc_cast3(cols_bound_per_npc_read_reg_131),
    .sub_cast(sub_reg_154),
    .last_blk_width_load(last_blk_width_read_reg_147),
    .sub3(sub3_reg_159),
    .add_ln1082(add_ln1082_reg_169)
);

pp_pipeline_accel_mul_mul_11ns_11ns_22_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 11 ),
    .din1_WIDTH( 11 ),
    .dout_WIDTH( 22 ))
mul_mul_11ns_11ns_22_4_1_U115(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_124_p0),
    .din1(grp_fu_124_p1),
    .ce(grp_fu_124_ce),
    .dout(grp_fu_124_p2)
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
        end else if (((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg <= 1'b1;
        end else if ((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_ready == 1'b1)) begin
            grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        add_ln1082_reg_169 <= add_ln1082_fu_117_p2;
        mul_ln1062_reg_174 <= grp_fu_124_p2;
        sub38_reg_164 <= sub38_fu_110_p2;
        sub3_reg_159 <= sub3_fu_103_p2;
        sub_reg_154 <= sub_fu_96_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        cols_bound_per_npc_read_reg_131 <= cols_bound_per_npc_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        last_blk_width_read_reg_147 <= last_blk_width;
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
    if ((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
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
    if (((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
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
    if (((1'b1 == ap_CS_fsm_state5) | ((1'b1 == ap_CS_fsm_state1) & ((cols_bound_per_npc_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0))))) begin
        grp_fu_124_ce = 1'b0;
    end else begin
        grp_fu_124_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        imgInput_uv_data82_write = grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_write;
    end else begin
        imgInput_uv_data82_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ldata1_read = grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ldata1_read;
    end else begin
        ldata1_read = 1'b0;
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
            if (((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
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

assign add_ln1082_fu_117_p2 = (last_blk_width_cast2_fu_87_p1 + 7'd63);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((cols_bound_per_npc_empty_n == 1'b0) | (rows_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign cols_bound_per_npc_cast5_fu_93_p1 = cols_bound_per_npc_read_reg_131;

assign grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start = grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg;

assign grp_fu_124_p0 = grp_fu_124_p00;

assign grp_fu_124_p00 = cols_bound_per_npc_dout;

assign grp_fu_124_p1 = grp_fu_124_p10;

assign grp_fu_124_p10 = rows_dout;

assign imgInput_uv_data82_din = grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_din;

assign last_blk_width_cast2_fu_87_p1 = last_blk_width_read_reg_147;

assign last_blk_width_cast7_fu_90_p1 = last_blk_width_read_reg_147;

assign sub38_fu_110_p2 = ($signed(last_blk_width_cast7_fu_90_p1) + $signed(6'd63));

assign sub3_fu_103_p2 = ($signed(7'd64) - $signed(last_blk_width_cast2_fu_87_p1));

assign sub_fu_96_p2 = ($signed(cols_bound_per_npc_cast5_fu_93_p1) + $signed(12'd4095));

endmodule //pp_pipeline_accel_AxiStream2MatStream_2_s
