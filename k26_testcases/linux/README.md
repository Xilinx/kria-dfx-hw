# Build linux applications

Set the environment for 2022.1 Vitis™ unified software platform.

Update the xsa path in the build tcl files. 

On a development server open bash prompt and navigate to the directory kria_dfx_hw/k26_testcases/linux
Run the following commands:

To build individual applications.
```
make AES128

make AES192

make FFT

make FIR
```
This will create a directory named workspace_<ACCELERATOR_NAME> and generate output files inside it.


To build all applications.
```
make all
```



# Run tests
1. For testing RM linux application, boot the board with linux image. 

2. Mount the board and transfer k26_2rp folder & elf file. 

Path for k26_2rp firmware- /software/plImages/k26_2rp 

Path for elfs- ./workspace_<ACCELERATOR_NAME>/<ACCELERATOR_NAME>/Debug/<ACCELERATOR_NAME>.elf

For example- Path for AES128 elf- ./workspace_AES128/AES128/Debug/AES128.elf 

Copy the elfs and k26_2rp folder to a directory. 

```
Systest# nfsroot3 "<path to the directory where the elf and k26_2rp are copied."
```

```
xilinx-k26-starterkit-20221:/home/petalinux# mkdir /mnt_nfsroot
xilinx-k26-starterkit-20221:/home/petalinux# mount -o port=2049,nolock,proto=tcp,vers=3 10.10.70.101:/exports/root /mnt_nfsroot
xilinx-k26-starterkit-20221:/home/petalinux# cp -r /mnt_nfsroot/k26_2rp /lib/firmware/xilinx/ 
xilinx-k26-starterkit-20221:/home/petalinux# xmutil listapps
xilinx-k26-starterkit-20221:/home/petalinux# xmutil unloadapp
xilinx-k26-starterkit-20221:/home/petalinux# xmutil loadapp AES128
xilinx-k26-starterkit-20221:/home/petalinux# cp -r /mnt_nfsroot/AES128.elf .
xilinx-k26-starterkit-20221:/home/petalinux# ./AES128.elf 
```

On successful application completion, you should see the following output on UART terminal.

```
=== TEST PASSED ===
```
