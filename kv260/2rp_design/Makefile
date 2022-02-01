############################## Help Section ##############################
.PHONY: help

help::
	@echo 'Makefile Usage:'
	@echo ''
	@echo '  make all'
	@echo '      Command used to generate xsa and platform with petalinux.'
	@echo ''
	@echo '  make xsa'
	@echo '      Command used to generate opendfx project and xsa.'
	@echo ''
	@echo '  make platform'
	@echo '      Command used to generate platform.'
	@echo ''
	@echo '  make clean '
	@echo '      Command to remove all the generated files.'
	@echo ''

.PHONY: xsa platform clean 

tcl_file=./opendfx_shell.tcl
platformtcl_file=./platform/generate_platform.tcl
HW_XSA=./project_1/opendfx_shell_wrapper.xsa
platform_out= ./platform/

all:	xsa platform

xsa:	$(tcl_file) 
	/proj/xbuilds/2022.1_daily_latest/installs/lin64/Vivado/2022.1/bin/vivado -mode batch -notrace -source $(tcl_file)	
	@echo 'Project build complete'

platform:	
	/proj/xbuilds/2022.1_daily_latest/installs/lin64/Vitis/2022.1/bin/xsct -nodisp -sdx ${platformtcl_file} HW_XSA "${HW_XSA}" platform_out "${platform_out}"
	@echo 'Platform build complete'

clean:
	$(RM) -r vivado* project* .Xil *.log *.jou *.xsa ./platform/opendfx_kv260
