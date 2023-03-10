<h1 align="center">KRIA DYNAMIC FUNCTION EXCHANGE REFERENCE DESIGNS</h1>

## Introduction
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
		* create_new_rm - Scripts to create new reconfigurable module for the 2RP design.
			* abstract_shells - Contains the abstract shells for slots RP_0 and RP_1.
			* generate_rm.tcl - Script to generate partial bitfiles for new accelerators.
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

## About DFX

The AMD-Xilinx Dynamic Function eXchange (DFX) is a technology that enables an incremental and partitioned hardware configuration of a programmable device. Details on DFX capabilities within the Vivado tool are available in [UG909](https://docs.xilinx.com/r/en-US/ug909-vivado-partial-reconfiguration). In PL/FPGA-based DFX this enables a concept of reconfigurable partitions (RP) and reconfigurable modules (RM). The RP provides a pre-provisioned HW space allocation within which different RMs can be loaded dynamically. The system and solution capabilities of the DFX incremental HW configuration enable:

• Partitioned designs allowing one part of the system to be changed (reconfigured) while another part of the system remains running.

• “Slotted” architecture allowing for dynamically composable HW systems without having to recompile a monolithic configuration bitstream file.

• Decoupled life cycles for PL-based functions, facilitating a reconfigurable module (RM) to be deployed to the field later without having to update or rebuild the base platform design.


## Try DFX Application

Detailed documentation and how to try this applcation is well documented [here](https://xilinx.github.io/kria-apps-docs/dfx/build/html/docs/DFX_Landing_Page.html#getting-started-with-pre-built-dfx-examples-for-kr260-and-kv260). Please go through the [DFX documentation page](https://xilinx.github.io/kria-apps-docs/dfx/build/html/docs/DFX_Landing_Page.html#) for more details.



