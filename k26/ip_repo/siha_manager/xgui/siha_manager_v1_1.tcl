# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDRSPACE_PER_SLOT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BASE_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CONFIGRAM_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_REG_PER_SLOT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_RP_SLOTS" -parent ${Page_0} -widget comboBox


}

proc update_PARAM_VALUE.ADDRSPACE_PER_SLOT { PARAM_VALUE.ADDRSPACE_PER_SLOT } {
	# Procedure called to update ADDRSPACE_PER_SLOT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDRSPACE_PER_SLOT { PARAM_VALUE.ADDRSPACE_PER_SLOT } {
	# Procedure called to validate ADDRSPACE_PER_SLOT
	return true
}

proc update_PARAM_VALUE.BASE_ADDR { PARAM_VALUE.BASE_ADDR } {
	# Procedure called to update BASE_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BASE_ADDR { PARAM_VALUE.BASE_ADDR } {
	# Procedure called to validate BASE_ADDR
	return true
}

proc update_PARAM_VALUE.CONFIGRAM_DEPTH { PARAM_VALUE.CONFIGRAM_DEPTH } {
	# Procedure called to update CONFIGRAM_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CONFIGRAM_DEPTH { PARAM_VALUE.CONFIGRAM_DEPTH } {
	# Procedure called to validate CONFIGRAM_DEPTH
	return true
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


proc update_MODELPARAM_VALUE.CONFIGRAM_DEPTH { MODELPARAM_VALUE.CONFIGRAM_DEPTH PARAM_VALUE.CONFIGRAM_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CONFIGRAM_DEPTH}] ${MODELPARAM_VALUE.CONFIGRAM_DEPTH}
}

proc update_MODELPARAM_VALUE.NUM_RP_SLOTS { MODELPARAM_VALUE.NUM_RP_SLOTS PARAM_VALUE.NUM_RP_SLOTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_RP_SLOTS}] ${MODELPARAM_VALUE.NUM_RP_SLOTS}
}

proc update_MODELPARAM_VALUE.NUM_REG_PER_SLOT { MODELPARAM_VALUE.NUM_REG_PER_SLOT PARAM_VALUE.NUM_REG_PER_SLOT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_REG_PER_SLOT}] ${MODELPARAM_VALUE.NUM_REG_PER_SLOT}
}

proc update_MODELPARAM_VALUE.BASE_ADDR { MODELPARAM_VALUE.BASE_ADDR PARAM_VALUE.BASE_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BASE_ADDR}] ${MODELPARAM_VALUE.BASE_ADDR}
}

proc update_MODELPARAM_VALUE.ADDRSPACE_PER_SLOT { MODELPARAM_VALUE.ADDRSPACE_PER_SLOT PARAM_VALUE.ADDRSPACE_PER_SLOT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDRSPACE_PER_SLOT}] ${MODELPARAM_VALUE.ADDRSPACE_PER_SLOT}
}

