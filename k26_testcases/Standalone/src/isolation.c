// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"

static u64 SHELLCONFIG;

//#define SHELLCONFIG                XPAR_STATIC_SHELL_SIHA_MANAGER_0_BASEADDR
int configSihaBase(u64 base){
	SHELLCONFIG = base;
	return 0;
}

int enableSlot(int slot){
	switch(slot){
		case 0:
			printf("enabling slot 0 @ %x...\r\n", SHELLCONFIG + 0x4000);
			Xil_Out32(SHELLCONFIG + 0x4000, 0x01);
			Xil_Out32(SHELLCONFIG + 0x4004, 0x01);
			Xil_Out32(SHELLCONFIG + 0x4008, 0x0b);
			Xil_Out32(SHELLCONFIG + 0x400c, 0x02);
			break;
		case 1:
			printf("enabling slot 1 @ %x...\r\n", SHELLCONFIG + 0x5000);
			Xil_Out32(SHELLCONFIG + 0x5000, 0x01);
			Xil_Out32(SHELLCONFIG + 0x5004, 0x01);
			Xil_Out32(SHELLCONFIG + 0x5008, 0x0b);
			Xil_Out32(SHELLCONFIG + 0x500c, 0x02);
			break;
		default: break;
	}
	return 0;
}

int disableSlot(int slot){
	switch(slot){
		case 0:
			Xil_Out32(SHELLCONFIG + 0x4000, 0x00);
			Xil_Out32(SHELLCONFIG + 0x4004, 0x00);
			Xil_Out32(SHELLCONFIG + 0x4008, 0x00);
			Xil_Out32(SHELLCONFIG + 0x400c, 0x00);
			printf("disabling slot 0 ...\n");
			break;
		case 1:
			Xil_Out32(SHELLCONFIG + 0x5000, 0x00);
			Xil_Out32(SHELLCONFIG + 0x5004, 0x00);
			Xil_Out32(SHELLCONFIG + 0x5008, 0x00);
			Xil_Out32(SHELLCONFIG + 0x500c, 0x00);
			printf("disabling slot 1 ...\n");
			break;
		default: break;
	}
	return 0;
}
