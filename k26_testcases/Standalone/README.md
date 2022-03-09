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

Update the bit files, data and elf path for the required RM in the test.tcl. 

For running tests run following scripts in xsdb prompt on board.

BOOT Mode should be JTAG. 
```
source test.tcl
```
