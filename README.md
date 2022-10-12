# DFX Reference Design on Kria

This repository contains DFX example designs on Kria. The repository structure is outlined below. 

* k26 - Hardware platform supported. Both KV260 and KR260 are supported.
	* 2rp_design - Top level directory containing Vivado HW design files for 2 slot DFX design.
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
	* 1rp_design - Top level directory containing Vivado HW design files for 1 slot DFX design.
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

* k26_testcases - Contains test-cases to run accelerators in Standalone environment.
	* Standalone
		* data - Directory to store input data and golden data for the accelerators.
		* src - Directory containing common platform files.
		* build_<RM_NAME>.tcl - Vitis script to build a RM application elf.
		* test_<RM_NAME>.tcl - Script to test the RM_NAME application on the target board.
		* Directories with accelerator name. Contains the application code specific to the accelerator.

# Steps to Build Hardware

Refer to the links mentioned below for detailed steps to build the hardware designs.

 * 1rp design - [Steps](https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/1rp_design/README.md) to build the 1RP design.

 * 2rp design - [Steps](https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/2rp_design/README.md) to build the 2RP design.

