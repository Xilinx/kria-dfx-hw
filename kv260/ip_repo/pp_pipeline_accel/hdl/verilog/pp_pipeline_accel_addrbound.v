// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_addrbound (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        return_r,
        return_r_ap_vld,
        rows,
        cols
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [18:0] return_r;
output   return_r_ap_vld;
input  [21:0] rows;
input  [24:0] cols;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[18:0] return_r;
reg return_r_ap_vld;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire  signed [24:0] sub_ln997_fu_67_p2;
reg  signed [24:0] sub_ln997_reg_94;
wire    ap_CS_fsm_state2;
wire   [24:0] grp_fu_73_p2;
reg   [24:0] mul_ln997_reg_104;
wire    ap_CS_fsm_state3;
reg    ap_block_state1;
reg   [18:0] return_r_preg;
wire    ap_CS_fsm_state4;
wire   [19:0] trunc_ln997_fu_47_p1;
wire   [24:0] shl_ln_fu_51_p3;
wire   [24:0] shl_ln997_1_fu_59_p3;
wire   [24:0] add_ln997_fu_78_p2;
reg   [3:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 return_r_preg = 19'd0;
end

pp_pipeline_accel_mul_25s_25s_25_2_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 25 ),
    .din1_WIDTH( 25 ),
    .dout_WIDTH( 25 ))
mul_25s_25s_25_2_1_U267(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(sub_ln997_reg_94),
    .din1(cols),
    .ce(1'b1),
    .dout(grp_fu_73_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        return_r_preg <= 19'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            return_r_preg <= {{add_ln997_fu_78_p2[24:6]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        mul_ln997_reg_104 <= grp_fu_73_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sub_ln997_reg_94[24 : 3] <= sub_ln997_fu_67_p2[24 : 3];
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        return_r = {{add_ln997_fu_78_p2[24:6]}};
    end else begin
        return_r = return_r_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        return_r_ap_vld = 1'b1;
    end else begin
        return_r_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln997_fu_78_p2 = (mul_ln997_reg_104 + 25'd63);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign shl_ln997_1_fu_59_p3 = {{rows}, {3'd0}};

assign shl_ln_fu_51_p3 = {{trunc_ln997_fu_47_p1}, {5'd0}};

assign sub_ln997_fu_67_p2 = (shl_ln_fu_51_p3 - shl_ln997_1_fu_59_p3);

assign trunc_ln997_fu_47_p1 = rows[19:0];

always @ (posedge ap_clk) begin
    sub_ln997_reg_94[2:0] <= 3'b000;
end

endmodule //pp_pipeline_accel_addrbound
