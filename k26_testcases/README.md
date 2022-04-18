Standalone Test cases-

The k26 dfx design have the four RM's added- AES192, AES128, FFT and FIR.

Each of the RM folder contains the main.c file to be used for the vitis application.

Directory structure of k26_testcases-

* Standalone
	* AES128- Application code to run AES128 accelerator.
	* AES192- Application code to run AES192 accelerator.
	* FFT- Application code to run FFT accelerator.
	* FIR- Application code to run FIR accelerator.
	* data- Input and output data reference files for all the RM's
	* src - Directory containing common platform files.
	* README.md- Instructions to build and test the elf
        * build<RM_NAME>.tcl - Vitis script to build RM_NAME application elf.
 	* test<RM_NAME> - Script containing xsdb commands to run the RM_NAME application on the target board. 

* Linux
	* AES128- Application code to run AES128 accelerator.
	* AES192- Application code to run AES192 accelerator.
	* FFT- Application code to run FFT accelerator.
	* FIR- Application code to run FIR accelerator.
	* README.md- Instructions to build and test the elf
	* build<RM_NAME>.tcl - Vitis script to build RM_NAME application elf.
	
