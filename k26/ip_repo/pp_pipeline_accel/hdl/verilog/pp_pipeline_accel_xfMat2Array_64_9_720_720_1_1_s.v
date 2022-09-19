// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_xfMat2Array_64_9_720_720_1_1_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_read,
        p_read1,
        out_mat_data85_dout,
        out_mat_data85_num_data_valid,
        out_mat_data85_fifo_cap,
        out_mat_data85_empty_n,
        out_mat_data85_read,
        m_axi_gmem3_AWVALID,
        m_axi_gmem3_AWREADY,
        m_axi_gmem3_AWADDR,
        m_axi_gmem3_AWID,
        m_axi_gmem3_AWLEN,
        m_axi_gmem3_AWSIZE,
        m_axi_gmem3_AWBURST,
        m_axi_gmem3_AWLOCK,
        m_axi_gmem3_AWCACHE,
        m_axi_gmem3_AWPROT,
        m_axi_gmem3_AWQOS,
        m_axi_gmem3_AWREGION,
        m_axi_gmem3_AWUSER,
        m_axi_gmem3_WVALID,
        m_axi_gmem3_WREADY,
        m_axi_gmem3_WDATA,
        m_axi_gmem3_WSTRB,
        m_axi_gmem3_WLAST,
        m_axi_gmem3_WID,
        m_axi_gmem3_WUSER,
        m_axi_gmem3_ARVALID,
        m_axi_gmem3_ARREADY,
        m_axi_gmem3_ARADDR,
        m_axi_gmem3_ARID,
        m_axi_gmem3_ARLEN,
        m_axi_gmem3_ARSIZE,
        m_axi_gmem3_ARBURST,
        m_axi_gmem3_ARLOCK,
        m_axi_gmem3_ARCACHE,
        m_axi_gmem3_ARPROT,
        m_axi_gmem3_ARQOS,
        m_axi_gmem3_ARREGION,
        m_axi_gmem3_ARUSER,
        m_axi_gmem3_RVALID,
        m_axi_gmem3_RREADY,
        m_axi_gmem3_RDATA,
        m_axi_gmem3_RLAST,
        m_axi_gmem3_RID,
        m_axi_gmem3_RFIFONUM,
        m_axi_gmem3_RUSER,
        m_axi_gmem3_RRESP,
        m_axi_gmem3_BVALID,
        m_axi_gmem3_BREADY,
        m_axi_gmem3_BRESP,
        m_axi_gmem3_BID,
        m_axi_gmem3_BUSER,
        dstPtr_dout,
        dstPtr_num_data_valid,
        dstPtr_fifo_cap,
        dstPtr_empty_n,
        dstPtr_read,
        stride_dout,
        stride_num_data_valid,
        stride_fifo_cap,
        stride_empty_n,
        stride_read
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] p_read;
input  [31:0] p_read1;
input  [23:0] out_mat_data85_dout;
input  [1:0] out_mat_data85_num_data_valid;
input  [1:0] out_mat_data85_fifo_cap;
input   out_mat_data85_empty_n;
output   out_mat_data85_read;
output   m_axi_gmem3_AWVALID;
input   m_axi_gmem3_AWREADY;
output  [63:0] m_axi_gmem3_AWADDR;
output  [0:0] m_axi_gmem3_AWID;
output  [31:0] m_axi_gmem3_AWLEN;
output  [2:0] m_axi_gmem3_AWSIZE;
output  [1:0] m_axi_gmem3_AWBURST;
output  [1:0] m_axi_gmem3_AWLOCK;
output  [3:0] m_axi_gmem3_AWCACHE;
output  [2:0] m_axi_gmem3_AWPROT;
output  [3:0] m_axi_gmem3_AWQOS;
output  [3:0] m_axi_gmem3_AWREGION;
output  [0:0] m_axi_gmem3_AWUSER;
output   m_axi_gmem3_WVALID;
input   m_axi_gmem3_WREADY;
output  [63:0] m_axi_gmem3_WDATA;
output  [7:0] m_axi_gmem3_WSTRB;
output   m_axi_gmem3_WLAST;
output  [0:0] m_axi_gmem3_WID;
output  [0:0] m_axi_gmem3_WUSER;
output   m_axi_gmem3_ARVALID;
input   m_axi_gmem3_ARREADY;
output  [63:0] m_axi_gmem3_ARADDR;
output  [0:0] m_axi_gmem3_ARID;
output  [31:0] m_axi_gmem3_ARLEN;
output  [2:0] m_axi_gmem3_ARSIZE;
output  [1:0] m_axi_gmem3_ARBURST;
output  [1:0] m_axi_gmem3_ARLOCK;
output  [3:0] m_axi_gmem3_ARCACHE;
output  [2:0] m_axi_gmem3_ARPROT;
output  [3:0] m_axi_gmem3_ARQOS;
output  [3:0] m_axi_gmem3_ARREGION;
output  [0:0] m_axi_gmem3_ARUSER;
input   m_axi_gmem3_RVALID;
output   m_axi_gmem3_RREADY;
input  [63:0] m_axi_gmem3_RDATA;
input   m_axi_gmem3_RLAST;
input  [0:0] m_axi_gmem3_RID;
input  [8:0] m_axi_gmem3_RFIFONUM;
input  [0:0] m_axi_gmem3_RUSER;
input  [1:0] m_axi_gmem3_RRESP;
input   m_axi_gmem3_BVALID;
output   m_axi_gmem3_BREADY;
input  [1:0] m_axi_gmem3_BRESP;
input  [0:0] m_axi_gmem3_BID;
input  [0:0] m_axi_gmem3_BUSER;
input  [63:0] dstPtr_dout;
input  [3:0] dstPtr_num_data_valid;
input  [3:0] dstPtr_fifo_cap;
input   dstPtr_empty_n;
output   dstPtr_read;
input  [31:0] stride_dout;
input  [3:0] stride_num_data_valid;
input  [3:0] stride_fifo_cap;
input   stride_empty_n;
output   stride_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_mat_data85_read;
reg m_axi_gmem3_AWVALID;
reg m_axi_gmem3_WVALID;
reg m_axi_gmem3_BREADY;
reg dstPtr_read;
reg stride_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    dstPtr_blk_n;
reg    stride_blk_n;
reg   [31:0] stride_read_reg_93;
reg   [63:0] dstPtr_read_reg_98;
wire   [15:0] trunc_ln1565_fu_84_p1;
reg   [15:0] trunc_ln1565_reg_103;
wire    grp_Mat2Axi_fu_72_out_mat_data85_read;
wire    grp_Mat2Axi_fu_72_m_axi_gmem3_AWVALID;
wire   [63:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWADDR;
wire   [0:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWID;
wire   [31:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWLEN;
wire   [2:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWSIZE;
wire   [1:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWBURST;
wire   [1:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWLOCK;
wire   [3:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWCACHE;
wire   [2:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWPROT;
wire   [3:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWQOS;
wire   [3:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWREGION;
wire   [0:0] grp_Mat2Axi_fu_72_m_axi_gmem3_AWUSER;
wire    grp_Mat2Axi_fu_72_m_axi_gmem3_WVALID;
wire   [63:0] grp_Mat2Axi_fu_72_m_axi_gmem3_WDATA;
wire   [7:0] grp_Mat2Axi_fu_72_m_axi_gmem3_WSTRB;
wire    grp_Mat2Axi_fu_72_m_axi_gmem3_WLAST;
wire   [0:0] grp_Mat2Axi_fu_72_m_axi_gmem3_WID;
wire   [0:0] grp_Mat2Axi_fu_72_m_axi_gmem3_WUSER;
wire    grp_Mat2Axi_fu_72_m_axi_gmem3_ARVALID;
wire   [63:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARADDR;
wire   [0:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARID;
wire   [31:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARLEN;
wire   [2:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARSIZE;
wire   [1:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARBURST;
wire   [1:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARLOCK;
wire   [3:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARCACHE;
wire   [2:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARPROT;
wire   [3:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARQOS;
wire   [3:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARREGION;
wire   [0:0] grp_Mat2Axi_fu_72_m_axi_gmem3_ARUSER;
wire    grp_Mat2Axi_fu_72_m_axi_gmem3_RREADY;
wire    grp_Mat2Axi_fu_72_m_axi_gmem3_BREADY;
wire    grp_Mat2Axi_fu_72_ap_start;
wire    grp_Mat2Axi_fu_72_ap_done;
wire    grp_Mat2Axi_fu_72_ap_ready;
wire    grp_Mat2Axi_fu_72_ap_idle;
reg    grp_Mat2Axi_fu_72_ap_continue;
reg    grp_Mat2Axi_fu_72_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_sync_grp_Mat2Axi_fu_72_ap_ready;
wire    ap_sync_grp_Mat2Axi_fu_72_ap_done;
reg    ap_block_state3_on_subcall_done;
reg    ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready;
reg    ap_sync_reg_grp_Mat2Axi_fu_72_ap_done;
reg    ap_block_state1;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 grp_Mat2Axi_fu_72_ap_start_reg = 1'b0;
#0 ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready = 1'b0;
#0 ap_sync_reg_grp_Mat2Axi_fu_72_ap_done = 1'b0;
end

pp_pipeline_accel_Mat2Axi grp_Mat2Axi_fu_72(
    .out_mat_data85_dout(out_mat_data85_dout),
    .out_mat_data85_empty_n(out_mat_data85_empty_n),
    .out_mat_data85_read(grp_Mat2Axi_fu_72_out_mat_data85_read),
    .m_axi_gmem3_AWVALID(grp_Mat2Axi_fu_72_m_axi_gmem3_AWVALID),
    .m_axi_gmem3_AWREADY(m_axi_gmem3_AWREADY),
    .m_axi_gmem3_AWADDR(grp_Mat2Axi_fu_72_m_axi_gmem3_AWADDR),
    .m_axi_gmem3_AWID(grp_Mat2Axi_fu_72_m_axi_gmem3_AWID),
    .m_axi_gmem3_AWLEN(grp_Mat2Axi_fu_72_m_axi_gmem3_AWLEN),
    .m_axi_gmem3_AWSIZE(grp_Mat2Axi_fu_72_m_axi_gmem3_AWSIZE),
    .m_axi_gmem3_AWBURST(grp_Mat2Axi_fu_72_m_axi_gmem3_AWBURST),
    .m_axi_gmem3_AWLOCK(grp_Mat2Axi_fu_72_m_axi_gmem3_AWLOCK),
    .m_axi_gmem3_AWCACHE(grp_Mat2Axi_fu_72_m_axi_gmem3_AWCACHE),
    .m_axi_gmem3_AWPROT(grp_Mat2Axi_fu_72_m_axi_gmem3_AWPROT),
    .m_axi_gmem3_AWQOS(grp_Mat2Axi_fu_72_m_axi_gmem3_AWQOS),
    .m_axi_gmem3_AWREGION(grp_Mat2Axi_fu_72_m_axi_gmem3_AWREGION),
    .m_axi_gmem3_AWUSER(grp_Mat2Axi_fu_72_m_axi_gmem3_AWUSER),
    .m_axi_gmem3_WVALID(grp_Mat2Axi_fu_72_m_axi_gmem3_WVALID),
    .m_axi_gmem3_WREADY(m_axi_gmem3_WREADY),
    .m_axi_gmem3_WDATA(grp_Mat2Axi_fu_72_m_axi_gmem3_WDATA),
    .m_axi_gmem3_WSTRB(grp_Mat2Axi_fu_72_m_axi_gmem3_WSTRB),
    .m_axi_gmem3_WLAST(grp_Mat2Axi_fu_72_m_axi_gmem3_WLAST),
    .m_axi_gmem3_WID(grp_Mat2Axi_fu_72_m_axi_gmem3_WID),
    .m_axi_gmem3_WUSER(grp_Mat2Axi_fu_72_m_axi_gmem3_WUSER),
    .m_axi_gmem3_ARVALID(grp_Mat2Axi_fu_72_m_axi_gmem3_ARVALID),
    .m_axi_gmem3_ARREADY(1'b0),
    .m_axi_gmem3_ARADDR(grp_Mat2Axi_fu_72_m_axi_gmem3_ARADDR),
    .m_axi_gmem3_ARID(grp_Mat2Axi_fu_72_m_axi_gmem3_ARID),
    .m_axi_gmem3_ARLEN(grp_Mat2Axi_fu_72_m_axi_gmem3_ARLEN),
    .m_axi_gmem3_ARSIZE(grp_Mat2Axi_fu_72_m_axi_gmem3_ARSIZE),
    .m_axi_gmem3_ARBURST(grp_Mat2Axi_fu_72_m_axi_gmem3_ARBURST),
    .m_axi_gmem3_ARLOCK(grp_Mat2Axi_fu_72_m_axi_gmem3_ARLOCK),
    .m_axi_gmem3_ARCACHE(grp_Mat2Axi_fu_72_m_axi_gmem3_ARCACHE),
    .m_axi_gmem3_ARPROT(grp_Mat2Axi_fu_72_m_axi_gmem3_ARPROT),
    .m_axi_gmem3_ARQOS(grp_Mat2Axi_fu_72_m_axi_gmem3_ARQOS),
    .m_axi_gmem3_ARREGION(grp_Mat2Axi_fu_72_m_axi_gmem3_ARREGION),
    .m_axi_gmem3_ARUSER(grp_Mat2Axi_fu_72_m_axi_gmem3_ARUSER),
    .m_axi_gmem3_RVALID(1'b0),
    .m_axi_gmem3_RREADY(grp_Mat2Axi_fu_72_m_axi_gmem3_RREADY),
    .m_axi_gmem3_RDATA(64'd0),
    .m_axi_gmem3_RLAST(1'b0),
    .m_axi_gmem3_RID(1'd0),
    .m_axi_gmem3_RFIFONUM(9'd0),
    .m_axi_gmem3_RUSER(1'd0),
    .m_axi_gmem3_RRESP(2'd0),
    .m_axi_gmem3_BVALID(m_axi_gmem3_BVALID),
    .m_axi_gmem3_BREADY(grp_Mat2Axi_fu_72_m_axi_gmem3_BREADY),
    .m_axi_gmem3_BRESP(m_axi_gmem3_BRESP),
    .m_axi_gmem3_BID(m_axi_gmem3_BID),
    .m_axi_gmem3_BUSER(m_axi_gmem3_BUSER),
    .dout(dstPtr_read_reg_98),
    .rows(trunc_ln1565_reg_103),
    .cols(p_read1),
    .stride(stride_read_reg_93),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .dout_ap_vld(1'b1),
    .rows_ap_vld(1'b1),
    .ap_start(grp_Mat2Axi_fu_72_ap_start),
    .stride_ap_vld(1'b1),
    .cols_ap_vld(1'b1),
    .ap_done(grp_Mat2Axi_fu_72_ap_done),
    .ap_ready(grp_Mat2Axi_fu_72_ap_ready),
    .ap_idle(grp_Mat2Axi_fu_72_ap_idle),
    .ap_continue(grp_Mat2Axi_fu_72_ap_continue)
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
        end else if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_Mat2Axi_fu_72_ap_done <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
            ap_sync_reg_grp_Mat2Axi_fu_72_ap_done <= 1'b0;
        end else if ((grp_Mat2Axi_fu_72_ap_done == 1'b1)) begin
            ap_sync_reg_grp_Mat2Axi_fu_72_ap_done <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
            ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready <= 1'b0;
        end else if ((grp_Mat2Axi_fu_72_ap_ready == 1'b1)) begin
            ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Mat2Axi_fu_72_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state3) & (ap_sync_grp_Mat2Axi_fu_72_ap_ready == 1'b0)))) begin
            grp_Mat2Axi_fu_72_ap_start_reg <= 1'b1;
        end else if ((grp_Mat2Axi_fu_72_ap_ready == 1'b1)) begin
            grp_Mat2Axi_fu_72_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        dstPtr_read_reg_98 <= dstPtr_dout;
        stride_read_reg_93 <= stride_dout;
        trunc_ln1565_reg_103 <= trunc_ln1565_fu_84_p1;
    end
end

always @ (*) begin
    if (((dstPtr_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1) | (stride_empty_n == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state3_on_subcall_done)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
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
    if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        dstPtr_blk_n = dstPtr_empty_n;
    end else begin
        dstPtr_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((dstPtr_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1) | (stride_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        dstPtr_read = 1'b1;
    end else begin
        dstPtr_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
        grp_Mat2Axi_fu_72_ap_continue = 1'b1;
    end else begin
        grp_Mat2Axi_fu_72_ap_continue = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_gmem3_AWVALID = grp_Mat2Axi_fu_72_m_axi_gmem3_AWVALID;
    end else begin
        m_axi_gmem3_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_gmem3_BREADY = grp_Mat2Axi_fu_72_m_axi_gmem3_BREADY;
    end else begin
        m_axi_gmem3_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_gmem3_WVALID = grp_Mat2Axi_fu_72_m_axi_gmem3_WVALID;
    end else begin
        m_axi_gmem3_WVALID = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        out_mat_data85_read = grp_Mat2Axi_fu_72_out_mat_data85_read;
    end else begin
        out_mat_data85_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        stride_blk_n = stride_empty_n;
    end else begin
        stride_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((dstPtr_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1) | (stride_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        stride_read = 1'b1;
    end else begin
        stride_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((dstPtr_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1) | (stride_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((dstPtr_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1) | (stride_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state3_on_subcall_done = ((ap_sync_grp_Mat2Axi_fu_72_ap_ready & ap_sync_grp_Mat2Axi_fu_72_ap_done) == 1'b0);
end

assign ap_sync_grp_Mat2Axi_fu_72_ap_done = (grp_Mat2Axi_fu_72_ap_done | ap_sync_reg_grp_Mat2Axi_fu_72_ap_done);

assign ap_sync_grp_Mat2Axi_fu_72_ap_ready = (grp_Mat2Axi_fu_72_ap_ready | ap_sync_reg_grp_Mat2Axi_fu_72_ap_ready);

assign grp_Mat2Axi_fu_72_ap_start = grp_Mat2Axi_fu_72_ap_start_reg;

assign m_axi_gmem3_ARADDR = 64'd0;

assign m_axi_gmem3_ARBURST = 2'd0;

assign m_axi_gmem3_ARCACHE = 4'd0;

assign m_axi_gmem3_ARID = 1'd0;

assign m_axi_gmem3_ARLEN = 32'd0;

assign m_axi_gmem3_ARLOCK = 2'd0;

assign m_axi_gmem3_ARPROT = 3'd0;

assign m_axi_gmem3_ARQOS = 4'd0;

assign m_axi_gmem3_ARREGION = 4'd0;

assign m_axi_gmem3_ARSIZE = 3'd0;

assign m_axi_gmem3_ARUSER = 1'd0;

assign m_axi_gmem3_ARVALID = 1'b0;

assign m_axi_gmem3_AWADDR = grp_Mat2Axi_fu_72_m_axi_gmem3_AWADDR;

assign m_axi_gmem3_AWBURST = grp_Mat2Axi_fu_72_m_axi_gmem3_AWBURST;

assign m_axi_gmem3_AWCACHE = grp_Mat2Axi_fu_72_m_axi_gmem3_AWCACHE;

assign m_axi_gmem3_AWID = grp_Mat2Axi_fu_72_m_axi_gmem3_AWID;

assign m_axi_gmem3_AWLEN = grp_Mat2Axi_fu_72_m_axi_gmem3_AWLEN;

assign m_axi_gmem3_AWLOCK = grp_Mat2Axi_fu_72_m_axi_gmem3_AWLOCK;

assign m_axi_gmem3_AWPROT = grp_Mat2Axi_fu_72_m_axi_gmem3_AWPROT;

assign m_axi_gmem3_AWQOS = grp_Mat2Axi_fu_72_m_axi_gmem3_AWQOS;

assign m_axi_gmem3_AWREGION = grp_Mat2Axi_fu_72_m_axi_gmem3_AWREGION;

assign m_axi_gmem3_AWSIZE = grp_Mat2Axi_fu_72_m_axi_gmem3_AWSIZE;

assign m_axi_gmem3_AWUSER = grp_Mat2Axi_fu_72_m_axi_gmem3_AWUSER;

assign m_axi_gmem3_RREADY = 1'b0;

assign m_axi_gmem3_WDATA = grp_Mat2Axi_fu_72_m_axi_gmem3_WDATA;

assign m_axi_gmem3_WID = grp_Mat2Axi_fu_72_m_axi_gmem3_WID;

assign m_axi_gmem3_WLAST = grp_Mat2Axi_fu_72_m_axi_gmem3_WLAST;

assign m_axi_gmem3_WSTRB = grp_Mat2Axi_fu_72_m_axi_gmem3_WSTRB;

assign m_axi_gmem3_WUSER = grp_Mat2Axi_fu_72_m_axi_gmem3_WUSER;

assign trunc_ln1565_fu_84_p1 = p_read[15:0];

endmodule //pp_pipeline_accel_xfMat2Array_64_9_720_720_1_1_s
