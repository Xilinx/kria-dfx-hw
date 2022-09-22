# kria_dfx_hw

This repository contains Kria DFX Reference Designs. It shows how to run OpenDFX accelerators on SOM platforms.

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

* software - Contains step to generate firmware required by dfx-mgr
	* plImages
		* Makefile - Make file uses bingen.sh, genOverlay.sh and genPkg.py files
		* bingen.sh - Copies bit files from hw build and generates bin files
		* genOverlay.sh - Generates pl.dtbo file. 
		* genPkg.py - Generates firmware
		* pl.dtsi - DTSI file for given hw design
		* shell.json - Json file for dfx design 
