## Pre-requisite to build Vivado project and platform 

- Vivado build - 2022.1
- Add the following line to Vivado_init.tcl before launching Vivado. Refer refer-ug894 for more information on Vivado_init.tcl.
```
vim ~/.Xilinx/Vivado/Vivado_init.tcl
set_param bd.gen_bda_file 1
```

- Clone the git repository to local sandbox.
```
git clone git@gitenterprise.xilinx.com:SOM/kria_dfx_hw.git kria_dfx_hw
```
	
- The build script, opendfx_shell.tcl, uses 16 parallel jobs to run implementation. The user can either increase or decrease the number of parallel jobs. The Vivado default setting is 1 job.
 
 https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/2rp_design/opendfx_shell.tcl#L2880
 
 https://gitenterprise.xilinx.com/SOM/kria-dfx-hw/blob/main/k26/2rp_design/opendfx_shell.tcl#L2883
```
cd kria_dfx_hw/k26/2rp_design
```

User can build the hardware files either in CLI mode or GUI mode.

## 1. CLI:
Navigate to the 2rp_design directory and run the Makefile in a bash shell.

```bash
cd kria_dfx_hw/k26/2rp_design
make all
```
After the build is finished, the terminal will have "Platform build complete" print. 

## 2. GUI:
Navigate to the directory 2rp_design, launch vivado, in vivado's tcl console source opendfx_shell.tcl
```
Launch vivado 
source ./opendfx_shell.tcl
```
