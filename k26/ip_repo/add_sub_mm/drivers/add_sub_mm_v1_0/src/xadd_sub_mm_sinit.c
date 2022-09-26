// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xadd_sub_mm.h"

extern XAdd_sub_mm_Config XAdd_sub_mm_ConfigTable[];

XAdd_sub_mm_Config *XAdd_sub_mm_LookupConfig(u16 DeviceId) {
	XAdd_sub_mm_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XADD_SUB_MM_NUM_INSTANCES; Index++) {
		if (XAdd_sub_mm_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAdd_sub_mm_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAdd_sub_mm_Initialize(XAdd_sub_mm *InstancePtr, u16 DeviceId) {
	XAdd_sub_mm_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAdd_sub_mm_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAdd_sub_mm_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

