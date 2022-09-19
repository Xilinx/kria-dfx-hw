// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
#include "xscugic.h"

#define INTC_DEVICE_ID		XPAR_SCUGIC_0_DEVICE_ID
//#define INTC_DEVICE_INT_ID	0x0E
#define INT0	121
#define INT1	122


XScuGic InterruptController; 	     /* Instance of the Interrupt Controller */
static XScuGic_Config *GicConfig;    /* The configuration parameters of the
                                       controller */
int SetUpInterruptSystem(XScuGic *XScuGicInstancePtr);

int gicConfig(Xil_ExceptionHandler DeviceInterruptHandler0, Xil_ExceptionHandler DeviceInterruptHandler1, void *data0, void *data1)
{
	int Status;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	GicConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == GicConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(&InterruptController, GicConfig,
					GicConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/*
	 * Perform a self-test to ensure that the hardware was built
	 * correctly
	 */
	Status = XScuGic_SelfTest(&InterruptController);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/*
	 * Setup the Interrupt System
	 */
	Status = SetUpInterruptSystem(&InterruptController);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler performs
	 * the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(&InterruptController, INT0,
			   (Xil_ExceptionHandler)DeviceInterruptHandler0,
			   (void *)data0);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	Status = XScuGic_Connect(&InterruptController, INT1,
			   (Xil_ExceptionHandler)DeviceInterruptHandler1,
			   (void *)data1);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the device and then cause (simulate) an
	 * interrupt so the handlers will be called
	 */
	XScuGic_Enable(&InterruptController, INT0);
	XScuGic_Enable(&InterruptController, INT1);

	/*
	 *  Simulate the Interrupt
	 */
	/*Status = XScuGic_SoftwareIntr(&InterruptController,
					INTC_DEVICE_INT_ID,
					XSCUGIC_SPI_CPU0_MASK);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}*/

	/*
	 * Wait for the interrupt to be processed, if the interrupt does not
	 * occur this loop will wait forever
	 */
	//while (1) {
		/*
		 * If the interrupt occurred which is indicated by the global
		 * variable which is set in the device driver handler, then
		 * stop waiting
		 */
	//	if (InterruptProcessed) {
	//		break;
	//	}
	//}

	return XST_SUCCESS;
}

/******************************************************************************/
/**
*
* This function connects the interrupt handler of the interrupt controller to
* the processor.  This function is separate to allow it to be customized for
* each application.  Each processor or RTOS may require unique processing to
* connect the interrupt handler.
*
* @param	XScuGicInstancePtr is the instance of the interrupt controller
*		that needs to be worked on.
*
* @return	None.
*
* @note		None.
*
****************************************************************************/
int SetUpInterruptSystem(XScuGic *XScuGicInstancePtr)
{

	/*
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the ARM processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler,
			XScuGicInstancePtr);

	/*
	 * Enable interrupts in the ARM
	 */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}
