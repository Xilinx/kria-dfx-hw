// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_Axi2AxiStream_Pipeline_VITIS_LOOP_1028_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_gmem2_AWVALID,
        m_axi_gmem2_AWREADY,
        m_axi_gmem2_AWADDR,
        m_axi_gmem2_AWID,
        m_axi_gmem2_AWLEN,
        m_axi_gmem2_AWSIZE,
        m_axi_gmem2_AWBURST,
        m_axi_gmem2_AWLOCK,
        m_axi_gmem2_AWCACHE,
        m_axi_gmem2_AWPROT,
        m_axi_gmem2_AWQOS,
        m_axi_gmem2_AWREGION,
        m_axi_gmem2_AWUSER,
        m_axi_gmem2_WVALID,
        m_axi_gmem2_WREADY,
        m_axi_gmem2_WDATA,
        m_axi_gmem2_WSTRB,
        m_axi_gmem2_WLAST,
        m_axi_gmem2_WID,
        m_axi_gmem2_WUSER,
        m_axi_gmem2_ARVALID,
        m_axi_gmem2_ARREADY,
        m_axi_gmem2_ARADDR,
        m_axi_gmem2_ARID,
        m_axi_gmem2_ARLEN,
        m_axi_gmem2_ARSIZE,
        m_axi_gmem2_ARBURST,
        m_axi_gmem2_ARLOCK,
        m_axi_gmem2_ARCACHE,
        m_axi_gmem2_ARPROT,
        m_axi_gmem2_ARQOS,
        m_axi_gmem2_ARREGION,
        m_axi_gmem2_ARUSER,
        m_axi_gmem2_RVALID,
        m_axi_gmem2_RREADY,
        m_axi_gmem2_RDATA,
        m_axi_gmem2_RLAST,
        m_axi_gmem2_RID,
        m_axi_gmem2_RFIFONUM,
        m_axi_gmem2_RUSER,
        m_axi_gmem2_RRESP,
        m_axi_gmem2_BVALID,
        m_axi_gmem2_BREADY,
        m_axi_gmem2_BRESP,
        m_axi_gmem2_BID,
        m_axi_gmem2_BUSER,
        ldata_din,
        ldata_num_data_valid,
        ldata_fifo_cap,
        ldata_full_n,
        ldata_write,
        sext_ln1028,
        cols_addrbound
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem2_AWVALID;
input   m_axi_gmem2_AWREADY;
output  [63:0] m_axi_gmem2_AWADDR;
output  [0:0] m_axi_gmem2_AWID;
output  [31:0] m_axi_gmem2_AWLEN;
output  [2:0] m_axi_gmem2_AWSIZE;
output  [1:0] m_axi_gmem2_AWBURST;
output  [1:0] m_axi_gmem2_AWLOCK;
output  [3:0] m_axi_gmem2_AWCACHE;
output  [2:0] m_axi_gmem2_AWPROT;
output  [3:0] m_axi_gmem2_AWQOS;
output  [3:0] m_axi_gmem2_AWREGION;
output  [0:0] m_axi_gmem2_AWUSER;
output   m_axi_gmem2_WVALID;
input   m_axi_gmem2_WREADY;
output  [63:0] m_axi_gmem2_WDATA;
output  [7:0] m_axi_gmem2_WSTRB;
output   m_axi_gmem2_WLAST;
output  [0:0] m_axi_gmem2_WID;
output  [0:0] m_axi_gmem2_WUSER;
output   m_axi_gmem2_ARVALID;
input   m_axi_gmem2_ARREADY;
output  [63:0] m_axi_gmem2_ARADDR;
output  [0:0] m_axi_gmem2_ARID;
output  [31:0] m_axi_gmem2_ARLEN;
output  [2:0] m_axi_gmem2_ARSIZE;
output  [1:0] m_axi_gmem2_ARBURST;
output  [1:0] m_axi_gmem2_ARLOCK;
output  [3:0] m_axi_gmem2_ARCACHE;
output  [2:0] m_axi_gmem2_ARPROT;
output  [3:0] m_axi_gmem2_ARQOS;
output  [3:0] m_axi_gmem2_ARREGION;
output  [0:0] m_axi_gmem2_ARUSER;
input   m_axi_gmem2_RVALID;
output   m_axi_gmem2_RREADY;
input  [63:0] m_axi_gmem2_RDATA;
input   m_axi_gmem2_RLAST;
input  [0:0] m_axi_gmem2_RID;
input  [8:0] m_axi_gmem2_RFIFONUM;
input  [0:0] m_axi_gmem2_RUSER;
input  [1:0] m_axi_gmem2_RRESP;
input   m_axi_gmem2_BVALID;
output   m_axi_gmem2_BREADY;
input  [1:0] m_axi_gmem2_BRESP;
input  [0:0] m_axi_gmem2_BID;
input  [0:0] m_axi_gmem2_BUSER;
output  [63:0] ldata_din;
input  [1:0] ldata_num_data_valid;
input  [1:0] ldata_fifo_cap;
input   ldata_full_n;
output   ldata_write;
input  [60:0] sext_ln1028;
input  [19:0] cols_addrbound;

reg ap_idle;
reg m_axi_gmem2_RREADY;
reg ldata_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln1028_reg_131;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1028_fu_96_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    gmem2_blk_n_R;
wire    ap_block_pp0_stage0;
reg    ldata_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [63:0] gmem2_addr_read_reg_135;
reg    ap_condition_exit_pp0_iter1_stage0;
reg   [19:0] c_V_fu_56;
wire   [19:0] c_V_2_fu_102_p2;
wire    ap_loop_init;
reg   [19:0] ap_sig_allocacmp_c_V_1;
reg    ap_block_pp0_stage0_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
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
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln1028_fu_96_p2 == 1'd0))) begin
            c_V_fu_56 <= c_V_2_fu_102_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            c_V_fu_56 <= 20'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln1028_reg_131 <= icmp_ln1028_fu_96_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1028_reg_131 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        gmem2_addr_read_reg_135 <= m_axi_gmem2_RDATA;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1028_fu_96_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1028_reg_131 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_c_V_1 = 20'd0;
    end else begin
        ap_sig_allocacmp_c_V_1 = c_V_fu_56;
    end
end

always @ (*) begin
    if (((icmp_ln1028_reg_131 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        gmem2_blk_n_R = m_axi_gmem2_RVALID;
    end else begin
        gmem2_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ldata_blk_n = ldata_full_n;
    end else begin
        ldata_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ldata_write = 1'b1;
    end else begin
        ldata_write = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1028_reg_131 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_gmem2_RREADY = 1'b1;
    end else begin
        m_axi_gmem2_RREADY = 1'b0;
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

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ldata_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln1028_reg_131 == 1'd0) & (m_axi_gmem2_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ldata_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln1028_reg_131 == 1'd0) & (m_axi_gmem2_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ldata_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln1028_reg_131 == 1'd0) & (m_axi_gmem2_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((icmp_ln1028_reg_131 == 1'd0) & (m_axi_gmem2_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (ldata_full_n == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign c_V_2_fu_102_p2 = (ap_sig_allocacmp_c_V_1 + 20'd1);

assign icmp_ln1028_fu_96_p2 = ((ap_sig_allocacmp_c_V_1 == cols_addrbound) ? 1'b1 : 1'b0);

assign ldata_din = gmem2_addr_read_reg_135;

assign m_axi_gmem2_ARADDR = 64'd0;

assign m_axi_gmem2_ARBURST = 2'd0;

assign m_axi_gmem2_ARCACHE = 4'd0;

assign m_axi_gmem2_ARID = 1'd0;

assign m_axi_gmem2_ARLEN = 32'd0;

assign m_axi_gmem2_ARLOCK = 2'd0;

assign m_axi_gmem2_ARPROT = 3'd0;

assign m_axi_gmem2_ARQOS = 4'd0;

assign m_axi_gmem2_ARREGION = 4'd0;

assign m_axi_gmem2_ARSIZE = 3'd0;

assign m_axi_gmem2_ARUSER = 1'd0;

assign m_axi_gmem2_ARVALID = 1'b0;

assign m_axi_gmem2_AWADDR = 64'd0;

assign m_axi_gmem2_AWBURST = 2'd0;

assign m_axi_gmem2_AWCACHE = 4'd0;

assign m_axi_gmem2_AWID = 1'd0;

assign m_axi_gmem2_AWLEN = 32'd0;

assign m_axi_gmem2_AWLOCK = 2'd0;

assign m_axi_gmem2_AWPROT = 3'd0;

assign m_axi_gmem2_AWQOS = 4'd0;

assign m_axi_gmem2_AWREGION = 4'd0;

assign m_axi_gmem2_AWSIZE = 3'd0;

assign m_axi_gmem2_AWUSER = 1'd0;

assign m_axi_gmem2_AWVALID = 1'b0;

assign m_axi_gmem2_BREADY = 1'b0;

assign m_axi_gmem2_WDATA = 64'd0;

assign m_axi_gmem2_WID = 1'd0;

assign m_axi_gmem2_WLAST = 1'b0;

assign m_axi_gmem2_WSTRB = 8'd0;

assign m_axi_gmem2_WUSER = 1'd0;

assign m_axi_gmem2_WVALID = 1'b0;

endmodule //pp_pipeline_accel_Axi2AxiStream_Pipeline_VITIS_LOOP_1028_1
