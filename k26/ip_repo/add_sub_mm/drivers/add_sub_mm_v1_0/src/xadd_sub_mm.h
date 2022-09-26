// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
#ifndef XADD_SUB_MM_H
#define XADD_SUB_MM_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xadd_sub_mm_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XAdd_sub_mm_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XAdd_sub_mm;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAdd_sub_mm_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAdd_sub_mm_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAdd_sub_mm_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAdd_sub_mm_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XAdd_sub_mm_Initialize(XAdd_sub_mm *InstancePtr, u16 DeviceId);
XAdd_sub_mm_Config* XAdd_sub_mm_LookupConfig(u16 DeviceId);
int XAdd_sub_mm_CfgInitialize(XAdd_sub_mm *InstancePtr, XAdd_sub_mm_Config *ConfigPtr);
#else
int XAdd_sub_mm_Initialize(XAdd_sub_mm *InstancePtr, const char* InstanceName);
int XAdd_sub_mm_Release(XAdd_sub_mm *InstancePtr);
#endif

void XAdd_sub_mm_Start(XAdd_sub_mm *InstancePtr);
u32 XAdd_sub_mm_IsDone(XAdd_sub_mm *InstancePtr);
u32 XAdd_sub_mm_IsIdle(XAdd_sub_mm *InstancePtr);
u32 XAdd_sub_mm_IsReady(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_EnableAutoRestart(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_DisableAutoRestart(XAdd_sub_mm *InstancePtr);

void XAdd_sub_mm_Set_arg1(XAdd_sub_mm *InstancePtr, u64 Data);
u64 XAdd_sub_mm_Get_arg1(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_Set_arg2(XAdd_sub_mm *InstancePtr, u64 Data);
u64 XAdd_sub_mm_Get_arg2(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_Set_mem(XAdd_sub_mm *InstancePtr, u64 Data);
u64 XAdd_sub_mm_Get_mem(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_Set_src_addr1(XAdd_sub_mm *InstancePtr, u32 Data);
u32 XAdd_sub_mm_Get_src_addr1(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_Set_src_addr2(XAdd_sub_mm *InstancePtr, u32 Data);
u32 XAdd_sub_mm_Get_src_addr2(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_Set_dst_addr(XAdd_sub_mm *InstancePtr, u32 Data);
u32 XAdd_sub_mm_Get_dst_addr(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_Set_size(XAdd_sub_mm *InstancePtr, u32 Data);
u32 XAdd_sub_mm_Get_size(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_Set_op(XAdd_sub_mm *InstancePtr, u32 Data);
u32 XAdd_sub_mm_Get_op(XAdd_sub_mm *InstancePtr);

void XAdd_sub_mm_InterruptGlobalEnable(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_InterruptGlobalDisable(XAdd_sub_mm *InstancePtr);
void XAdd_sub_mm_InterruptEnable(XAdd_sub_mm *InstancePtr, u32 Mask);
void XAdd_sub_mm_InterruptDisable(XAdd_sub_mm *InstancePtr, u32 Mask);
void XAdd_sub_mm_InterruptClear(XAdd_sub_mm *InstancePtr, u32 Mask);
u32 XAdd_sub_mm_InterruptGetEnabled(XAdd_sub_mm *InstancePtr);
u32 XAdd_sub_mm_InterruptGetStatus(XAdd_sub_mm *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
