# Build tests

First set environment for vitis. 

To do this on a development server open bash prompt and run 

xsct buildAES128.tcl

xsct buildFFT.tcl

xsct buildFIR.tcl

# Run tests


For running tests run following scripts in xsdb prompt on board.

source testAES128.tcl

source testFFT.tcl

source testFIR.tcl
