# Build linux applications

Set the environment for 2022.1 Vitis™ unified software platform.

Update the xsa path in the build tcl files. 

On a development server open bash prompt and run 
```
xsct buildAES128.tcl

xsct buildFFT.tcl

xsct buildFIR.tcl

xsct buildAES192.tcl
```
# Run tests
For testing RM linux application, boot the board with linux image. 
Mount the board and transfer k26_2rp folder & elf file. 

Path for k26_2rp firmware- /software/plImages/k26_2rp 

Path for elfs- ./workspace_<ACCELERATOR_NAME>/<ACCELERATOR_NAME>/Debug/<ACCELERATOR_NAME>.elf

For example- Path for AES128 elf- ./workspace_AES128/AES128/Debug/AES128.elf 

```
xilinx-k26-starterkit-20221:/home/petalinux# mkdir /mnt_nfsroot
xilinx-kv-kr-starter-20221:/home/petalinux# mount -o port=2049,nolock,proto=tcp,vers=3 10.10.70.101:/exports/root /mnt_nfsroot
xilinx-k26-starterkit-20221:/home/petalinux# cp -r /mnt_nfsroot/k26_2rp /lib/firmware/xilinx/ 
xilinx-k26-starterkit-20221:/home/petalinux# xmutil listapps
xilinx-k26-starterkit-20221:/home/petalinux# xmutil loadapp aes128encdec
xilinx-k26-starterkit-20221:/home/petalinux# cp -r /mnt_nfsroot/AES128.elf .
xilinx-k26-starterkit-20221:/home/petalinux# ./AES128.elf 
```

Last prints on uart terminal will match the outputs given below-

```
=== TEST PASSED ===
```
