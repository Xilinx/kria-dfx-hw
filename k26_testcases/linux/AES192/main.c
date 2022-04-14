/*
 * Copyright (c) 2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "utils.h"
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>

#define S2MM      0x0000
#define MM2S      0x10000

uint32_t decryptedbuff[] = {
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

uint32_t encryptedbuff[] = {
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
uint32_t decryptedkeybuff[] = {
		0x03020100, 0x07060504, 0x0b0a0908,0x0f0e0d0c,
		0x13121110, 0x17161514,0x00000001, 0x00000000
};
uint32_t encryptedkeybuff[] = {
		0x03020100, 0x07060504, 0x0b0a0908,0x0f0e0d0c,
		0x13121110, 0x17161514,0x00000000, 0x00000000
};

int main(int argc, char *argv[])
{
	int fd1,fd2,fd3;
	void *accel_ptr,*siha_ptr,*rmcomm_ptr;
	char *uiod1 = "/dev/uio4";//Siha_manager
	char *uiod2 = "/dev/uio5";//Accelconfig
	char *uiod3 = "/dev/uio6";//rmcomm_box
	//Application code for slot0. UID are of slot0

	/* Open the UIO device file to allow access to the device in user space*/
	fd1 = open(uiod1, O_RDWR | O_SYNC);
	if (fd1 < 1) {
		printf("Failed to open %s device\n", uiod1);
		return -1;}
	fd2 = open(uiod2, O_RDWR | O_SYNC);
	if (fd2 < 1) {
		printf("Failed to open %s device\n", uiod2);
		return -1;}
	fd3 = open(uiod3, O_RDWR | O_SYNC);
	if (fd3 < 1) {
		printf("Failed to open %s device\n", uiod3);
		return -1;}

	/* Memory map */
	siha_ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE, MAP_SHARED, fd1, 0);
	if (siha_ptr == MAP_FAILED) {
		printf("Failed to map memory %s [%d]: %s(): \n", __FILE__, __LINE__, __FUNCTION__);
		return -1;}
	accel_ptr = mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_SHARED, fd2, 0);
	if (accel_ptr == MAP_FAILED) {
		printf("Failed to map memory %s [%d]: %s(): \n", __FILE__, __LINE__, __FUNCTION__);
		return -1;}
	rmcomm_ptr = mmap(NULL, 0x1000000, PROT_READ | PROT_WRITE, MAP_SHARED, fd3, 0);
	if (rmcomm_ptr == MAP_FAILED) {
		printf("Failed to map memory %s [%d]: %s(): \n", __FILE__, __LINE__, __FUNCTION__);
		return -1;}

	unsigned int ddr_size = 0x8000;
	off_t ddr_pbase = 0x60000000; // physical base address
	int *vptr;int fd;
	// Map the ddr physical address into user space getting a virtual address for it
	if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) != -1) {
		vptr = (int *)mmap(NULL, ddr_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, ddr_pbase);
		// Write to the memory that was mapped, use devmem from the command line of Linux to verify it worked
		int i=0;
		for (i=0;i<8;i++)
		{
			vptr[i]=encryptedkeybuff[i];
		}
		for (i=0; i< 64; i++)
		{
			vptr[i+64]=encryptedbuff[i];
		}
		//close(fd);
	}

	//Initialize AES192
	*((volatile unsigned *)(accel_ptr))=0x81; // Enable Accelerator in RP 0
	printf("Slot enabled !!\n");

	//Program key to Accelerator
	//Config key DM with TID 1
	// DM Seq 0x010, 0x14, 0x1c, 0x24, 0x0 memaddr_low, mem_high, size, tid, ctrl
	*((volatile unsigned *)(rmcomm_ptr+0x10+MM2S))= 0x60000000; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x2; //size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x1; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;        //Ctrl
	printf("Config done !!\n");

	//Config MM2S	TID 0
	*((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x60000100; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x10;//size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x0; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;	       //Ctrl
	int statusd1;
	statusd1 = *((volatile unsigned *)(rmcomm_ptr +MM2S));
	while (! ((statusd1) & 0x1))
		statusd1 =*((volatile unsigned *)(rmcomm_ptr +MM2S));

	//Config S2MM
	*((volatile unsigned *)(rmcomm_ptr + 0x10 +S2MM))=0x60000200;//memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +S2MM))=0x0; //memaddr_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +S2MM))=0x10;//size
	*((volatile unsigned *)(rmcomm_ptr +S2MM))=0x1;	       //Ctrl
	int statusb3;
	statusb3 = *((volatile unsigned *)(rmcomm_ptr));
	while (! ((statusb3) & 0x1))
		statusb3 =*((volatile unsigned *)(rmcomm_ptr ));
	printf("slot 0 done !!\n");

	return 0;

}


