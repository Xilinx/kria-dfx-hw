/*
 * Copyright (c) 2022 Xilinx, Inc.  All rights reserved.
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
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>

#define S2MM      0x0000
#define MM2S      0x10000

uint32_t config[] = {0x0000000c,0x0000000c,0x0000000c,0x0000000c};

uint32_t fft_data_in[] = {
	0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7
};
uint32_t fft_data_out[] = {
	0x88009C00, 0x5C006800, 0x5800E400, 0x1400A800
};

uint32_t resultbuff[] = {
	0x00000000, 0x00000000, 0x00000000, 0x00000000,
	0x00000000, 0x00000000, 0x00000000, 0x00000000,
	0x00000000, 0x00000000, 0x00000000, 0x00000000,
	0x00000000, 0x00000000, 0x00000000, 0x00000000
};


int main(int argc, char *argv[])
{
	int fd1,fd2,fd3;
	void *accel_ptr,*siha_ptr,*rmcomm_ptr;
	char *uiod1 = "/dev/uio4";//Siha_manager
	char *uiod2 = "/dev/uio7";//Accelconfig
	char *uiod3 = "/dev/uio8";//rmcomm_box
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

	unsigned int ddr_size = 0x80000;
	off_t ddr_pbase = 0x60000000; // physical base address
	int *vptr;int fd;
	// Map the ddr physical address into user space getting a virtual address for it
	if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) != -1) {
		vptr = (int *)mmap(NULL, ddr_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, ddr_pbase);
		// Write to the memory that was mapped, use devmem from the command line of Linux to verify it worked
		int i=0;
		for (i=0;i<4;i++)
		{
			vptr[i]=config[i];
		}

		for (i=0;i<16384;i++)
		{
			vptr[1024+i]=fft_data_in[i%4];
		}
	}

	printf("FFT TEST :\n");
    //Configure FFT Ch0
    *((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x60000000; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x1;//size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x1; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;	       //Ctrl

	int status = *((volatile unsigned *)(rmcomm_ptr +MM2S));
	while (! ((status) & 0x1))
		status =*((volatile unsigned *)(rmcomm_ptr +MM2S));

    //Configure FFT Ch1
    *((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x60000000; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x1;//size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x2; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;	       //Ctrl

	status = *((volatile unsigned *)(rmcomm_ptr +MM2S));
	while (! ((status) & 0x1))
		status =*((volatile unsigned *)(rmcomm_ptr +MM2S));

        //Configure FFT Ch2
    *((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x60000000; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x1;//size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x3; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;	       //Ctrl

	status = *((volatile unsigned *)(rmcomm_ptr +MM2S));
	while (! ((status) & 0x1))
		status =*((volatile unsigned *)(rmcomm_ptr +MM2S));

        //Configure FFT Ch3
    *((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x60000000; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x1;//size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x4; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;	       //Ctrl

	status = *((volatile unsigned *)(rmcomm_ptr +MM2S));
	while (! ((status) & 0x1))
		status =*((volatile unsigned *)(rmcomm_ptr +MM2S));

	//Config MM2S data
	*((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x60001000; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x1000;//size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x0; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;	       //Ctrl
	status = *((volatile unsigned *)(rmcomm_ptr +MM2S));
	while (! ((status) & 0x1))
		status =*((volatile unsigned *)(rmcomm_ptr +MM2S));

	//Config S2MM data
	*((volatile unsigned *)(rmcomm_ptr + 0x10 +S2MM))=0x60011000;//memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +S2MM))=0x0; //memaddr_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +S2MM))=0x1000;//size
	*((volatile unsigned *)(rmcomm_ptr +S2MM))=0x1;	       //Ctrl
	status = *((volatile unsigned *)(rmcomm_ptr));
	while (! ((status) & 0x1))
		status =*((volatile unsigned *)(rmcomm_ptr ));

	sleep(2);									//Time added for completion of FFT before reading the out data

	for (int i=0; i < 16; i++)					//Copying out data to resultbuff for comparision with golden data
	  	resultbuff[i] = vptr[(i*1024)+17408];

	int same_flag = 1;
		for (int i=0; i< 16; i++)
		{
			if(fft_data_out[i%4] != resultbuff[i])
			{
				same_flag=0;
				break;
			}
		}

		if(same_flag)
			printf("\t === TEST PASSED ===\n");
		else
			printf("\t === TEST FAILED ===\n");

	close(fd1);
	close(fd2);
	close(fd3);
	return 0;

}


