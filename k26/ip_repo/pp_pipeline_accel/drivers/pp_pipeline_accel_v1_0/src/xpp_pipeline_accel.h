// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// ==============================================================
#ifndef XPP_PIPELINE_ACCEL_H
#define XPP_PIPELINE_ACCEL_H

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
#include "xpp_pipeline_accel_hw.h"

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
} XPp_pipeline_accel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XPp_pipeline_accel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPp_pipeline_accel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPp_pipeline_accel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPp_pipeline_accel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPp_pipeline_accel_ReadReg(BaseAddress, RegOffset) \
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
int XPp_pipeline_accel_Initialize(XPp_pipeline_accel *InstancePtr, u16 DeviceId);
XPp_pipeline_accel_Config* XPp_pipeline_accel_LookupConfig(u16 DeviceId);
int XPp_pipeline_accel_CfgInitialize(XPp_pipeline_accel *InstancePtr, XPp_pipeline_accel_Config *ConfigPtr);
#else
int XPp_pipeline_accel_Initialize(XPp_pipeline_accel *InstancePtr, const char* InstanceName);
int XPp_pipeline_accel_Release(XPp_pipeline_accel *InstancePtr);
#endif

void XPp_pipeline_accel_Start(XPp_pipeline_accel *InstancePtr);
u32 XPp_pipeline_accel_IsDone(XPp_pipeline_accel *InstancePtr);
u32 XPp_pipeline_accel_IsIdle(XPp_pipeline_accel *InstancePtr);
u32 XPp_pipeline_accel_IsReady(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Continue(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_EnableAutoRestart(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_DisableAutoRestart(XPp_pipeline_accel *InstancePtr);

void XPp_pipeline_accel_Set_img_inp_y(XPp_pipeline_accel *InstancePtr, u64 Data);
u64 XPp_pipeline_accel_Get_img_inp_y(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_img_inp_uv(XPp_pipeline_accel *InstancePtr, u64 Data);
u64 XPp_pipeline_accel_Get_img_inp_uv(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_img_out(XPp_pipeline_accel *InstancePtr, u64 Data);
u64 XPp_pipeline_accel_Get_img_out(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_params(XPp_pipeline_accel *InstancePtr, u64 Data);
u64 XPp_pipeline_accel_Get_params(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_in_img_width(XPp_pipeline_accel *InstancePtr, u32 Data);
u32 XPp_pipeline_accel_Get_in_img_width(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_in_img_height(XPp_pipeline_accel *InstancePtr, u32 Data);
u32 XPp_pipeline_accel_Get_in_img_height(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_in_img_linestride(XPp_pipeline_accel *InstancePtr, u32 Data);
u32 XPp_pipeline_accel_Get_in_img_linestride(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_out_img_width(XPp_pipeline_accel *InstancePtr, u32 Data);
u32 XPp_pipeline_accel_Get_out_img_width(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_out_img_height(XPp_pipeline_accel *InstancePtr, u32 Data);
u32 XPp_pipeline_accel_Get_out_img_height(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_Set_out_img_linestride(XPp_pipeline_accel *InstancePtr, u32 Data);
u32 XPp_pipeline_accel_Get_out_img_linestride(XPp_pipeline_accel *InstancePtr);

void XPp_pipeline_accel_InterruptGlobalEnable(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_InterruptGlobalDisable(XPp_pipeline_accel *InstancePtr);
void XPp_pipeline_accel_InterruptEnable(XPp_pipeline_accel *InstancePtr, u32 Mask);
void XPp_pipeline_accel_InterruptDisable(XPp_pipeline_accel *InstancePtr, u32 Mask);
void XPp_pipeline_accel_InterruptClear(XPp_pipeline_accel *InstancePtr, u32 Mask);
u32 XPp_pipeline_accel_InterruptGetEnabled(XPp_pipeline_accel *InstancePtr);
u32 XPp_pipeline_accel_InterruptGetStatus(XPp_pipeline_accel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
