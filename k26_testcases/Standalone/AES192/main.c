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

u32 decryptedbuff[] = {
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc,
	0x33221100, 0x77665544, 0xbbaa9988, 0xffeeddcc
};

u32 encryptedbuff[] = {
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec,
	0xa47ca9dd, 0xe0df4c86, 0xa070af6e, 0x91710dec
};
u32 decryptedkeybuff[] = {
	0x03020100, 0x07060504, 0x0b0a0908,0x0f0e0d0c,
	0x13121110, 0x17161514,0x00000001, 0x00000000
};
u32 encryptedkeybuff[] = {
	0x03020100, 0x07060504, 0x0b0a0908,0x0f0e0d0c,
	0x13121110, 0x17161514,0x00000000, 0x00000000
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
			printf("AES192 Config Done !!\n");
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

	configAES(0, CONFIGADDRESS[1]);
	configAES(1, CONFIGADDRESS[0]);

	printf("Config done!!\n");
	trigger_DMA(0, INDATAADDRESS[1],0x200000,OUTDATAADDRESS[0],0x200000);
	wait_DMA(0);
	printf("slot 0 done !!\n");
	trigger_DMA(1, INDATAADDRESS[0],0x200000,OUTDATAADDRESS[1],0x200000);
	wait_DMA(1);
	printf("slot 1 done !!\n");

	printf("comparing slot 0 output with reference ...\n");
	compare(0x200000, OUTDATAADDRESS[0], INDATAADDRESS[0]);

	printf("comparing slot 1 output with reference ...\n");
	compare(0x200000, OUTDATAADDRESS[1], INDATAADDRESS[1]);

	//printf("Input Data ...\n");
	//printBuff(0x100, INDATAADDRESS[0]);
	//printf("Decrypted Reference Data ...\n");
	//printBuff(0x100, INDATAADDRESS[1]);
	//printf(" output Data from Slot 0\n");
	//printBuff(0x100, OUTDATAADDRESS[0]);
	//printf("output Data from Slot 1\n");
	//printBuff(0x100, OUTDATAADDRESS[1]);

	printf("all done \n");
	cleanup_platform();
	return XST_SUCCESS;
}
