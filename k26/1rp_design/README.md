# Pre-requisite to build Vivado project and platform 

- Vivado build -  2022.1
- Add the following line to Vivado_init.tcl before launching Vivado. Refer UG894 for more information on Vivado_init.tcl.
```
vim ~/.Xilinx/Vivado/Vivado_init.tcl
set_param bd.gen_bda_file 1
```

# Steps to build 1 RP Hardware Design

- Clone the kria-dfx-hw git repository and navigate to the directory 1rp_design
```
git clone git@gitenterprise.xilinx.com:SOM/kria_dfx_hw.git kria_dfx_hw
cd kria_dfx_hw/k26/1rp_design
```
	
- The build script, opendfx_shell.tcl, uses 16 parallel jobs to run implementation. On the following lines, increase or decrease the number of parallel jobs as desired. The Vivado default setting is 1 job.
          https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/1rp_design/opendfx_shell.tcl#L2529
	  
          https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/1rp_design/opendfx_shell.tcl#L2532



# Building the Hardware Design
User can build the hardware files either in CLI mode or GUI mode.

## Build steps in CLI mode:
Open a bash shell, navigate to the 1rp_design directory and run the Makefile.

```bash
cd kria_dfx_hw/k26/1rp_design
make all
```
After the build is finished, the terminal will display the message "Platform build complete". 


## Build steps in GUI mode:
* Navigate to the directory 1rp_design.
```
cd kria_dfx_hw/k26/1rp_design
```


* Launch vivado. In Vivado tcl console, run the following command
```
source ./opendfx_shell.tcl
```
Wait till all design runs finish in Vivado.



## Verify output products
* The build steps should create base bitstream, RM partials and XSA file.
* Inspect the following sub-directories under project_1/project_1.runs directory to verify that bitfiles are generated. There should be 2 bit files in each sub-directory 
    * impl_1
    * child_0_impl_1
    * child_1_impl_1
    * child_2_impl_1
    * child_3_impl_1
    * child_4_impl_1
    * child_5_impl_1

* Inspect the directory project_1 to verify that XSA file is generated.
