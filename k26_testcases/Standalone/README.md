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
# Run tests

Update the Vitis path in the environment.tcl. 

For testing RM, run the corresponding tcl in xsdb prompt on board.

BOOT Mode should be JTAG. 
```
source environment.tcl
```

```
source testAES128.tcl

source testAES192.tcl

source testFIR.tcl

source testFFT.tcl
```
