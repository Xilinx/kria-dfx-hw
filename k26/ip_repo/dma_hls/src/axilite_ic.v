// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
module axilite_ic(
input              clk,
input              resetn,

input              s_axi_awvalid,
output reg         s_axi_awready = 1'b0,
input    [16:0]    s_axi_awaddr,
input              s_axi_wvalid,
output reg         s_axi_wready = 1'b0,
input    [31:0]    s_axi_wdata,
input    [3:0]     s_axi_wstrb,
input              s_axi_arvalid,
output reg         s_axi_arready = 1'b0,
input    [16:0]    s_axi_araddr,
output reg         s_axi_rvalid = 1'b0,
input              s_axi_rready,
output reg  [31:0] s_axi_rdata,
output reg  [1:0]  s_axi_rresp,
output reg         s_axi_bvalid = 1'b0,
input              s_axi_bready,
output reg  [1:0]  s_axi_bresp = 2'b00,

output reg         m00_axi_awvalid = 1'b0,
input              m00_axi_awready,
output wire [16:0] m00_axi_awaddr,
output reg         m00_axi_wvalid = 1'b0,
input              m00_axi_wready,
output wire [31:0] m00_axi_wdata,
output wire [3:0]  m00_axi_wstrb,
output reg         m00_axi_arvalid = 1'b0,
input              m00_axi_arready,
output wire [16:0] m00_axi_araddr,
input              m00_axi_rvalid,
output reg         m00_axi_rready = 1'b0,
input   [31:0]     m00_axi_rdata,
input   [1:0]      m00_axi_rresp,
input              m00_axi_bvalid,
output reg         m00_axi_bready = 1'b0,
input   [1:0]      m00_axi_bresp,

output reg         m01_axi_awvalid = 1'b0,
input              m01_axi_awready,
output wire [16:0] m01_axi_awaddr,
output reg         m01_axi_wvalid = 1'b0,
input              m01_axi_wready,
output wire [31:0] m01_axi_wdata,
output wire [3:0]  m01_axi_wstrb,
output reg         m01_axi_arvalid = 1'b0,
input              m01_axi_arready,
output wire [16:0] m01_axi_araddr,
input              m01_axi_rvalid,
output reg         m01_axi_rready = 1'b0,
input   [31:0]     m01_axi_rdata,
input   [1:0]      m01_axi_rresp,
input              m01_axi_bvalid,
output reg         m01_axi_bready = 1'b0,
input   [1:0]      m01_axi_bresp

);



//AXI Write Channel
reg [1:0]  axi_wr_state = 2'b0;
reg [16:0] waddr = 17'h0;
reg [31:0] wdata = 32'h0;
reg [3:0]  wstrb = 4'h0;
localparam w_reset = 2'b00;
localparam aw_hs   = 2'b01;
localparam w_hs    = 2'b10;
localparam b_hs    = 2'b11;

reg enable_wr_ch1;
always @(posedge clk)
begin
  if (~resetn)
  begin
    axi_wr_state      <= w_reset;
    s_axi_awready     <= 1'b0;
    m00_axi_awvalid   <= 1'b0;
    m01_axi_awvalid   <= 1'b0;
    enable_wr_ch1     <= 1'b0;
    s_axi_wready      <= 1'b0;
    m00_axi_wvalid    <= 1'b0;
    m01_axi_wvalid    <= 1'b0;
    s_axi_bvalid      <= 1'b0;
    m00_axi_bready    <= 1'b0;
    m01_axi_bready    <= 1'b0;
  end
  else
  begin  //~reset
    s_axi_awready     <= 1'b0;
    m00_axi_awvalid   <= 1'b0;
    m01_axi_awvalid   <= 1'b0;

    m00_axi_wvalid    <= 1'b0;
    m01_axi_wvalid    <= 1'b0;
    s_axi_wready      <= 1'b0;

    s_axi_bvalid      <= 1'b0;
    m00_axi_bready    <= 1'b0;
    m01_axi_bready    <= 1'b0;
	
    case(axi_wr_state)

      w_reset : axi_wr_state <= aw_hs;

      aw_hs   : begin
                  if (s_axi_awvalid)
                  begin
                    waddr <= s_axi_awaddr;

                    if (s_axi_awaddr[16] && ~m01_axi_awvalid)
                    begin
                      m01_axi_awvalid <= 1'b1;
                      enable_wr_ch1 <= 1'b1;
                    end

                    if (~s_axi_awaddr[16] && ~m00_axi_awvalid)
                    begin
                      m00_axi_awvalid <= 1'b1;
                      enable_wr_ch1 <= 1'b0;
                    end

                  end
                    
                  if ((m00_axi_awvalid && m00_axi_awready) || (m01_axi_awvalid && m01_axi_awready))
                  begin
                    m00_axi_awvalid <= 1'b0;
                    m01_axi_awvalid <= 1'b0;
                    axi_wr_state  <= w_hs;
                    s_axi_awready <= 1'b1;
                  end
                end

      w_hs    : begin
                  if (s_axi_wvalid)
                  begin
                    wdata <= s_axi_wdata;
                    wstrb <= s_axi_wstrb;

                    if (enable_wr_ch1 && ~m01_axi_wvalid)
                      m01_axi_wvalid <= 1'b1;

                    if (~enable_wr_ch1 && ~m00_axi_wvalid)
                      m00_axi_wvalid <= 1'b1;					

                  end
                  				  
                  if ((m00_axi_wvalid && m00_axi_wready) || (m01_axi_wvalid && m01_axi_wready))
                  begin
                    m00_axi_wvalid <= 1'b0;
                    m01_axi_wvalid <= 1'b0;
                    s_axi_wready <= 1'b1;
                    axi_wr_state <= b_hs;
                  end
                end

      b_hs    : begin  //m*_bready tie off is fine as m*bvalid can arrive only after W handshake. 
                  if (enable_wr_ch1)
                  begin
                    s_axi_bvalid <= m01_axi_bvalid;
                    s_axi_bresp  <= m01_axi_bresp;
                  end
                  else
                  begin
                    s_axi_bvalid <= m00_axi_bvalid;
                    s_axi_bresp  <= m00_axi_bresp;
                  end
                  
                  if (s_axi_bvalid && s_axi_bready)
                  begin
                    axi_wr_state <= aw_hs;
                    s_axi_bvalid <= 1'b0;
                    if (enable_wr_ch1)
                      m01_axi_bready <= 1'b1;
                    else
                      m00_axi_bready <= 1'b1;
                  end
                end

      default : axi_wr_state <= aw_hs;
    endcase
  end  //~reset
end


assign m00_axi_awaddr = waddr;
assign m00_axi_wdata  = wdata;
assign m00_axi_wstrb  = wstrb;

assign m01_axi_awaddr = waddr;
assign m01_axi_wdata  = wdata;
assign m01_axi_wstrb  = wstrb;



//AXI Read Channel
reg [1:0]  axi_rd_state = 2'b00;
reg [16:0] raddr = 17'h0;
reg        enable_rd_ch1;

localparam r_reset   = 2'b00;
localparam ar_hs     = 2'b01;
localparam dly_state = 2'b10;
localparam r_hs      = 2'b11;


always @(posedge clk)
begin
  if (~resetn)
  begin
    raddr           <= 16'h0;
    s_axi_arready   <= 1'b0;
    m00_axi_arvalid <= 1'b0;
    m01_axi_arvalid <= 1'b0;
    enable_rd_ch1   <= 1'b0;
    m00_axi_rready  <= 1'b0;
    m01_axi_rready  <= 1'b0;
    s_axi_rvalid    <= 1'b0;
    axi_rd_state <= r_reset;
  end
  else
  begin
    s_axi_arready   <= 1'b0;
    m00_axi_arvalid <= 1'b0;
    m01_axi_arvalid <= 1'b0;

    s_axi_rvalid   <= 1'b0;
    m00_axi_rready <= 1'b0;
    m01_axi_rready <= 1'b0;

    case (axi_rd_state)

      r_reset   : axi_rd_state <= ar_hs;

      ar_hs     : begin
                    if (s_axi_arvalid)
                    begin
                      raddr <= s_axi_araddr;
                      if (s_axi_araddr[16] && ~m01_axi_arvalid)
                      begin
                        m01_axi_arvalid <= 1'b1;
                        enable_rd_ch1 <= 1'b1;
                      end
                      
                      if (~s_axi_araddr[16] && ~m00_axi_arvalid)
                      begin
                        m00_axi_arvalid <= 1'b1;
                        enable_rd_ch1 <= 1'b0;
                      end
                    end

                    if ((m00_axi_arvalid && m00_axi_arready) || (m01_axi_arvalid && m01_axi_arready))
                    begin
                      m00_axi_arvalid <= 1'b0;
                      m01_axi_arvalid <= 1'b0;
                      s_axi_arready <= 1'b1;
                      axi_rd_state <= r_hs;
                    end
                  end

      r_hs      : begin
                    if (enable_rd_ch1)
                     begin
                       s_axi_rvalid <= m01_axi_rvalid;
                       s_axi_rdata  <= m01_axi_rdata;
                       s_axi_rresp  <= m01_axi_rresp;
                     end
                     else
                     begin
                       s_axi_rvalid <= m00_axi_rvalid;
                       s_axi_rdata  <= m00_axi_rdata;
                       s_axi_rresp  <= m00_axi_rresp;
                     end
                     if (s_axi_rvalid && s_axi_rready)
                     begin
                       axi_rd_state <= ar_hs;
                       s_axi_rvalid <= 1'b0;
                       if (enable_rd_ch1)
                         m01_axi_rready <= 1'b1;
                       else
                         m00_axi_rready <= 1'b1;
                     end

                  end

      default   : axi_rd_state <= ar_hs;
    endcase
  end
end

assign m00_axi_araddr = raddr;
assign m01_axi_araddr = raddr;


endmodule
