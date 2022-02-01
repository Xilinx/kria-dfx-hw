
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AccelConfig_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "HAS_SCALAR_OUTPUT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "HAS_TID1_AXIS_OUTPUT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "HAS_TID2_AXIS_OUTPUT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "HAS_TID3_AXIS_OUTPUT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "HAS_TID4_AXIS_OUTPUT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "HAS_TID5_AXIS_OUTPUT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "HAS_TID6_AXIS_OUTPUT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "HAS_TID7_AXIS_OUTPUT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "NUM_SCALAR_PORTS" -parent ${Page_0}
  set SCALAR1_WIDTH [ipgui::add_param $IPINST -name "SCALAR1_WIDTH" -parent ${Page_0}]
  set_property tooltip {Use multiples of 32} ${SCALAR1_WIDTH}
  set SCALAR2_WIDTH [ipgui::add_param $IPINST -name "SCALAR2_WIDTH" -parent ${Page_0}]
  set_property tooltip {Use multiples of 32} ${SCALAR2_WIDTH}
  set SCALAR3_WIDTH [ipgui::add_param $IPINST -name "SCALAR3_WIDTH" -parent ${Page_0}]
  set_property tooltip {Use multiples of 32} ${SCALAR3_WIDTH}
  set SCALAR4_WIDTH [ipgui::add_param $IPINST -name "SCALAR4_WIDTH" -parent ${Page_0}]
  set_property tooltip {Use multiples of 32} ${SCALAR4_WIDTH}
  set SCALAR5_WIDTH [ipgui::add_param $IPINST -name "SCALAR5_WIDTH" -parent ${Page_0}]
  set_property tooltip {Use multiples of 32} ${SCALAR5_WIDTH}
  set SCALAR6_WIDTH [ipgui::add_param $IPINST -name "SCALAR6_WIDTH" -parent ${Page_0}]
  set_property tooltip {Use multiples of 32} ${SCALAR6_WIDTH}
  set SCALAR7_WIDTH [ipgui::add_param $IPINST -name "SCALAR7_WIDTH" -parent ${Page_0}]
  set_property tooltip {Use multiples of 32} ${SCALAR7_WIDTH}
  set SCALAR8_WIDTH [ipgui::add_param $IPINST -name "SCALAR8_WIDTH" -parent ${Page_0}]
  set_property tooltip {Use multiples of 32} ${SCALAR8_WIDTH}
  ipgui::add_param $IPINST -name "SCALAR_HAS_HS" -parent ${Page_0} -widget comboBox


}

proc update_PARAM_VALUE.HAS_TID1_AXIS_OUTPUT { PARAM_VALUE.HAS_TID1_AXIS_OUTPUT PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update HAS_TID1_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID1_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID1_AXIS_OUTPUT}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_HAS_TID1_AXIS_OUTPUT_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
		set_property enabled true $HAS_TID1_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID1_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID1_AXIS_OUTPUT { PARAM_VALUE.HAS_TID1_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID1_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID2_AXIS_OUTPUT { PARAM_VALUE.HAS_TID2_AXIS_OUTPUT PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update HAS_TID2_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID2_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID2_AXIS_OUTPUT}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_HAS_TID2_AXIS_OUTPUT_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
		set_property enabled true $HAS_TID2_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID2_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID2_AXIS_OUTPUT { PARAM_VALUE.HAS_TID2_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID2_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID3_AXIS_OUTPUT { PARAM_VALUE.HAS_TID3_AXIS_OUTPUT PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update HAS_TID3_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID3_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID3_AXIS_OUTPUT}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_HAS_TID3_AXIS_OUTPUT_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
		set_property enabled true $HAS_TID3_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID3_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID3_AXIS_OUTPUT { PARAM_VALUE.HAS_TID3_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID3_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID4_AXIS_OUTPUT { PARAM_VALUE.HAS_TID4_AXIS_OUTPUT PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update HAS_TID4_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID4_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID4_AXIS_OUTPUT}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_HAS_TID4_AXIS_OUTPUT_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
		set_property enabled true $HAS_TID4_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID4_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID4_AXIS_OUTPUT { PARAM_VALUE.HAS_TID4_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID4_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID5_AXIS_OUTPUT { PARAM_VALUE.HAS_TID5_AXIS_OUTPUT PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update HAS_TID5_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID5_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID5_AXIS_OUTPUT}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_HAS_TID5_AXIS_OUTPUT_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
		set_property enabled true $HAS_TID5_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID5_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID5_AXIS_OUTPUT { PARAM_VALUE.HAS_TID5_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID5_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID6_AXIS_OUTPUT { PARAM_VALUE.HAS_TID6_AXIS_OUTPUT PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update HAS_TID6_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID6_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID6_AXIS_OUTPUT}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_HAS_TID6_AXIS_OUTPUT_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
		set_property enabled true $HAS_TID6_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID6_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID6_AXIS_OUTPUT { PARAM_VALUE.HAS_TID6_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID6_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.HAS_TID7_AXIS_OUTPUT { PARAM_VALUE.HAS_TID7_AXIS_OUTPUT PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update HAS_TID7_AXIS_OUTPUT when any of the dependent parameters in the arguments change
	
	set HAS_TID7_AXIS_OUTPUT ${PARAM_VALUE.HAS_TID7_AXIS_OUTPUT}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_HAS_TID7_AXIS_OUTPUT_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
		set_property enabled true $HAS_TID7_AXIS_OUTPUT
	} else {
		set_property enabled false $HAS_TID7_AXIS_OUTPUT
	}
}

proc validate_PARAM_VALUE.HAS_TID7_AXIS_OUTPUT { PARAM_VALUE.HAS_TID7_AXIS_OUTPUT } {
	# Procedure called to validate HAS_TID7_AXIS_OUTPUT
	return true
}

proc update_PARAM_VALUE.NUM_SCALAR_PORTS { PARAM_VALUE.NUM_SCALAR_PORTS PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update NUM_SCALAR_PORTS when any of the dependent parameters in the arguments change
	
	set NUM_SCALAR_PORTS ${PARAM_VALUE.NUM_SCALAR_PORTS}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_NUM_SCALAR_PORTS_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
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

proc update_PARAM_VALUE.SCALAR_HAS_HS { PARAM_VALUE.SCALAR_HAS_HS PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update SCALAR_HAS_HS when any of the dependent parameters in the arguments change
	
	set SCALAR_HAS_HS ${PARAM_VALUE.SCALAR_HAS_HS}
	set HAS_SCALAR_OUTPUT ${PARAM_VALUE.HAS_SCALAR_OUTPUT}
	set values(HAS_SCALAR_OUTPUT) [get_property value $HAS_SCALAR_OUTPUT]
	if { [gen_USERPARAMETER_SCALAR_HAS_HS_ENABLEMENT $values(HAS_SCALAR_OUTPUT)] } {
		set_property enabled true $SCALAR_HAS_HS
	} else {
		set_property enabled false $SCALAR_HAS_HS
	}
}

proc validate_PARAM_VALUE.SCALAR_HAS_HS { PARAM_VALUE.SCALAR_HAS_HS } {
	# Procedure called to validate SCALAR_HAS_HS
	return true
}

proc update_PARAM_VALUE.ACCEL_COMPATIBLE_SHELL { PARAM_VALUE.ACCEL_COMPATIBLE_SHELL } {
	# Procedure called to update ACCEL_COMPATIBLE_SHELL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACCEL_COMPATIBLE_SHELL { PARAM_VALUE.ACCEL_COMPATIBLE_SHELL } {
	# Procedure called to validate ACCEL_COMPATIBLE_SHELL
	return true
}

proc update_PARAM_VALUE.ACCEL_FMAX_MHZ { PARAM_VALUE.ACCEL_FMAX_MHZ } {
	# Procedure called to update ACCEL_FMAX_MHZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACCEL_FMAX_MHZ { PARAM_VALUE.ACCEL_FMAX_MHZ } {
	# Procedure called to validate ACCEL_FMAX_MHZ
	return true
}

proc update_PARAM_VALUE.ACCEL_SLOT { PARAM_VALUE.ACCEL_SLOT } {
	# Procedure called to update ACCEL_SLOT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACCEL_SLOT { PARAM_VALUE.ACCEL_SLOT } {
	# Procedure called to validate ACCEL_SLOT
	return true
}

proc update_PARAM_VALUE.ACCEL_VER { PARAM_VALUE.ACCEL_VER } {
	# Procedure called to update ACCEL_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACCEL_VER { PARAM_VALUE.ACCEL_VER } {
	# Procedure called to validate ACCEL_VER
	return true
}

proc update_PARAM_VALUE.HAS_SCALAR_OUTPUT { PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to update HAS_SCALAR_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_SCALAR_OUTPUT { PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to validate HAS_SCALAR_OUTPUT
	return true
}


proc update_MODELPARAM_VALUE.NUM_TIDS_USED { MODELPARAM_VALUE.NUM_TIDS_USED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "NUM_TIDS_USED". Setting updated value from the model parameter.
set_property value 2 ${MODELPARAM_VALUE.NUM_TIDS_USED}
}

proc update_MODELPARAM_VALUE.HAS_SCALAR_OUTPUT { MODELPARAM_VALUE.HAS_SCALAR_OUTPUT PARAM_VALUE.HAS_SCALAR_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_SCALAR_OUTPUT}] ${MODELPARAM_VALUE.HAS_SCALAR_OUTPUT}
}

proc update_MODELPARAM_VALUE.SCALAR_HAS_HS { MODELPARAM_VALUE.SCALAR_HAS_HS PARAM_VALUE.SCALAR_HAS_HS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCALAR_HAS_HS}] ${MODELPARAM_VALUE.SCALAR_HAS_HS}
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

proc update_MODELPARAM_VALUE.ACCEL_VER { MODELPARAM_VALUE.ACCEL_VER PARAM_VALUE.ACCEL_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACCEL_VER}] ${MODELPARAM_VALUE.ACCEL_VER}
}

proc update_MODELPARAM_VALUE.ACCEL_COMPATIBLE_SHELL { MODELPARAM_VALUE.ACCEL_COMPATIBLE_SHELL PARAM_VALUE.ACCEL_COMPATIBLE_SHELL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACCEL_COMPATIBLE_SHELL}] ${MODELPARAM_VALUE.ACCEL_COMPATIBLE_SHELL}
}

proc update_MODELPARAM_VALUE.ACCEL_SLOT { MODELPARAM_VALUE.ACCEL_SLOT PARAM_VALUE.ACCEL_SLOT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACCEL_SLOT}] ${MODELPARAM_VALUE.ACCEL_SLOT}
}

proc update_MODELPARAM_VALUE.ACCEL_FMAX_MHZ { MODELPARAM_VALUE.ACCEL_FMAX_MHZ PARAM_VALUE.ACCEL_FMAX_MHZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACCEL_FMAX_MHZ}] ${MODELPARAM_VALUE.ACCEL_FMAX_MHZ}
}

