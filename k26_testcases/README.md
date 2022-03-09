Standalone Test cases-

The k26 dfx design have the four RM's added- AES192, AES128, FFT and FIR.

Each of the RM folder contains the main.c file to be used for the vitis application.

Directory structure of k26_testcases-

* Standalone
	* AES128- RM code
	* AES192- RM code
	* FFT- RM code
	* FIR- RM code
	* data- Input and output data reference files for all the RM's
	* src - Contains file required for the opendfx_shell
	* README.md- Instructions to build and test the elf
	* buildAES128.tcl - Build vitis project for AES128 RM
	* buildAES192.tcl - Build vitis project for AES192 RM
	* buildFFT.tcl - Build vitis project for FFT RM
	* buildFIR.tcl - Build vitis project for FIR RM
	* test.tcl - xsdb commands to run the accelerator on the k26 board. 
