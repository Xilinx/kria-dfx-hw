## Pre-requisite to build Vivado project and platform 

- Source vivado 2022.1 tool settings
- Add the following line to Vivado_init.tcl before launching Vivado. Refer refer-ug894 for more information on Vivado_init.tcl.
```
set_param bd.gen_bda_file 1
```

- Clone the git repository to local sandbox.
```
git clone git@gitenterprise.xilinx.com:SOM/kria_dfx_hw.git kria_dfx_hw
```
	
- If needed, update the following line in opendfx_shell.tcl according to your job queue setting.
```
cd kria_dfx_hw/k26/2rp_design
launch_runs impl_1 child_0_impl_1 child_1_impl_1 child_2_impl_1 child_3_impl_1 -to_step write_bitstream -jobs 16
```

User can build the hardware files either in CLI mode or GUI mode

##1 CLI:

```bash
make all
```
After the build is finished, the terminal will have "Platform build complete" print. 

## 2. GUI:
```
Launch vivado 
source ./opendfx_shell.tcl in the tcl console.
```
