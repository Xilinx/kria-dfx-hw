# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
# Proc to create BD FFT_4channel
proc cr_bd_FFT_4channel { parentCell designName } {

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
  xilinx.com:ip:proc_sys_reset:5.0\
  user.org:user:rm_comm_box:1.0\
  xilinx.com:ip:smartconnect:1.0\
  xilinx.com:ip:xlconcat:2.1\
  xilinx.com:ip:xlconstant:1.1\
  user.org:user:channelSelectLogic:1.0\
  xilinx:hls:gather:1.0\
  xilinx:hls:scatter:1.0\
  user.org:user:axisMask:1.0\
  xilinx.com:ip:axis_dwidth_converter:1.1\
  xilinx.com:ip:xfft:9.1\
  xilinx.com:ip:axis_data_fifo:2.0\
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

  
# Hierarchical cell: Fifo1
proc create_hier_cell_Fifo1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Fifo1() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_0

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_1

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_2

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_3

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_0

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_2

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_3


  # Create pins
  create_bd_pin -dir I -type clk s_axis_aclk_0
  create_bd_pin -dir I -type rst s_axis_aresetn_0

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {4096} \
   CONFIG.FIFO_MEMORY_TYPE {ultra} \
 ] $axis_data_fifo_0

  # Create instance: axis_data_fifo_1, and set properties
  set axis_data_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_1 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {4096} \
   CONFIG.FIFO_MEMORY_TYPE {ultra} \
 ] $axis_data_fifo_1

  # Create instance: axis_data_fifo_2, and set properties
  set axis_data_fifo_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_2 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {4096} \
   CONFIG.FIFO_MEMORY_TYPE {ultra} \
 ] $axis_data_fifo_2

  # Create instance: axis_data_fifo_3, and set properties
  set axis_data_fifo_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_3 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {4096} \
   CONFIG.FIFO_MEMORY_TYPE {ultra} \
 ] $axis_data_fifo_3

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXIS_0] [get_bd_intf_pins axis_data_fifo_0/M_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXIS_0] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S_AXIS_1] [get_bd_intf_pins axis_data_fifo_1/S_AXIS]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M_AXIS_1] [get_bd_intf_pins axis_data_fifo_1/M_AXIS]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins S_AXIS_2] [get_bd_intf_pins axis_data_fifo_2/S_AXIS]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins M_AXIS_2] [get_bd_intf_pins axis_data_fifo_2/M_AXIS]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins S_AXIS_3] [get_bd_intf_pins axis_data_fifo_3/S_AXIS]
  connect_bd_intf_net -intf_net Conn8 [get_bd_intf_pins M_AXIS_3] [get_bd_intf_pins axis_data_fifo_3/M_AXIS]

  # Create port connections
  connect_bd_net -net s_axis_aclk_0_1 [get_bd_pins s_axis_aclk_0] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins axis_data_fifo_1/s_axis_aclk] [get_bd_pins axis_data_fifo_2/s_axis_aclk] [get_bd_pins axis_data_fifo_3/s_axis_aclk]
  connect_bd_net -net s_axis_aresetn_0_1 [get_bd_pins s_axis_aresetn_0] [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins axis_data_fifo_1/s_axis_aresetn] [get_bd_pins axis_data_fifo_2/s_axis_aresetn] [get_bd_pins axis_data_fifo_3/s_axis_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: Fifo
proc create_hier_cell_Fifo { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Fifo() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_0

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_1

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_2

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_3

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_0

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_2

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_3


  # Create pins
  create_bd_pin -dir I -type clk s_axis_aclk_0
  create_bd_pin -dir I -type rst s_axis_aresetn_0

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {4096} \
   CONFIG.FIFO_MEMORY_TYPE {ultra} \
 ] $axis_data_fifo_0

  # Create instance: axis_data_fifo_1, and set properties
  set axis_data_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_1 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {4096} \
   CONFIG.FIFO_MEMORY_TYPE {ultra} \
 ] $axis_data_fifo_1

  # Create instance: axis_data_fifo_2, and set properties
  set axis_data_fifo_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_2 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {4096} \
   CONFIG.FIFO_MEMORY_TYPE {ultra} \
 ] $axis_data_fifo_2

  # Create instance: axis_data_fifo_3, and set properties
  set axis_data_fifo_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_3 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {4096} \
   CONFIG.FIFO_MEMORY_TYPE {ultra} \
 ] $axis_data_fifo_3

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXIS_0] [get_bd_intf_pins axis_data_fifo_0/M_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXIS_0] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S_AXIS_1] [get_bd_intf_pins axis_data_fifo_1/S_AXIS]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M_AXIS_1] [get_bd_intf_pins axis_data_fifo_1/M_AXIS]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins S_AXIS_2] [get_bd_intf_pins axis_data_fifo_2/S_AXIS]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins M_AXIS_2] [get_bd_intf_pins axis_data_fifo_2/M_AXIS]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins S_AXIS_3] [get_bd_intf_pins axis_data_fifo_3/S_AXIS]
  connect_bd_intf_net -intf_net Conn8 [get_bd_intf_pins M_AXIS_3] [get_bd_intf_pins axis_data_fifo_3/M_AXIS]

  # Create port connections
  connect_bd_net -net s_axis_aclk_0_1 [get_bd_pins s_axis_aclk_0] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins axis_data_fifo_1/s_axis_aclk] [get_bd_pins axis_data_fifo_2/s_axis_aclk] [get_bd_pins axis_data_fifo_3/s_axis_aclk]
  connect_bd_net -net s_axis_aresetn_0_1 [get_bd_pins s_axis_aresetn_0] [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins axis_data_fifo_1/s_axis_aresetn] [get_bd_pins axis_data_fifo_2/s_axis_aresetn] [get_bd_pins axis_data_fifo_3/s_axis_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: FFTBlock3
proc create_hier_cell_FFTBlock3 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_FFTBlock3() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS1


  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -type rst aresetn
  create_bd_pin -dir O -type intr event_data_in_channel_halt
  create_bd_pin -dir O -type intr event_data_out_channel_halt
  create_bd_pin -dir O -type intr event_frame_started
  create_bd_pin -dir O -type intr event_status_channel_halt
  create_bd_pin -dir O -type intr event_tlast_missing
  create_bd_pin -dir O -type intr event_tlast_unexpected

  # Create instance: axisMask_1, and set properties
  set axisMask_1 [ create_bd_cell -type ip -vlnv user.org:user:axisMask:1.0 axisMask_1 ]

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_0

  # Create instance: axis_dwidth_converter_1, and set properties
  set axis_dwidth_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_1 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_1

  # Create instance: axis_dwidth_converter_3, and set properties
  set axis_dwidth_converter_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_3 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_3

  # Create instance: xfft_0, and set properties
  set xfft_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_0 ]
  set_property -dict [ list \
   CONFIG.butterfly_type {use_xtremedsp_slices} \
   CONFIG.complex_mult_type {use_mults_performance} \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {5} \
   CONFIG.output_ordering {natural_order} \
   CONFIG.run_time_configurable_transform_length {true} \
   CONFIG.target_data_throughput {50} \
   CONFIG.transform_length {4096} \
 ] $xfft_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_dwidth_converter_1/S_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS] [get_bd_intf_pins xfft_0/M_AXIS_DATA]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins axis_dwidth_converter_1/M_AXIS] [get_bd_intf_pins xfft_0/S_AXIS_DATA]
  connect_bd_intf_net -intf_net axisMask_1_out_AXIS [get_bd_intf_pins axisMask_1/out_AXIS] [get_bd_intf_pins xfft_0/S_AXIS_CONFIG]
  connect_bd_intf_net -intf_net axis_dwidth_converter_3_M_AXIS [get_bd_intf_pins axisMask_1/in_AXIS] [get_bd_intf_pins axis_dwidth_converter_3/M_AXIS]
  connect_bd_intf_net -intf_net axis_interconnect_0_M01_AXIS [get_bd_intf_pins S_AXIS1] [get_bd_intf_pins axis_dwidth_converter_3/S_AXIS]

  # Create port connections
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins aresetn] [get_bd_pins axisMask_1/resetn] [get_bd_pins axis_dwidth_converter_0/aresetn] [get_bd_pins axis_dwidth_converter_1/aresetn] [get_bd_pins axis_dwidth_converter_3/aresetn]
  connect_bd_net -net slot_event_data_in_channel_halt [get_bd_pins event_data_in_channel_halt] [get_bd_pins xfft_0/event_data_in_channel_halt]
  connect_bd_net -net slot_event_data_out_channel_halt [get_bd_pins event_data_out_channel_halt] [get_bd_pins xfft_0/event_data_out_channel_halt]
  connect_bd_net -net slot_event_frame_started [get_bd_pins event_frame_started] [get_bd_pins xfft_0/event_frame_started]
  connect_bd_net -net slot_event_status_channel_halt [get_bd_pins event_status_channel_halt] [get_bd_pins xfft_0/event_status_channel_halt]
  connect_bd_net -net slot_event_tlast_missing [get_bd_pins event_tlast_missing] [get_bd_pins xfft_0/event_tlast_missing]
  connect_bd_net -net slot_event_tlast_unexpected [get_bd_pins event_tlast_unexpected] [get_bd_pins xfft_0/event_tlast_unexpected]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins aclk] [get_bd_pins axisMask_1/clk] [get_bd_pins axis_dwidth_converter_0/aclk] [get_bd_pins axis_dwidth_converter_1/aclk] [get_bd_pins axis_dwidth_converter_3/aclk] [get_bd_pins xfft_0/aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: FFTBlock2
proc create_hier_cell_FFTBlock2 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_FFTBlock2() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS1


  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -type rst aresetn
  create_bd_pin -dir O -type intr event_data_in_channel_halt
  create_bd_pin -dir O -type intr event_data_out_channel_halt
  create_bd_pin -dir O -type intr event_frame_started
  create_bd_pin -dir O -type intr event_status_channel_halt
  create_bd_pin -dir O -type intr event_tlast_missing
  create_bd_pin -dir O -type intr event_tlast_unexpected

  # Create instance: axisMask_1, and set properties
  set axisMask_1 [ create_bd_cell -type ip -vlnv user.org:user:axisMask:1.0 axisMask_1 ]

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_0

  # Create instance: axis_dwidth_converter_1, and set properties
  set axis_dwidth_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_1 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_1

  # Create instance: axis_dwidth_converter_3, and set properties
  set axis_dwidth_converter_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_3 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_3

  # Create instance: xfft_0, and set properties
  set xfft_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_0 ]
  set_property -dict [ list \
   CONFIG.butterfly_type {use_xtremedsp_slices} \
   CONFIG.complex_mult_type {use_mults_performance} \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {5} \
   CONFIG.output_ordering {natural_order} \
   CONFIG.run_time_configurable_transform_length {true} \
   CONFIG.target_data_throughput {50} \
   CONFIG.transform_length {4096} \
 ] $xfft_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_dwidth_converter_1/S_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS] [get_bd_intf_pins xfft_0/M_AXIS_DATA]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins axis_dwidth_converter_1/M_AXIS] [get_bd_intf_pins xfft_0/S_AXIS_DATA]
  connect_bd_intf_net -intf_net axisMask_1_out_AXIS [get_bd_intf_pins axisMask_1/out_AXIS] [get_bd_intf_pins xfft_0/S_AXIS_CONFIG]
  connect_bd_intf_net -intf_net axis_dwidth_converter_3_M_AXIS [get_bd_intf_pins axisMask_1/in_AXIS] [get_bd_intf_pins axis_dwidth_converter_3/M_AXIS]
  connect_bd_intf_net -intf_net axis_interconnect_0_M01_AXIS [get_bd_intf_pins S_AXIS1] [get_bd_intf_pins axis_dwidth_converter_3/S_AXIS]

  # Create port connections
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins aresetn] [get_bd_pins axisMask_1/resetn] [get_bd_pins axis_dwidth_converter_0/aresetn] [get_bd_pins axis_dwidth_converter_1/aresetn] [get_bd_pins axis_dwidth_converter_3/aresetn]
  connect_bd_net -net slot_event_data_in_channel_halt [get_bd_pins event_data_in_channel_halt] [get_bd_pins xfft_0/event_data_in_channel_halt]
  connect_bd_net -net slot_event_data_out_channel_halt [get_bd_pins event_data_out_channel_halt] [get_bd_pins xfft_0/event_data_out_channel_halt]
  connect_bd_net -net slot_event_frame_started [get_bd_pins event_frame_started] [get_bd_pins xfft_0/event_frame_started]
  connect_bd_net -net slot_event_status_channel_halt [get_bd_pins event_status_channel_halt] [get_bd_pins xfft_0/event_status_channel_halt]
  connect_bd_net -net slot_event_tlast_missing [get_bd_pins event_tlast_missing] [get_bd_pins xfft_0/event_tlast_missing]
  connect_bd_net -net slot_event_tlast_unexpected [get_bd_pins event_tlast_unexpected] [get_bd_pins xfft_0/event_tlast_unexpected]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins aclk] [get_bd_pins axisMask_1/clk] [get_bd_pins axis_dwidth_converter_0/aclk] [get_bd_pins axis_dwidth_converter_1/aclk] [get_bd_pins axis_dwidth_converter_3/aclk] [get_bd_pins xfft_0/aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: FFTBlock1
proc create_hier_cell_FFTBlock1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_FFTBlock1() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS1


  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -type rst aresetn
  create_bd_pin -dir O -type intr event_data_in_channel_halt
  create_bd_pin -dir O -type intr event_data_out_channel_halt
  create_bd_pin -dir O -type intr event_frame_started
  create_bd_pin -dir O -type intr event_status_channel_halt
  create_bd_pin -dir O -type intr event_tlast_missing
  create_bd_pin -dir O -type intr event_tlast_unexpected

  # Create instance: axisMask_1, and set properties
  set axisMask_1 [ create_bd_cell -type ip -vlnv user.org:user:axisMask:1.0 axisMask_1 ]

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_0

  # Create instance: axis_dwidth_converter_1, and set properties
  set axis_dwidth_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_1 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_1

  # Create instance: axis_dwidth_converter_3, and set properties
  set axis_dwidth_converter_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_3 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_3

  # Create instance: xfft_0, and set properties
  set xfft_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_0 ]
  set_property -dict [ list \
   CONFIG.butterfly_type {use_xtremedsp_slices} \
   CONFIG.complex_mult_type {use_mults_performance} \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {5} \
   CONFIG.output_ordering {natural_order} \
   CONFIG.run_time_configurable_transform_length {true} \
   CONFIG.target_data_throughput {50} \
   CONFIG.transform_length {4096} \
 ] $xfft_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_dwidth_converter_1/S_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS] [get_bd_intf_pins xfft_0/M_AXIS_DATA]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins axis_dwidth_converter_1/M_AXIS] [get_bd_intf_pins xfft_0/S_AXIS_DATA]
  connect_bd_intf_net -intf_net axisMask_1_out_AXIS [get_bd_intf_pins axisMask_1/out_AXIS] [get_bd_intf_pins xfft_0/S_AXIS_CONFIG]
  connect_bd_intf_net -intf_net axis_dwidth_converter_3_M_AXIS [get_bd_intf_pins axisMask_1/in_AXIS] [get_bd_intf_pins axis_dwidth_converter_3/M_AXIS]
  connect_bd_intf_net -intf_net axis_interconnect_0_M01_AXIS [get_bd_intf_pins S_AXIS1] [get_bd_intf_pins axis_dwidth_converter_3/S_AXIS]

  # Create port connections
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins aresetn] [get_bd_pins axisMask_1/resetn] [get_bd_pins axis_dwidth_converter_0/aresetn] [get_bd_pins axis_dwidth_converter_1/aresetn] [get_bd_pins axis_dwidth_converter_3/aresetn]
  connect_bd_net -net slot_event_data_in_channel_halt [get_bd_pins event_data_in_channel_halt] [get_bd_pins xfft_0/event_data_in_channel_halt]
  connect_bd_net -net slot_event_data_out_channel_halt [get_bd_pins event_data_out_channel_halt] [get_bd_pins xfft_0/event_data_out_channel_halt]
  connect_bd_net -net slot_event_frame_started [get_bd_pins event_frame_started] [get_bd_pins xfft_0/event_frame_started]
  connect_bd_net -net slot_event_status_channel_halt [get_bd_pins event_status_channel_halt] [get_bd_pins xfft_0/event_status_channel_halt]
  connect_bd_net -net slot_event_tlast_missing [get_bd_pins event_tlast_missing] [get_bd_pins xfft_0/event_tlast_missing]
  connect_bd_net -net slot_event_tlast_unexpected [get_bd_pins event_tlast_unexpected] [get_bd_pins xfft_0/event_tlast_unexpected]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins aclk] [get_bd_pins axisMask_1/clk] [get_bd_pins axis_dwidth_converter_0/aclk] [get_bd_pins axis_dwidth_converter_1/aclk] [get_bd_pins axis_dwidth_converter_3/aclk] [get_bd_pins xfft_0/aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: FFTBlock
proc create_hier_cell_FFTBlock { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_FFTBlock() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS1


  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -type rst aresetn
  create_bd_pin -dir O -type intr event_data_in_channel_halt
  create_bd_pin -dir O -type intr event_data_out_channel_halt
  create_bd_pin -dir O -type intr event_frame_started
  create_bd_pin -dir O -type intr event_status_channel_halt
  create_bd_pin -dir O -type intr event_tlast_missing
  create_bd_pin -dir O -type intr event_tlast_unexpected

  # Create instance: axisMask_1, and set properties
  set axisMask_1 [ create_bd_cell -type ip -vlnv user.org:user:axisMask:1.0 axisMask_1 ]

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_0

  # Create instance: axis_dwidth_converter_1, and set properties
  set axis_dwidth_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_1 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_1

  # Create instance: axis_dwidth_converter_3, and set properties
  set axis_dwidth_converter_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_3 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.M_TDATA_NUM_BYTES {4} \
   CONFIG.S_TDATA_NUM_BYTES {16} \
 ] $axis_dwidth_converter_3

  # Create instance: xfft_0, and set properties
  set xfft_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_0 ]
  set_property -dict [ list \
   CONFIG.butterfly_type {use_xtremedsp_slices} \
   CONFIG.complex_mult_type {use_mults_performance} \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {5} \
   CONFIG.output_ordering {natural_order} \
   CONFIG.run_time_configurable_transform_length {true} \
   CONFIG.target_data_throughput {50} \
   CONFIG.transform_length {4096} \
 ] $xfft_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_dwidth_converter_1/S_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS] [get_bd_intf_pins xfft_0/M_AXIS_DATA]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins axis_dwidth_converter_1/M_AXIS] [get_bd_intf_pins xfft_0/S_AXIS_DATA]
  connect_bd_intf_net -intf_net axisMask_1_out_AXIS [get_bd_intf_pins axisMask_1/out_AXIS] [get_bd_intf_pins xfft_0/S_AXIS_CONFIG]
  connect_bd_intf_net -intf_net axis_dwidth_converter_3_M_AXIS [get_bd_intf_pins axisMask_1/in_AXIS] [get_bd_intf_pins axis_dwidth_converter_3/M_AXIS]
  connect_bd_intf_net -intf_net axis_interconnect_0_M01_AXIS [get_bd_intf_pins S_AXIS1] [get_bd_intf_pins axis_dwidth_converter_3/S_AXIS]

  # Create port connections
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins aresetn] [get_bd_pins axisMask_1/resetn] [get_bd_pins axis_dwidth_converter_0/aresetn] [get_bd_pins axis_dwidth_converter_1/aresetn] [get_bd_pins axis_dwidth_converter_3/aresetn]
  connect_bd_net -net slot_event_data_in_channel_halt [get_bd_pins event_data_in_channel_halt] [get_bd_pins xfft_0/event_data_in_channel_halt]
  connect_bd_net -net slot_event_data_out_channel_halt [get_bd_pins event_data_out_channel_halt] [get_bd_pins xfft_0/event_data_out_channel_halt]
  connect_bd_net -net slot_event_frame_started [get_bd_pins event_frame_started] [get_bd_pins xfft_0/event_frame_started]
  connect_bd_net -net slot_event_status_channel_halt [get_bd_pins event_status_channel_halt] [get_bd_pins xfft_0/event_status_channel_halt]
  connect_bd_net -net slot_event_tlast_missing [get_bd_pins event_tlast_missing] [get_bd_pins xfft_0/event_tlast_missing]
  connect_bd_net -net slot_event_tlast_unexpected [get_bd_pins event_tlast_unexpected] [get_bd_pins xfft_0/event_tlast_unexpected]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins aclk] [get_bd_pins axisMask_1/clk] [get_bd_pins axis_dwidth_converter_0/aclk] [get_bd_pins axis_dwidth_converter_1/aclk] [get_bd_pins axis_dwidth_converter_3/aclk] [get_bd_pins xfft_0/aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: FFTWithScatterGather
proc create_hier_cell_FFTWithScatterGather { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_FFTWithScatterGather() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 axis_conf0

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 axis_conf1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 axis_conf2

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 axis_conf3

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 axis_din

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 axis_dout


  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir O -from 3 -to 0 events_data_in_channel_halt_0
  create_bd_pin -dir O -from 3 -to 0 events_data_out_channel_halt_0
  create_bd_pin -dir O -from 3 -to 0 events_frame_started_0
  create_bd_pin -dir O -from 3 -to 0 events_status_channel_halt_0
  create_bd_pin -dir O -from 3 -to 0 events_tlast_missing_0
  create_bd_pin -dir O -from 3 -to 0 events_tlast_unexpected_0
  create_bd_pin -dir I -type rst resetn

  # Create instance: FFTBlock
  create_hier_cell_FFTBlock $hier_obj FFTBlock

  # Create instance: FFTBlock1
  create_hier_cell_FFTBlock1 $hier_obj FFTBlock1

  # Create instance: FFTBlock2
  create_hier_cell_FFTBlock2 $hier_obj FFTBlock2

  # Create instance: FFTBlock3
  create_hier_cell_FFTBlock3 $hier_obj FFTBlock3

  # Create instance: Fifo
  create_hier_cell_Fifo $hier_obj Fifo

  # Create instance: Fifo1
  create_hier_cell_Fifo1 $hier_obj Fifo1

  # Create instance: axis_interconnect_0, and set properties
  set axis_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.ARB_ON_TLAST {0} \
   CONFIG.M00_FIFO_DEPTH {0} \
   CONFIG.M00_HAS_REGSLICE {0} \
   CONFIG.M01_FIFO_DEPTH {0} \
   CONFIG.M01_HAS_REGSLICE {0} \
   CONFIG.M02_FIFO_DEPTH {0} \
   CONFIG.M04_FIFO_DEPTH {0} \
   CONFIG.M05_FIFO_DEPTH {0} \
   CONFIG.M06_FIFO_DEPTH {0} \
   CONFIG.M07_FIFO_DEPTH {0} \
   CONFIG.NUM_MI {4} \
 ] $axis_interconnect_0

  # Create instance: axis_interconnect_1, and set properties
  set axis_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_interconnect_1 ]
  set_property -dict [ list \
   CONFIG.ARB_ALGORITHM {3} \
   CONFIG.ARB_ON_MAX_XFERS {1024} \
   CONFIG.ARB_ON_TLAST {1} \
   CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {4} \
   CONFIG.S00_FIFO_DEPTH {0} \
   CONFIG.S00_HAS_REGSLICE {1} \
   CONFIG.S01_FIFO_DEPTH {0} \
   CONFIG.S01_HAS_REGSLICE {1} \
   CONFIG.S02_FIFO_DEPTH {0} \
   CONFIG.S02_HAS_REGSLICE {1} \
   CONFIG.S03_FIFO_DEPTH {0} \
   CONFIG.S03_HAS_REGSLICE {1} \
 ] $axis_interconnect_1

  # Create instance: channelSelectLogic_1, and set properties
  set channelSelectLogic_1 [ create_bd_cell -type ip -vlnv user.org:user:channelSelectLogic:1.0 channelSelectLogic_1 ]

  # Create instance: gather_0, and set properties
  set gather_0 [ create_bd_cell -type ip -vlnv xilinx:hls:gather:1.0 gather_0 ]

  # Create instance: scatter_0, and set properties
  set scatter_0 [ create_bd_cell -type ip -vlnv xilinx:hls:scatter:1.0 scatter_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net FFTBlock1_M_AXIS [get_bd_intf_pins FFTBlock1/M_AXIS] [get_bd_intf_pins Fifo/S_AXIS_1]
  connect_bd_intf_net -intf_net FFTBlock2_M_AXIS [get_bd_intf_pins FFTBlock2/M_AXIS] [get_bd_intf_pins Fifo/S_AXIS_2]
  connect_bd_intf_net -intf_net FFTBlock3_M_AXIS [get_bd_intf_pins FFTBlock3/M_AXIS] [get_bd_intf_pins Fifo/S_AXIS_3]
  connect_bd_intf_net -intf_net FFTBlock_M_AXIS [get_bd_intf_pins FFTBlock/M_AXIS] [get_bd_intf_pins Fifo/S_AXIS_0]
  connect_bd_intf_net -intf_net Fifo_M_AXIS_0 [get_bd_intf_pins Fifo/M_AXIS_0] [get_bd_intf_pins axis_interconnect_1/S00_AXIS]
  connect_bd_intf_net -intf_net Fifo_M_AXIS_1 [get_bd_intf_pins Fifo/M_AXIS_1] [get_bd_intf_pins axis_interconnect_1/S01_AXIS]
  connect_bd_intf_net -intf_net Fifo_M_AXIS_2 [get_bd_intf_pins Fifo/M_AXIS_2] [get_bd_intf_pins axis_interconnect_1/S02_AXIS]
  connect_bd_intf_net -intf_net Fifo_M_AXIS_3 [get_bd_intf_pins Fifo/M_AXIS_3] [get_bd_intf_pins axis_interconnect_1/S03_AXIS]
  connect_bd_intf_net -intf_net S_AXIS1_0_1 [get_bd_intf_pins axis_conf2] [get_bd_intf_pins FFTBlock3/S_AXIS1]
  connect_bd_intf_net -intf_net S_AXIS1_1_1 [get_bd_intf_pins axis_conf0] [get_bd_intf_pins FFTBlock/S_AXIS1]
  connect_bd_intf_net -intf_net S_AXIS1_2_1 [get_bd_intf_pins axis_conf1] [get_bd_intf_pins FFTBlock1/S_AXIS1]
  connect_bd_intf_net -intf_net S_AXIS1_3_1 [get_bd_intf_pins axis_conf3] [get_bd_intf_pins FFTBlock2/S_AXIS1]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins FFTBlock/S_AXIS] [get_bd_intf_pins Fifo1/M_AXIS_0]
  connect_bd_intf_net -intf_net S_AXIS_2 [get_bd_intf_pins FFTBlock1/S_AXIS] [get_bd_intf_pins Fifo1/M_AXIS_1]
  connect_bd_intf_net -intf_net S_AXIS_3 [get_bd_intf_pins FFTBlock2/S_AXIS] [get_bd_intf_pins Fifo1/M_AXIS_2]
  connect_bd_intf_net -intf_net S_AXIS_4 [get_bd_intf_pins FFTBlock3/S_AXIS] [get_bd_intf_pins Fifo1/M_AXIS_3]
  connect_bd_intf_net -intf_net axis_in_0_1 [get_bd_intf_pins axis_din] [get_bd_intf_pins scatter_0/axis_in]
  connect_bd_intf_net -intf_net axis_interconnect_0_M00_AXIS [get_bd_intf_pins Fifo1/S_AXIS_0] [get_bd_intf_pins axis_interconnect_0/M00_AXIS]
  connect_bd_intf_net -intf_net axis_interconnect_0_M01_AXIS [get_bd_intf_pins Fifo1/S_AXIS_1] [get_bd_intf_pins axis_interconnect_0/M01_AXIS]
  connect_bd_intf_net -intf_net axis_interconnect_0_M02_AXIS [get_bd_intf_pins Fifo1/S_AXIS_2] [get_bd_intf_pins axis_interconnect_0/M02_AXIS]
  connect_bd_intf_net -intf_net axis_interconnect_0_M03_AXIS [get_bd_intf_pins Fifo1/S_AXIS_3] [get_bd_intf_pins axis_interconnect_0/M03_AXIS]
  connect_bd_intf_net -intf_net axis_interconnect_1_M00_AXIS [get_bd_intf_pins axis_interconnect_1/M00_AXIS] [get_bd_intf_pins gather_0/axis_in]
  connect_bd_intf_net -intf_net gather_0_axis_out [get_bd_intf_pins axis_dout] [get_bd_intf_pins gather_0/axis_out]
  connect_bd_intf_net -intf_net scatter_0_axis_out [get_bd_intf_pins axis_interconnect_0/S00_AXIS] [get_bd_intf_pins scatter_0/axis_out]

  # Create port connections
  connect_bd_net -net FFTBlock1_event_data_in_channel_halt [get_bd_pins FFTBlock1/event_data_in_channel_halt] [get_bd_pins channelSelectLogic_1/event_data_in_channel_halt_1]
  connect_bd_net -net FFTBlock1_event_data_out_channel_halt [get_bd_pins FFTBlock1/event_data_out_channel_halt] [get_bd_pins channelSelectLogic_1/event_data_out_channel_halt_1]
  connect_bd_net -net FFTBlock1_event_frame_started [get_bd_pins FFTBlock1/event_frame_started] [get_bd_pins channelSelectLogic_1/event_frame_started_1]
  connect_bd_net -net FFTBlock1_event_status_channel_halt [get_bd_pins FFTBlock1/event_status_channel_halt] [get_bd_pins channelSelectLogic_1/event_status_channel_halt_1]
  connect_bd_net -net FFTBlock1_event_tlast_missing [get_bd_pins FFTBlock1/event_tlast_missing] [get_bd_pins channelSelectLogic_1/event_tlast_missing_1]
  connect_bd_net -net FFTBlock1_event_tlast_unexpected [get_bd_pins FFTBlock1/event_tlast_unexpected] [get_bd_pins channelSelectLogic_1/event_tlast_unexpected_1]
  connect_bd_net -net FFTBlock2_event_data_in_channel_halt [get_bd_pins FFTBlock2/event_data_in_channel_halt] [get_bd_pins channelSelectLogic_1/event_data_in_channel_halt_2]
  connect_bd_net -net FFTBlock2_event_data_out_channel_halt [get_bd_pins FFTBlock2/event_data_out_channel_halt] [get_bd_pins channelSelectLogic_1/event_data_out_channel_halt_2]
  connect_bd_net -net FFTBlock2_event_frame_started [get_bd_pins FFTBlock2/event_frame_started] [get_bd_pins channelSelectLogic_1/event_frame_started_2]
  connect_bd_net -net FFTBlock2_event_status_channel_halt [get_bd_pins FFTBlock2/event_status_channel_halt] [get_bd_pins channelSelectLogic_1/event_status_channel_halt_2]
  connect_bd_net -net FFTBlock2_event_tlast_missing [get_bd_pins FFTBlock2/event_tlast_missing] [get_bd_pins channelSelectLogic_1/event_tlast_missing_2]
  connect_bd_net -net FFTBlock2_event_tlast_unexpected [get_bd_pins FFTBlock2/event_tlast_unexpected] [get_bd_pins channelSelectLogic_1/event_tlast_unexpected_2]
  connect_bd_net -net FFTBlock3_event_data_in_channel_halt [get_bd_pins FFTBlock3/event_data_in_channel_halt] [get_bd_pins channelSelectLogic_1/event_data_in_channel_halt_3]
  connect_bd_net -net FFTBlock3_event_data_out_channel_halt [get_bd_pins FFTBlock3/event_data_out_channel_halt] [get_bd_pins channelSelectLogic_1/event_data_out_channel_halt_3]
  connect_bd_net -net FFTBlock3_event_frame_started [get_bd_pins FFTBlock3/event_frame_started] [get_bd_pins channelSelectLogic_1/event_frame_started_3]
  connect_bd_net -net FFTBlock3_event_status_channel_halt [get_bd_pins FFTBlock3/event_status_channel_halt] [get_bd_pins channelSelectLogic_1/event_status_channel_halt_3]
  connect_bd_net -net FFTBlock3_event_tlast_missing [get_bd_pins FFTBlock3/event_tlast_missing] [get_bd_pins channelSelectLogic_1/event_tlast_missing_3]
  connect_bd_net -net FFTBlock3_event_tlast_unexpected [get_bd_pins FFTBlock3/event_tlast_unexpected] [get_bd_pins channelSelectLogic_1/event_tlast_unexpected_3]
  connect_bd_net -net FFTBlock_event_data_in_channel_halt [get_bd_pins FFTBlock/event_data_in_channel_halt] [get_bd_pins channelSelectLogic_1/event_data_in_channel_halt_0]
  connect_bd_net -net FFTBlock_event_data_out_channel_halt [get_bd_pins FFTBlock/event_data_out_channel_halt] [get_bd_pins channelSelectLogic_1/event_data_out_channel_halt_0]
  connect_bd_net -net FFTBlock_event_frame_started [get_bd_pins FFTBlock/event_frame_started] [get_bd_pins channelSelectLogic_1/event_frame_started_0]
  connect_bd_net -net FFTBlock_event_status_channel_halt [get_bd_pins FFTBlock/event_status_channel_halt] [get_bd_pins channelSelectLogic_1/event_status_channel_halt_0]
  connect_bd_net -net FFTBlock_event_tlast_missing [get_bd_pins FFTBlock/event_tlast_missing] [get_bd_pins channelSelectLogic_1/event_tlast_missing_0]
  connect_bd_net -net FFTBlock_event_tlast_unexpected [get_bd_pins FFTBlock/event_tlast_unexpected] [get_bd_pins channelSelectLogic_1/event_tlast_unexpected_0]
  connect_bd_net -net ap_clk_0_1 [get_bd_pins clk] [get_bd_pins FFTBlock/aclk] [get_bd_pins FFTBlock1/aclk] [get_bd_pins FFTBlock2/aclk] [get_bd_pins FFTBlock3/aclk] [get_bd_pins Fifo/s_axis_aclk_0] [get_bd_pins Fifo1/s_axis_aclk_0] [get_bd_pins axis_interconnect_0/ACLK] [get_bd_pins axis_interconnect_0/M00_AXIS_ACLK] [get_bd_pins axis_interconnect_0/M01_AXIS_ACLK] [get_bd_pins axis_interconnect_0/M02_AXIS_ACLK] [get_bd_pins axis_interconnect_0/M03_AXIS_ACLK] [get_bd_pins axis_interconnect_0/S00_AXIS_ACLK] [get_bd_pins axis_interconnect_1/ACLK] [get_bd_pins axis_interconnect_1/M00_AXIS_ACLK] [get_bd_pins axis_interconnect_1/S00_AXIS_ACLK] [get_bd_pins axis_interconnect_1/S01_AXIS_ACLK] [get_bd_pins axis_interconnect_1/S02_AXIS_ACLK] [get_bd_pins axis_interconnect_1/S03_AXIS_ACLK] [get_bd_pins channelSelectLogic_1/clk] [get_bd_pins gather_0/ap_clk] [get_bd_pins scatter_0/ap_clk]
  connect_bd_net -net ap_rst_n_0_1 [get_bd_pins resetn] [get_bd_pins FFTBlock/aresetn] [get_bd_pins FFTBlock1/aresetn] [get_bd_pins FFTBlock2/aresetn] [get_bd_pins FFTBlock3/aresetn] [get_bd_pins Fifo/s_axis_aresetn_0] [get_bd_pins Fifo1/s_axis_aresetn_0] [get_bd_pins axis_interconnect_0/ARESETN] [get_bd_pins axis_interconnect_0/M00_AXIS_ARESETN] [get_bd_pins axis_interconnect_0/M01_AXIS_ARESETN] [get_bd_pins axis_interconnect_0/M02_AXIS_ARESETN] [get_bd_pins axis_interconnect_0/M03_AXIS_ARESETN] [get_bd_pins axis_interconnect_0/S00_AXIS_ARESETN] [get_bd_pins axis_interconnect_1/ARESETN] [get_bd_pins axis_interconnect_1/M00_AXIS_ARESETN] [get_bd_pins axis_interconnect_1/S00_AXIS_ARESETN] [get_bd_pins axis_interconnect_1/S01_AXIS_ARESETN] [get_bd_pins axis_interconnect_1/S02_AXIS_ARESETN] [get_bd_pins axis_interconnect_1/S03_AXIS_ARESETN] [get_bd_pins channelSelectLogic_1/resetn] [get_bd_pins gather_0/ap_rst_n] [get_bd_pins scatter_0/ap_rst_n]
  connect_bd_net -net channelSelectLogic_1_channelSellect_V_full_n [get_bd_pins channelSelectLogic_1/channelSellect_V_full_n] [get_bd_pins gather_0/channelSelect_V_full_n]
  connect_bd_net -net channelSelectLogic_1_events_data_in_channel_halt [get_bd_pins events_data_in_channel_halt_0] [get_bd_pins channelSelectLogic_1/events_data_in_channel_halt]
  connect_bd_net -net channelSelectLogic_1_events_data_out_channel_halt [get_bd_pins events_data_out_channel_halt_0] [get_bd_pins channelSelectLogic_1/events_data_out_channel_halt]
  connect_bd_net -net channelSelectLogic_1_events_frame_started [get_bd_pins events_frame_started_0] [get_bd_pins channelSelectLogic_1/events_frame_started]
  connect_bd_net -net channelSelectLogic_1_events_status_channel_halt [get_bd_pins events_status_channel_halt_0] [get_bd_pins channelSelectLogic_1/events_status_channel_halt]
  connect_bd_net -net channelSelectLogic_1_events_tlast_missing [get_bd_pins events_tlast_missing_0] [get_bd_pins channelSelectLogic_1/events_tlast_missing]
  connect_bd_net -net channelSelectLogic_1_events_tlast_unexpected [get_bd_pins events_tlast_unexpected_0] [get_bd_pins channelSelectLogic_1/events_tlast_unexpected]
  connect_bd_net -net gather_0_channelSelect_V_din [get_bd_pins channelSelectLogic_1/channelSellect_V_din] [get_bd_pins gather_0/channelSelect_V_din]
  connect_bd_net -net gather_0_channelSelect_V_write [get_bd_pins channelSelectLogic_1/channelSellect_V_write] [get_bd_pins gather_0/channelSelect_V_write]

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
   CONFIG.EN_TID4_AXIS_OUTPUT {true} \
 ] $AccelConfig_0

  # Create instance: FFTWithScatterGather
  create_hier_cell_FFTWithScatterGather [current_bd_instance .] FFTWithScatterGather

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
  connect_bd_intf_net -intf_net AccelConfig_0_tid1_axis [get_bd_intf_pins AccelConfig_0/tid1_axis] [get_bd_intf_pins FFTWithScatterGather/axis_conf0]
  connect_bd_intf_net -intf_net AccelConfig_0_tid2_axis [get_bd_intf_pins AccelConfig_0/tid2_axis] [get_bd_intf_pins FFTWithScatterGather/axis_conf1]
  connect_bd_intf_net -intf_net AccelConfig_0_tid3_axis [get_bd_intf_pins AccelConfig_0/tid3_axis] [get_bd_intf_pins FFTWithScatterGather/axis_conf2]
  connect_bd_intf_net -intf_net AccelConfig_0_tid4_axis [get_bd_intf_pins AccelConfig_0/tid4_axis] [get_bd_intf_pins FFTWithScatterGather/axis_conf3]
  connect_bd_intf_net -intf_net FFTWithScatterGather_axis_dout [get_bd_intf_pins FFTWithScatterGather/axis_dout] [get_bd_intf_pins rm_comm_box_0/s2mm_axis]
  connect_bd_intf_net -intf_net S_AXI_CTRL_1 [get_bd_intf_ports S_AXI_CTRL] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axis_din_1 [get_bd_intf_pins AccelConfig_0/tid0_axis] [get_bd_intf_pins FFTWithScatterGather/axis_din]
  connect_bd_intf_net -intf_net rm_comm_box_0_m_axi_gmem [get_bd_intf_ports M_AXI_GMEM] [get_bd_intf_pins rm_comm_box_0/m_axi_gmem]
  connect_bd_intf_net -intf_net rm_comm_box_0_mm2s_axis [get_bd_intf_pins AccelConfig_0/axis_in] [get_bd_intf_pins rm_comm_box_0/mm2s_axis]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins rm_comm_box_0/s_axi_control] [get_bd_intf_pins smartconnect_0/M00_AXI]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net clk_3 [get_bd_ports clk] [get_bd_pins AccelConfig_0/clk] [get_bd_pins FFTWithScatterGather/clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins rm_comm_box_0/clk] [get_bd_pins smartconnect_0/aclk]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins AccelConfig_0/resetn] [get_bd_pins FFTWithScatterGather/resetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins rm_comm_box_0/resetn]
  connect_bd_net -net rm_comm_box_0_interrupt_mm2s [get_bd_pins rm_comm_box_0/interrupt_mm2s] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net rm_comm_box_0_interrupt_s2mm [get_bd_pins rm_comm_box_0/interrupt_s2mm] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net static_shell_rp2_resetn [get_bd_ports resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in]
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
# End of cr_bd_FFT_4channel()
