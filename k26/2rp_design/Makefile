# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
############################## Help Section ##############################
.PHONY: help

help::
	@echo 'Makefile Usage:'
	@echo ''
	@echo '  make all'
	@echo '      Command used to generate xsa and vitis platform.'
	@echo ''
	@echo '  make xsa'
	@echo '      Command used to generate opendfx project and xsa.'
	@echo ''
	@echo '  make platform'
	@echo '      Command used to generate vitis platform. Platform need xsa file as input.'
	@echo ''
	@echo '  make clean'
	@echo '      Command to remove all the generated files.'
	@echo ''

.PHONY: xsa platform clean 

tcl_file=./opendfx_shell.tcl
platformtcl_file=./platform/generate_platform.tcl
HW_XSA=./project_1/opendfx_shell_wrapper.xsa
platform_out= ./platform/

all:	xsa platform

xsa:	$(tcl_file) 
	vivado -mode batch -notrace -source $(tcl_file)	
	@echo 'Project build complete'

platform:	
	xsct -nodisp -sdx ${platformtcl_file} HW_XSA "${HW_XSA}" platform_out "${platform_out}"
	@echo 'Platform build complete'

clean:
	$(RM) -r vivado* project* .Xil *.log *.jou *.xsa ./platform/opendfx_shell_wrapper_platform_0
