
############################## Help Section ##############################
.PHONY: help

help::
	@echo 'Makefile Usage:'
	@echo ''
	@echo '  make all'
	@echo '      Command used to generate standalone RM projects.'
	@echo ''
	@echo '  make AES128'
	@echo '      Command used to generate standalone AES128 vitis project and elf.'
	@echo ''
	@echo '  make AES192'
	@echo '      Command used to generate standalone AES192 vitis project and elf.'
	@echo ''
	@echo '  make FFT'
	@echo '      Command used to generate standalone FFT vitis project and elf.'
	@echo ''
	@echo '  make FIR'
	@echo '      Command used to generate standalone FIR vitis project and elf.'
	@echo ''
	@echo '  make clean'
	@echo '      Command to remove all the generated files.'
	@echo ''

.PHONY: all AES128 AES192 FIR FFT clean 


all:	AES128 AES192 FFT FIR

AES128:	
	xsct buildAES128.tcl
AES192:	
	xsct buildAES192.tcl
FFT:	
	xsct buildFFT.tcl
FIR:	
	xsct buildFIR.tcl
clean:
	rm -rf workspace*
