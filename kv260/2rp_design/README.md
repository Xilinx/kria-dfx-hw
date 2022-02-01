## Steps to build Vivado project and platform 
```
- Edit the $PATH variable to include vivado 2022.1 tool
- Add the following line to /home/`user`/.Xilinx/Vivado/2022.1/Vivado_init.tcl before launching Vivado(create the file if it doesn't exist)
       	- set_param bd.gen_bda_file 1
        - set_param bitstream.enableMetaData 1
- Clone the openacap git repository to local sandbox.
	Example: git clone git@gitenterprise.xilinx.com:SOM/kria_dfx_hw.git opendfx
	
- Navigate to the directory that you intend to build.
	- 2P design -  opendfx/kv260/2rp_design
- To Build both vivado project and platform on development server
        - Open bash shell 
        - make all
```

## Vivado Project build

```bash
make xsa
```

## Platform build

```bash
make platform
```

## Project build steps for vnc

### bsub 

```bash
bsub -q long -R "select[type=X86_64&&osver=ws7]" -R "rusage[mem=131072]" -M 262144000 make all
```
OR 

```bash
Launch vivado 
bsub -q long -R "select[type=X86_64&&osver=ws7]" -R "rusage[mem=131072]" -M 262144000 /proj/xbuilds/2022.1_daily_latest/installs/lin64/Vivado/2022.1/bin/vivado
source ./opendfx_shell.tcl 
```
