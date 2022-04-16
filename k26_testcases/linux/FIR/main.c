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
int16_t reload[] = {142,-266,-59,32,66,70,61,44,23,1,-21,-40,-54,-59,-56,-43,-22,5,33,58,75,81,74,53,21,-17,-56,-90,-111,-114,-98,-64,-16,39,93,135,159,157,128,75,4,-74,-147,-201,-226,-215,-166,-84,20,130,230,300,326,300,219,92,-64,-227,-370,-468,-497,-444,-308,-99,159,429,670,836,887,790,528,102,-468,-1145,-1875,-2596,-3244,-3757,-4086,28568};
uint32_t fir_data_in[] = {
	0xcca5a729, 0x4b276e90, 0x9a57a7e7, 0xd0bfe1c7
};

int main(int argc, char *argv[])
{
	printf("test");
	int fd1,fd2,fd3;
	void *accel_ptr,*siha_ptr,*rmcomm_ptr;
	
	//Application code for slot1. UID are of slot1
	char *uiod1 = "/dev/uio4";//Siha_manager
	char *uiod2 = "/dev/uio7";//Accelconfig
	char *uiod3 = "/dev/uio8";//rmcomm_box

	printf("uid opened");
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
	printf("uid done");
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
	off_t ddr_pbase = 0x70000000; // physical base address
	int *vptr;int fd;
	// Map the ddr physical address into user space getting a virtual address for it
	if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) != -1) {
		vptr = (int *)mmap(NULL, ddr_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, ddr_pbase);
		// Write to the memory that was mapped, use devmem from the command line of Linux to verify it worked
		int i=0;
		for (i=0;i<40;i++)
		{
			vptr[i]= (uint16_t)reload[2*i] | reload[2*i+1]<<16;
		}
		for (i=0; i<4; i++)
		{
			vptr[i+128]=config[i];  //70000200
		}
		for (i=0; i<16384; i++)
		{
			vptr[i+256]=fir_data_in[i%4];  //70000400
		}
		//close(fd);
	}

	printf("FIR RM !!\n");
	
	//Config reload data with TID 1
	*((volatile unsigned *)(rmcomm_ptr+0x10+MM2S))= 0x70000000; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0xA; //size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x1; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;        //Ctrl
	printf("Reload done !!\n");

	//Config Data MM2S with TID 0 
	*((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x70000200; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x1;//size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x2; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;	       //Ctrl
	printf("Config done !!\n");

	//Config MM2S fir input data
	*((volatile unsigned *)(rmcomm_ptr + 0x10 +MM2S))=0x70000400; //memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +MM2S))=0x0; //mem_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +MM2S))=0x1000;//size
	*((volatile unsigned *)(rmcomm_ptr + 0x24 +MM2S))=0x0; //tid
	*((volatile unsigned *)(rmcomm_ptr +MM2S))=0x1;	       //Ctrl
	printf("Config done !!\n");

	int statusd2;
	statusd2 = *((volatile unsigned *)(rmcomm_ptr +MM2S));
	while (! ((statusd2) & 0x1))
		statusd2 =*((volatile unsigned *)(rmcomm_ptr +MM2S));
	
	//Config S2MM output data
	*((volatile unsigned *)(rmcomm_ptr + 0x10 +S2MM))=0x70008000;//memaddr_low
	*((volatile unsigned *)(rmcomm_ptr + 0x14 +S2MM))=0x0; //memaddr_high
	*((volatile unsigned *)(rmcomm_ptr + 0x1c +S2MM))=0x1000;//size
	*((volatile unsigned *)(rmcomm_ptr +S2MM))=0x1;	       //Ctrl
	int statusd3;
	statusd3 = *((volatile unsigned *)(rmcomm_ptr));
	while (! ((statusd3) & 0x1))
		statusd3 =*((volatile unsigned *)(rmcomm_ptr ));
	
	printf("Done !!\n");
	return 0;
}
