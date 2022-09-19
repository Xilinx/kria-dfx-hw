# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "NUM_RP_SLOTS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_REG_PER_SLOT" -parent ${Page_0}


}

proc update_PARAM_VALUE.NUM_REG_PER_SLOT { PARAM_VALUE.NUM_REG_PER_SLOT } {
	# Procedure called to update NUM_REG_PER_SLOT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_REG_PER_SLOT { PARAM_VALUE.NUM_REG_PER_SLOT } {
	# Procedure called to validate NUM_REG_PER_SLOT
	return true
}

proc update_PARAM_VALUE.NUM_RP_SLOTS { PARAM_VALUE.NUM_RP_SLOTS } {
	# Procedure called to update NUM_RP_SLOTS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_RP_SLOTS { PARAM_VALUE.NUM_RP_SLOTS } {
	# Procedure called to validate NUM_RP_SLOTS
	return true
}


proc update_MODELPARAM_VALUE.NUM_RP_SLOTS { MODELPARAM_VALUE.NUM_RP_SLOTS PARAM_VALUE.NUM_RP_SLOTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_RP_SLOTS}] ${MODELPARAM_VALUE.NUM_RP_SLOTS}
}

proc update_MODELPARAM_VALUE.NUM_REG_PER_SLOT { MODELPARAM_VALUE.NUM_REG_PER_SLOT PARAM_VALUE.NUM_REG_PER_SLOT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_REG_PER_SLOT}] ${MODELPARAM_VALUE.NUM_REG_PER_SLOT}
}

