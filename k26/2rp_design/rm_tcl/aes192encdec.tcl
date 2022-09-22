# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
# Proc to create BD AES192
proc cr_bd_AES192 { parentCell designName } {

  # CHANGE DESIGN NAME HERE
  set design_name $designName

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  user.org:user:AES192_Dec:1.0\
  user.org:user:AES192_Enc:1.0\
  user.org:user:AccelConfig:1.0\
  user.org:user:axis_accel_sel:1.0\
  xilinx.com:ip:proc_sys_reset:5.0\
  user.org:user:rm_comm_box:1.0\
  xilinx.com:ip:smartconnect:1.0\
  xilinx.com:ip:xlconcat:2.1\
  xilinx.com:ip:xlconstant:1.1\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set M_AXI_GMEM [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_GMEM ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {49} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $M_AXI_GMEM

  set S_AXI_CTRL [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CTRL ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {8} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {8} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $S_AXI_CTRL


  # Create ports
  set clk [ create_bd_port -dir I -type clk -freq_hz 249997498 clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S_AXI_CTRL:M_AXI_GMEM} \
 ] $clk
  set interrupt [ create_bd_port -dir O -from 3 -to 0 -type intr interrupt ]
  set resetn [ create_bd_port -dir I -type rst resetn ]

  # Create instance: AES192_Dec_0, and set properties
  set AES192_Dec_0 [ create_bd_cell -type ip -vlnv user.org:user:AES192_Dec:1.0 AES192_Dec_0 ]

  # Create instance: AES192_Enc_0, and set properties
  set AES192_Enc_0 [ create_bd_cell -type ip -vlnv user.org:user:AES192_Enc:1.0 AES192_Enc_0 ]

  # Create instance: AccelConfig_0, and set properties
  set AccelConfig_0 [ create_bd_cell -type ip -vlnv user.org:user:AccelConfig:1.0 AccelConfig_0 ]
  set_property -dict [ list \
   CONFIG.EN_TID1_OUTPUT {true} \
   CONFIG.EN_TID2_AXIS_OUTPUT {false} \
   CONFIG.NUM_SCALAR_PORTS {2} \
   CONFIG.SCALAR1_WIDTH {192} \
   CONFIG.SCALAR2_WIDTH {32} \
   CONFIG.TID1_OUTPUT {2} \
 ] $AccelConfig_0

  # Create instance: axis_accel_sel_0, and set properties
  set axis_accel_sel_0 [ create_bd_cell -type ip -vlnv user.org:user:axis_accel_sel:1.0 axis_accel_sel_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: rm_comm_box_0, and set properties
  set rm_comm_box_0 [ create_bd_cell -type ip -vlnv user.org:user:rm_comm_box:1.0 rm_comm_box_0 ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
 ] $xlconcat_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create interface connections
  connect_bd_intf_net -intf_net AES192_Dec_0_out_r [get_bd_intf_pins AES192_Dec_0/out_r] [get_bd_intf_pins axis_accel_sel_0/out_V_dec]
  connect_bd_intf_net -intf_net AES192_Enc_0_out_r [get_bd_intf_pins AES192_Enc_0/out_r] [get_bd_intf_pins axis_accel_sel_0/out_V_enc]
  connect_bd_intf_net -intf_net AccelConfig_0_tid0_axis [get_bd_intf_pins AccelConfig_0/tid0_axis] [get_bd_intf_pins axis_accel_sel_0/in_V]
  connect_bd_intf_net -intf_net S_AXI_CTRL_1 [get_bd_intf_ports S_AXI_CTRL] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axis_accel_sel_0_in_V_dec [get_bd_intf_pins AES192_Dec_0/in_r] [get_bd_intf_pins axis_accel_sel_0/in_V_dec]
  connect_bd_intf_net -intf_net axis_accel_sel_0_in_V_enc [get_bd_intf_pins AES192_Enc_0/in_r] [get_bd_intf_pins axis_accel_sel_0/in_V_enc]
  connect_bd_intf_net -intf_net axis_accel_sel_0_out_V [get_bd_intf_pins axis_accel_sel_0/out_V] [get_bd_intf_pins rm_comm_box_0/s2mm_axis]
  connect_bd_intf_net -intf_net rm_comm_box_0_m_axi_gmem [get_bd_intf_ports M_AXI_GMEM] [get_bd_intf_pins rm_comm_box_0/m_axi_gmem]
  connect_bd_intf_net -intf_net rm_comm_box_0_mm2s_axis [get_bd_intf_pins AccelConfig_0/axis_in] [get_bd_intf_pins rm_comm_box_0/mm2s_axis]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins AccelConfig_0/s_axi_ctrl] [get_bd_intf_pins smartconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M01_AXI [get_bd_intf_pins rm_comm_box_0/s_axi_control] [get_bd_intf_pins smartconnect_0/M01_AXI]

  # Create port connections
  connect_bd_net -net AES192_Dec_0_ap_done [get_bd_pins AES192_Dec_0/ap_done] [get_bd_pins axis_accel_sel_0/ap_done_dec]
  connect_bd_net -net AES192_Dec_0_ap_idle [get_bd_pins AES192_Dec_0/ap_idle] [get_bd_pins axis_accel_sel_0/ap_idle_dec]
  connect_bd_net -net AES192_Dec_0_ap_ready [get_bd_pins AES192_Dec_0/ap_ready] [get_bd_pins axis_accel_sel_0/ap_ready_dec]
  connect_bd_net -net AES192_Enc_0_ap_done [get_bd_pins AES192_Enc_0/ap_done] [get_bd_pins axis_accel_sel_0/ap_done_enc]
  connect_bd_net -net AES192_Enc_0_ap_idle [get_bd_pins AES192_Enc_0/ap_idle] [get_bd_pins axis_accel_sel_0/ap_idle_enc]
  connect_bd_net -net AES192_Enc_0_ap_ready [get_bd_pins AES192_Enc_0/ap_ready] [get_bd_pins axis_accel_sel_0/ap_ready_enc]
  connect_bd_net -net AccelConfig_0_ap_start [get_bd_pins AccelConfig_0/ap_start] [get_bd_pins axis_accel_sel_0/ap_start]
  connect_bd_net -net AccelConfig_0_config_port1_tdata [get_bd_pins AES192_Dec_0/key] [get_bd_pins AES192_Enc_0/key] [get_bd_pins AccelConfig_0/scalar1]
  connect_bd_net -net AccelConfig_0_interrupt [get_bd_pins AccelConfig_0/interrupt] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net AccelConfig_0_scalar2 [get_bd_pins AccelConfig_0/scalar2] [get_bd_pins axis_accel_sel_0/USE_ENC]
  connect_bd_net -net axis_accel_sel_0_ap_done [get_bd_pins AccelConfig_0/ap_done] [get_bd_pins axis_accel_sel_0/ap_done]
  connect_bd_net -net axis_accel_sel_0_ap_idle [get_bd_pins AccelConfig_0/ap_idle] [get_bd_pins axis_accel_sel_0/ap_idle]
  connect_bd_net -net axis_accel_sel_0_ap_ready [get_bd_pins AccelConfig_0/ap_ready] [get_bd_pins axis_accel_sel_0/ap_ready]
  connect_bd_net -net axis_accel_sel_0_ap_start_dec [get_bd_pins AES192_Dec_0/ap_start] [get_bd_pins axis_accel_sel_0/ap_start_dec]
  connect_bd_net -net axis_accel_sel_0_ap_start_enc [get_bd_pins AES192_Enc_0/ap_start] [get_bd_pins axis_accel_sel_0/ap_start_enc]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins AES192_Dec_0/ap_clk] [get_bd_pins AES192_Enc_0/ap_clk] [get_bd_pins AccelConfig_0/clk] [get_bd_pins axis_accel_sel_0/ap_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins rm_comm_box_0/clk] [get_bd_pins smartconnect_0/aclk]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins AES192_Dec_0/ap_rst_n] [get_bd_pins AES192_Enc_0/ap_rst_n] [get_bd_pins AccelConfig_0/resetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins rm_comm_box_0/resetn]
  connect_bd_net -net rm_comm_box_0_interrupt_mm2s [get_bd_pins rm_comm_box_0/interrupt_mm2s] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net rm_comm_box_0_interrupt_s2mm [get_bd_pins rm_comm_box_0/interrupt_s2mm] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net static_shell_rp0_resetn [get_bd_ports resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net xlconcat_0_dout [get_bd_ports interrupt] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xlconcat_0/In3] [get_bd_pins xlconstant_1/dout]

  # Create address segments
  assign_bd_address -external -dict [list offset 0x00000000 range 0x80000000 offset 0x000200000000 range 0x40000000 offset 0x000280000000 range 0x40000000 offset 0x000800000000 range 0x000800000000 offset 0xC0000000 range 0x20000000 offset 0xFF000000 range 0x01000000] -target_address_space [get_bd_addr_spaces rm_comm_box_0/m_axi_gmem] [get_bd_addr_segs M_AXI_GMEM/Reg] -force
  assign_bd_address -offset 0x80000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces S_AXI_CTRL] [get_bd_addr_segs AccelConfig_0/s_axi_ctrl/reg0] -force
  assign_bd_address -offset 0x81000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces S_AXI_CTRL] [get_bd_addr_segs rm_comm_box_0/s_axi_control/reg0] -force

  set_property USAGE memory [get_bd_addr_segs M_AXI_GMEM/Reg]


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_AES192()
