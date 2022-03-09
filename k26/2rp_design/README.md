## Steps to build Vivado project and platform 
```
- Source vivado 2022.1 tool settings
- Add the following line to Vivado_init.tcl before launching Vivado.
       	- set_param bd.gen_bda_file 1
	For path of Vivado_init.tcl please refer- ug894.
- Clone the git repository to local sandbox.
	Example: git clone git@gitenterprise.xilinx.com:SOM/kria_dfx_hw.git kria_dfx_hw
	
- Go to the 2rp design directory.
	- 2rp_design -  kria_dfx_hw/k26/2rp_design
```

Two ways to build -
## 1. Vivado Project & Platform build

```bash
make all
```
## 2. GUI build steps for vivado
```
Launch vivado 
source ./opendfx_shell.tcl 
```
