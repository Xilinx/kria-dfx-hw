# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT

proc init {cellpath otherInfo } {
# cell initialization here
# Not needed, can be removed
}

proc post_configure_ip {cellpath otherInfo } {
# Any updates to interface properties based on user configuration
# Not needed, can be removed
}

proc propagate {cellpath otherInfo } {
#    set cell_handle [get_bd_cells $cellpath]
#    set intf_handle [get_bd_intf_pins $cellpath/gpio]
    
	#set width [get_property CONFIG.WIDTH $intf_handle]
    #set_property CONFIG.C_GPIO_WIDTH $width $cell_handle

    #set all_inputs [get_property CONFIG.ALL_INPUTS $intf_handle]
    #set_property CONFIG.C_ALL_INPUTS $all_inputs $cell_handle

    #set dout_default [get_property CONFIG.DOUT_DEFAULT $intf_handle]
    #set_property CONFIG.C_DOUT_DEFAULT $dout_default $cell_handle

    #set tri_default [get_property CONFIG.TRI_DEFAULT $intf_handle]
    #set_property CONFIG.C_TRI_DEFAULT $tri_default $cell_handle

    # If gpio_2 interface is enabled, update properties for the second channel
	#if { [string compare -nocase [get_property CONFIG.C_IS_DUAL $cell_handle] "1"] == 0} {
	#	set intf_handle [get_bd_intf_pins $cellpath/gpio_2]
		
	#	set width_2 [get_property CONFIG.WIDTH $intf_handle]
		#set_property CONFIG.C_GPIO_WIDTH_2 $width_2 $cell_handle

		#set all_inputs_2 [get_property CONFIG.ALL_INPUTS $intf_handle]
		#set_property CONFIG.C_ALL_INPUTS_2 $all_inputs_2 $cell_handle

		#set dout_default_2 [get_property CONFIG.DOUT_DEFAULT $intf_handle]
		#set_property CONFIG.C_DOUT_DEFAULT_2 $dout_default_2 $cell_handle

		#set tri_default_2 [get_property CONFIG.TRI_DEFAULT $intf_handle]
		#set_property CONFIG.C_TRI_DEFAULT_2 $tri_default_2 $cell_handle
	#}

	# standard parameter propagation here
}
