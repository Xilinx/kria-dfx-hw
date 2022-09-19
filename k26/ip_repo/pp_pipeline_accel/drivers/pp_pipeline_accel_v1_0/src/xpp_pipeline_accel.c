// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
// ==============================================================
// ==============================================================
/***************************** Include Files *********************************/
#include "xpp_pipeline_accel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPp_pipeline_accel_CfgInitialize(XPp_pipeline_accel *InstancePtr, XPp_pipeline_accel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XPp_pipeline_accel_Start(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XPp_pipeline_accel_IsDone(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XPp_pipeline_accel_IsIdle(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XPp_pipeline_accel_IsReady(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XPp_pipeline_accel_Continue(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XPp_pipeline_accel_EnableAutoRestart(XPp_pipeline_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XPp_pipeline_accel_DisableAutoRestart(XPp_pipeline_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XPp_pipeline_accel_Set_img_inp_y(XPp_pipeline_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_Y_DATA, (u32)(Data));
    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_Y_DATA + 4, (u32)(Data >> 32));
}

u64 XPp_pipeline_accel_Get_img_inp_y(XPp_pipeline_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_Y_DATA);
    Data += (u64)XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_Y_DATA + 4) << 32;
    return Data;
}

void XPp_pipeline_accel_Set_img_inp_uv(XPp_pipeline_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_UV_DATA, (u32)(Data));
    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_UV_DATA + 4, (u32)(Data >> 32));
}

u64 XPp_pipeline_accel_Get_img_inp_uv(XPp_pipeline_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_UV_DATA);
    Data += (u64)XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_INP_UV_DATA + 4) << 32;
    return Data;
}

void XPp_pipeline_accel_Set_img_out(XPp_pipeline_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_OUT_DATA, (u32)(Data));
    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XPp_pipeline_accel_Get_img_out(XPp_pipeline_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_OUT_DATA);
    Data += (u64)XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IMG_OUT_DATA + 4) << 32;
    return Data;
}

void XPp_pipeline_accel_Set_params(XPp_pipeline_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_PARAMS_DATA, (u32)(Data));
    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_PARAMS_DATA + 4, (u32)(Data >> 32));
}

u64 XPp_pipeline_accel_Get_params(XPp_pipeline_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_PARAMS_DATA);
    Data += (u64)XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_PARAMS_DATA + 4) << 32;
    return Data;
}

void XPp_pipeline_accel_Set_in_img_width(XPp_pipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_WIDTH_DATA, Data);
}

u32 XPp_pipeline_accel_Get_in_img_width(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_WIDTH_DATA);
    return Data;
}

void XPp_pipeline_accel_Set_in_img_height(XPp_pipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_HEIGHT_DATA, Data);
}

u32 XPp_pipeline_accel_Get_in_img_height(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_HEIGHT_DATA);
    return Data;
}

void XPp_pipeline_accel_Set_in_img_linestride(XPp_pipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_LINESTRIDE_DATA, Data);
}

u32 XPp_pipeline_accel_Get_in_img_linestride(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IN_IMG_LINESTRIDE_DATA);
    return Data;
}

void XPp_pipeline_accel_Set_out_img_width(XPp_pipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_WIDTH_DATA, Data);
}

u32 XPp_pipeline_accel_Get_out_img_width(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_WIDTH_DATA);
    return Data;
}

void XPp_pipeline_accel_Set_out_img_height(XPp_pipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_HEIGHT_DATA, Data);
}

u32 XPp_pipeline_accel_Get_out_img_height(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_HEIGHT_DATA);
    return Data;
}

void XPp_pipeline_accel_Set_out_img_linestride(XPp_pipeline_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_LINESTRIDE_DATA, Data);
}

u32 XPp_pipeline_accel_Get_out_img_linestride(XPp_pipeline_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_OUT_IMG_LINESTRIDE_DATA);
    return Data;
}

void XPp_pipeline_accel_InterruptGlobalEnable(XPp_pipeline_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_GIE, 1);
}

void XPp_pipeline_accel_InterruptGlobalDisable(XPp_pipeline_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_GIE, 0);
}

void XPp_pipeline_accel_InterruptEnable(XPp_pipeline_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IER);
    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IER, Register | Mask);
}

void XPp_pipeline_accel_InterruptDisable(XPp_pipeline_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IER);
    XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XPp_pipeline_accel_InterruptClear(XPp_pipeline_accel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XPp_pipeline_accel_WriteReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_ISR, Mask);
}

u32 XPp_pipeline_accel_InterruptGetEnabled(XPp_pipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_IER);
}

u32 XPp_pipeline_accel_InterruptGetStatus(XPp_pipeline_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XPp_pipeline_accel_ReadReg(InstancePtr->Control_BaseAddress, XPP_PIPELINE_ACCEL_CONTROL_ADDR_ISR);
}

