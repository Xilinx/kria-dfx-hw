## Build Instructions 
Given design uses 2022.1 Vivado tool.
- Clone the opendfx git repository to local sandbox.

	Example:  git clone git@gitenterprise.xilinx.com:SOM/kria_dfx_hw.git kria_dfx_hw

# HW Build 

1. Go to 2rp_design directory
```bash
bash$: > cd <repo_dir>/kv260/2rp_design
```

2. Launch vivado. 

Add the following line to installdir/Vivado/VivadoVersion/scripts/Vivado_init.tcl

- set_param bd.gen_bda_file 1

3. Build Vivado project and platform
```bash
bash$: > make all 
```
