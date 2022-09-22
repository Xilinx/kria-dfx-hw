# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT

# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AccelConfig_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "EN_AP_CTRL_HS"
  ipgui::add_param $IPINST -name "EN_TID1_OUTPUT"
  set TID1_OUTPUT [ipgui::add_param $IPINST -name "TID1_OUTPUT" -widget comboBox]
  set_property tooltip {1- AXIS 2-Scalar} ${TID1_OUTPUT}
  set NUM_SCALAR_PORTS [ipgui::add_param $IPINST -name "NUM_SCALAR_PORTS"]
  set_property tooltip {Num of Scalar Ports. Width of each enabled scalar port should be multiple of 32} ${NUM_SCALAR_PORTS}
  set SCALAR1_WIDTH [ipgui::add_param $IPINST -name "SCALAR1_WIDTH"]
  set_property tooltip {Scalar1 Width. Width should be a multiple of 32.} ${SCALAR1_WIDTH}
  set SCALAR2_WIDTH [ipgui::add_param $IPINST -name "SCALAR2_WIDTH"]
  set_property tooltip {Scalar2 Width. Width should be a multiple of 32.} ${SCALAR2_WIDTH}
  set SCALAR3_WIDTH [ipgui::add_param $IPINST -name "SCALAR3_WIDTH"]
  set_property tooltip {Scalar3 Width. Width should be a multiple of 32.} ${SCALAR3_WIDTH}
  set SCALAR4_WIDTH [ipgui::add_param $IPINST -name "SCALAR4_WIDTH"]
  set_property tooltip {Scalar4 Width. Width should be a multiple of 32.} ${SCALAR4_WIDTH}
  set SCALAR5_WIDTH [ipgui::add_param $IPINST -name "SCALAR5_WIDTH"]
  set_property tooltip {Scalar5 Width. Width should be a multiple of 32.} ${SCALAR5_WIDTH}
  set SCALAR6_WIDTH [ipgui::add_param $IPINST -name "SCALAR6_WIDTH"]
  set_property tooltip {Scalar6 Width. Width should be a multiple of 32.} ${SCALAR6_WIDTH}
  set SCALAR7_WIDTH [ipgui::add_param $IPINST -name "SCALAR7_WIDTH"]
  set_property tooltip {Scalar7 Width. Width should be a multiple of 32.} ${SCALAR7_WIDTH}
  set SCALAR8_WIDTH [ipgui::add_param $IPINST -name "SCALAR8_WIDTH"]
  set_property tooltip {Scalar8 Width. Width should be a multiple of 32.} ${SCALAR8_WIDTH}
  ipgui::add_param $IPINST -name "EN_TID2_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "EN_TID3_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "EN_TID4_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "EN_TID5_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "EN_TID6_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "EN_TID7_AXIS_OUTPUT"

}

proc update_PARAM_VALUE.NUM_SCALAR_PORTS { PARAM_VALUE.NUM_SCALAR_PORTS PARAM_VALUE.EN_TID1_OUTPUT PARAM_VALUE.TID1_OUTPUT } {
	# Procedure called to update NUM_SCALAR_PORTS when any of the dependent parameters in the arguments change
	
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set EN_TID1_OUTPUT ${PARAM_VALUE.EN_TID1_OUTPUT}
	set TID1_OUTPUT ${PARAM_VALUE.TID1_OUTPUT}
	set values(EN_TID1_OUTPUT) [get_property value $EN_TID1_OUTPUT]
	set values(TID1_OUTPUT) [get_property value $TID1_OUTPUT]
	if { [gen_USERPARAMETER_NUM_SCALAR_PORTS_ENABLEMENT $values(EN_TID1_OUTPUT) $values(TID1_OUTPUT)] } {
		set_property enabled true $NUM_SCALAR_PORTS
	} else {
		set_property enabled false $NUM_SCALAR_PORTS
	}
}

proc validate_PARAM_VALUE.NUM_SCALAR_PORTS { PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to validate NUM_SCALAR_PORTS
	return true
}

proc update_PARAM_VALUE.SCALAR1_WIDTH { PARAM_VALUE.SCALAR1_WIDTH PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update SCALAR1_WIDTH when any of the dependent parameters in the arguments change
	
	set SCALAR1_WIDTH ${PARAM_VALUE.SCALAR1_WIDTH}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_SCALAR1_WIDTH_ENABLEMENT $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $SCALAR1_WIDTH
	} else {
		set_property enabled false $SCALAR1_WIDTH
		set_property value [gen_USERPARAMETER_SCALAR1_WIDTH_VALUE $values(NUM_SCALAR_PORTS)] $SCALAR1_WIDTH
	}
}

proc validate_PARAM_VALUE.SCALAR1_WIDTH { PARAM_VALUE.SCALAR1_WIDTH } {
	# Procedure called to validate SCALAR1_WIDTH
	return true
}

proc update_PARAM_VALUE.SCALAR2_WIDTH { PARAM_VALUE.SCALAR2_WIDTH PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update SCALAR2_WIDTH when any of the dependent parameters in the arguments change
	
	set SCALAR2_WIDTH ${PARAM_VALUE.SCALAR2_WIDTH}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_SCALAR2_WIDTH_ENABLEMENT $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $SCALAR2_WIDTH
	} else {
		set_property enabled false $SCALAR2_WIDTH
		set_property value [gen_USERPARAMETER_SCALAR2_WIDTH_VALUE $values(NUM_SCALAR_PORTS)] $SCALAR2_WIDTH
	}
}

proc validate_PARAM_VALUE.SCALAR2_WIDTH { PARAM_VALUE.SCALAR2_WIDTH } {
	# Procedure called to validate SCALAR2_WIDTH
	return true
}

proc update_PARAM_VALUE.SCALAR3_WIDTH { PARAM_VALUE.SCALAR3_WIDTH PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update SCALAR3_WIDTH when any of the dependent parameters in the arguments change
	
	set SCALAR3_WIDTH ${PARAM_VALUE.SCALAR3_WIDTH}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_SCALAR3_WIDTH_ENABLEMENT $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $SCALAR3_WIDTH
	} else {
		set_property enabled false $SCALAR3_WIDTH
		set_property value [gen_USERPARAMETER_SCALAR3_WIDTH_VALUE $values(NUM_SCALAR_PORTS)] $SCALAR3_WIDTH
	}
}

proc validate_PARAM_VALUE.SCALAR3_WIDTH { PARAM_VALUE.SCALAR3_WIDTH } {
	# Procedure called to validate SCALAR3_WIDTH
	return true
}

proc update_PARAM_VALUE.SCALAR4_WIDTH { PARAM_VALUE.SCALAR4_WIDTH PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update SCALAR4_WIDTH when any of the dependent parameters in the arguments change
	
	set SCALAR4_WIDTH ${PARAM_VALUE.SCALAR4_WIDTH}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_SCALAR4_WIDTH_ENABLEMENT $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $SCALAR4_WIDTH
	} else {
		set_property enabled false $SCALAR4_WIDTH
		set_property value [gen_USERPARAMETER_SCALAR4_WIDTH_VALUE $values(NUM_SCALAR_PORTS)] $SCALAR4_WIDTH
	}
}

proc validate_PARAM_VALUE.SCALAR4_WIDTH { PARAM_VALUE.SCALAR4_WIDTH } {
	# Procedure called to validate SCALAR4_WIDTH
	return true
}

proc update_PARAM_VALUE.SCALAR5_WIDTH { PARAM_VALUE.SCALAR5_WIDTH PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update SCALAR5_WIDTH when any of the dependent parameters in the arguments change
	
	set SCALAR5_WIDTH ${PARAM_VALUE.SCALAR5_WIDTH}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_SCALAR5_WIDTH_ENABLEMENT $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $SCALAR5_WIDTH
	} else {
		set_property enabled false $SCALAR5_WIDTH
		set_property value [gen_USERPARAMETER_SCALAR5_WIDTH_VALUE $values(NUM_SCALAR_PORTS)] $SCALAR5_WIDTH
	}
}

proc validate_PARAM_VALUE.SCALAR5_WIDTH { PARAM_VALUE.SCALAR5_WIDTH } {
	# Procedure called to validate SCALAR5_WIDTH
	return true
}

proc update_PARAM_VALUE.SCALAR6_WIDTH { PARAM_VALUE.SCALAR6_WIDTH PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update SCALAR6_WIDTH when any of the dependent parameters in the arguments change
	
	set SCALAR6_WIDTH ${PARAM_VALUE.SCALAR6_WIDTH}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_SCALAR6_WIDTH_ENABLEMENT $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $SCALAR6_WIDTH
	} else {
		set_property enabled false $SCALAR6_WIDTH
		set_property value [gen_USERPARAMETER_SCALAR6_WIDTH_VALUE $values(NUM_SCALAR_PORTS)] $SCALAR6_WIDTH
	}
}

proc validate_PARAM_VALUE.SCALAR6_WIDTH { PARAM_VALUE.SCALAR6_WIDTH } {
	# Procedure called to validate SCALAR6_WIDTH
	return true
}

proc update_PARAM_VALUE.SCALAR7_WIDTH { PARAM_VALUE.SCALAR7_WIDTH PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update SCALAR7_WIDTH when any of the dependent parameters in the arguments change
	
	set SCALAR7_WIDTH ${PARAM_VALUE.SCALAR7_WIDTH}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_SCALAR7_WIDTH_ENABLEMENT $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $SCALAR7_WIDTH
	} else {
		set_property enabled false $SCALAR7_WIDTH
		set_property value [gen_USERPARAMETER_SCALAR7_WIDTH_VALUE $values(NUM_SCALAR_PORTS)] $SCALAR7_WIDTH
	}
}

proc validate_PARAM_VALUE.SCALAR7_WIDTH { PARAM_VALUE.SCALAR7_WIDTH } {
	# Procedure called to validate SCALAR7_WIDTH
	return true
}

proc update_PARAM_VALUE.SCALAR8_WIDTH { PARAM_VALUE.SCALAR8_WIDTH PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update SCALAR8_WIDTH when any of the dependent parameters in the arguments change
	
	set SCALAR8_WIDTH ${PARAM_VALUE.SCALAR8_WIDTH}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_SCALAR8_WIDTH_ENABLEMENT $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $SCALAR8_WIDTH
	} else {
		set_property enabled false $SCALAR8_WIDTH
		set_property value [gen_USERPARAMETER_SCALAR8_WIDTH_VALUE $values(NUM_SCALAR_PORTS)] $SCALAR8_WIDTH
	}
}

proc validate_PARAM_VALUE.SCALAR8_WIDTH { PARAM_VALUE.SCALAR8_WIDTH } {
	# Procedure called to validate SCALAR8_WIDTH
	return true
}

proc update_PARAM_VALUE.TID1_OUTPUT { PARAM_VALUE.TID1_OUTPUT PARAM_VALUE.EN_TID1_OUTPUT } {
	# Procedure called to update TID1_OUTPUT when any of the dependent parameters in the arguments change
	
	set TID1_OUTPUT ${PARAM_VALUE.TID1_OUTPUT}
	set EN_TID1_OUTPUT ${PARAM_VALUE.EN_TID1_OUTPUT}
	set values(EN_TID1_OUTPUT) [get_property value $EN_TID1_OUTPUT]
	if { [gen_USERPARAMETER_TID1_OUTPUT_ENABLEMENT $values(EN_TID1_OUTPUT)] } {
		set_property enabled true $TID1_OUTPUT
	} else {
		set_property enabled false $TID1_OUTPUT
	}
}

proc validate_PARAM_VALUE.TID1_OUTPUT { PARAM_VALUE.TID1_OUTPUT } {
	# Procedure called to validate TID1_OUTPUT
	return true
}

proc update_PARAM_VALUE.EN_AP_CTRL_HS { PARAM_VALUE.EN_AP_CTRL_HS } {
	# Procedure called to update EN_AP_CTRL_HS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_AP_CTRL_HS { PARAM_VALUE.EN_AP_CTRL_HS } {
	# Procedure called to validate EN_AP_CTRL_HS
	return true
}

proc update_PARAM_VALUE.EN_TID1_OUTPUT { PARAM_VALUE.EN_TID1_OUTPUT } {
	# Procedure called to update EN_TID1_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_TID1_OUTPUT { PARAM_VALUE.EN_TID1_OUTPUT } {
	# Procedure called to validate EN_TID1_OUTPUT
	return true
}

proc update_PARAM_VALUE.EN_TID2_AXIS_OUTPUT { PARAM_VALUE.EN_TID2_AXIS_OUTPUT } {
	# Procedure called to update EN_TID2_AXIS_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_TID2_AXIS_OUTPUT { PARAM_VALUE.EN_TID2_AXIS_OUTPUT } {
	# Procedure called to validate EN_TID2_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.EN_TID3_AXIS_OUTPUT { PARAM_VALUE.EN_TID3_AXIS_OUTPUT } {
	# Procedure called to update EN_TID3_AXIS_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_TID3_AXIS_OUTPUT { PARAM_VALUE.EN_TID3_AXIS_OUTPUT } {
	# Procedure called to validate EN_TID3_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.EN_TID4_AXIS_OUTPUT { PARAM_VALUE.EN_TID4_AXIS_OUTPUT } {
	# Procedure called to update EN_TID4_AXIS_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_TID4_AXIS_OUTPUT { PARAM_VALUE.EN_TID4_AXIS_OUTPUT } {
	# Procedure called to validate EN_TID4_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.EN_TID5_AXIS_OUTPUT { PARAM_VALUE.EN_TID5_AXIS_OUTPUT } {
	# Procedure called to update EN_TID5_AXIS_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_TID5_AXIS_OUTPUT { PARAM_VALUE.EN_TID5_AXIS_OUTPUT } {
	# Procedure called to validate EN_TID5_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.EN_TID6_AXIS_OUTPUT { PARAM_VALUE.EN_TID6_AXIS_OUTPUT } {
	# Procedure called to update EN_TID6_AXIS_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_TID6_AXIS_OUTPUT { PARAM_VALUE.EN_TID6_AXIS_OUTPUT } {
	# Procedure called to validate EN_TID6_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.EN_TID7_AXIS_OUTPUT { PARAM_VALUE.EN_TID7_AXIS_OUTPUT } {
	# Procedure called to update EN_TID7_AXIS_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_TID7_AXIS_OUTPUT { PARAM_VALUE.EN_TID7_AXIS_OUTPUT } {
	# Procedure called to validate EN_TID7_AXIS_OUTPUT
	return true
}


proc update_MODELPARAM_VALUE.NUM_SCALAR_PORTS { MODELPARAM_VALUE.NUM_SCALAR_PORTS PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_SCALAR_PORTS}] ${MODELPARAM_VALUE.NUM_SCALAR_PORTS}
}

proc update_MODELPARAM_VALUE.SCALAR1_WIDTH { MODELPARAM_VALUE.SCALAR1_WIDTH PARAM_VALUE.SCALAR1_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR1_WIDTH}] ${MODELPARAM_VALUE.SCALAR1_WIDTH}
}

proc update_MODELPARAM_VALUE.SCALAR2_WIDTH { MODELPARAM_VALUE.SCALAR2_WIDTH PARAM_VALUE.SCALAR2_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR2_WIDTH}] ${MODELPARAM_VALUE.SCALAR2_WIDTH}
}

proc update_MODELPARAM_VALUE.SCALAR3_WIDTH { MODELPARAM_VALUE.SCALAR3_WIDTH PARAM_VALUE.SCALAR3_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR3_WIDTH}] ${MODELPARAM_VALUE.SCALAR3_WIDTH}
}

proc update_MODELPARAM_VALUE.SCALAR4_WIDTH { MODELPARAM_VALUE.SCALAR4_WIDTH PARAM_VALUE.SCALAR4_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR4_WIDTH}] ${MODELPARAM_VALUE.SCALAR4_WIDTH}
}

proc update_MODELPARAM_VALUE.SCALAR5_WIDTH { MODELPARAM_VALUE.SCALAR5_WIDTH PARAM_VALUE.SCALAR5_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR5_WIDTH}] ${MODELPARAM_VALUE.SCALAR5_WIDTH}
}

proc update_MODELPARAM_VALUE.SCALAR6_WIDTH { MODELPARAM_VALUE.SCALAR6_WIDTH PARAM_VALUE.SCALAR6_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR6_WIDTH}] ${MODELPARAM_VALUE.SCALAR6_WIDTH}
}

proc update_MODELPARAM_VALUE.SCALAR7_WIDTH { MODELPARAM_VALUE.SCALAR7_WIDTH PARAM_VALUE.SCALAR7_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR7_WIDTH}] ${MODELPARAM_VALUE.SCALAR7_WIDTH}
}

proc update_MODELPARAM_VALUE.SCALAR8_WIDTH { MODELPARAM_VALUE.SCALAR8_WIDTH PARAM_VALUE.SCALAR8_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR8_WIDTH}] ${MODELPARAM_VALUE.SCALAR8_WIDTH}
}

proc update_MODELPARAM_VALUE.EN_AP_CTRL_HS { MODELPARAM_VALUE.EN_AP_CTRL_HS PARAM_VALUE.EN_AP_CTRL_HS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_AP_CTRL_HS}] ${MODELPARAM_VALUE.EN_AP_CTRL_HS}
}

proc update_MODELPARAM_VALUE.EN_TID2_AXIS_OUTPUT { MODELPARAM_VALUE.EN_TID2_AXIS_OUTPUT PARAM_VALUE.EN_TID2_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_TID2_AXIS_OUTPUT}] ${MODELPARAM_VALUE.EN_TID2_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.EN_TID3_AXIS_OUTPUT { MODELPARAM_VALUE.EN_TID3_AXIS_OUTPUT PARAM_VALUE.EN_TID3_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_TID3_AXIS_OUTPUT}] ${MODELPARAM_VALUE.EN_TID3_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.EN_TID4_AXIS_OUTPUT { MODELPARAM_VALUE.EN_TID4_AXIS_OUTPUT PARAM_VALUE.EN_TID4_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_TID4_AXIS_OUTPUT}] ${MODELPARAM_VALUE.EN_TID4_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.EN_TID5_AXIS_OUTPUT { MODELPARAM_VALUE.EN_TID5_AXIS_OUTPUT PARAM_VALUE.EN_TID5_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_TID5_AXIS_OUTPUT}] ${MODELPARAM_VALUE.EN_TID5_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.EN_TID6_AXIS_OUTPUT { MODELPARAM_VALUE.EN_TID6_AXIS_OUTPUT PARAM_VALUE.EN_TID6_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_TID6_AXIS_OUTPUT}] ${MODELPARAM_VALUE.EN_TID6_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.EN_TID7_AXIS_OUTPUT { MODELPARAM_VALUE.EN_TID7_AXIS_OUTPUT PARAM_VALUE.EN_TID7_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_TID7_AXIS_OUTPUT}] ${MODELPARAM_VALUE.EN_TID7_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.EN_TID1_OUTPUT { MODELPARAM_VALUE.EN_TID1_OUTPUT PARAM_VALUE.EN_TID1_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_TID1_OUTPUT}] ${MODELPARAM_VALUE.EN_TID1_OUTPUT}
}

proc update_MODELPARAM_VALUE.TID1_OUTPUT { MODELPARAM_VALUE.TID1_OUTPUT PARAM_VALUE.TID1_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TID1_OUTPUT}] ${MODELPARAM_VALUE.TID1_OUTPUT}
}

