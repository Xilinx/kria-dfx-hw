# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "USE_DMA" -parent ${Page_0}


}

proc update_PARAM_VALUE.USE_DMA { PARAM_VALUE.USE_DMA } {
	# Procedure called to update USE_DMA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_DMA { PARAM_VALUE.USE_DMA } {
	# Procedure called to validate USE_DMA
	return true
}


proc update_MODELPARAM_VALUE.USE_DMA { MODELPARAM_VALUE.USE_DMA PARAM_VALUE.USE_DMA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_DMA}] ${MODELPARAM_VALUE.USE_DMA}
}

