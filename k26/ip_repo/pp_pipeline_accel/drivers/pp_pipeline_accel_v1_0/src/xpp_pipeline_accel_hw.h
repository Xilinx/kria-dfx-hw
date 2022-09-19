// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 4  - ap_continue (Read/Write/SC)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/COR)
//        bit 0 - ap_done (Read/COR)
//        bit 1 - ap_ready (Read/COR)
//        others - reserved
// 0x10 : Data signal of img_inp_y
//        bit 31~0 - img_inp_y[31:0] (Read/Write)
// 0x14 : Data signal of img_inp_y
//        bit 31~0 - img_inp_y[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of img_inp_uv
//        bit 31~0 - img_inp_uv[31:0] (Read/Write)
// 0x20 : Data signal of img_inp_uv
//        bit 31~0 - img_inp_uv[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of img_out
//        bit 31~0 - img_out[31:0] (Read/Write)
// 0x2c : Data signal of img_out
//        bit 31~0 - img_out[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of params
//        bit 31~0 - params[31:0] (Read/Write)
// 0x38 : Data signal of params
//        bit 31~0 - params[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of in_img_width
//        bit 31~0 - in_img_width[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of in_img_height
//        bit 31~0 - in_img_height[31:0] (Read/Write)
// 0x4c : reserved
// 0x50 : Data signal of in_img_linestride
//        bit 31~0 - in_img_linestride[31:0] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of out_img_width
//        bit 31~0 - out_img_width[31:0] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of out_img_height
//        bit 31~0 - out_img_height[31:0] (Read/Write)
// 0x64 : reserved
// 0x68 : Data signal of out_img_linestride
//        bit 31~0 - out_img_linestride[31:0] (Read/Write)
// 0x6c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL                 0x00
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_GIE                     0x04
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_IER                     0x08
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_ISR                     0x0c
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_Y_DATA          0x10
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_IMG_INP_Y_DATA          64
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_UV_DATA         0x1c
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_IMG_INP_UV_DATA         64
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_OUT_DATA            0x28
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_IMG_OUT_DATA            64
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_PARAMS_DATA             0x34
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_PARAMS_DATA             64
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_WIDTH_DATA       0x40
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_IN_IMG_WIDTH_DATA       32
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_HEIGHT_DATA      0x48
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_IN_IMG_HEIGHT_DATA      32
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_LINESTRIDE_DATA  0x50
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_IN_IMG_LINESTRIDE_DATA  32
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_WIDTH_DATA      0x58
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_OUT_IMG_WIDTH_DATA      32
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_HEIGHT_DATA     0x60
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_OUT_IMG_HEIGHT_DATA     32
#define XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_LINESTRIDE_DATA 0x68
#define XPP_PIPELINE_ACCEL_CONTROL_BITS_OUT_IMG_LINESTRIDE_DATA 32

