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

2. Copy k26_2rp folder & elf files to a directory

```
cp -rf <path to git dir>/kria_dfx_hw/software/plImages/k26_2rp/ <Path to local Directory eg: /home/saikira/copy_dir>
cp -rf <path to git dir>/kria_dfx_hw/k26_testcases/linux/workspace_*/*/Debug/*.elf <Path to local Directory eg: /home/saikira/copy_dir>
```

3. Board steps  

login id of som board: petalinux, password: root or petalinux

```
Systest# nfsroot3 <path to the directory where the elf and k26_2rp are copied in Step 2>
eg: Systest# nfsroot3 "/home/saikira/copy_dir"
```

```
xilinx-k26-starterkit-20221:~$sudo su
Password: root
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
