# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  set Component_Name  [  ipgui::add_param $IPINST -name "Component_Name" -display_name {Component Name}]
  set_property tooltip {Component Name} ${Component_Name}
  #Adding Page
  set Page_0  [  ipgui::add_page $IPINST -name "Page 0" -display_name {Page 0}]
  set_property tooltip {Page 0} ${Page_0}
  set WIDTH  [  ipgui::add_param $IPINST -name "WIDTH" -parent ${Page_0} -display_name {WIDTH}]
  set_property tooltip {WIDTH} ${WIDTH}


}

proc update_PARAM_VALUE.WIDTH { PARAM_VALUE.WIDTH } {
	# Procedure called to update WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH { PARAM_VALUE.WIDTH } {
	# Procedure called to validate WIDTH
	return true
}


proc update_MODELPARAM_VALUE.INITIALISE { MODELPARAM_VALUE.INITIALISE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "INITIALISE". Setting updated value from the model parameter.
set_property value "000000" ${MODELPARAM_VALUE.INITIALISE}
}

proc update_MODELPARAM_VALUE.WIDTH { MODELPARAM_VALUE.WIDTH PARAM_VALUE.WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH}] ${MODELPARAM_VALUE.WIDTH}
}

