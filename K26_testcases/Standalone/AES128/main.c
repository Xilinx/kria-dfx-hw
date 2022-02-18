/******************************************************************************
* Copyright (C) 2010 - 2020 Xilinx, Inc.  All rights reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
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


u32 decryptedbuff[] = {
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233,
		0xccddeeff, 0x8899aabb, 0x44556677, 0x00112233
};
u32 encryptedbuff[] = {
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7,
		0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7
};
u32 decryptedkeybuff[] = {
		0x0c0d0e0f, 0x08090a0b, 0x04050607, 0x00010203,
		0x00000001, 0x00000000, 0x00000000, 0x00000000
};
u32 encryptedkeybuff[] = {
		0x0c0d0e0f, 0x08090a0b, 0x04050607, 0x00010203,
		0x00000000, 0x00000000, 0x00000000, 0x00000000
};


void configAES(int slot, u64 addr){
	switch(slot){
		case 0 : Xil_Out32(RM0_CONFIG, 0x00000081);
			break;
		case 1 : Xil_Out32(RM1_CONFIG, 0x00000081);
			break;
	}
	/*Configuring Data movers and Triggering them*/
	MM2SData(slot, addr, 0x20, 0x01);
	//MM2SStatus(slot);
	while(1){
		if(MM2SDone(slot)){
			printf("AES128 Config Done !!\n");
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

	writeBuff(encryptedkeybuff, 0x20, CONFIGADDRESS[0]);
	writeBuff(decryptedkeybuff, 0x20, CONFIGADDRESS[1]);
	printf("Config Start !!\n");
	configAES(0, CONFIGADDRESS[0]);
	configAES(1, CONFIGADDRESS[0]);

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

	printf("all done \n");
    cleanup_platform();
	return XST_SUCCESS;
}

