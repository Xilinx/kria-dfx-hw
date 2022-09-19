// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
#include <stdio.h>
#include <stdlib.h>
#include "xil_io.h"
#include "xil_exception.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xil_types.h"

#include "isolation.h"
#include "utils.h"
#include "map.h"
#include "platform.h"
#include "dmDriver.h"

u64 INDATAADDRESS[2]  = {0x02000000, 0x04000000};
u64 OUTDATAADDRESS[2]  = {0x08000000, 0x0A000000};
u64 CONFIGADDRESS[2] = {0x0E000000, 0x10000000};

u32 config[] = {0x0000000c,0x0000000c,0x0000000c,0x0000000c};
int16_t reload[] = {142,-266,-59,32,66,70,61,44,23,1,-21,-40,-54,-59,-56,-43,-22,5,33,58,75,81,74,53,21,-17,-56,-90,-111,-114,-98,-64,-16,39,93,135,159,157,128,75,4,-74,-147,-201,-226,-215,-166,-84,20,130,230,300,326,300,219,92,-64,-227,-370,-468,-497,-444,-308,-99,159,429,670,836,887,790,528,102,-468,-1145,-1875,-2596,-3244,-3757,-4086,28568};

void configFIR(int slot,u64 addr){
	MM2SData(slot, addr, 0xA0, 0x01);
	while(1){
		if(MM2SDone(slot)){
			xil_printf("MM2S Done !\n");
			break;
		}
	}
	xil_printf("Reload coeff data \n");
	//Transaction on Config port
	MM2SData(slot,  addr+0xA0, 0x10, 0x02);
	while(1){
		if(MM2SDone(slot)){
			xil_printf("FIR Config Done !\n");
			break;
		}
	}
}

void trigger_DMA(int slot, u64 INDATAADDRESS,int insize, u64 OUTDATAADDRESS, int outsize){
	S2MMData(slot, OUTDATAADDRESS, outsize);
	MM2SData(slot, INDATAADDRESS, insize, 0x00);
}

void wait_DMA(int slot){
	while(1){
		if(S2MMDone(slot)){
			break;
		}
	}
}

uint64_t SLOT_MEM_ADDR[2] = {0x200000000, 0x280000000};


int main(void){
	int interRM_en=0;

	init_platform();
	Xil_ICacheDisable();
	Xil_DCacheDisable();

	configSihaBase(SHELLCONFIG_BASE);
	configDMSlots(DMA_HLS_0_BASE, DMA_HLS_1_BASE);

	enableSlot(0);
	enableSlot(1);
	printf("Slots enabled !!\n");

	writeBuff((u32*)reload, 0xA0, CONFIGADDRESS[0]);
	writeBuff(config, 0x10, CONFIGADDRESS[0] + 0xA0);
	configFIR(0, CONFIGADDRESS[0]);
	configFIR(1, CONFIGADDRESS[0]);

	printf("Config done !!\n");
	trigger_DMA(0, INDATAADDRESS[0],0x200000,OUTDATAADDRESS[0],0x200000);
	wait_DMA(0);
	printf("slot 0 done !!\n");
	trigger_DMA(1, INDATAADDRESS[0],0x200000,OUTDATAADDRESS[1],0x200000);
	wait_DMA(1);
	printf("slot 1 done !!\n");

	printf("comparing slot 0 output with reference ...\n");
	compare(0x200000, OUTDATAADDRESS[0], INDATAADDRESS[1]);

	printf("comparing slot 1 output with reference ...\n");
	compare(0x200000, OUTDATAADDRESS[1], INDATAADDRESS[1]);

	//printBuff(0x100, OUTDATAADDRESS[0]);
	//printBuff(0x100, OUTDATAADDRESS[1]);

	printf("all done \n");
	cleanup_platform();
	return XST_SUCCESS;
}

