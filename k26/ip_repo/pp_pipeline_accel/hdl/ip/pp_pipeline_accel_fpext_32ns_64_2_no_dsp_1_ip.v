// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT

// IP VLNV: xilinx.com:ip:floating_point:7.1
// IP Revision: 14

(* X_CORE_INFO = "floating_point_v7_1_14,Vivado 2022.1" *)
(* CHECK_LICENSE_TYPE = "pp_pipeline_accel_fpext_32ns_64_2_no_dsp_1_ip,floating_point_v7_1_14,{}" *)
(* CORE_GENERATION_INFO = "pp_pipeline_accel_fpext_32ns_64_2_no_dsp_1_ip,floating_point_v7_1_14,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=floating_point,x_ipVersion=7.1,x_ipCoreRevision=14,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_XDEVICEFAMILY=zynquplus,C_PART=xck26-sfvc784-2LV-c,C_HAS_ADD=0,C_HAS_SUBTRACT=0,C_HAS_MULTIPLY=0,C_HAS_DIVIDE=0,C_HAS_SQRT=0,C_HAS_COMPARE=0,C_HAS_FIX_TO_FLT=0,C_HAS_FLT_TO_FIX=0,C_HAS_FLT_TO_FLT=1,C_HAS_RECIP=0,C_HAS_RECIP_SQRT=0,C_HAS_ABSOLUTE=0,C_HAS_LOGARITH\
M=0,C_HAS_EXPONENTIAL=0,C_HAS_FMA=0,C_HAS_FMS=0,C_HAS_UNFUSED_MULTIPLY_ADD=0,C_HAS_UNFUSED_MULTIPLY_SUB=0,C_HAS_UNFUSED_MULTIPLY_ACCUMULATOR_A=0,C_HAS_UNFUSED_MULTIPLY_ACCUMULATOR_S=0,C_HAS_ACCUMULATOR_A=0,C_HAS_ACCUMULATOR_S=0,C_HAS_ACCUMULATOR_PRIMITIVE_A=0,C_HAS_ACCUMULATOR_PRIMITIVE_S=0,C_A_WIDTH=32,C_A_FRACTION_WIDTH=24,C_B_WIDTH=32,C_B_FRACTION_WIDTH=24,C_C_WIDTH=32,C_C_FRACTION_WIDTH=24,C_RESULT_WIDTH=64,C_RESULT_FRACTION_WIDTH=53,C_COMPARE_OPERATION=8,C_LATENCY=0,C_OPTIMIZATION=1,C_MULT_\
USAGE=0,C_BRAM_USAGE=0,C_RATE=1,C_ACCUM_INPUT_MSB=32,C_ACCUM_MSB=32,C_ACCUM_LSB=-31,C_HAS_UNDERFLOW=0,C_HAS_OVERFLOW=0,C_HAS_INVALID_OP=0,C_HAS_DIVIDE_BY_ZERO=0,C_HAS_ACCUM_OVERFLOW=0,C_HAS_ACCUM_INPUT_OVERFLOW=0,C_HAS_ACLKEN=0,C_HAS_ARESETN=0,C_THROTTLE_SCHEME=3,C_HAS_A_TUSER=0,C_HAS_A_TLAST=0,C_HAS_B=0,C_HAS_B_TUSER=0,C_HAS_B_TLAST=0,C_HAS_C=0,C_HAS_C_TUSER=0,C_HAS_C_TLAST=0,C_HAS_OPERATION=0,C_HAS_OPERATION_TUSER=0,C_HAS_OPERATION_TLAST=0,C_HAS_RESULT_TUSER=0,C_HAS_RESULT_TLAST=0,C_TLAST_RESO\
LUTION=0,C_A_TDATA_WIDTH=32,C_A_TUSER_WIDTH=1,C_B_TDATA_WIDTH=32,C_B_TUSER_WIDTH=1,C_C_TDATA_WIDTH=32,C_C_TUSER_WIDTH=1,C_OPERATION_TDATA_WIDTH=8,C_OPERATION_TUSER_WIDTH=1,C_RESULT_TDATA_WIDTH=64,C_RESULT_TUSER_WIDTH=1,C_FIXED_DATA_UNSIGNED=0}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pp_pipeline_accel_fpext_32ns_64_2_no_dsp_1_ip (
  s_axis_a_tvalid,
  s_axis_a_tdata,
  m_axis_result_tvalid,
  m_axis_result_tdata
);

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_A TVALID" *)
input wire s_axis_a_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_A, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_A TDATA" *)
input wire [31 : 0] s_axis_a_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TVALID" *)
output wire m_axis_result_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_RESULT, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TDATA" *)
output wire [63 : 0] m_axis_result_tdata;

  floating_point_v7_1_14 #(
    .C_XDEVICEFAMILY("zynquplus"),
    .C_PART("xck26-sfvc784-2LV-c"),
    .C_HAS_ADD(0),
    .C_HAS_SUBTRACT(0),
    .C_HAS_MULTIPLY(0),
    .C_HAS_DIVIDE(0),
    .C_HAS_SQRT(0),
    .C_HAS_COMPARE(0),
    .C_HAS_FIX_TO_FLT(0),
    .C_HAS_FLT_TO_FIX(0),
    .C_HAS_FLT_TO_FLT(1),
    .C_HAS_RECIP(0),
    .C_HAS_RECIP_SQRT(0),
    .C_HAS_ABSOLUTE(0),
    .C_HAS_LOGARITHM(0),
    .C_HAS_EXPONENTIAL(0),
    .C_HAS_FMA(0),
    .C_HAS_FMS(0),
    .C_HAS_UNFUSED_MULTIPLY_ADD(0),
    .C_HAS_UNFUSED_MULTIPLY_SUB(0),
    .C_HAS_UNFUSED_MULTIPLY_ACCUMULATOR_A(0),
    .C_HAS_UNFUSED_MULTIPLY_ACCUMULATOR_S(0),
    .C_HAS_ACCUMULATOR_A(0),
    .C_HAS_ACCUMULATOR_S(0),
    .C_HAS_ACCUMULATOR_PRIMITIVE_A(0),
    .C_HAS_ACCUMULATOR_PRIMITIVE_S(0),
    .C_A_WIDTH(32),
    .C_A_FRACTION_WIDTH(24),
    .C_B_WIDTH(32),
    .C_B_FRACTION_WIDTH(24),
    .C_C_WIDTH(32),
    .C_C_FRACTION_WIDTH(24),
    .C_RESULT_WIDTH(64),
    .C_RESULT_FRACTION_WIDTH(53),
    .C_COMPARE_OPERATION(8),
    .C_LATENCY(0),
    .C_OPTIMIZATION(1),
    .C_MULT_USAGE(0),
    .C_BRAM_USAGE(0),
    .C_RATE(1),
    .C_ACCUM_INPUT_MSB(32),
    .C_ACCUM_MSB(32),
    .C_ACCUM_LSB(-31),
    .C_HAS_UNDERFLOW(0),
    .C_HAS_OVERFLOW(0),
    .C_HAS_INVALID_OP(0),
    .C_HAS_DIVIDE_BY_ZERO(0),
    .C_HAS_ACCUM_OVERFLOW(0),
    .C_HAS_ACCUM_INPUT_OVERFLOW(0),
    .C_HAS_ACLKEN(0),
    .C_HAS_ARESETN(0),
    .C_THROTTLE_SCHEME(3),
    .C_HAS_A_TUSER(0),
    .C_HAS_A_TLAST(0),
    .C_HAS_B(0),
    .C_HAS_B_TUSER(0),
    .C_HAS_B_TLAST(0),
    .C_HAS_C(0),
    .C_HAS_C_TUSER(0),
    .C_HAS_C_TLAST(0),
    .C_HAS_OPERATION(0),
    .C_HAS_OPERATION_TUSER(0),
    .C_HAS_OPERATION_TLAST(0),
    .C_HAS_RESULT_TUSER(0),
    .C_HAS_RESULT_TLAST(0),
    .C_TLAST_RESOLUTION(0),
    .C_A_TDATA_WIDTH(32),
    .C_A_TUSER_WIDTH(1),
    .C_B_TDATA_WIDTH(32),
    .C_B_TUSER_WIDTH(1),
    .C_C_TDATA_WIDTH(32),
    .C_C_TUSER_WIDTH(1),
    .C_OPERATION_TDATA_WIDTH(8),
    .C_OPERATION_TUSER_WIDTH(1),
    .C_RESULT_TDATA_WIDTH(64),
    .C_RESULT_TUSER_WIDTH(1),
    .C_FIXED_DATA_UNSIGNED(0)
  ) inst (
    .aclk(1'H0),
    .aclken(1'H1),
    .aresetn(1'H1),
    .s_axis_a_tvalid(s_axis_a_tvalid),
    .s_axis_a_tready(),
    .s_axis_a_tdata(s_axis_a_tdata),
    .s_axis_a_tuser(1'B0),
    .s_axis_a_tlast(1'H0),
    .s_axis_b_tvalid(1'H0),
    .s_axis_b_tready(),
    .s_axis_b_tdata(32'B0),
    .s_axis_b_tuser(1'B0),
    .s_axis_b_tlast(1'H0),
    .s_axis_c_tvalid(1'H0),
    .s_axis_c_tready(),
    .s_axis_c_tdata(32'B0),
    .s_axis_c_tuser(1'B0),
    .s_axis_c_tlast(1'H0),
    .s_axis_operation_tvalid(1'H0),
    .s_axis_operation_tready(),
    .s_axis_operation_tdata(8'B0),
    .s_axis_operation_tuser(1'B0),
    .s_axis_operation_tlast(1'H0),
    .m_axis_result_tvalid(m_axis_result_tvalid),
    .m_axis_result_tready(1'H0),
    .m_axis_result_tdata(m_axis_result_tdata),
    .m_axis_result_tuser(),
    .m_axis_result_tlast()
  );
endmodule
