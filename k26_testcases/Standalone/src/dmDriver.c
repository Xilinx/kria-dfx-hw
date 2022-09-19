// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"
#include "gicManager.h"

static u64 ACCELCONFIG[] = {
		0,
		0
};

// HLS control
#define APCR       0x00
#define GIER       0x04
#define IIER       0x08
#define IISR       0x0c
#define ADDR_LOW   0x10
#define ADDR_HIGH  0x14
#define SIZE_LOW   0x1c
#define TID        0x24

//Control signals
#define AP_START       0
#define AP_DONE        1
#define AP_IDLE        2
#define AP_READY       3
#define AP_AUTORESTART 7

#define SIZE_HIGH  0x20
#define S2MM      0x00000
#define MM2S      0x10000

volatile static int S2MMProcessed[] = {FALSE, FALSE};
volatile static int MM2SProcessed[] = {FALSE, FALSE};

	int configDMSlots(u64 rm0_base, u64 rm1_base){
		ACCELCONFIG[0] = rm0_base;
		ACCELCONFIG[1] = rm1_base;
		return 0;
	}

int MM2SStatus(int slot){
	int status;
	printf("################# MM2S %lx ##############\n", ACCELCONFIG[slot] + MM2S);
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + APCR);
	printf("ap_start     = %x \n", (status >> AP_START) & 0x1);
	printf("ap_done      = %x \n", (status >> AP_DONE) & 0x1);
	printf("ap_idle      = %x \n", (status >> AP_IDLE) & 0x1);
	printf("ap_ready     = %x \n", (status >> AP_READY) & 0x1);
	printf("auto_restart = %x \n", (status >> AP_AUTORESTART) & 0x1);
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + ADDR_LOW);
	printf("ADDR_LOW = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + ADDR_HIGH);
	printf("ADDR_HIGH = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + SIZE_LOW);
	printf("SIZE_LOW = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + GIER);
	printf("GIER = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + IIER);
	printf("IIER = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + IISR);
	printf("IISR = %x \n", status);
	printf("################# MM2S #######################\n");
	return 0;
}

int S2MMStatus(int slot){
	int status;
	printf("################# S2MM %lx ###############\n", ACCELCONFIG[slot] + S2MM);
	status = Xil_In32(ACCELCONFIG[slot] + S2MM + APCR);
	printf("ap_start     = %x \n", (status >> AP_START) & 0x1);
	printf("ap_done      = %x \n", (status >> AP_DONE) & 0x1);
	printf("ap_idle      = %x \n", (status >> AP_IDLE) & 0x1);
	printf("ap_ready     = %x \n", (status >> AP_READY) & 0x1);
	printf("auto_restart = %x \n", (status >> AP_AUTORESTART) & 0x1);

	status = Xil_In32(ACCELCONFIG[slot] + S2MM + ADDR_LOW);
	printf("ADDR_LOW = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + S2MM + ADDR_HIGH);
	printf("ADDR_HIGH = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + S2MM + SIZE_LOW);
	printf("SIZE_LOW = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + S2MM + GIER);
	printf("GIER = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + S2MM + IIER);
	printf("IIER = %x \n", status);
	status = Xil_In32(ACCELCONFIG[slot] + S2MM + IISR);
	printf("IISR = %x \n", status);
	printf("################# s2MM #######################\n");
	return 0;
}

int MM2SData(int slot, u64 data, u64 size, u8 tid){
	//printf("MM2S @ slot %x with address %x %x\n", slot, ACCELCONFIG[slot] + MM2S + ADDR_HIGH, ACCELCONFIG[slot] + MM2S + ADDR_LOW);
	Xil_Out32(ACCELCONFIG[slot] + MM2S + ADDR_LOW, data & 0xFFFFFFFF);
	Xil_Out32(ACCELCONFIG[slot] + MM2S + ADDR_HIGH, (data >> 32) & 0xFFFFFFFF);
	Xil_Out32(ACCELCONFIG[slot] + MM2S + SIZE_LOW, (size >> 4) & 0xFFFFFFFF);
	//Xil_Out32(ACCELCONFIG[slot] + MM2S + SIZE_HIGH, (size >> 32) & 0xFFFFFFFF);
	Xil_Out32(ACCELCONFIG[slot] + MM2S + TID, tid);
	Xil_Out32(ACCELCONFIG[slot] + MM2S + GIER, 0x1);
	Xil_Out32(ACCELCONFIG[slot] + MM2S + IIER, 0x3);
	Xil_Out32(ACCELCONFIG[slot] + MM2S + APCR, 0x1 << AP_START);
	return 0;
}

int S2MMData(int slot, u64 data, u64 size){
	//printf("S2MM @ slot %x with address %x %x\n", slot, ACCELCONFIG[slot] + MM2S + ADDR_HIGH, ACCELCONFIG[slot] + MM2S + ADDR_LOW);
	Xil_Out32(ACCELCONFIG[slot] + S2MM + ADDR_LOW, data & 0xFFFFFFFF);
	Xil_Out32(ACCELCONFIG[slot] + S2MM + ADDR_HIGH, (data >> 32) & 0xFFFFFFFF);
	Xil_Out32(ACCELCONFIG[slot] + S2MM + SIZE_LOW, (size >> 4) & 0xFFFFFFFF);
	//Xil_Out32(ACCELCONFIG[slot] + S2MM + SIZE_HIGH, (size >> 32) & 0xFFFFFFFF);
	//Xil_Out32(ACCELCONFIG[slot] + S2MM + TID, tid);
	Xil_Out32(ACCELCONFIG[slot] + S2MM + GIER, 0x1);
	Xil_Out32(ACCELCONFIG[slot] + S2MM + IIER, 0x3);
	Xil_Out32(ACCELCONFIG[slot] + S2MM + APCR, 0x1 << AP_START);
	return 0;
}

int S2MMDone(int slot){
	int status;
	status = Xil_In32(ACCELCONFIG[slot] + S2MM + APCR);
	//printf("%x\n", status);
	return ((status >> AP_DONE) | (status >> AP_IDLE)) & 0x1;
}

int MM2SDone(int slot){
	int status;
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + APCR);
	//printf("%x\n", status);
	return ((status >> AP_DONE) | (status >> AP_IDLE)) & 0x1;
}

int MM2SAck(int slot){
	int status;
	status = Xil_In32(ACCELCONFIG[slot] + MM2S + IISR);
	Xil_Out32(ACCELCONFIG[slot] + MM2S + IISR, status);
	return 0;
}

int S2MMAck(int slot){
	int status;
	status = Xil_In32(ACCELCONFIG[slot] + S2MM + IISR);
	Xil_Out32(ACCELCONFIG[slot] + S2MM + IISR, status);
	return 0;
}

void MM2SHandler(void *CallbackRef)
{
	/*
	 * Indicate the interrupt has been processed using a shared variable
	 */
	MM2SAck(0);
	//MM2SStatus();
	MM2SProcessed[0] = TRUE;
	printf("MM2S Interrupted !!\n");
}

void S2MMHandler(void *CallbackRef)
{
	/*
	 * Indicate the interrupt has been processed using a shared variable
	 */
	S2MMAck(0);
	//S2MMStatus();
	S2MMProcessed[0] = TRUE;
	printf("S2MM Interrupted !!\n");
}

int sihaInterruptConfig(){
	int Status;
	Status = gicConfig(S2MMHandler, MM2SHandler, (void *)&S2MMProcessed[0], (void *)&MM2SProcessed[0]);
	if (Status != XST_SUCCESS) {
		xil_printf("Interrupt Configuration Failed\r\n");
		return XST_FAILURE;
	}

	S2MMProcessed[0] = TRUE;
	MM2SProcessed[0] = TRUE;
	return 0;
}

int getS2MMProcessed(int slot){
	return S2MMProcessed[slot];
}
int getMM2SProcessed(int slot){
	return MM2SProcessed[slot];
}
