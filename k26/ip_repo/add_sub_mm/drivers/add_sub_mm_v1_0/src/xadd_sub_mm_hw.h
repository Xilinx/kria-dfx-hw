// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
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
// 0x10 : Data signal of arg1
//        bit 31~0 - arg1[31:0] (Read/Write)
// 0x14 : Data signal of arg1
//        bit 31~0 - arg1[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of arg2
//        bit 31~0 - arg2[31:0] (Read/Write)
// 0x20 : Data signal of arg2
//        bit 31~0 - arg2[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of mem
//        bit 31~0 - mem[31:0] (Read/Write)
// 0x2c : Data signal of mem
//        bit 31~0 - mem[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of src_addr1
//        bit 31~0 - src_addr1[31:0] (Read/Write)
// 0x38 : reserved
// 0x3c : Data signal of src_addr2
//        bit 31~0 - src_addr2[31:0] (Read/Write)
// 0x40 : reserved
// 0x44 : Data signal of dst_addr
//        bit 31~0 - dst_addr[31:0] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of size
//        bit 31~0 - size[31:0] (Read/Write)
// 0x50 : reserved
// 0x54 : Data signal of op
//        bit 0  - op[0] (Read/Write)
//        others - reserved
// 0x58 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XADD_SUB_MM_CONTROL_ADDR_AP_CTRL        0x00
#define XADD_SUB_MM_CONTROL_ADDR_GIE            0x04
#define XADD_SUB_MM_CONTROL_ADDR_IER            0x08
#define XADD_SUB_MM_CONTROL_ADDR_ISR            0x0c
#define XADD_SUB_MM_CONTROL_ADDR_ARG1_DATA      0x10
#define XADD_SUB_MM_CONTROL_BITS_ARG1_DATA      64
#define XADD_SUB_MM_CONTROL_ADDR_ARG2_DATA      0x1c
#define XADD_SUB_MM_CONTROL_BITS_ARG2_DATA      64
#define XADD_SUB_MM_CONTROL_ADDR_MEM_DATA       0x28
#define XADD_SUB_MM_CONTROL_BITS_MEM_DATA       64
#define XADD_SUB_MM_CONTROL_ADDR_SRC_ADDR1_DATA 0x34
#define XADD_SUB_MM_CONTROL_BITS_SRC_ADDR1_DATA 32
#define XADD_SUB_MM_CONTROL_ADDR_SRC_ADDR2_DATA 0x3c
#define XADD_SUB_MM_CONTROL_BITS_SRC_ADDR2_DATA 32
#define XADD_SUB_MM_CONTROL_ADDR_DST_ADDR_DATA  0x44
#define XADD_SUB_MM_CONTROL_BITS_DST_ADDR_DATA  32
#define XADD_SUB_MM_CONTROL_ADDR_SIZE_DATA      0x4c
#define XADD_SUB_MM_CONTROL_BITS_SIZE_DATA      32
#define XADD_SUB_MM_CONTROL_ADDR_OP_DATA        0x54
#define XADD_SUB_MM_CONTROL_BITS_OP_DATA        1

