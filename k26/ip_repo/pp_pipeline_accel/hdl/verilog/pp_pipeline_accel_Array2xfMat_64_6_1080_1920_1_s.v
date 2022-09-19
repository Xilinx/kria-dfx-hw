// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// Version: 2022.1
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pp_pipeline_accel_Array2xfMat_64_6_1080_1920_1_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
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
        img_inp_uv,
        p_read,
        p_read1,
        imgInput_uv_data_din,
        imgInput_uv_data_num_data_valid,
        imgInput_uv_data_fifo_cap,
        imgInput_uv_data_full_n,
        imgInput_uv_data_write,
        p_read2
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
input  [63:0] img_inp_uv;
input  [10:0] p_read;
input  [10:0] p_read1;
output  [15:0] imgInput_uv_data_din;
input  [1:0] imgInput_uv_data_num_data_valid;
input  [1:0] imgInput_uv_data_fifo_cap;
input   imgInput_uv_data_full_n;
output   imgInput_uv_data_write;
input  [31:0] p_read2;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_gmem2_ARVALID;
reg m_axi_gmem2_RREADY;
reg imgInput_uv_data_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
wire    grp_Axi2Mat_fu_64_m_axi_gmem2_AWVALID;
wire   [63:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWADDR;
wire   [0:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWID;
wire   [31:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWLEN;
wire   [2:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWSIZE;
wire   [1:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWBURST;
wire   [1:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWLOCK;
wire   [3:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWCACHE;
wire   [2:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWPROT;
wire   [3:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWQOS;
wire   [3:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWREGION;
wire   [0:0] grp_Axi2Mat_fu_64_m_axi_gmem2_AWUSER;
wire    grp_Axi2Mat_fu_64_m_axi_gmem2_WVALID;
wire   [63:0] grp_Axi2Mat_fu_64_m_axi_gmem2_WDATA;
wire   [7:0] grp_Axi2Mat_fu_64_m_axi_gmem2_WSTRB;
wire    grp_Axi2Mat_fu_64_m_axi_gmem2_WLAST;
wire   [0:0] grp_Axi2Mat_fu_64_m_axi_gmem2_WID;
wire   [0:0] grp_Axi2Mat_fu_64_m_axi_gmem2_WUSER;
wire    grp_Axi2Mat_fu_64_m_axi_gmem2_ARVALID;
wire   [63:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARADDR;
wire   [0:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARID;
wire   [31:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARLEN;
wire   [2:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARSIZE;
wire   [1:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARBURST;
wire   [1:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARLOCK;
wire   [3:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARCACHE;
wire   [2:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARPROT;
wire   [3:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARQOS;
wire   [3:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARREGION;
wire   [0:0] grp_Axi2Mat_fu_64_m_axi_gmem2_ARUSER;
wire    grp_Axi2Mat_fu_64_m_axi_gmem2_RREADY;
wire    grp_Axi2Mat_fu_64_m_axi_gmem2_BREADY;
wire   [15:0] grp_Axi2Mat_fu_64_imgInput_uv_data82_din;
wire    grp_Axi2Mat_fu_64_imgInput_uv_data82_write;
wire    grp_Axi2Mat_fu_64_ap_start;
wire    grp_Axi2Mat_fu_64_ap_done;
wire    grp_Axi2Mat_fu_64_ap_ready;
wire    grp_Axi2Mat_fu_64_ap_idle;
reg    grp_Axi2Mat_fu_64_ap_continue;
reg    grp_Axi2Mat_fu_64_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_sync_grp_Axi2Mat_fu_64_ap_ready;
wire    ap_sync_grp_Axi2Mat_fu_64_ap_done;
reg    ap_block_state3_on_subcall_done;
reg    ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready;
reg    ap_sync_reg_grp_Axi2Mat_fu_64_ap_done;
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
#0 grp_Axi2Mat_fu_64_ap_start_reg = 1'b0;
#0 ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready = 1'b0;
#0 ap_sync_reg_grp_Axi2Mat_fu_64_ap_done = 1'b0;
end

pp_pipeline_accel_Axi2Mat grp_Axi2Mat_fu_64(
    .m_axi_gmem2_AWVALID(grp_Axi2Mat_fu_64_m_axi_gmem2_AWVALID),
    .m_axi_gmem2_AWREADY(1'b0),
    .m_axi_gmem2_AWADDR(grp_Axi2Mat_fu_64_m_axi_gmem2_AWADDR),
    .m_axi_gmem2_AWID(grp_Axi2Mat_fu_64_m_axi_gmem2_AWID),
    .m_axi_gmem2_AWLEN(grp_Axi2Mat_fu_64_m_axi_gmem2_AWLEN),
    .m_axi_gmem2_AWSIZE(grp_Axi2Mat_fu_64_m_axi_gmem2_AWSIZE),
    .m_axi_gmem2_AWBURST(grp_Axi2Mat_fu_64_m_axi_gmem2_AWBURST),
    .m_axi_gmem2_AWLOCK(grp_Axi2Mat_fu_64_m_axi_gmem2_AWLOCK),
    .m_axi_gmem2_AWCACHE(grp_Axi2Mat_fu_64_m_axi_gmem2_AWCACHE),
    .m_axi_gmem2_AWPROT(grp_Axi2Mat_fu_64_m_axi_gmem2_AWPROT),
    .m_axi_gmem2_AWQOS(grp_Axi2Mat_fu_64_m_axi_gmem2_AWQOS),
    .m_axi_gmem2_AWREGION(grp_Axi2Mat_fu_64_m_axi_gmem2_AWREGION),
    .m_axi_gmem2_AWUSER(grp_Axi2Mat_fu_64_m_axi_gmem2_AWUSER),
    .m_axi_gmem2_WVALID(grp_Axi2Mat_fu_64_m_axi_gmem2_WVALID),
    .m_axi_gmem2_WREADY(1'b0),
    .m_axi_gmem2_WDATA(grp_Axi2Mat_fu_64_m_axi_gmem2_WDATA),
    .m_axi_gmem2_WSTRB(grp_Axi2Mat_fu_64_m_axi_gmem2_WSTRB),
    .m_axi_gmem2_WLAST(grp_Axi2Mat_fu_64_m_axi_gmem2_WLAST),
    .m_axi_gmem2_WID(grp_Axi2Mat_fu_64_m_axi_gmem2_WID),
    .m_axi_gmem2_WUSER(grp_Axi2Mat_fu_64_m_axi_gmem2_WUSER),
    .m_axi_gmem2_ARVALID(grp_Axi2Mat_fu_64_m_axi_gmem2_ARVALID),
    .m_axi_gmem2_ARREADY(m_axi_gmem2_ARREADY),
    .m_axi_gmem2_ARADDR(grp_Axi2Mat_fu_64_m_axi_gmem2_ARADDR),
    .m_axi_gmem2_ARID(grp_Axi2Mat_fu_64_m_axi_gmem2_ARID),
    .m_axi_gmem2_ARLEN(grp_Axi2Mat_fu_64_m_axi_gmem2_ARLEN),
    .m_axi_gmem2_ARSIZE(grp_Axi2Mat_fu_64_m_axi_gmem2_ARSIZE),
    .m_axi_gmem2_ARBURST(grp_Axi2Mat_fu_64_m_axi_gmem2_ARBURST),
    .m_axi_gmem2_ARLOCK(grp_Axi2Mat_fu_64_m_axi_gmem2_ARLOCK),
    .m_axi_gmem2_ARCACHE(grp_Axi2Mat_fu_64_m_axi_gmem2_ARCACHE),
    .m_axi_gmem2_ARPROT(grp_Axi2Mat_fu_64_m_axi_gmem2_ARPROT),
    .m_axi_gmem2_ARQOS(grp_Axi2Mat_fu_64_m_axi_gmem2_ARQOS),
    .m_axi_gmem2_ARREGION(grp_Axi2Mat_fu_64_m_axi_gmem2_ARREGION),
    .m_axi_gmem2_ARUSER(grp_Axi2Mat_fu_64_m_axi_gmem2_ARUSER),
    .m_axi_gmem2_RVALID(m_axi_gmem2_RVALID),
    .m_axi_gmem2_RREADY(grp_Axi2Mat_fu_64_m_axi_gmem2_RREADY),
    .m_axi_gmem2_RDATA(m_axi_gmem2_RDATA),
    .m_axi_gmem2_RLAST(m_axi_gmem2_RLAST),
    .m_axi_gmem2_RID(m_axi_gmem2_RID),
    .m_axi_gmem2_RFIFONUM(m_axi_gmem2_RFIFONUM),
    .m_axi_gmem2_RUSER(m_axi_gmem2_RUSER),
    .m_axi_gmem2_RRESP(m_axi_gmem2_RRESP),
    .m_axi_gmem2_BVALID(1'b0),
    .m_axi_gmem2_BREADY(grp_Axi2Mat_fu_64_m_axi_gmem2_BREADY),
    .m_axi_gmem2_BRESP(2'd0),
    .m_axi_gmem2_BID(1'd0),
    .m_axi_gmem2_BUSER(1'd0),
    .din(img_inp_uv),
    .imgInput_uv_data82_din(grp_Axi2Mat_fu_64_imgInput_uv_data82_din),
    .imgInput_uv_data82_full_n(imgInput_uv_data_full_n),
    .imgInput_uv_data82_write(grp_Axi2Mat_fu_64_imgInput_uv_data82_write),
    .rows(p_read),
    .cols(p_read1),
    .stride(p_read2),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .stride_ap_vld(1'b1),
    .rows_ap_vld(1'b1),
    .ap_start(grp_Axi2Mat_fu_64_ap_start),
    .din_ap_vld(1'b1),
    .cols_ap_vld(1'b1),
    .ap_done(grp_Axi2Mat_fu_64_ap_done),
    .ap_ready(grp_Axi2Mat_fu_64_ap_ready),
    .ap_idle(grp_Axi2Mat_fu_64_ap_idle),
    .ap_continue(grp_Axi2Mat_fu_64_ap_continue)
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
        ap_sync_reg_grp_Axi2Mat_fu_64_ap_done <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
            ap_sync_reg_grp_Axi2Mat_fu_64_ap_done <= 1'b0;
        end else if ((grp_Axi2Mat_fu_64_ap_done == 1'b1)) begin
            ap_sync_reg_grp_Axi2Mat_fu_64_ap_done <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
            ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready <= 1'b0;
        end else if ((grp_Axi2Mat_fu_64_ap_ready == 1'b1)) begin
            ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_Axi2Mat_fu_64_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state3) & (ap_sync_grp_Axi2Mat_fu_64_ap_ready == 1'b0)))) begin
            grp_Axi2Mat_fu_64_ap_start_reg <= 1'b1;
        end else if ((grp_Axi2Mat_fu_64_ap_ready == 1'b1)) begin
            grp_Axi2Mat_fu_64_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (ap_done_reg == 1'b1))) begin
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
    if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
        grp_Axi2Mat_fu_64_ap_continue = 1'b1;
    end else begin
        grp_Axi2Mat_fu_64_ap_continue = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        imgInput_uv_data_write = grp_Axi2Mat_fu_64_imgInput_uv_data82_write;
    end else begin
        imgInput_uv_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_gmem2_ARVALID = grp_Axi2Mat_fu_64_m_axi_gmem2_ARVALID;
    end else begin
        m_axi_gmem2_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_gmem2_RREADY = grp_Axi2Mat_fu_64_m_axi_gmem2_RREADY;
    end else begin
        m_axi_gmem2_RREADY = 1'b0;
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
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state3_on_subcall_done = ((ap_sync_grp_Axi2Mat_fu_64_ap_ready & ap_sync_grp_Axi2Mat_fu_64_ap_done) == 1'b0);
end

assign ap_sync_grp_Axi2Mat_fu_64_ap_done = (grp_Axi2Mat_fu_64_ap_done | ap_sync_reg_grp_Axi2Mat_fu_64_ap_done);

assign ap_sync_grp_Axi2Mat_fu_64_ap_ready = (grp_Axi2Mat_fu_64_ap_ready | ap_sync_reg_grp_Axi2Mat_fu_64_ap_ready);

assign grp_Axi2Mat_fu_64_ap_start = grp_Axi2Mat_fu_64_ap_start_reg;

assign imgInput_uv_data_din = grp_Axi2Mat_fu_64_imgInput_uv_data82_din;

assign m_axi_gmem2_ARADDR = grp_Axi2Mat_fu_64_m_axi_gmem2_ARADDR;

assign m_axi_gmem2_ARBURST = grp_Axi2Mat_fu_64_m_axi_gmem2_ARBURST;

assign m_axi_gmem2_ARCACHE = grp_Axi2Mat_fu_64_m_axi_gmem2_ARCACHE;

assign m_axi_gmem2_ARID = grp_Axi2Mat_fu_64_m_axi_gmem2_ARID;

assign m_axi_gmem2_ARLEN = grp_Axi2Mat_fu_64_m_axi_gmem2_ARLEN;

assign m_axi_gmem2_ARLOCK = grp_Axi2Mat_fu_64_m_axi_gmem2_ARLOCK;

assign m_axi_gmem2_ARPROT = grp_Axi2Mat_fu_64_m_axi_gmem2_ARPROT;

assign m_axi_gmem2_ARQOS = grp_Axi2Mat_fu_64_m_axi_gmem2_ARQOS;

assign m_axi_gmem2_ARREGION = grp_Axi2Mat_fu_64_m_axi_gmem2_ARREGION;

assign m_axi_gmem2_ARSIZE = grp_Axi2Mat_fu_64_m_axi_gmem2_ARSIZE;

assign m_axi_gmem2_ARUSER = grp_Axi2Mat_fu_64_m_axi_gmem2_ARUSER;

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

endmodule //pp_pipeline_accel_Array2xfMat_64_6_1080_1920_1_s
