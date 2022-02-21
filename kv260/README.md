## Build Instructions 
All steps are given for a development server. 

- Clone the opendfx git repository to local sandbox.

	Example: git clone https://gitenterprise.xilinx.com/SOM/kria_dfx_hw.git kria_dfx_hw

# HW Build 

1. Go to 2rp_design directory
```bash
bash$: > cd <repo dir>/kv260/2rp_design
```

2. Launch vivado. 

Add the following line to Vivado_init.tcl(create the file if it doesn't exist)

- set_param bd.gen_bda_file 1
- set_param bitstream.enableMetaData 1

3. Build Vivado project and platform
```bash
bash$: > make all 
```

	

