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

Load xmutil loadapp <ACCELERATOR_NAME>

```
xilinx-k26-starterkit-20221:#./aes128.elf
```


Last prints on uart terminal will match the outputs given below-

```
comparing slot 0 output with reference ...
Success: Matched with the reference !!!!
comparing slot 1 output with reference ...
Success: Matched with the reference !!!!
all done
```

