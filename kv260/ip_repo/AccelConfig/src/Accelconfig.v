`timescale 1 ns / 1 ps

`define NON_NEG_MSb(a) (((a) > 0) ? ((a)-1) : 0)
`define NON_NEG_DIV32(a) (((a) > 0) ? (((a)-1)/32)+1 : 0)

//HAS_AP_CTRL_HS - Decides if AP_CTRL_HS ports are generated.
//PARSE_AXIS_TID: 0 - tid parsing is not enabled. axis_in connected to tid0_axis port. No other axis ports or scalar ports supported.
//                    1 - tid parsing is enabled. tid0-7 axis ports and 
//tid 0   - Used for data. Always present.
//tid 1   - Used to generate scalar data or axis data with tid=1.
//          If scalar is enabled then axis port cannot be used for tid1_axis_tdata
//          8 scalar ports are supported. Width of each scalar port should be multiple of 32.
//tid2-7  - Used as axis ports only.
module AccelConfig
#(
  HAS_AP_CTRL_HS = 1,
  PARSE_AXIS_TID = 1,
//  NUM_TIDS_USED = 2,
//  HAS_SCALAR_OUTPUT = 1,
  NUM_SCALAR_PORTS = 1,
//  SCALAR_HAS_HS = 0,
  SCALAR1_WIDTH = 32,
  SCALAR2_WIDTH = 0,
  SCALAR3_WIDTH = 0,
  SCALAR4_WIDTH = 0,
  SCALAR5_WIDTH = 0,
  SCALAR6_WIDTH = 0,
  SCALAR7_WIDTH = 0,
  SCALAR8_WIDTH = 0,
  HAS_TID1_AXIS_OUTPUT = 0,
  HAS_TID2_AXIS_OUTPUT = 1,
  HAS_TID3_AXIS_OUTPUT = 0,
  HAS_TID4_AXIS_OUTPUT = 0,
  HAS_TID5_AXIS_OUTPUT = 0,
  HAS_TID6_AXIS_OUTPUT = 0,
  HAS_TID7_AXIS_OUTPUT = 0
//  ACCEL_VER = 32'h0001_0000,
//  ACCEL_COMPATIBLE_SHELL = 1,
//  ACCEL_SLOT = 1,
//  ACCEL_FMAX_MHZ = 32'd300
  )
(
input                              clk,
input                              resetn,
                                   
//Input AXIS                       
input   [127:0]                    axis_in_tdata,
input   [15:0]                     axis_in_tkeep,
input   [7:0]                      axis_in_tid, 
input   [7:0]                      axis_in_tdest,
input   [7:0]                      axis_in_tuser,
input                              axis_in_tvalid,
input                              axis_in_tlast,
output wire                        axis_in_tready,

//Output AXIS - data
output reg [127:0]                 tid0_axis_tdata,
output reg [15:0]                  tid0_axis_tkeep,
output reg [7:0]                   tid0_axis_tid,
output reg [7:0]                   tid0_axis_tdest,
output reg [7:0]                   tid0_axis_tuser,
output reg                         tid0_axis_tvalid,
output reg                         tid0_axis_tlast,
input                              tid0_axis_tready,

//Output AXIS - ctrl
output reg [127:0]                 tid1_axis_tdata,
output reg [15:0]                  tid1_axis_tkeep,
output reg [7:0]                   tid1_axis_tid,
output reg [7:0]                   tid1_axis_tdest,
output reg [7:0]                   tid1_axis_tuser,
output reg                         tid1_axis_tvalid,
output reg                         tid1_axis_tlast,
input                              tid1_axis_tready,

output reg  [127:0]                tid2_axis_tdata,
output reg  [15:0]                 tid2_axis_tkeep,
output reg  [7:0]                  tid2_axis_tid,
output reg  [7:0]                  tid2_axis_tdest,
output reg  [7:0]                  tid2_axis_tuser,
output reg                         tid2_axis_tvalid,
output reg                         tid2_axis_tlast,
input                              tid2_axis_tready,
       
output reg [127:0]                 tid3_axis_tdata,
output reg [15:0]                  tid3_axis_tkeep,
output reg [7:0]                   tid3_axis_tid,
output reg [7:0]                   tid3_axis_tdest,
output reg [7:0]                   tid3_axis_tuser,
output reg                         tid3_axis_tvalid,
output reg                         tid3_axis_tlast,
input                              tid3_axis_tready,
       
output reg [127:0]                 tid4_axis_tdata,
output reg [15:0]                  tid4_axis_tkeep,
output reg [7:0]                   tid4_axis_tid,
output reg [7:0]                   tid4_axis_tdest,
output reg [7:0]                   tid4_axis_tuser,
output reg                         tid4_axis_tvalid,
output reg                         tid4_axis_tlast,
input                              tid4_axis_tready,
       
output reg [127:0]                 tid5_axis_tdata,
output reg [15:0]                  tid5_axis_tkeep,
output reg [7:0]                   tid5_axis_tid,
output reg [7:0]                   tid5_axis_tdest,
output reg [7:0]                   tid5_axis_tuser,
output reg                         tid5_axis_tvalid,
output reg                         tid5_axis_tlast,
input                              tid5_axis_tready,
       
output reg [127:0]                 tid6_axis_tdata,
output reg [15:0]                  tid6_axis_tkeep,
output reg [7:0]                   tid6_axis_tid,
output reg [7:0]                   tid6_axis_tdest,
output reg [7:0]                   tid6_axis_tuser,
output reg                         tid6_axis_tvalid,
output reg                         tid6_axis_tlast,
input                              tid6_axis_tready,
       
output reg [127:0]                 tid7_axis_tdata,
output reg [15:0]                  tid7_axis_tkeep,
output reg [7:0]                   tid7_axis_tid,
output reg [7:0]                   tid7_axis_tdest,
output reg [7:0]                   tid7_axis_tuser,
output reg                         tid7_axis_tvalid,
output reg                         tid7_axis_tlast,
input                              tid7_axis_tready,

//Input AXI
input  [15:0]                      s_axi_ctrl_awaddr, //64 KB address space
input                              s_axi_ctrl_awvalid,
output reg                         s_axi_ctrl_awready,
                                   
input  [31:0]                      s_axi_ctrl_wdata,
input  [3:0]                       s_axi_ctrl_wstrb,
input                              s_axi_ctrl_wvalid,
output reg                         s_axi_ctrl_wready,
                                   
output reg [1:0]                   s_axi_ctrl_bresp = 2'b00,
output reg                         s_axi_ctrl_bvalid,
input                              s_axi_ctrl_bready,
                                   
input  [15:0]                      s_axi_ctrl_araddr, //64 KB address space
input                              s_axi_ctrl_arvalid,
output reg                         s_axi_ctrl_arready,
                                   
output reg [31:0]                  s_axi_ctrl_rdata,
output reg  [1:0]                  s_axi_ctrl_rresp = 2'b00,
output reg                         s_axi_ctrl_rvalid,
input                              s_axi_ctrl_rready,

output [`NON_NEG_MSb(SCALAR1_WIDTH):0] scalar1,
output [`NON_NEG_MSb(SCALAR2_WIDTH):0] scalar2,
output [`NON_NEG_MSb(SCALAR3_WIDTH):0] scalar3,
output [`NON_NEG_MSb(SCALAR4_WIDTH):0] scalar4,
output [`NON_NEG_MSb(SCALAR5_WIDTH):0] scalar5,
output [`NON_NEG_MSb(SCALAR6_WIDTH):0] scalar6,
output [`NON_NEG_MSb(SCALAR7_WIDTH):0] scalar7,
output [`NON_NEG_MSb(SCALAR8_WIDTH):0] scalar8,

//output reg                           scalar1_tvalid,
//input  wire                          scalar1_tready,
//output reg                           scalar2_tvalid,
//input  wire                          scalar2_tready,
//output reg                           scalar3_tvalid,
//input  wire                          scalar3_tready,
//output reg                           scalar4_tvalid,
//input  wire                          scalar4_tready,
//output reg                           scalar5_tvalid,
//input  wire                          scalar5_tready,
//output reg                           scalar6_tvalid,
//input  wire                          scalar6_tready,
//output reg                           scalar7_tvalid,
//input  wire                          scalar7_tready,
//output reg                           scalar8_tvalid,
//input  wire                          scalar8_tready,

output wire                          AccelStart,
input                                AccelDone,
input                                AccelIdle,
input                                AccelReady,
//output                               RMDataSource,

input                                s2mmDone,
input                                mm2sDone,
//input                                RMHang,

output [0:0]                         interrupt


);

//Madagascar registers
//reg [31:0]   VersionReg = ACCEL_VER;                //Addr 0x0 - RO [31:16]-Major version, [15:0]-minor version
//reg [31:0]   CompShellTypeReg = ACCEL_COMPATIBLE_SHELL;  //Addr 0x
//reg [31:0]   AccelSlotReg = ACCEL_SLOT;                 //Addr 0x
//reg [31:0]   FMaxReg = ACCEL_FMAX_MHZ;                  //Addr 0x
//reg [31:0]   SupportedDataMoverReg = 0;                 //Addr 0x
//reg [31:0]   CtrlReg    = 0;                            //Addr 0x20

// 0x00 : Control Reg
//        bit 0  - AccelStart (Read/Write/COH)
//        bit 1  - AccelDone (Read/COR)
//        bit 2  - AccelIdle (Read)
//        bit 3  - AccelReady (Read)
//        bit 7  - AutoRestartAccel (Read/Write)
// 0x04 : Global Interrupt Enable Reg (Read/Write)
// 0x08 : Interrupt Enable Reg (Read/Write)
//        bit 0  - AccelDone  (Read/Write)
//        bit 1  - Reserved
//        bit 2  - s2mm Done  (Read/Write)
//        bit 3  - Reserved
//        bit 4  - mm2s Done  (Read/Write)
//        bit 5  - Reserved
//        bit 6  - RM Hang    (Read/Write)
// 0x0C : Status Reg (Clear On Read)
//        bit 0  - AccelDone  
//        bit 1  - Reserved
//        bit 2  - s2mm Done  
//        bit 3  - Reserved
//        bit 4  - mm2s Done  
//        bit 5  - Reserved
//        bit 6  - RM Hang    
// 0x10 - RM data source. Not implemented.
//        bit 0 - RM data source (Read/Write)
//                0 - DMA mm2s data is fed to Accel input
//                1 - axiwr_to_axis data is fed to Accel input


//Accel specific registers
localparam NUM_CONFIG_REGS = `NON_NEG_DIV32(SCALAR1_WIDTH)+
                             `NON_NEG_DIV32(SCALAR2_WIDTH)+
                             `NON_NEG_DIV32(SCALAR3_WIDTH)+
                             `NON_NEG_DIV32(SCALAR4_WIDTH)+
                             `NON_NEG_DIV32(SCALAR5_WIDTH)+
                             `NON_NEG_DIV32(SCALAR6_WIDTH)+
                             `NON_NEG_DIV32(SCALAR7_WIDTH)+
                             `NON_NEG_DIV32(SCALAR8_WIDTH);
reg [31:0] configRegister [0:`NON_NEG_MSb(NUM_CONFIG_REGS)];

reg RMHang = 0;

//AXI Write Channel
reg [1:0] axi_wr_state = 0;
reg [15:0] waddr = 0;
//reg [7:0]  awlen = 0;
//reg [7:0]  WrBeatCounter = 0;
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
//    awlen        <= 8'h0;
  end
  else
  begin  //~reset
    case(axi_wr_state)
      
      w_reset : axi_wr_state <= aw_hs;

      aw_hs   : if (s_axi_ctrl_awvalid && s_axi_ctrl_awready)
                begin
                  waddr <= s_axi_ctrl_awaddr;
                  axi_wr_state <= w_hs;
                end

      w_hs    : if (s_axi_ctrl_wvalid && s_axi_ctrl_wready)
                begin
                    axi_wr_state <= b_hs;
                end

      b_hs    : if (s_axi_ctrl_bvalid && s_axi_ctrl_bready)
                  axi_wr_state <= aw_hs;

      default : axi_wr_state <= aw_hs;
    endcase
  end  //~reset
end

always @(*)
begin
  s_axi_ctrl_awready <= 1'b0;
  s_axi_ctrl_wready  <= 1'b0;
  s_axi_ctrl_bvalid  <= 1'b0;
  case (axi_wr_state)
    aw_hs   : s_axi_ctrl_awready <= 1'b1;
    w_hs    : s_axi_ctrl_wready  <= 1'b1;
    b_hs    : s_axi_ctrl_bvalid  <= 1'b1;
  endcase
end

//AXI Read Channel
reg [1:0]  axi_rd_state = 0;
reg [15:0] raddr;
//reg [7:0]  arlen;
//reg [7:0]  RdBeatCounter;

localparam r_reset   = 2'b00;
localparam ar_hs     = 2'b01;
localparam dly_state = 2'b10;
localparam r_hs      = 2'b11;

always @(posedge clk)
begin
  if (~resetn)
  begin
    raddr <= 16'h0;
//    arlen <= 8'h0;
    axi_rd_state <= r_reset;
  end
  else
  begin
    case (axi_rd_state)

      r_reset   : axi_rd_state <= ar_hs;

      ar_hs     : if (s_axi_ctrl_arvalid && s_axi_ctrl_arready)
                  begin
                    raddr <= s_axi_ctrl_araddr;

                    axi_rd_state <= dly_state;
                  end

      dly_state : axi_rd_state <= r_hs;

      r_hs      : if (s_axi_ctrl_rvalid && s_axi_ctrl_rready)
                  begin
                      axi_rd_state <= ar_hs;
                  end

      default   : axi_rd_state <= ar_hs;
    endcase
  end
end

always @(*)
begin
  s_axi_ctrl_arready <= 1'b0;
  s_axi_ctrl_rvalid  <= 1'b0;
//  s_axi_ctrl_rlast   <= 1'b0;
  case (axi_rd_state)
    ar_hs    : s_axi_ctrl_arready <= 1'b1;
     r_hs    : begin
                 s_axi_ctrl_rvalid <= 1'b1;
               end
  endcase
end

reg AccelStartReg     = 0;
reg AccelDoneReg      = 0;
reg AccelIdleReg      = 0;
reg AccelReadyReg     = 0;
reg AutoRestartAccel  = 0;
reg GlobalIER         = 0;
reg AccelDoneIER      = 0;
reg s2mmDoneIER       = 0;
reg mm2sDoneIER       = 0;
reg RMHangIER         = 0;
reg AccelDoneISR      = 0;
reg s2mmDoneISR       = 0;
reg mm2sDoneISR       = 0;
reg RMHangISR         = 0;
//reg RMDataSourceReg   = 0;

assign AccelStart = AccelStartReg;
//assign RMDataSource = RMDataSourceReg;
assign interrupt = GlobalIER && (AccelDoneISR || s2mmDoneISR || mm2sDoneISR || RMHangISR);

always @(posedge clk)
begin
  if (~resetn)
  begin
    AccelStartReg      <= 1'b0;
    AccelDoneReg       <= 1'b0;
    AccelIdleReg       <= 1'b0;
    AccelReadyReg      <= 1'b0;
    AutoRestartAccel   <= 1'b0;
    GlobalIER          <= 1'b0;
    AccelDoneIER       <= 1'b0;
    s2mmDoneIER        <= 1'b0;
    mm2sDoneIER        <= 1'b0;
    RMHangIER          <= 1'b0;
    AccelDoneISR       <= 1'b0;
    s2mmDoneISR        <= 1'b0;
    mm2sDoneISR        <= 1'b0;
    RMHangISR          <= 1'b0;
//    RMDataSourceReg    <= 1'b0;
  end
  else
  begin
  
    if ((waddr == 16'h0) &&  s_axi_ctrl_wvalid && s_axi_ctrl_wready)
    begin
      AccelStartReg <= s_axi_ctrl_wstrb[0] ? s_axi_ctrl_wdata[0] : AccelStartReg;
      AutoRestartAccel <= s_axi_ctrl_wstrb[0] ? s_axi_ctrl_wdata[7] : AutoRestartAccel;
    end
    else
    begin
      if (AccelDone)
        AccelStartReg <= AutoRestartAccel;
    end
        
    if (AccelDone)
      AccelDoneReg  <= 1'b1;
    else if ((raddr == 16'h0) && s_axi_ctrl_rvalid && s_axi_ctrl_rready)
      AccelDoneReg  <= 1'b0;
      
    AccelIdleReg  <= AccelIdle ;
    AccelReadyReg <= AccelReady;
        
    if ((waddr == 16'h4) &&  s_axi_ctrl_wvalid && s_axi_ctrl_wready)
    begin
      GlobalIER <= s_axi_ctrl_wstrb[0] ? s_axi_ctrl_wdata[0] : GlobalIER;
    end
        
    if ((waddr == 16'h8) &&  s_axi_ctrl_wvalid && s_axi_ctrl_wready)
    begin
      AccelDoneIER <= s_axi_ctrl_wstrb[0] ? s_axi_ctrl_wdata[0] : AccelDoneIER;
      s2mmDoneIER  <= s_axi_ctrl_wstrb[0] ? s_axi_ctrl_wdata[2] : s2mmDoneIER ;
      mm2sDoneIER  <= s_axi_ctrl_wstrb[0] ? s_axi_ctrl_wdata[4] : mm2sDoneIER ;
      RMHangIER    <= s_axi_ctrl_wstrb[0] ? s_axi_ctrl_wdata[6] : RMHangIER   ;
    end
      
    if ((AccelDoneIER) && AccelDone)
      AccelDoneISR <= 1'b1;
    else if ((raddr == 16'hC) && s_axi_ctrl_rvalid && s_axi_ctrl_rready)
      AccelDoneISR <= 1'b0;
    
    if ((s2mmDoneIER) && s2mmDone)
      s2mmDoneISR <= 1'b1;
    else if ((raddr == 16'hC) && s_axi_ctrl_rvalid && s_axi_ctrl_rready)
      s2mmDoneISR <= 1'b0;

    if ((mm2sDoneIER) && mm2sDone)
      mm2sDoneISR <= 1'b1;
    else if ((raddr == 16'hC) && s_axi_ctrl_rvalid && s_axi_ctrl_rready)
      mm2sDoneISR <= 1'b0;      
   
    if ((RMHangIER) && RMHang)
      RMHangISR <= 1'b1;
    else if ((raddr == 16'hC) && s_axi_ctrl_rvalid && s_axi_ctrl_rready)
      RMHangISR <= 1'b0;  
      
//    if ((waddr == 16'h10) &&  s_axi_ctrl_wvalid && s_axi_ctrl_wready)
//    begin
//      RMDataSourceReg <= s_axi_ctrl_wstrb[0] ? s_axi_ctrl_wdata[0] : RMDataSourceReg;
//    end
    
    
  end  //resetn
end //always


always @(posedge clk)
begin //always
  if (~resetn)
  begin  //~resetn
    s_axi_ctrl_rdata <= 32'b0;
  end  //~resetn
  else
  begin //resetn
    if (raddr[15] == 1'b0)
    begin
//      if (raddr[14:0] == 15'h0)
//        s_axi_ctrl_rdata <= VersionReg;
//      if (raddr[14:0] == 15'h4)
//        s_axi_ctrl_rdata <= CompShellTypeReg;
//      if (raddr[14:0] == 15'h8)
//        s_axi_ctrl_rdata <= AccelSlotReg;
//      if (raddr[14:0] == 15'hC)
//        s_axi_ctrl_rdata <= FMaxReg;
//      if (raddr[14:0] == 15'h10)
//        s_axi_ctrl_rdata <= SupportedDataMoverReg;
//      if (raddr[14:0] == 15'h14)
//        s_axi_ctrl_rdata <= 32'h1;
//      if (raddr[14:0] == 15'h20)
//        s_axi_ctrl_rdata <= {CtrlReg[31:3], AccelIdle, CtrlReg[1:0]};
      if (raddr[14:0] == 15'h0)
        s_axi_ctrl_rdata <= {24'h0, AutoRestartAccel, 3'b0, AccelReadyReg, AccelIdleReg, AccelDoneReg, AccelStartReg};
      if (raddr[14:0] == 15'h4)
        s_axi_ctrl_rdata <= {31'b0, GlobalIER};
      if (raddr[14:0] == 15'h8)
        s_axi_ctrl_rdata <= {24'h0, 1'h0, RMHangIER, 1'h0, mm2sDoneIER, 1'h0, s2mmDoneIER, 1'h0, AccelDoneIER};
      if (raddr[14:0] == 15'hC)
        s_axi_ctrl_rdata <= {1'b1, 23'h0, 1'h0, RMHangISR, 1'h0, mm2sDoneISR, 1'h0, s2mmDoneISR, 1'h0, AccelDoneISR};
//      if (raddr[14:0] == 15'h10)
//        s_axi_ctrl_rdata <= {31'b0, RMDataSourceReg};
    end
    else
    begin
      s_axi_ctrl_rdata <= configRegister[raddr[14:0]/4];
    end //raddr
  end  //resetn
end  //always


wire  [127:0]                in_reg_tdata;
wire  [15:0]                 in_reg_tkeep;
wire  [7:0]                  in_reg_tid;
wire  [7:0]                  in_reg_tdest;
wire  [7:0]                  in_reg_tuser;
wire                         in_reg_tvalid;
wire                         in_reg_tlast;
reg                          in_reg_tready;

reg  [127:0]                 int_v_tdata;
reg  [15:0]                  int_v_tkeep;
reg                          int_v_tvalid;
reg                          int_v_tlast;
reg                          int_v_tready;
//Use a register slice to isolate timing path on axis_in bus.
//axis_register_slice_0 i_axis_register_slice (
//  .aclk(clk),                    // input wire aclk
//  .aresetn(resetn),              // input wire aresetn
//  .s_axis_tvalid(axis_in_tvalid),  // input wire s_axis_tvalid
//  .s_axis_tready(axis_in_tready),  // output wire s_axis_tready
//  .s_axis_tdata(axis_in_tdata),    // input wire [127 : 0] s_axis_tdata
//  .s_axis_tkeep(axis_in_tkeep),    // input wire [15 : 0] s_axis_tkeep
//  .s_axis_tlast(axis_in_tlast),    // input wire s_axis_tlast
//  .s_axis_tid(axis_in_tid),        // input wire [7 : 0] s_axis_tid
//  .s_axis_tdest(axis_in_tdest),    // input wire [7 : 0] s_axis_tdest
//  .s_axis_tuser(axis_in_tuser),    // input wire [7 : 0] s_axis_tuser
//
//  .m_axis_tvalid(in_reg_tvalid),  // output wire m_axis_tvalid
//  .m_axis_tready(in_reg_tready),  // input wire m_axis_tready
//  .m_axis_tdata (in_reg_tdata),    // output wire [127 : 0] m_axis_tdata
//  .m_axis_tkeep (in_reg_tkeep),    // output wire [15 : 0] m_axis_tkeep
//  .m_axis_tlast (in_reg_tlast),    // output wire m_axis_tlast
//  .m_axis_tid   (in_reg_tid),        // output wire [7 : 0] m_axis_tid
//  .m_axis_tdest (in_reg_tdest),    // output wire [7 : 0] m_axis_tdest
//  .m_axis_tuser (in_reg_tuser)    // output wire [7 : 0] m_axis_tuser
//);

assign in_reg_tvalid = axis_in_tvalid; 
assign in_reg_tdata = axis_in_tdata;
assign in_reg_tkeep = axis_in_tkeep;
assign in_reg_tlast = axis_in_tlast;
assign in_reg_tid = axis_in_tid;
assign in_reg_tdest = axis_in_tdest;
assign in_reg_tuser = axis_in_tuser;
assign axis_in_tready = in_reg_tready;

//Convert 128 bit data to 32 bit data to populate configRegister.
reg [1:0] counter_wc = 0;
reg  [31:0]                  int_wc_tdata;
reg  [3:0]                   int_wc_tkeep;
reg                          int_wc_tvalid;
reg                          int_wc_tlast;
wire                         int_wc_tready;

generate
 if (NUM_SCALAR_PORTS != 0)
 begin
//axis_dwidth_converter_0 i_axis_dwidth_converter(
//  .aclk(clk),                    // input wire aclk
//  .aresetn(resetn),              // input wire aresetn
//  .s_axis_tvalid(int_v_tvalid),  // input wire s_axis_tvalid
//  .s_axis_tready(int_v_tready),  // output wire s_axis_tready
//  .s_axis_tdata (int_v_tdata),    // input wire [127 : 0] s_axis_tdata
//  .s_axis_tkeep (int_v_tkeep),    // input wire [15 : 0] s_axis_tkeep
//  .s_axis_tlast (int_v_tlast),    // input wire s_axis_tlast
//  .m_axis_tvalid(int_wc_tvalid),  // output wire m_axis_tvalid
//  .m_axis_tready(int_wc_tready),  // input wire m_axis_tready
//  .m_axis_tdata (int_wc_tdata),    // output wire [31 : 0] m_axis_tdata
//  .m_axis_tkeep (int_wc_tkeep),    // output wire [3 : 0] m_axis_tkeep
//  .m_axis_tlast (int_wc_tlast)    // output wire m_axis_tlast
//);


  
  always @(*)
  begin
    int_wc_tdata <= 32'h0;
    int_wc_tkeep <= 4'h0;
    
     int_wc_tvalid <= int_v_tvalid;
     
    if (counter_wc == 0)
    begin
      int_wc_tdata <= int_v_tdata[31:0];
      int_wc_tkeep <= int_v_tkeep[3:0];
    end
    if (counter_wc == 1)
    begin
      int_wc_tdata <= int_v_tdata[63:32];
      int_wc_tkeep <= int_v_tkeep[7:4];
    end
    if (counter_wc == 2)
    begin
      int_wc_tdata <= int_v_tdata[95:64];
      int_wc_tkeep <= int_v_tkeep[11:8];
    end
    if (counter_wc == 3)
    begin
      int_wc_tdata <= int_v_tdata[127:96];
      int_wc_tkeep <= int_v_tkeep[15:12];
    end
  end
  
  
  always @(*)
  begin
    if (~int_v_tlast)
      int_wc_tlast <= 1'b0;
    else
    begin
      if ((int_v_tkeep[7:4] == 4'h0 && counter_wc == 2'h0) || (int_v_tkeep[11:8] == 4'h0 && counter_wc == 2'h1) || (int_v_tkeep[15:12] == 4'h0 && counter_wc == 2'h2) || (counter_wc == 2'h3))
        int_wc_tlast <= 1'b1;
      else
        int_wc_tlast <= 1'b0;
    end
  end
  
  always @(*)
  begin
    if (~int_v_tlast)
      int_v_tready <= (counter_wc == 2'h3) ? 1'b1 : 1'b0;
    else
      int_v_tready <= int_wc_tvalid && int_wc_tready && int_wc_tlast;  
  end
  
  always @(posedge clk)
  begin
    if (~resetn)
      counter_wc <= 2'b00;
    else
    begin
      if (int_wc_tvalid && int_wc_tready)
      begin
        counter_wc <= counter_wc + 1'b1;
        if (int_wc_tlast)
          counter_wc <= 2'b00;
      end
    end
  end
end

endgenerate



generate
  if (PARSE_AXIS_TID == 0)
  begin
    always @(*)
    begin
      tid0_axis_tdata    <= in_reg_tdata ;
      tid0_axis_tkeep    <= in_reg_tkeep ; 
      tid0_axis_tid      <= in_reg_tid;
      tid0_axis_tdest    <= in_reg_tdest;
      tid0_axis_tuser    <= in_reg_tuser;
      tid0_axis_tvalid   <= in_reg_tvalid; 
      tid0_axis_tlast    <= in_reg_tlast ; 
      in_reg_tready      <= tid0_axis_tready;
    end
  end
  
  else
  begin
    always @(*)
    begin
      tid0_axis_tdata  <= 'b0;
      tid0_axis_tkeep  <= 'b0; 
      tid0_axis_tid    <= 'b0;
      tid0_axis_tdest  <= 'b0;
      tid0_axis_tuser  <= 'b0;
      tid0_axis_tvalid <= 'b0; 
      tid0_axis_tlast  <= 'b0;
    
      int_v_tdata  <= 'b0;
      int_v_tkeep  <= 'b0;
      int_v_tvalid <= 'b0;
      int_v_tlast  <= 'b0;
    
      tid1_axis_tdata  <= 'b0;
      tid1_axis_tkeep  <= 'b0;
      tid1_axis_tid    <= 'b0;
      tid1_axis_tdest  <= 'b0;
      tid1_axis_tuser  <= 'b0;
      tid1_axis_tvalid <= 'b0;
      tid1_axis_tlast  <= 'b0;
      
      tid2_axis_tdata  <= 'b0;
      tid2_axis_tkeep  <= 'b0;
      tid2_axis_tid    <= 'b0;
      tid2_axis_tdest  <= 'b0;
      tid2_axis_tuser  <= 'b0;
      tid2_axis_tvalid <= 'b0;
      tid2_axis_tlast  <= 'b0;
    
      tid3_axis_tdata  <= 'b0;
      tid3_axis_tkeep  <= 'b0;
      tid3_axis_tid    <= 'b0;
      tid3_axis_tdest  <= 'b0;
      tid3_axis_tuser  <= 'b0;
      tid3_axis_tvalid <= 'b0;
      tid3_axis_tlast  <= 'b0;
      
      tid4_axis_tdata  <= 'b0;
      tid4_axis_tkeep  <= 'b0;
      tid4_axis_tid    <= 'b0;
      tid4_axis_tdest  <= 'b0;
      tid4_axis_tuser  <= 'b0;
      tid4_axis_tvalid <= 'b0;
      tid4_axis_tlast  <= 'b0;
    
      tid5_axis_tdata  <= 'b0;
      tid5_axis_tkeep  <= 'b0;
      tid5_axis_tid    <= 'b0;
      tid5_axis_tdest  <= 'b0;
      tid5_axis_tuser  <= 'b0;
      tid5_axis_tvalid <= 'b0;
      tid5_axis_tlast  <= 'b0;
      
      tid6_axis_tdata  <= 'b0;
      tid6_axis_tkeep  <= 'b0;
      tid6_axis_tid    <= 'b0;
      tid6_axis_tdest  <= 'b0;
      tid6_axis_tuser  <= 'b0;
      tid6_axis_tvalid <= 'b0;
      tid6_axis_tlast  <= 'b0;    
      
      tid7_axis_tdata  <= 'b0;
      tid7_axis_tkeep  <= 'b0;
      tid7_axis_tid    <= 'b0;
      tid7_axis_tdest  <= 'b0;
      tid7_axis_tuser  <= 'b0;
      tid7_axis_tvalid <= 'b0;
      tid7_axis_tlast  <= 'b0;
      
      in_reg_tready    <= 1'b0;
      
      if (in_reg_tid == 0)
      begin
        tid0_axis_tdata    <= in_reg_tdata ;
        tid0_axis_tkeep    <= in_reg_tkeep ; 
        tid0_axis_tid      <= in_reg_tid;
        tid0_axis_tdest    <= in_reg_tdest;
        tid0_axis_tuser    <= in_reg_tuser;
        tid0_axis_tvalid   <= in_reg_tvalid; 
        tid0_axis_tlast    <= in_reg_tlast ; 
        in_reg_tready      <= tid0_axis_tready; 
      end
    
      if (in_reg_tid == 1)
      begin
        if (NUM_SCALAR_PORTS != 0)
        begin
          int_v_tdata    <= in_reg_tdata ;
          int_v_tkeep    <= in_reg_tkeep ; 
          int_v_tvalid   <= in_reg_tvalid; 
          int_v_tlast    <= in_reg_tlast ; 
          in_reg_tready  <= int_v_tready; 
        end
        else if (HAS_TID1_AXIS_OUTPUT ==1)
        begin
          tid1_axis_tdata  <= in_reg_tdata ;
          tid1_axis_tkeep  <= in_reg_tkeep ; 
          tid1_axis_tid    <= in_reg_tid;
          tid1_axis_tdest  <= in_reg_tdest;
          tid1_axis_tuser  <= in_reg_tuser;
          tid1_axis_tvalid <= in_reg_tvalid; 
          tid1_axis_tlast  <= in_reg_tlast ; 
          in_reg_tready    <= tid1_axis_tready; 
        end
      end
        
      if ((HAS_TID2_AXIS_OUTPUT ==1) && (in_reg_tid == 2))
      begin
        tid2_axis_tdata  <= in_reg_tdata ;
        tid2_axis_tkeep  <= in_reg_tkeep ; 
        tid2_axis_tid    <= in_reg_tid;
        tid2_axis_tdest  <= in_reg_tdest;
        tid2_axis_tuser  <= in_reg_tuser;
        tid2_axis_tvalid <= in_reg_tvalid; 
        tid2_axis_tlast  <= in_reg_tlast ; 
        in_reg_tready    <= tid2_axis_tready; 
      end
      
      if ((HAS_TID3_AXIS_OUTPUT ==1) && (in_reg_tid == 3))
      begin
        tid3_axis_tdata  <= in_reg_tdata ;
        tid3_axis_tkeep  <= in_reg_tkeep ; 
        tid3_axis_tid    <= in_reg_tid;
        tid3_axis_tdest  <= in_reg_tdest;
        tid3_axis_tuser  <= in_reg_tuser;
        tid3_axis_tvalid <= in_reg_tvalid; 
        tid3_axis_tlast  <= in_reg_tlast ; 
        in_reg_tready    <= tid3_axis_tready; 
      end
      
      if ((HAS_TID4_AXIS_OUTPUT ==1) && (in_reg_tid == 4))
      begin
        tid4_axis_tdata  <= in_reg_tdata ;
        tid4_axis_tkeep  <= in_reg_tkeep ; 
        tid4_axis_tid    <= in_reg_tid;
        tid4_axis_tdest  <= in_reg_tdest;
        tid4_axis_tuser  <= in_reg_tuser;
        tid4_axis_tvalid <= in_reg_tvalid; 
        tid4_axis_tlast  <= in_reg_tlast ; 
        in_reg_tready    <= tid4_axis_tready; 
      end
                
      
      if ((HAS_TID5_AXIS_OUTPUT ==1) && (in_reg_tid == 5))
      begin
        tid5_axis_tdata  <= in_reg_tdata ;
        tid5_axis_tkeep  <= in_reg_tkeep ; 
        tid5_axis_tid    <= in_reg_tid;
        tid5_axis_tdest  <= in_reg_tdest;
        tid5_axis_tuser  <= in_reg_tuser;
        tid5_axis_tvalid <= in_reg_tvalid; 
        tid5_axis_tlast  <= in_reg_tlast ; 
        in_reg_tready    <= tid5_axis_tready; 
      end
      
      if ((HAS_TID6_AXIS_OUTPUT ==1) && (in_reg_tid == 6))
      begin
        tid6_axis_tdata  <= in_reg_tdata ;
        tid6_axis_tkeep  <= in_reg_tkeep ; 
        tid6_axis_tid    <= in_reg_tid;
        tid6_axis_tdest  <= in_reg_tdest;
        tid6_axis_tuser  <= in_reg_tuser;
        tid6_axis_tvalid <= in_reg_tvalid; 
        tid6_axis_tlast  <= in_reg_tlast ; 
        in_reg_tready    <= tid6_axis_tready; 
      end
      
      if ((HAS_TID7_AXIS_OUTPUT ==1) &&(in_reg_tid == 7))
      begin
        tid7_axis_tdata  <= in_reg_tdata ;
        tid7_axis_tkeep  <= in_reg_tkeep ; 
        tid7_axis_tid    <= in_reg_tid;
        tid7_axis_tdest  <= in_reg_tdest;
        tid7_axis_tuser  <= in_reg_tuser;
        tid7_axis_tvalid <= in_reg_tvalid; 
        tid7_axis_tlast  <= in_reg_tlast ; 
        in_reg_tready    <= tid7_axis_tready; 
      end

    end //always
  end  //PARSE_AXIS_TID == 1
endgenerate
    

reg[`NON_NEG_MSb(NUM_CONFIG_REGS*32):0] configData;
genvar mm;    
    generate
   if (NUM_CONFIG_REGS != 0 && NUM_SCALAR_PORTS != 0)
      begin
        for (mm = 0; mm < NUM_CONFIG_REGS; mm = mm +1)
        begin
          always @(*)
            configRegister[mm] <= configData[((mm+1)*32)-1: mm*32];
        end
      end
    endgenerate

 genvar ii;
 reg [7:0] index;
 reg       resetn_reg = 0;
 reg       int_wc_tready_int = 0;
 generate
   if (NUM_SCALAR_PORTS != 0)
   begin //if
     assign int_wc_tready = int_wc_tready_int;

 //Avoid updating config registers with config data of next packet when current
 //job is still active.
     always @(posedge clk)
     begin
       resetn_reg <= resetn;
     end

     always @(posedge clk)
     begin
       if (resetn && ~resetn_reg)
         int_wc_tready_int <= 1'b1;
       else
       begin
         if (int_wc_tvalid && int_wc_tready && int_wc_tlast)
           int_wc_tready_int <= 1'b0;
         if (AccelDone)
           int_wc_tready_int <= 1'b1;
       end
     end

     always @(posedge clk)
     begin
       if (~resetn)
         index <= 8'b0;
       else
       begin
         if (int_wc_tvalid && int_wc_tready)
         begin
           if (int_wc_tlast)
             index <= 8'b0;
           else
             index <= index + 1'b1;
         end
       end
     end //always

     for (ii = 0; ii < NUM_CONFIG_REGS; ii = ii+ 1)
     begin
       always @(posedge clk)
       begin //always
         if (~resetn)
         begin  //~resetn
           configData[((ii+1)*32)-1:ii*32] <= 32'b0;
         end  //~resetn
         else
         begin //resetn
           if (int_wc_tvalid && int_wc_tready && (ii == index))
           begin
             configData[ii*32+7 :ii*32   ] <= int_wc_tkeep[0] ? int_wc_tdata[ 7: 0] : configData[ii*32+7 :ii*32   ];
             configData[ii*32+15:ii*32+8 ] <= int_wc_tkeep[1] ? int_wc_tdata[15: 8] : configData[ii*32+15:ii*32+8 ];
             configData[ii*32+23:ii*32+16] <= int_wc_tkeep[2] ? int_wc_tdata[23:16] : configData[ii*32+23:ii*32+16];
             configData[ii*32+31:ii*32+24] <= int_wc_tkeep[3] ? int_wc_tdata[31:24] : configData[ii*32+31:ii*32+24];
           end //int_wc_tvalid
         end  //resetn
       end  //always
     end //for
   end //if
 endgenerate


//If a port has zero width, assign LSb and MSb to the previous Scalar's MSb
`define scalar1LSb  0
`define scalar1MSb  ((SCALAR1_WIDTH > 0) ? (SCALAR1_WIDTH-1)              : 0          )

`define scalar2LSb  ((SCALAR2_WIDTH > 0) ? (`scalar1MSb+1)                : `scalar1MSb)
`define scalar2MSb  ((SCALAR2_WIDTH > 0) ? (`scalar1MSb + SCALAR2_WIDTH)  : `scalar1MSb)
                                                                                                 
`define scalar3LSb  ((SCALAR3_WIDTH > 0) ? (`scalar2MSb+1)                : `scalar2MSb)
`define scalar3MSb  ((SCALAR3_WIDTH > 0) ? (`scalar2MSb + SCALAR3_WIDTH)  : `scalar2MSb)
                                                                                                 
`define scalar4LSb  ((SCALAR4_WIDTH > 0) ? (`scalar3MSb+1)                : `scalar3MSb)
`define scalar4MSb  ((SCALAR4_WIDTH > 0) ? (`scalar3MSb + SCALAR4_WIDTH)  : `scalar3MSb)
                                                                                                 
`define scalar5LSb  ((SCALAR5_WIDTH > 0) ? (`scalar4MSb+1)                : `scalar4MSb)
`define scalar5MSb  ((SCALAR5_WIDTH > 0) ? (`scalar4MSb + SCALAR5_WIDTH)  : `scalar4MSb)
                                                                                                 
`define scalar6LSb  ((SCALAR6_WIDTH > 0) ? (`scalar5MSb+1)                : `scalar5MSb)
`define scalar6MSb  ((SCALAR6_WIDTH > 0) ? (`scalar5MSb + SCALAR6_WIDTH)  : `scalar5MSb)
                                                                                                 
`define scalar7LSb  ((SCALAR7_WIDTH > 0) ? (`scalar6MSb+1)                : `scalar6MSb)
`define scalar7MSb  ((SCALAR7_WIDTH > 0) ? (`scalar6MSb + SCALAR7_WIDTH)  : `scalar6MSb)
                                                                                                 
`define scalar8LSb  ((SCALAR8_WIDTH > 0) ? (`scalar7MSb+1)                : `scalar7MSb)
`define scalar8MSb  ((SCALAR8_WIDTH > 0) ? (`scalar7MSb + SCALAR8_WIDTH)  : `scalar7MSb)

assign scalar1 = configData[`scalar1MSb:`scalar1LSb];
assign scalar2 = configData[`scalar2MSb:`scalar2LSb];
assign scalar3 = configData[`scalar3MSb:`scalar3LSb];
assign scalar4 = configData[`scalar4MSb:`scalar4LSb];
assign scalar5 = configData[`scalar5MSb:`scalar5LSb];
assign scalar6 = configData[`scalar6MSb:`scalar6LSb];
assign scalar7 = configData[`scalar7MSb:`scalar7LSb];
assign scalar8 = configData[`scalar8MSb:`scalar8LSb];



//generate
//  if ((SCALAR_HAS_HS ==1) && (HAS_SCALAR_OUTPUT == 1))
//  begin
//    always @(posedge clk)
//    begin
//      if (~resetn)
//      begin
//        scalar1_tvalid <= 1'b0;
//        scalar2_tvalid <= 1'b0;
//        scalar3_tvalid <= 1'b0;
//        scalar4_tvalid <= 1'b0;
//        scalar5_tvalid <= 1'b0;
//        scalar6_tvalid <= 1'b0;
//        scalar7_tvalid <= 1'b0;
//        scalar8_tvalid <= 1'b0;
//      end
//      else
//      begin
//        if (int_wc_tvalid && int_wc_tready && int_wc_tlast)
//        begin
//          scalar1_tvalid <= 1'b1;
//          scalar2_tvalid <= 1'b1;
//          scalar3_tvalid <= 1'b1;
//          scalar4_tvalid <= 1'b1;
//          scalar5_tvalid <= 1'b1;
//          scalar6_tvalid <= 1'b1;
//          scalar7_tvalid <= 1'b1;
//          scalar8_tvalid <= 1'b1;
//        end
//        else
//        begin
//          if (scalar1_tvalid && scalar1_tready)
//            scalar1_tvalid <= 1'b0;
//          if (scalar2_tvalid && scalar2_tready)
//            scalar2_tvalid <= 1'b0;
//          if (scalar3_tvalid && scalar3_tready)
//            scalar3_tvalid <= 1'b0;
//          if (scalar4_tvalid && scalar4_tready)
//            scalar4_tvalid <= 1'b0;
//          if (scalar5_tvalid && scalar5_tready)
//            scalar5_tvalid <= 1'b0;
//          if (scalar6_tvalid && scalar6_tready)
//            scalar6_tvalid <= 1'b0;
//          if (scalar7_tvalid && scalar7_tready)
//            scalar7_tvalid <= 1'b0;
//          if (scalar8_tvalid && scalar8_tready)
//            scalar8_tvalid <= 1'b0;
//        end
//      end
//    end //always 
//  end  //if
//endgenerate  


endmodule
