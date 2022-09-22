# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
# Proc to create BD FIR_compiler
proc cr_bd_FIR_compiler { parentCell designName } {

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
  user.org:user:AccelConfig:1.0\
  xilinx.com:ip:axis_dwidth_converter:1.1\
  xilinx.com:ip:fir_compiler:7.2\
  user.org:user:outputbits_selector_v1_0:1.0\
  xilinx.com:ip:proc_sys_reset:5.0\
  user.org:user:rm_comm_box:1.0\
  xilinx.com:ip:smartconnect:1.0\
  xilinx.com:ip:xlconcat:2.1\
  xilinx.com:ip:xlconstant:1.1\
  xilinx.com:ip:xlslice:1.0\
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

  
# Hierarchical cell: tdata_instripe
proc create_hier_cell_tdata_instripe { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_tdata_instripe() - Empty argument(s)!"}
     return
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

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 127 -to 0 Din
  create_bd_pin -dir O -from 63 -to 0 dout_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
 ] $xlconcat_0

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {15} \
   CONFIG.DIN_WIDTH {128} \
   CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {47} \
   CONFIG.DIN_TO {32} \
   CONFIG.DIN_WIDTH {128} \
   CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {79} \
   CONFIG.DIN_TO {64} \
   CONFIG.DIN_WIDTH {128} \
   CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {111} \
   CONFIG.DIN_TO {96} \
   CONFIG.DIN_WIDTH {128} \
   CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_3

  # Create port connections
  connect_bd_net -net AccelConfig_0_out_v_tdata [get_bd_pins Din] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins dout_0] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins xlconcat_0/In0] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins xlconcat_0/In1] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins xlconcat_0/In2] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins xlconcat_0/In3] [get_bd_pins xlslice_3/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
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
   CONFIG.ADDR_WIDTH {64} \
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
  set interrupt [ create_bd_port -dir O -from 3 -to 0 -type intr interrupt ]
  set resetn [ create_bd_port -dir I -type rst resetn ]

  # Create instance: AccelConfig_0, and set properties
  set AccelConfig_0 [ create_bd_cell -type ip -vlnv user.org:user:AccelConfig:1.0 AccelConfig_0 ]
  set_property -dict [ list \
   CONFIG.EN_AP_CTRL_HS {false} \
   CONFIG.EN_TID1_OUTPUT {true} \
   CONFIG.EN_TID2_AXIS_OUTPUT {true} \
   CONFIG.EN_TID3_AXIS_OUTPUT {true} \
 ] $AccelConfig_0

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]

  # Create instance: fir_compiler_0, and set properties
  set fir_compiler_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_compiler_0 ]
  set_property -dict [ list \
   CONFIG.Clock_Frequency {250} \
   CONFIG.CoefficientVector {\
-23,-12,-11,-6,4,16,30,42,49,48,38,17,-11,-42,-72,-94,-103,-96,-71,-33,14,61,100,123,125,107,73,29,-12,-42,-52,-40,-8,36,79,107,109,75,7,-87,-193,-290,-357,-376,-339,-248,-114,39,184,296,353,347,284,183,75,-7,-32,17,141,321,517,679,752,692,473,97,-402,-959,-1491,-1905,-2118,-2070,-1738,-1142,-345,552,1430,2167,2657,2828,2657,2167,1430,552,-345,-1142,-1738,-2070,-2118,-1905,-1491,-959,-402,97,473,692,752,679,517,321,141,17,-32,-7,75,183,284,347,353,296,184,39,-114,-248,-339,-376,-357,-290,-193,-87,7,75,109,107,79,36,-8,-40,-52,-42,-12,29,73,107,125,123,100,61,14,-33,-71,-96,-103,-94,-72,-42,-11,17,38,48,49,42,30,16,4,-6,-11,-12,-23} \
   CONFIG.Coefficient_Fractional_Bits {0} \
   CONFIG.Coefficient_Reload {true} \
   CONFIG.Coefficient_Sets {1} \
   CONFIG.Coefficient_Sign {Signed} \
   CONFIG.Coefficient_Structure {Inferred} \
   CONFIG.Coefficient_Width {16} \
   CONFIG.ColumnConfig {40,40} \
   CONFIG.DATA_Has_TLAST {Packet_Framing} \
   CONFIG.Data_Width {16} \
   CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
   CONFIG.Has_ARESETn {true} \
   CONFIG.Inter_Column_Pipe_Length {8} \
   CONFIG.M_DATA_Has_TREADY {true} \
   CONFIG.Multi_Column_Support {Custom} \
   CONFIG.Output_Rounding_Mode {Truncate_LSBs} \
   CONFIG.Output_Width {33} \
   CONFIG.Quantization {Integer_Coefficients} \
   CONFIG.Reset_Data_Vector {false} \
   CONFIG.S_CONFIG_Sync_Mode {On_Packet} \
   CONFIG.Sample_Frequency {1000} \
 ] $fir_compiler_0

  # Create instance: outputbits_selector_0, and set properties
  set outputbits_selector_0 [ create_bd_cell -type ip -vlnv user.org:user:outputbits_selector_v1_0:1.0 outputbits_selector_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: rm_comm_box_0, and set properties
  set rm_comm_box_0 [ create_bd_cell -type ip -vlnv user.org:user:rm_comm_box:1.0 rm_comm_box_0 ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: tdata_instripe
  create_hier_cell_tdata_instripe [current_bd_instance .] tdata_instripe

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net AccelConfig_0_tid0_axis [get_bd_intf_pins AccelConfig_0/tid0_axis] [get_bd_intf_pins fir_compiler_0/S_AXIS_DATA]
  connect_bd_intf_net -intf_net AccelConfig_0_tid1_axis [get_bd_intf_pins AccelConfig_0/tid1_axis] [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS]
  connect_bd_intf_net -intf_net AccelConfig_0_tid2_axis [get_bd_intf_pins AccelConfig_0/tid2_axis] [get_bd_intf_pins fir_compiler_0/S_AXIS_CONFIG]
  connect_bd_intf_net -intf_net AccelConfig_0_tid3_axis [get_bd_intf_pins AccelConfig_0/tid3_axis] [get_bd_intf_pins outputbits_selector_0/s00_axis]
  connect_bd_intf_net -intf_net S_AXI_CTRL_1 [get_bd_intf_ports S_AXI_CTRL] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axis_dwidth_converter_0_M_AXIS [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS] [get_bd_intf_pins fir_compiler_0/S_AXIS_RELOAD]
  connect_bd_intf_net -intf_net fir_compiler_0_M_AXIS_DATA [get_bd_intf_pins fir_compiler_0/M_AXIS_DATA] [get_bd_intf_pins outputbits_selector_0/s01_axis]
  connect_bd_intf_net -intf_net outputbits_selector_0_m00_axis [get_bd_intf_pins outputbits_selector_0/m00_axis] [get_bd_intf_pins rm_comm_box_0/s2mm_axis]
  connect_bd_intf_net -intf_net rm_comm_box_0_m_axi_gmem [get_bd_intf_ports M_AXI_GMEM] [get_bd_intf_pins rm_comm_box_0/m_axi_gmem]
  connect_bd_intf_net -intf_net rm_comm_box_0_mm2s_axis [get_bd_intf_pins AccelConfig_0/axis_in] [get_bd_intf_pins rm_comm_box_0/mm2s_axis]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins rm_comm_box_0/s_axi_control] [get_bd_intf_pins smartconnect_0/M00_AXI]

  # Create port connections
  connect_bd_net -net Din_1 [get_bd_pins AccelConfig_0/tid0_axis_tdata] [get_bd_pins tdata_instripe/Din]
  connect_bd_net -net clk_4 [get_bd_ports clk] [get_bd_pins AccelConfig_0/clk] [get_bd_pins axis_dwidth_converter_0/aclk] [get_bd_pins fir_compiler_0/aclk] [get_bd_pins outputbits_selector_0/aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins rm_comm_box_0/clk] [get_bd_pins smartconnect_0/aclk]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins AccelConfig_0/resetn] [get_bd_pins axis_dwidth_converter_0/aresetn] [get_bd_pins fir_compiler_0/aresetn] [get_bd_pins outputbits_selector_0/aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins rm_comm_box_0/resetn]
  connect_bd_net -net rm_comm_box_0_interrupt_mm2s [get_bd_pins rm_comm_box_0/interrupt_mm2s] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net rm_comm_box_0_interrupt_s2mm [get_bd_pins rm_comm_box_0/interrupt_s2mm] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net static_shell_rp1_resetn [get_bd_ports resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net tdata_stripe_dout_0 [get_bd_pins fir_compiler_0/s_axis_data_tdata] [get_bd_pins tdata_instripe/dout_0]
  connect_bd_net -net xlconcat_0_dout [get_bd_ports interrupt] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_0/In3] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  assign_bd_address -external -dict [list offset 0x00000000 range 0x80000000 offset 0x000200000000 range 0x40000000 offset 0x000280000000 range 0x40000000 offset 0x000800000000 range 0x000800000000 offset 0xC0000000 range 0x20000000 offset 0xFF000000 range 0x01000000] -target_address_space [get_bd_addr_spaces rm_comm_box_0/m_axi_gmem] [get_bd_addr_segs M_AXI_GMEM/Reg] -force
  assign_bd_address -offset 0x81000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces S_AXI_CTRL] [get_bd_addr_segs rm_comm_box_0/s_axi_control/reg0] -force

  set_property USAGE memory [get_bd_addr_segs M_AXI_GMEM/Reg]


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_FIR_compiler()
