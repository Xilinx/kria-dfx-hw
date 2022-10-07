# kria_dfx_hw

This repository contains Kria DFX Reference Designs. It shows how to run accelerators on kria platforms(kv260/kr260).

The repository structure is outlined below. 

* k26 - KRIA hardware platform
	* 2rp_design - Top level directory containing Vivado HW design
		* rm_tcl - Directory contains tcl files for the accelerator modules("RMs") built against the base shell.
		* xdc - Directory contains design constraints
			* physical_constraints.xdc
			* timing_constraints.xdc
		* opendfx_shell.tcl - Top-level script which 
			* Sources the RMs in rm_tcl directory and creates RM Block Designs(BDs)
			* Creates base shell containing Block Design containers(BDCs)
			* Adds RM BDs to BDCs
			* Creates DFx configurations.
			* Generates bitfiles for the base shell and the accelerators.

	* ip_repo - Source code of accelerators packaged in IP-XACT format.

* k26_testcases - Contains test-cases to run accelerators in Linux or Standalone environment.
	* Standalone
		* data - Directory to store input data and golden data for the accelerators.
		* src - Directory containing common platform files.
		* build_<RM_NAME>.tcl - Vitis script to build a RM application elf.
		* test_<RM_NAME>.tcl - Script to test the RM_NAME application on the target board.
		* Directories with accelerator name. Contains the application code specific to the accelerator.

# Build Steps  
## 1. HW Build 

Please find the detailed steps-

 1rp design- https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/1rp_design/README.md

 2rp design-  https://gitenterprise.xilinx.com/SOM/kria_dfx_hw/edit/main/k26/2rp_design/README.md 

## 2. K26 2RP Firmware Build for dfx-mgr

Execute step 1 before running step 2. 

Please find the detailed steps-https://gitenterprise.xilinx.com/SOM/kria_dfx_hw/blob/main/software/plImages/README.md 

## 3. HW Standalone App Build & Test 

Execute step 1 before running step 4. 

Please find the detailed steps-https://gitenterprise.xilinx.com/SOM/kria_dfx_hw/blob/main/k26_testcases/Standalone/README.md 
