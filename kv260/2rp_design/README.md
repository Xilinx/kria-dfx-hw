## Steps to build Vivado project and platform 
```
- Source vivado 2022.1 tool settings
- Add the following line to Vivado_init.tcl before launching Vivado.
       	- set_param bd.gen_bda_file 1
- Clone the git repository to local sandbox.
	Example: git clone git@gitenterprise.xilinx.com:SOM/kria_dfx_hw.git kria_dfx_hw
	
- Go to the 2rp design directory.
	- 2P design -  kria_dfx_hw/kv260/2rp_design
- To Build both vivado project and platform on development server
        - Open bash shell 
        - make all
```
## Vivado Project build

```bash
make xsa
```
## Project build steps for vivado

```
Launch vivado 
source ./opendfx_shell.tcl 
```
## Platform build

```bash
make platform
```
