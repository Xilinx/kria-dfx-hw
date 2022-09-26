// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
/***************************** Include Files *********************************/
#include "xadd_sub_mm.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAdd_sub_mm_CfgInitialize(XAdd_sub_mm *InstancePtr, XAdd_sub_mm_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAdd_sub_mm_Start(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAdd_sub_mm_IsDone(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAdd_sub_mm_IsIdle(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAdd_sub_mm_IsReady(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAdd_sub_mm_EnableAutoRestart(XAdd_sub_mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XAdd_sub_mm_DisableAutoRestart(XAdd_sub_mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_AP_CTRL, 0);
}

void XAdd_sub_mm_Set_arg1(XAdd_sub_mm *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ARG1_DATA, (u32)(Data));
    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ARG1_DATA + 4, (u32)(Data >> 32));
}

u64 XAdd_sub_mm_Get_arg1(XAdd_sub_mm *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ARG1_DATA);
    Data += (u64)XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ARG1_DATA + 4) << 32;
    return Data;
}

void XAdd_sub_mm_Set_arg2(XAdd_sub_mm *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ARG2_DATA, (u32)(Data));
    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ARG2_DATA + 4, (u32)(Data >> 32));
}

u64 XAdd_sub_mm_Get_arg2(XAdd_sub_mm *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ARG2_DATA);
    Data += (u64)XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ARG2_DATA + 4) << 32;
    return Data;
}

void XAdd_sub_mm_Set_mem(XAdd_sub_mm *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_MEM_DATA, (u32)(Data));
    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_MEM_DATA + 4, (u32)(Data >> 32));
}

u64 XAdd_sub_mm_Get_mem(XAdd_sub_mm *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_MEM_DATA);
    Data += (u64)XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_MEM_DATA + 4) << 32;
    return Data;
}

void XAdd_sub_mm_Set_src_addr1(XAdd_sub_mm *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_SRC_ADDR1_DATA, Data);
}

u32 XAdd_sub_mm_Get_src_addr1(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_SRC_ADDR1_DATA);
    return Data;
}

void XAdd_sub_mm_Set_src_addr2(XAdd_sub_mm *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_SRC_ADDR2_DATA, Data);
}

u32 XAdd_sub_mm_Get_src_addr2(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_SRC_ADDR2_DATA);
    return Data;
}

void XAdd_sub_mm_Set_dst_addr(XAdd_sub_mm *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_DST_ADDR_DATA, Data);
}

u32 XAdd_sub_mm_Get_dst_addr(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_DST_ADDR_DATA);
    return Data;
}

void XAdd_sub_mm_Set_size(XAdd_sub_mm *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_SIZE_DATA, Data);
}

u32 XAdd_sub_mm_Get_size(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_SIZE_DATA);
    return Data;
}

void XAdd_sub_mm_Set_op(XAdd_sub_mm *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_OP_DATA, Data);
}

u32 XAdd_sub_mm_Get_op(XAdd_sub_mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_OP_DATA);
    return Data;
}

void XAdd_sub_mm_InterruptGlobalEnable(XAdd_sub_mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_GIE, 1);
}

void XAdd_sub_mm_InterruptGlobalDisable(XAdd_sub_mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_GIE, 0);
}

void XAdd_sub_mm_InterruptEnable(XAdd_sub_mm *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_IER);
    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_IER, Register | Mask);
}

void XAdd_sub_mm_InterruptDisable(XAdd_sub_mm *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_IER);
    XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XAdd_sub_mm_InterruptClear(XAdd_sub_mm *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XAdd_sub_mm_WriteReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ISR, Mask);
}

u32 XAdd_sub_mm_InterruptGetEnabled(XAdd_sub_mm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_IER);
}

u32 XAdd_sub_mm_InterruptGetStatus(XAdd_sub_mm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XAdd_sub_mm_ReadReg(InstancePtr->Control_BaseAddress, XADD_SUB_MM_CONTROL_ADDR_ISR);
}

