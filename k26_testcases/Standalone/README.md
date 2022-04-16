# Build tests

Set the environment for 2022.1 Vitis™ unified software platform.

Update the xsa path in the build tcl files. 

On a development server open bash prompt and run 
```
xsct buildAES128.tcl

xsct buildFFT.tcl

xsct buildFIR.tcl

xsct buildAES192.tcl
```

Clean build
```
make clean
```
# Run tests

Update the Vitis path in the environment.tcl line 2. 

Update the RM name for test in line 8 & 9 for PMUFW and FSBL ELF path. 
```
vim environment.tcl
```

For testing RM, run the corresponding tcl in xsdb prompt on board.

BOOT Mode should be JTAG. 
```
xsdb% source environment.tcl
```
```
xsdb% source som_bootmode.tcl
xsdb% connect
xsdb% boot_jtag
```
```
xsdb% source testAES128.tcl

xsdb% source testAES192.tcl

xsdb% source testFIR.tcl

xsdb% source testFFT.tcl
```

Last prints on uart terminal will match the outputs given below-

```
comparing slot 0 output with reference ...
Success: Matched with the reference !!!!
comparing slot 1 output with reference ...
Success: Matched with the reference !!!!
all done
```

