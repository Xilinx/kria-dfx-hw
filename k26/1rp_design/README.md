# Pre-requisite to build Vivado project and platform 

- Vivado build -  2022.1
- Add the following line to Vivado_init.tcl before launching Vivado. Refer UG894 for more information on Vivado_init.tcl.
```
vim ~/.Xilinx/Vivado/Vivado_init.tcl
set_param bd.gen_bda_file 1
```

# Steps to build 1 RP Hardware Design

- Clone the kria-dfx-hw git repository
```
git clone git@gitenterprise.xilinx.com:SOM/kria_dfx_hw.git kria_dfx_hw
```
	
- The build script, opendfx_shell.tcl, uses 16 parallel jobs to run implementation. On the following lines, increase or decrease the number of parallel jobs as desired. The Vivado default setting is 1 job.
          https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/1rp_design/opendfx_shell.tcl#L2529
          https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/1rp_design/opendfx_shell.tcl#L2532


User can build the hardware files either in CLI mode or GUI mode.

## 1. CLI:
Navigate to the directory 1rp_design and run the Makefile in a bash shell.

```bash
cd kria_dfx_hw/k26/1rp_design
make all
```
After the build is finished, the terminal will have "Platform build complete" print. 

## 2. GUI:
Navigate to the directory 1rp_design, launch vivado, in vivado's tcl console source opendfx_shell.tcl.
```
Launch vivado 
source ./opendfx_shell.tcl
```
