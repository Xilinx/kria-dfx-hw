#include <stdio.h>
#include "xil_types.h"
#include "xil_io.h"


int writeBuff(u32* buff, int counts, UINTPTR address){
	int i;
	for (i = 0; i < counts >> 2; i++){
		Xil_Out32(address + (i << 2), buff[i]);
	}
	return 0;
}

int zeroBuff(int counts, UINTPTR address){
	int i;
	for (i = 0; i < counts >> 2; i++){
		Xil_Out32(address + (i << 2), 0);
	}
	return 0;
}

int readBuff(u32* buff, int counts, UINTPTR address){
	int i;
	for (i = 0; i < counts >> 2; i++){
		buff[i] = Xil_In32(address + (i << 2));
	}
	return 0;
}

int printBuff(int counts, UINTPTR address){
	int i;
	u32 value;
	for (i = 0; i < counts >> 2; i++){
		value = Xil_In32(address + (i << 2));
		if (i % 8 == 0){
			printf("\n %x :", i);
		}
		printf(" %08x", value);
	}
	printf("\n");
	return 0;
}
int compare(int counts, UINTPTR address, UINTPTR refaddress){
	int i;
	int error = 0;
	u32 value, refvalue;
	for (i = 0; i < counts >> 2; i++){
		value = Xil_In32(address + (i << 2));
		refvalue = Xil_In32(refaddress + (i << 2));
		if (value != refvalue){
			printf("Error: Doesn't matched with the reference !!!!\n");
			printf("%x", i);
			error = 1;
			break;
		}
	}
	if (error==0){
		printf("Success: Matched with the reference !!!!\n");
	}
	return 0;
}
