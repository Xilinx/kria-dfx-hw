# Introduction
This document provides steps to build DFX example design on Kria.

## Pre-requisite to build Vivado project and platform 

- Vivado build - 2022.1
- Linux environment to build the design.
- Add the following line to Vivado_init.tcl before launching Vivado. Refer refer-ug894 for more information on Vivado_init.tcl.
```
vim ~/.Xilinx/Vivado/Vivado_init.tcl
set_param bd.gen_bda_file 1
```

- Clone the kria-dfx-hw git repository and navigate to the directory 2rp_design
```
git clone https://github.com/Xilinx/kria-dfx-hw.git
cd kria-dfx-hw/k26/2rp_design
```
	
- The build script, opendfx_shell.tcl, uses 16 parallel jobs to run implementation. The user can modify the number of parallel jobs by editing lines 2880 and 2883 in opendfx_shell.tcl. The Vivado default setting is 1 job. 


## Building the Hardware Design
User can build the hardware files either in CLI mode or GUI mode.

### Build steps in CLI mode:
Open a bash shell, navigate to the 2rp_design directory and run the Makefile.

```
make all
```
After the build is finished, the terminal will display the message "Platform build complete". 

### Build steps in GUI mode:
Launch vivado. In Vivado tcl console, run the following command
```
source ./opendfx_shell.tcl
```
Wait till all design runs finish in Vivado.

### Verify output products
* The build steps should create base bitstream, RM partials and XSA file.
* Inspect the following sub-directories under project_1/project_1.runs directory to verify that bitfiles are generated. There should be 3 bit files in each sub-directory 
    * impl_1
    * child_0_impl_1
    * child_1_impl_1
    * child_2_impl_1
    * child_3_impl_1

* Inspect the directory project_1 to verify that XSA file is generated.
