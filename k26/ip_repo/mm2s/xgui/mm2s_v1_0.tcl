# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_M_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_ARUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_AWUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_BUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_CACHE_VALUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_PROT_VALUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_RUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_USER_VALUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_WSTRB_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_GMEM_WUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXI_WSTRB_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_CONTROL_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_CONTROL_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_CONTROL_WSTRB_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_WSTRB_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_pp0_stage0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state12" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state5" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state6" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state7" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ap_ST_fsm_state8" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_M_AXI_DATA_WIDTH { PARAM_VALUE.C_M_AXI_DATA_WIDTH } {
	# Procedure called to update C_M_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_DATA_WIDTH { PARAM_VALUE.C_M_AXI_DATA_WIDTH } {
	# Procedure called to validate C_M_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_BUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE { PARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE } {
	# Procedure called to update C_M_AXI_GMEM_CACHE_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE { PARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE } {
	# Procedure called to validate C_M_AXI_GMEM_CACHE_VALUE
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE { PARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE } {
	# Procedure called to update C_M_AXI_GMEM_PROT_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE { PARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE } {
	# Procedure called to validate C_M_AXI_GMEM_PROT_VALUE
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_USER_VALUE { PARAM_VALUE.C_M_AXI_GMEM_USER_VALUE } {
	# Procedure called to update C_M_AXI_GMEM_USER_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_USER_VALUE { PARAM_VALUE.C_M_AXI_GMEM_USER_VALUE } {
	# Procedure called to validate C_M_AXI_GMEM_USER_VALUE
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_WSTRB_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_WSTRB_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH } {
	# Procedure called to update C_M_AXI_GMEM_WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH { PARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH } {
	# Procedure called to validate C_M_AXI_GMEM_WUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_WSTRB_WIDTH { PARAM_VALUE.C_M_AXI_WSTRB_WIDTH } {
	# Procedure called to update C_M_AXI_WSTRB_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_WSTRB_WIDTH { PARAM_VALUE.C_M_AXI_WSTRB_WIDTH } {
	# Procedure called to validate C_M_AXI_WSTRB_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_CONTROL_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_CONTROL_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH { PARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_CONTROL_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH { PARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_CONTROL_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH { PARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH } {
	# Procedure called to update C_S_AXI_CONTROL_WSTRB_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH { PARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH } {
	# Procedure called to validate C_S_AXI_CONTROL_WSTRB_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_WSTRB_WIDTH { PARAM_VALUE.C_S_AXI_WSTRB_WIDTH } {
	# Procedure called to update C_S_AXI_WSTRB_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_WSTRB_WIDTH { PARAM_VALUE.C_S_AXI_WSTRB_WIDTH } {
	# Procedure called to validate C_S_AXI_WSTRB_WIDTH
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_pp0_stage0 { PARAM_VALUE.ap_ST_fsm_pp0_stage0 } {
	# Procedure called to update ap_ST_fsm_pp0_stage0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_pp0_stage0 { PARAM_VALUE.ap_ST_fsm_pp0_stage0 } {
	# Procedure called to validate ap_ST_fsm_pp0_stage0
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state1 { PARAM_VALUE.ap_ST_fsm_state1 } {
	# Procedure called to update ap_ST_fsm_state1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state1 { PARAM_VALUE.ap_ST_fsm_state1 } {
	# Procedure called to validate ap_ST_fsm_state1
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state12 { PARAM_VALUE.ap_ST_fsm_state12 } {
	# Procedure called to update ap_ST_fsm_state12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state12 { PARAM_VALUE.ap_ST_fsm_state12 } {
	# Procedure called to validate ap_ST_fsm_state12
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state2 { PARAM_VALUE.ap_ST_fsm_state2 } {
	# Procedure called to update ap_ST_fsm_state2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state2 { PARAM_VALUE.ap_ST_fsm_state2 } {
	# Procedure called to validate ap_ST_fsm_state2
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state3 { PARAM_VALUE.ap_ST_fsm_state3 } {
	# Procedure called to update ap_ST_fsm_state3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state3 { PARAM_VALUE.ap_ST_fsm_state3 } {
	# Procedure called to validate ap_ST_fsm_state3
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state4 { PARAM_VALUE.ap_ST_fsm_state4 } {
	# Procedure called to update ap_ST_fsm_state4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state4 { PARAM_VALUE.ap_ST_fsm_state4 } {
	# Procedure called to validate ap_ST_fsm_state4
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state5 { PARAM_VALUE.ap_ST_fsm_state5 } {
	# Procedure called to update ap_ST_fsm_state5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state5 { PARAM_VALUE.ap_ST_fsm_state5 } {
	# Procedure called to validate ap_ST_fsm_state5
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state6 { PARAM_VALUE.ap_ST_fsm_state6 } {
	# Procedure called to update ap_ST_fsm_state6 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state6 { PARAM_VALUE.ap_ST_fsm_state6 } {
	# Procedure called to validate ap_ST_fsm_state6
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state7 { PARAM_VALUE.ap_ST_fsm_state7 } {
	# Procedure called to update ap_ST_fsm_state7 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state7 { PARAM_VALUE.ap_ST_fsm_state7 } {
	# Procedure called to validate ap_ST_fsm_state7
	return true
}

proc update_PARAM_VALUE.ap_ST_fsm_state8 { PARAM_VALUE.ap_ST_fsm_state8 } {
	# Procedure called to update ap_ST_fsm_state8 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ap_ST_fsm_state8 { PARAM_VALUE.ap_ST_fsm_state8 } {
	# Procedure called to validate ap_ST_fsm_state8
	return true
}


proc update_MODELPARAM_VALUE.ap_ST_fsm_state1 { MODELPARAM_VALUE.ap_ST_fsm_state1 PARAM_VALUE.ap_ST_fsm_state1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state1}] ${MODELPARAM_VALUE.ap_ST_fsm_state1}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_state2 { MODELPARAM_VALUE.ap_ST_fsm_state2 PARAM_VALUE.ap_ST_fsm_state2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state2}] ${MODELPARAM_VALUE.ap_ST_fsm_state2}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_state3 { MODELPARAM_VALUE.ap_ST_fsm_state3 PARAM_VALUE.ap_ST_fsm_state3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state3}] ${MODELPARAM_VALUE.ap_ST_fsm_state3}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_state4 { MODELPARAM_VALUE.ap_ST_fsm_state4 PARAM_VALUE.ap_ST_fsm_state4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state4}] ${MODELPARAM_VALUE.ap_ST_fsm_state4}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_state5 { MODELPARAM_VALUE.ap_ST_fsm_state5 PARAM_VALUE.ap_ST_fsm_state5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state5}] ${MODELPARAM_VALUE.ap_ST_fsm_state5}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_state6 { MODELPARAM_VALUE.ap_ST_fsm_state6 PARAM_VALUE.ap_ST_fsm_state6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state6}] ${MODELPARAM_VALUE.ap_ST_fsm_state6}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_state7 { MODELPARAM_VALUE.ap_ST_fsm_state7 PARAM_VALUE.ap_ST_fsm_state7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state7}] ${MODELPARAM_VALUE.ap_ST_fsm_state7}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_state8 { MODELPARAM_VALUE.ap_ST_fsm_state8 PARAM_VALUE.ap_ST_fsm_state8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state8}] ${MODELPARAM_VALUE.ap_ST_fsm_state8}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_pp0_stage0 { MODELPARAM_VALUE.ap_ST_fsm_pp0_stage0 PARAM_VALUE.ap_ST_fsm_pp0_stage0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_pp0_stage0}] ${MODELPARAM_VALUE.ap_ST_fsm_pp0_stage0}
}

proc update_MODELPARAM_VALUE.ap_ST_fsm_state12 { MODELPARAM_VALUE.ap_ST_fsm_state12 PARAM_VALUE.ap_ST_fsm_state12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ap_ST_fsm_state12}] ${MODELPARAM_VALUE.ap_ST_fsm_state12}
}

proc update_MODELPARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH PARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_CONTROL_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH PARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_CONTROL_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH PARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH PARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH PARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH PARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH PARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH PARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH PARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH PARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_BUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_USER_VALUE { MODELPARAM_VALUE.C_M_AXI_GMEM_USER_VALUE PARAM_VALUE.C_M_AXI_GMEM_USER_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_USER_VALUE}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_USER_VALUE}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE { MODELPARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE PARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_PROT_VALUE}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE { MODELPARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE PARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_CACHE_VALUE}
}

proc update_MODELPARAM_VALUE.C_M_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_M_AXI_DATA_WIDTH PARAM_VALUE.C_M_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH { MODELPARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH PARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_CONTROL_WSTRB_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_WSTRB_WIDTH { MODELPARAM_VALUE.C_S_AXI_WSTRB_WIDTH PARAM_VALUE.C_S_AXI_WSTRB_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_WSTRB_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_WSTRB_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH { MODELPARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH PARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_GMEM_WSTRB_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_WSTRB_WIDTH { MODELPARAM_VALUE.C_M_AXI_WSTRB_WIDTH PARAM_VALUE.C_M_AXI_WSTRB_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_WSTRB_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_WSTRB_WIDTH}
}

