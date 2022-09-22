// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT

`timescale 1 ns / 1 ps

`define NON_NEG_MSb(a) (((a) > 0) ? ((a)-1) : 0)
`define NON_NEG_DIV32(a) (((a) > 0) ? (((a)-1)/32)+1 : 0)

//EN_AP_CTRL_HS - Decides if AP_CTRL_HS ports are generated.
//tid 0   - Used for data. Always present.
//tid 1   - Used to generate scalar data or axis data with tid=1.
//          If scalar is enabled then axis port cannot be used for tid1_axis_tdata
//          8 scalar ports are supported. Width of each scalar port should be multiple of 32.
//tid2-7  - Used as axis ports only.
module AccelConfig
#(
  EN_AP_CTRL_HS = 1,
  EN_TID1_OUTPUT = 0,
  TID1_OUTPUT = 1,
  NUM_SCALAR_PORTS = 0,
  SCALAR1_WIDTH = 0,
  SCALAR2_WIDTH = 0,
  SCALAR3_WIDTH = 0,
  SCALAR4_WIDTH = 0,
  SCALAR5_WIDTH = 0,
  SCALAR6_WIDTH = 0,
  SCALAR7_WIDTH = 0,
  SCALAR8_WIDTH = 0,
  EN_TID2_AXIS_OUTPUT = 1,
  EN_TID3_AXIS_OUTPUT = 0,
  EN_TID4_AXIS_OUTPUT = 0,
  EN_TID5_AXIS_OUTPUT = 0,
  EN_TID6_AXIS_OUTPUT = 0,
  EN_TID7_AXIS_OUTPUT = 0
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
output reg                         axis_in_tready,

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

output [`NON_NEG_MSb(SCALAR1_WIDTH):0] scalar1,
output [`NON_NEG_MSb(SCALAR2_WIDTH):0] scalar2,
output [`NON_NEG_MSb(SCALAR3_WIDTH):0] scalar3,
output [`NON_NEG_MSb(SCALAR4_WIDTH):0] scalar4,
output [`NON_NEG_MSb(SCALAR5_WIDTH):0] scalar5,
output [`NON_NEG_MSb(SCALAR6_WIDTH):0] scalar6,
output [`NON_NEG_MSb(SCALAR7_WIDTH):0] scalar7,
output [`NON_NEG_MSb(SCALAR8_WIDTH):0] scalar8,


//Input AXI
input  [15:0]                      s_axi_ctrl_awaddr, //64 KB address space
input                              s_axi_ctrl_awvalid,
output wire                        s_axi_ctrl_awready,
                                   
input  [31:0]                      s_axi_ctrl_wdata,
input  [3:0]                       s_axi_ctrl_wstrb,
input                              s_axi_ctrl_wvalid,
output wire                       s_axi_ctrl_wready,
                                   
output wire [1:0]                  s_axi_ctrl_bresp,
output wire                        s_axi_ctrl_bvalid,
input                              s_axi_ctrl_bready,
                                   
input  [15:0]                      s_axi_ctrl_araddr, //64 KB address space
input                              s_axi_ctrl_arvalid,
output wire                        s_axi_ctrl_arready,
                                   
output wire [31:0]                 s_axi_ctrl_rdata,
output wire  [1:0]                 s_axi_ctrl_rresp,
output wire                        s_axi_ctrl_rvalid,
input                              s_axi_ctrl_rready,

output wire                          ap_start,
input                                ap_done,
input                                ap_ready,
input                                ap_idle,
output [0:0]                         interrupt
);

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



reg  [127:0]                 int_v_tdata;
reg  [15:0]                  int_v_tkeep;
reg                          int_v_tvalid;
reg                          int_v_tlast;
reg                          int_v_tready;

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
      
      axis_in_tready    <= 1'b0;
      
      if (axis_in_tid == 0)
      begin
        tid0_axis_tdata    <= axis_in_tdata ;
        tid0_axis_tkeep    <= axis_in_tkeep ; 
        tid0_axis_tid      <= axis_in_tid;
        tid0_axis_tdest    <= axis_in_tdest;
        tid0_axis_tuser    <= axis_in_tuser;
        tid0_axis_tvalid   <= axis_in_tvalid; 
        tid0_axis_tlast    <= axis_in_tlast ; 
        axis_in_tready     <= tid0_axis_tready; 
      end
    
      if (axis_in_tid == 1)
      begin
        if (NUM_SCALAR_PORTS != 0)
        begin
          int_v_tdata    <= axis_in_tdata ;
          int_v_tkeep    <= axis_in_tkeep ; 
          int_v_tvalid   <= axis_in_tvalid; 
          int_v_tlast    <= axis_in_tlast ; 
          axis_in_tready  <= int_v_tready; 
        end
        else if (EN_TID1_OUTPUT == 1 && TID1_OUTPUT ==1)
        begin
          tid1_axis_tdata  <= axis_in_tdata ;
          tid1_axis_tkeep  <= axis_in_tkeep ; 
          tid1_axis_tid    <= axis_in_tid;
          tid1_axis_tdest  <= axis_in_tdest;
          tid1_axis_tuser  <= axis_in_tuser;
          tid1_axis_tvalid <= axis_in_tvalid; 
          tid1_axis_tlast  <= axis_in_tlast ; 
          axis_in_tready    <= tid1_axis_tready; 
        end
      end
        
      if ((EN_TID2_AXIS_OUTPUT ==1) && (axis_in_tid == 2))
      begin
        tid2_axis_tdata  <= axis_in_tdata ;
        tid2_axis_tkeep  <= axis_in_tkeep ; 
        tid2_axis_tid    <= axis_in_tid;
        tid2_axis_tdest  <= axis_in_tdest;
        tid2_axis_tuser  <= axis_in_tuser;
        tid2_axis_tvalid <= axis_in_tvalid; 
        tid2_axis_tlast  <= axis_in_tlast ; 
        axis_in_tready    <= tid2_axis_tready; 
      end
      
      if ((EN_TID3_AXIS_OUTPUT ==1) && (axis_in_tid == 3))
      begin
        tid3_axis_tdata  <= axis_in_tdata ;
        tid3_axis_tkeep  <= axis_in_tkeep ; 
        tid3_axis_tid    <= axis_in_tid;
        tid3_axis_tdest  <= axis_in_tdest;
        tid3_axis_tuser  <= axis_in_tuser;
        tid3_axis_tvalid <= axis_in_tvalid; 
        tid3_axis_tlast  <= axis_in_tlast ; 
        axis_in_tready    <= tid3_axis_tready; 
      end
      
      if ((EN_TID4_AXIS_OUTPUT ==1) && (axis_in_tid == 4))
      begin
        tid4_axis_tdata  <= axis_in_tdata ;
        tid4_axis_tkeep  <= axis_in_tkeep ; 
        tid4_axis_tid    <= axis_in_tid;
        tid4_axis_tdest  <= axis_in_tdest;
        tid4_axis_tuser  <= axis_in_tuser;
        tid4_axis_tvalid <= axis_in_tvalid; 
        tid4_axis_tlast  <= axis_in_tlast ; 
        axis_in_tready    <= tid4_axis_tready; 
      end
                
      
      if ((EN_TID5_AXIS_OUTPUT ==1) && (axis_in_tid == 5))
      begin
        tid5_axis_tdata  <= axis_in_tdata ;
        tid5_axis_tkeep  <= axis_in_tkeep ; 
        tid5_axis_tid    <= axis_in_tid;
        tid5_axis_tdest  <= axis_in_tdest;
        tid5_axis_tuser  <= axis_in_tuser;
        tid5_axis_tvalid <= axis_in_tvalid; 
        tid5_axis_tlast  <= axis_in_tlast ; 
        axis_in_tready    <= tid5_axis_tready; 
      end
      
      if ((EN_TID6_AXIS_OUTPUT ==1) && (axis_in_tid == 6))
      begin
        tid6_axis_tdata  <= axis_in_tdata ;
        tid6_axis_tkeep  <= axis_in_tkeep ; 
        tid6_axis_tid    <= axis_in_tid;
        tid6_axis_tdest  <= axis_in_tdest;
        tid6_axis_tuser  <= axis_in_tuser;
        tid6_axis_tvalid <= axis_in_tvalid; 
        tid6_axis_tlast  <= axis_in_tlast ; 
        axis_in_tready    <= tid6_axis_tready; 
      end
      
      if ((EN_TID7_AXIS_OUTPUT ==1) &&(axis_in_tid == 7))
      begin
        tid7_axis_tdata  <= axis_in_tdata ;
        tid7_axis_tkeep  <= axis_in_tkeep ; 
        tid7_axis_tid    <= axis_in_tid;
        tid7_axis_tdest  <= axis_in_tdest;
        tid7_axis_tuser  <= axis_in_tuser;
        tid7_axis_tvalid <= axis_in_tvalid; 
        tid7_axis_tlast  <= axis_in_tlast ; 
        axis_in_tready    <= tid7_axis_tready; 
      end

    end //always
    

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
         if (ap_done)
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


generate
  if (EN_AP_CTRL_HS == 1)
  begin: gen_ap_ctrl_hs
    control_s_axi #(
      .C_S_AXI_ADDR_WIDTH (4),
      .C_S_AXI_DATA_WIDTH (32))
    i_control_s_axi (
      .ACLK        ( clk ),
      .ARESET      ( ~resetn ),
      .ACLK_EN     ( 1'b1 ),
      .AWADDR      ( s_axi_ctrl_awaddr ),
      .AWVALID     ( s_axi_ctrl_awvalid ),
      .AWREADY     ( s_axi_ctrl_awready ),
      .WDATA       ( s_axi_ctrl_wdata ),
      .WSTRB       ( s_axi_ctrl_wstrb ),
      .WVALID      ( s_axi_ctrl_wvalid ),
      .WREADY      ( s_axi_ctrl_wready ),
      .BRESP       ( s_axi_ctrl_bresp ),
      .BVALID      ( s_axi_ctrl_bvalid ),
      .BREADY      ( s_axi_ctrl_bready ),
      .ARADDR      ( s_axi_ctrl_araddr ),
      .ARVALID     ( s_axi_ctrl_arvalid ),
      .ARREADY     ( s_axi_ctrl_arready ),
      .RDATA       ( s_axi_ctrl_rdata ),
      .RRESP       ( s_axi_ctrl_rresp ),
      .RVALID      ( s_axi_ctrl_rvalid ),
      .RREADY      ( s_axi_ctrl_rready ),
      .interrupt   ( interrupt ),
      .ap_start    ( ap_start ),
      .ap_done     ( ap_done ),
      .ap_ready    ( ap_ready ),
      .ap_idle     ( ap_idle ));
  end  
endgenerate

endmodule
