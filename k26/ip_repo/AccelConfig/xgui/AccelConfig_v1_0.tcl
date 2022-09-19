# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT

# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AccelConfig_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "HAS_AP_CTRL_HS"
  ipgui::add_param $IPINST -name "PARSE_AXIS_TID"
  ipgui::add_param $IPINST -name "NUM_SCALAR_PORTS"
  ipgui::add_param $IPINST -name "SCALAR1_WIDTH"
  ipgui::add_param $IPINST -name "SCALAR2_WIDTH"
  ipgui::add_param $IPINST -name "SCALAR3_WIDTH"
  ipgui::add_param $IPINST -name "SCALAR4_WIDTH"
  ipgui::add_param $IPINST -name "SCALAR5_WIDTH"
  ipgui::add_param $IPINST -name "SCALAR6_WIDTH"
  ipgui::add_param $IPINST -name "SCALAR7_WIDTH"
  ipgui::add_param $IPINST -name "SCALAR8_WIDTH"
  ipgui::add_param $IPINST -name "HAS_TID1_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "HAS_TID2_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "HAS_TID3_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "HAS_TID4_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "HAS_TID5_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "HAS_TID6_AXIS_OUTPUT"
  ipgui::add_param $IPINST -name "HAS_TID7_AXIS_OUTPUT"

}

proc update_PARAM_VALUE.HAS_TID1_AXIS_OUTPUT { PARAM_VALUE.HAS_TID1_AXIS_OUTPUT PARAM_VALUE.PARSE_AXIS_TID PARAM_VALUE.NUM_SCALAR_PORTS } {
	# Procedure called to update HAS_TID1_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID1_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID1_AXIS_OUTPUT}
	set PARSE_AXIS_TID ${PARAM_VALUE.PARSE_AXIS_TID}
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set values(PARSE_AXIS_TID) [get_property value $PARSE_AXIS_TID]
	set values(NUM_SCALAR_PORTS) [get_property value $NUM_SCALAR_PORTS]
	if { [gen_USERPARAMETER_HAS_TID1_AXIS_OUTPUT_ENABLEMENT $values(PARSE_AXIS_TID) $values(NUM_SCALAR_PORTS)] } {
		set_property enabled true $HAS_TID1_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID1_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID1_AXIS_OUTPUT { PARAM_VALUE.HAS_TID1_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID1_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID2_AXIS_OUTPUT { PARAM_VALUE.HAS_TID2_AXIS_OUTPUT PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to update HAS_TID2_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID2_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID2_AXIS_OUTPUT}
	set PARSE_AXIS_TID ${PARAM_VALUE.PARSE_AXIS_TID}
	set values(PARSE_AXIS_TID) [get_property value $PARSE_AXIS_TID]
	if { [gen_USERPARAMETER_HAS_TID2_AXIS_OUTPUT_ENABLEMENT $values(PARSE_AXIS_TID)] } {
		set_property enabled true $HAS_TID2_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID2_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID2_AXIS_OUTPUT { PARAM_VALUE.HAS_TID2_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID2_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID3_AXIS_OUTPUT { PARAM_VALUE.HAS_TID3_AXIS_OUTPUT PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to update HAS_TID3_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID3_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID3_AXIS_OUTPUT}
	set PARSE_AXIS_TID ${PARAM_VALUE.PARSE_AXIS_TID}
	set values(PARSE_AXIS_TID) [get_property value $PARSE_AXIS_TID]
	if { [gen_USERPARAMETER_HAS_TID3_AXIS_OUTPUT_ENABLEMENT $values(PARSE_AXIS_TID)] } {
		set_property enabled true $HAS_TID3_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID3_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID3_AXIS_OUTPUT { PARAM_VALUE.HAS_TID3_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID3_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID4_AXIS_OUTPUT { PARAM_VALUE.HAS_TID4_AXIS_OUTPUT PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to update HAS_TID4_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID4_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID4_AXIS_OUTPUT}
	set PARSE_AXIS_TID ${PARAM_VALUE.PARSE_AXIS_TID}
	set values(PARSE_AXIS_TID) [get_property value $PARSE_AXIS_TID]
	if { [gen_USERPARAMETER_HAS_TID4_AXIS_OUTPUT_ENABLEMENT $values(PARSE_AXIS_TID)] } {
		set_property enabled true $HAS_TID4_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID4_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID4_AXIS_OUTPUT { PARAM_VALUE.HAS_TID4_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID4_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID5_AXIS_OUTPUT { PARAM_VALUE.HAS_TID5_AXIS_OUTPUT PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to update HAS_TID5_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID5_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID5_AXIS_OUTPUT}
	set PARSE_AXIS_TID ${PARAM_VALUE.PARSE_AXIS_TID}
	set values(PARSE_AXIS_TID) [get_property value $PARSE_AXIS_TID]
	if { [gen_USERPARAMETER_HAS_TID5_AXIS_OUTPUT_ENABLEMENT $values(PARSE_AXIS_TID)] } {
		set_property enabled true $HAS_TID5_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID5_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID5_AXIS_OUTPUT { PARAM_VALUE.HAS_TID5_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID5_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID6_AXIS_OUTPUT { PARAM_VALUE.HAS_TID6_AXIS_OUTPUT PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to update HAS_TID6_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID6_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID6_AXIS_OUTPUT}
	set PARSE_AXIS_TID ${PARAM_VALUE.PARSE_AXIS_TID}
	set values(PARSE_AXIS_TID) [get_property value $PARSE_AXIS_TID]
	if { [gen_USERPARAMETER_HAS_TID6_AXIS_OUTPUT_ENABLEMENT $values(PARSE_AXIS_TID)] } {
		set_property enabled true $HAS_TID6_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID6_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID6_AXIS_OUTPUT { PARAM_VALUE.HAS_TID6_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID6_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID7_AXIS_OUTPUT { PARAM_VALUE.HAS_TID7_AXIS_OUTPUT PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to update HAS_TID7_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID7_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID7_AXIS_OUTPUT}
	set PARSE_AXIS_TID ${PARAM_VALUE.PARSE_AXIS_TID}
	set values(PARSE_AXIS_TID) [get_property value $PARSE_AXIS_TID]
	if { [gen_USERPARAMETER_HAS_TID7_AXIS_OUTPUT_ENABLEMENT $values(PARSE_AXIS_TID)] } {
		set_property enabled true $HAS_TID7_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID7_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID7_AXIS_OUTPUT { PARAM_VALUE.HAS_TID7_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID7_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.NUM_SCALAR_PORTS { PARAM_VALUE.NUM_SCALAR_PORTS PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to update NUM_SCALAR_PORTS when any of the dependent parameters in the arguments change
	
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set PARSE_AXIS_TID ${PARAM_VALUE.PARSE_AXIS_TID}
	set values(PARSE_AXIS_TID) [get_property value $PARSE_AXIS_TID]
	if { [gen_USERPARAMETER_NUM_SCALAR_PORTS_ENABLEMENT $values(PARSE_AXIS_TID)] } {
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

proc update_PARAM_VALUE.HAS_AP_CTRL_HS { PARAM_VALUE.HAS_AP_CTRL_HS } {
	# Procedure called to update HAS_AP_CTRL_HS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_AP_CTRL_HS { PARAM_VALUE.HAS_AP_CTRL_HS } {
	# Procedure called to validate HAS_AP_CTRL_HS
	return true
}

proc update_PARAM_VALUE.PARSE_AXIS_TID { PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to update PARSE_AXIS_TID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PARSE_AXIS_TID { PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to validate PARSE_AXIS_TID
	return true
}


proc update_MODELPARAM_VALUE.HAS_AP_CTRL_HS { MODELPARAM_VALUE.HAS_AP_CTRL_HS PARAM_VALUE.HAS_AP_CTRL_HS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_AP_CTRL_HS}] ${MODELPARAM_VALUE.HAS_AP_CTRL_HS}
}

proc update_MODELPARAM_VALUE.PARSE_AXIS_TID { MODELPARAM_VALUE.PARSE_AXIS_TID PARAM_VALUE.PARSE_AXIS_TID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PARSE_AXIS_TID}] ${MODELPARAM_VALUE.PARSE_AXIS_TID}
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

proc update_MODELPARAM_VALUE.HAS_TID1_AXIS_OUTPUT { MODELPARAM_VALUE.HAS_TID1_AXIS_OUTPUT PARAM_VALUE.HAS_TID1_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_TID1_AXIS_OUTPUT}] ${MODELPARAM_VALUE.HAS_TID1_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.HAS_TID2_AXIS_OUTPUT { MODELPARAM_VALUE.HAS_TID2_AXIS_OUTPUT PARAM_VALUE.HAS_TID2_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_TID2_AXIS_OUTPUT}] ${MODELPARAM_VALUE.HAS_TID2_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.HAS_TID3_AXIS_OUTPUT { MODELPARAM_VALUE.HAS_TID3_AXIS_OUTPUT PARAM_VALUE.HAS_TID3_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_TID3_AXIS_OUTPUT}] ${MODELPARAM_VALUE.HAS_TID3_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.HAS_TID4_AXIS_OUTPUT { MODELPARAM_VALUE.HAS_TID4_AXIS_OUTPUT PARAM_VALUE.HAS_TID4_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_TID4_AXIS_OUTPUT}] ${MODELPARAM_VALUE.HAS_TID4_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.HAS_TID5_AXIS_OUTPUT { MODELPARAM_VALUE.HAS_TID5_AXIS_OUTPUT PARAM_VALUE.HAS_TID5_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_TID5_AXIS_OUTPUT}] ${MODELPARAM_VALUE.HAS_TID5_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.HAS_TID6_AXIS_OUTPUT { MODELPARAM_VALUE.HAS_TID6_AXIS_OUTPUT PARAM_VALUE.HAS_TID6_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_TID6_AXIS_OUTPUT}] ${MODELPARAM_VALUE.HAS_TID6_AXIS_OUTPUT}
}

proc update_MODELPARAM_VALUE.HAS_TID7_AXIS_OUTPUT { MODELPARAM_VALUE.HAS_TID7_AXIS_OUTPUT PARAM_VALUE.HAS_TID7_AXIS_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_TID7_AXIS_OUTPUT}] ${MODELPARAM_VALUE.HAS_TID7_AXIS_OUTPUT}
}

