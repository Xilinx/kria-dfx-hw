# Petalinux build flow

## Get to the bash prompt

```bash
bash
```

## Clone the repository

```bash
git clone https://gitenterprise.xilinx.com/SOM/kria_dfx_hw.git
```

## Change directory to petalinux

```bash
[kria_dfx_hw]$ cd software/petalinux
```
## Copy/download board support package

```bash
[petalinux]$ cp -r /proj/petalinux/2022.1/petalinux-v2022.1_03231148/bsp/release/xilinx-k26-starterkit-v2022.1-03231148.bsp ./
```
## Configure the build environment

```bash
[petalinux]$ source /proj/petalinux/2022.1/petalinux-v2022.1_03231148/tool/petalinux-v2022.1-final/settings.sh
```
## Create Petalinux Project

```bash
[petalinux]$ petalinux-create -t project -s ./xilinx-k26-starterkit-v2022.1-03231148.bsp 
[petalinux]$ cd ./xilinx-k26-starterkit-v2022.1
```
## Build Petalinux Project

```bash
[xilinx-k26-starterkit-v2022.1]$ cp -r ../Makefile .
[xilinx-k26-starterkit-v2022.1]$ make all
```


