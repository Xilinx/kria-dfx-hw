// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
`timescale 1 ns / 1 ps

module siha_manager
#(
  NUM_RP_SLOTS = 2,
  NUM_REG_PER_SLOT = 4
)
(
input                               clk,
input                               resetn,
input                               shellClkLocked,
input                               rp0ClkLocked,
input                               rp1ClkLocked,
input                               rp2ClkLocked,
input                               rp3ClkLocked,
input                               rp4ClkLocked,
input                               rp5ClkLocked,
input                               rp6ClkLocked,
input                               rp7ClkLocked,
input                               rp8ClkLocked,
input                               rp0_decouple_status,
input                               rp1_decouple_status,
input                               rp2_decouple_status,
input                               rp3_decouple_status,
input                               rp4_decouple_status,
input                               rp5_decouple_status,
input                               rp6_decouple_status,
input                               rp7_decouple_status,
input                               rp8_decouple_status,
//Input AXI
input  [15:0]                       s_axi_awaddr, //64 KB address space
input                               s_axi_awvalid,
output reg                          s_axi_awready,

input  [31:0]                       s_axi_wdata,
input  [3:0]                        s_axi_wstrb,
input                               s_axi_wvalid,
output reg                          s_axi_wready,

output reg [1:0]                    s_axi_bresp = 2'b00,
output reg                          s_axi_bvalid,
input                               s_axi_bready,

input  [15:0]                       s_axi_araddr, //64 KB address space
input                               s_axi_arvalid,
output reg                          s_axi_arready,

output reg [31:0]                   s_axi_rdata,
output reg  [1:0]                   s_axi_rresp = 2'b00,
output reg                          s_axi_rvalid,
input                               s_axi_rready,

output wire                         slot0_clken,
output wire                         slot1_clken,
output wire                         slot2_clken,
output wire                         slot3_clken,
output wire                         slot4_clken,
output wire                         slot5_clken,
output wire                         slot6_clken,
output wire                         slot7_clken,
output wire                         slot8_clken,

output wire                         slot0_resetn,
output wire                         slot1_resetn,
output wire                         slot2_resetn,
output wire                         slot3_resetn,
output wire                         slot4_resetn,
output wire                         slot5_resetn,
output wire                         slot6_resetn,
output wire                         slot7_resetn,
output wire                         slot8_resetn,

output  wire [3:0]                  AxCACHE0,
output  wire [3:0]                  AxCACHE1,
output  wire [3:0]                  AxCACHE2,
output  wire [3:0]                  AxCACHE3,
output  wire [3:0]                  AxCACHE4,
output  wire [3:0]                  AxCACHE5,
output  wire [3:0]                  AxCACHE6,
output  wire [3:0]                  AxCACHE7,
output  wire [3:0]                  AxCACHE8,

output  wire [2:0]                  AxPROT0,
output  wire [2:0]                  AxPROT1,
output  wire [2:0]                  AxPROT2,
output  wire [2:0]                  AxPROT3,
output  wire [2:0]                  AxPROT4,
output  wire [2:0]                  AxPROT5,
output  wire [2:0]                  AxPROT6,
output  wire [2:0]                  AxPROT7,
output  wire [2:0]                  AxPROT8 //,
);

localparam MAX_RP_SLOTS = 9;

wire [MAX_RP_SLOTS-1:0]    clkenInt;
wire [MAX_RP_SLOTS-1:0]    resetInt;
wire [MAX_RP_SLOTS*4-1:0]  AxCACHEInt;
wire [MAX_RP_SLOTS*3-1:0]  AxPROTInt;

assign slot0_clken  = clkenInt[0];
assign slot1_clken  = clkenInt[1];
assign slot2_clken  = clkenInt[2];
assign slot3_clken  = clkenInt[3];
assign slot4_clken  = clkenInt[4];
assign slot5_clken  = clkenInt[5];
assign slot6_clken  = clkenInt[6];
assign slot7_clken  = clkenInt[7];
assign slot8_clken  = clkenInt[8];

assign slot0_resetn  = resetInt[0];
assign slot1_resetn  = resetInt[1];
assign slot2_resetn  = resetInt[2];
assign slot3_resetn  = resetInt[3];
assign slot4_resetn  = resetInt[4];
assign slot5_resetn  = resetInt[5];
assign slot6_resetn  = resetInt[6];
assign slot7_resetn  = resetInt[7];
assign slot8_resetn  = resetInt[8];

assign AxCACHE0  = AxCACHEInt[3:0];
assign AxCACHE1  = AxCACHEInt[7:4];
assign AxCACHE2  = AxCACHEInt[11:8];
assign AxCACHE3  = AxCACHEInt[15:12];
assign AxCACHE4  = AxCACHEInt[19:16];
assign AxCACHE5  = AxCACHEInt[23:20];
assign AxCACHE6  = AxCACHEInt[27:24];
assign AxCACHE7  = AxCACHEInt[31:28];
assign AxCACHE8  = AxCACHEInt[35:32];

assign AxPROT0  = AxPROTInt[2:0];
assign AxPROT1  = AxPROTInt[5:3];
assign AxPROT2  = AxPROTInt[8:6];
assign AxPROT3  = AxPROTInt[11:9];
assign AxPROT4  = AxPROTInt[14:12];
assign AxPROT5  = AxPROTInt[17:15];
assign AxPROT6  = AxPROTInt[20:18];
assign AxPROT7  = AxPROTInt[23:21];
assign AxPROT8  = AxPROTInt[26:24];

localparam REG_WIDTH = 32;
localparam CONFIGRAM_DEPTH = 1024;

reg [REG_WIDTH-1:0] RegBits [NUM_RP_SLOTS*NUM_REG_PER_SLOT-1:0];
//reg [8:0] decouple_status_r0 = 0;
//reg [8:0] decouple_status_r1 = 0;
wire [8:0] decouple_status;

//Registers         Addr
//ClkCtrlReg    -   0x0
//ResetCtrlReg  -   0x4
//CacheCtrlReg  -   0x8
//ProtCtrlReg   -   0xC
//Slot 1 Offset  = 0x1000
//Slot 2 Offset  = 0x2000
//Slot 12 Offset = 0xC000

//AXI Write Channel
reg [1:0] axi_wr_state = 0;
reg [15:0] waddr = 0;
reg [7:0]  awlen = 0;
reg [7:0]  WrBeatCounter = 0;
localparam w_reset = 2'b00;
localparam aw_hs   = 2'b01;
localparam w_hs    = 2'b10;
localparam b_hs    = 2'b11;

always @(posedge clk)
begin
  if (~resetn)
  begin
    axi_wr_state <= w_reset;
    waddr        <= 16'h0;
    awlen        <= 8'h0;
  end
  else
  begin  //~reset
    case(axi_wr_state)
      
      w_reset : axi_wr_state <= aw_hs;

      aw_hs   : if (s_axi_awvalid && s_axi_awready)
                begin
                  waddr <= s_axi_awaddr;
                  axi_wr_state <= w_hs;
                end

      w_hs    : if (s_axi_wvalid && s_axi_wready)
                begin
                    axi_wr_state <= b_hs;
                end

      b_hs    : if (s_axi_bvalid && s_axi_bready)
                  axi_wr_state <= aw_hs;

      default : axi_wr_state <= aw_hs;
    endcase
  end  //~reset
end

always @(*)
begin
  s_axi_awready <= 1'b0;
  s_axi_wready  <= 1'b0;
  s_axi_bvalid  <= 1'b0;
  case (axi_wr_state)
    aw_hs   : s_axi_awready <= 1'b1;
    w_hs    : s_axi_wready  <= 1'b1;
    b_hs    : s_axi_bvalid  <= 1'b1;
  endcase
end

wire [15:0] WrAddrRegBits;
assign WrAddrRegBits = (waddr[15:12]-1)*NUM_REG_PER_SLOT + waddr[11:2];
genvar ii, jj;
generate
    for (ii = 0; ii < NUM_RP_SLOTS; ii = ii + 1) begin : SlotSel
      for (jj = 0; jj < NUM_REG_PER_SLOT; jj = jj + 1) begin : RegSel

        always @(posedge clk)
        begin
          if (~resetn)
          begin
            RegBits[ii*NUM_REG_PER_SLOT + jj] <= {REG_WIDTH{1'b0}};
          end
          else if (s_axi_wvalid && s_axi_wready && (ii == waddr[15:12]-4'd4) && (jj == waddr[11:2]))
          begin
            RegBits[ii*NUM_REG_PER_SLOT + jj][ 7: 0] <= s_axi_wstrb[0] ? s_axi_wdata[ 7: 0] : RegBits[ii*NUM_REG_PER_SLOT + jj][ 7: 0];
            RegBits[ii*NUM_REG_PER_SLOT + jj][15: 8] <= s_axi_wstrb[1] ? s_axi_wdata[15: 8] : RegBits[ii*NUM_REG_PER_SLOT + jj][15: 8];
            RegBits[ii*NUM_REG_PER_SLOT + jj][23:16] <= s_axi_wstrb[2] ? s_axi_wdata[23:16] : RegBits[ii*NUM_REG_PER_SLOT + jj][23:16];
            RegBits[ii*NUM_REG_PER_SLOT + jj][31:24] <= s_axi_wstrb[3] ? s_axi_wdata[31:24] : RegBits[ii*NUM_REG_PER_SLOT + jj][31:24];
          end //reset
        end  //always

   end //for jj

      assign clkenInt[ii] = RegBits[ii*NUM_REG_PER_SLOT][0];
      assign resetInt[ii] = RegBits[ii*NUM_REG_PER_SLOT + 1][0];
      assign AxCACHEInt[(ii+1)*4-1:ii*4] = RegBits[ii*NUM_REG_PER_SLOT + 2][3:0];
      assign AxPROTInt[(ii+1)*3-1:ii*3] = RegBits[ii*NUM_REG_PER_SLOT + 3][2:0];

   end //for ii
endgenerate

//AXI Read Channel
reg [1:0]  axi_rd_state = 0;
reg [15:0] raddr;
reg [7:0]  arlen;
reg [7:0]  RdBeatCounter;

localparam r_reset   = 2'b00;
localparam ar_hs     = 2'b01;
localparam dly_state = 2'b10;
localparam r_hs      = 2'b11;

always @(posedge clk)
begin
  if (~resetn)
  begin
    raddr <= 16'h0;
    arlen <= 8'h0;
    axi_rd_state <= r_reset;
  end
  else
  begin
    case (axi_rd_state)

      r_reset   : axi_rd_state <= ar_hs;

      ar_hs     : if (s_axi_arvalid && s_axi_arready)
                  begin
                    raddr <= s_axi_araddr;
                    axi_rd_state <= dly_state;
                  end

      dly_state : axi_rd_state <= r_hs;

      r_hs      : if (s_axi_rvalid && s_axi_rready)
                  begin
                      axi_rd_state <= ar_hs;
                  end

      default   : axi_rd_state <= ar_hs;
    endcase
  end
end

always @(*)
begin
  s_axi_arready <= 1'b0;
  s_axi_rvalid  <= 1'b0;
  case (axi_rd_state)
    ar_hs    : s_axi_arready <= 1'b1;
     r_hs    : begin
                 s_axi_rvalid <= 1'b1;
               end
  endcase
end

wire [31:0] spo;
dist_mem_gen_0 ShellConfigRAM (
  .a(raddr[11:2]),      // input wire [9 : 0] a
  .spo(spo)  // output wire [31 : 0] spo
);


assign   decouple_status = {rp8_decouple_status, rp7_decouple_status, rp6_decouple_status, rp5_decouple_status, rp4_decouple_status, rp3_decouple_status, rp2_decouple_status, rp1_decouple_status, rp0_decouple_status};

genvar kk, ll;
wire [15:0] RdAddrRegBits;
assign RdAddrRegBits = (raddr[15:12]-4'd4)*NUM_REG_PER_SLOT + raddr[11:2];
generate
    always @(posedge clk)
    begin
      if (~resetn)
        s_axi_rdata <= 32'h0;
      else
      begin
        if (raddr[15:12] == 4'h0)
          s_axi_rdata <= spo;
        else if ((raddr[15:12] == 4'h3) && (raddr[11:2] == 10'h0))
          s_axi_rdata <= {7'b0, decouple_status, 6'b0, rp8ClkLocked, rp7ClkLocked, rp6ClkLocked, rp5ClkLocked, rp4ClkLocked, rp3ClkLocked, rp2ClkLocked, rp1ClkLocked, rp0ClkLocked, shellClkLocked};
        else if (raddr[15:12] >= 4'd4)
          s_axi_rdata <= RegBits[RdAddrRegBits];
        else
          s_axi_rdata <= 128'h0;
      end //reset
    end  //always
endgenerate

endmodule
