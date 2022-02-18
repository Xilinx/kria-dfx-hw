# Build tests

first set environment for vitis. 

to do this on a development server open bash prompt and run 

source <repo>/zu/software/environment.sh

Then 

xsct buildAES128.tcl

xsct buildAES192.tcl

xsct buildFFT.tcl

xsct buildFIR.tcl

# Run tests


For running tests run following scripts in xsdb prompt.

source testAES128.tcl

source testAES192.tcl

source testFFT.tcl

source testFIR.tcl
