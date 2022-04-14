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

uint32_t encryptedbuff[] = {
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

uint32_t decryptedkeybuff[] = {
	0x0c0d0e0f, 0x08090a0b, 0x04050607, 0x00010203,
	0x00000001, 0x00000000, 0x00000000, 0x00000000
};

uint32_t encryptedkeybuff[] = {
	0x0c0d0e0f, 0x08090a0b, 0x04050607, 0x00010203,
	0x00000000, 0x00000000, 0x00000000, 0x00000000
};

#define BUFFSIZE 0x400000
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
	// Map the BRAM physical address into user space getting a virtual address for it
	if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) != -1) {

		bram64_vptr = (int *)mmap(NULL, bram_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, bram_pbase);

		// Write to the memory that was mapped, use devmem from the command line of Linux to verify it worked
		// it could be read back here also
		int i=0;
		for (i=0;i<8;i++)
		{
			bram64_vptr[i]=encryptedkeybuff[i];
		}
		for (i=0; i< 64; i++)
		{
			bram64_vptr[i+64]=encryptedbuff[i];
		}
		close(fd);
	}

	int data1,data2,data3,data4,data5,data6,data7;

	printf("!! ------------------ Starting Linux App ------------- !!\n");

	printf("data\n");
	//data = *((uint32_t *)(accel_ptr));
	data1 = *((volatile unsigned *)(siha_ptr));
	printf("data1 read\n");
	data2 = *((volatile unsigned *)(accel_ptr));
	printf("data2 read\n");

	*((volatile unsigned *)(accel_ptr))=0x81;;
	data7= *((volatile unsigned *)(accel_ptr));
	printf("data6 read\n");
	printf("%x\n",data7);
	int key1;
	key1 = *((volatile unsigned *)(rmcomm_ptr+MM2S));
	printf("key 1 is %x",key1);
	printf("data \n");

	*((volatile unsigned *)(rmcomm_ptr+0x10+MM2S))= 0x60000000;
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0;
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x2;
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x1;
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;
	int key2,key3;
	key2 = *((volatile unsigned *)(rmcomm_ptr+0x10+MM2S));
	printf("key 2 is %x",key2);
	key3 = *((volatile unsigned *)(bram64_vptr+1));
	printf("key 3 is %x",key3);

	*((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x60000100;
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0;
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x10;
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x0;
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;
	int statusd1;
	statusd1 = *((volatile unsigned *)(rmcomm_ptr +MM2S));

	while (! ((statusd1) & 0x1))
		statusd1 =*((volatile unsigned *)(rmcomm_ptr +MM2S));
	printf("!! ------------------ DONE1 ------------- !!\n");
	int dataw1;
	dataw1 = *((volatile unsigned *)(rmcomm_ptr+0x10+MM2S));
	printf("dataw 1 is %x",dataw1);
	int keym1;
	keym1 = *((volatile unsigned *)(rmcomm_ptr+MM2S));
	printf("keym 1 is %x",keym1);
	printf("data \n");
	//		//Config S2MM


	*((volatile unsigned *)(rmcomm_ptr + 0x10 +S2MM))=0x60000200;
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +S2MM))=0x0;
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +S2MM))=0x10;
	*((volatile unsigned *)(rmcomm_ptr +S2MM))=0x1;
	int statusb3;
	statusb3 = *((volatile unsigned *)(rmcomm_ptr));
	while (! ((statusb3) & 0x1))
		statusb3 =*((volatile unsigned *)(rmcomm_ptr ));
	int keym2;
	keym2 = *((volatile unsigned *)(rmcomm_ptr+S2MM));
	printf("keym 2 is %x",keym2);
	printf("data \n");

	return 0;

}


