# kria_dfx_hw
Kria DFX Reference Designs

The repository structure is outlined below. 

* k26 - KRIA based platform
	* 2rp_design
		* rm_tcl - Directory contains tcl files for the accelerator module designs ("RMs") built against the base shell.
		* xdc - Directory contains design constraints
			* physical_constraints.xdc
			* timing_constraints.xdc
		* opendfx_shell.tcl - Top-level script which 
			* Sources the RMs in rm_tcl directory and creates RM Block Designs(BDs)
			* Creates Block Design containers (BDCs)
			* Adds RM BDs to BDCs
			* Creates DFx configurations.

	* ip_repo - Source code of accelerators packaged in IP-XACT format.

* k26_testcases - Test cases
	* Standalone
		* data - Standalone test cases input data
		* src - Source code
		* build_RM.tcl - Creates vitis project, source the code, and build elf. 
		* test.tcl - Tcl to test the RM on the board 
