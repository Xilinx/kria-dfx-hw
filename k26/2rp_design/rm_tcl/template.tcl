# Proc to create BD template
proc cr_bd_template { parentCell } {

  # CHANGE DESIGN NAME HERE
  set design_name template

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
  xilinx.com:ip:axi_fifo_mm_s:4.2\
  xilinx.com:ip:proc_sys_reset:5.0\
  user.org:user:rm_comm_box:1.0\
  xilinx.com:ip:smartconnect:1.0\
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
  set M_AXI_GMEM [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 -portmaps { \
   ARADDR { physical_name M_AXI_GMEM_araddr direction O left 48 right 0 } \
   ARBURST { physical_name M_AXI_GMEM_arburst direction O left 1 right 0 } \
   ARCACHE { physical_name M_AXI_GMEM_arcache direction O left 3 right 0 } \
   ARID { physical_name M_AXI_GMEM_arid direction O left 7 right 0 } \
   ARLEN { physical_name M_AXI_GMEM_arlen direction O left 7 right 0 } \
   ARLOCK { physical_name M_AXI_GMEM_arlock direction O left 1 right 0 } \
   ARPROT { physical_name M_AXI_GMEM_arprot direction O left 2 right 0 } \
   ARQOS { physical_name M_AXI_GMEM_arqos direction O left 3 right 0 } \
   ARREADY { physical_name M_AXI_GMEM_arready direction I } \
   ARREGION { physical_name M_AXI_GMEM_arregion direction O left 3 right 0 } \
   ARSIZE { physical_name M_AXI_GMEM_arsize direction O left 2 right 0 } \
   ARVALID { physical_name M_AXI_GMEM_arvalid direction O } \
   AWADDR { physical_name M_AXI_GMEM_awaddr direction O left 48 right 0 } \
   AWBURST { physical_name M_AXI_GMEM_awburst direction O left 1 right 0 } \
   AWCACHE { physical_name M_AXI_GMEM_awcache direction O left 3 right 0 } \
   AWID { physical_name M_AXI_GMEM_awid direction O left 7 right 0 } \
   AWLEN { physical_name M_AXI_GMEM_awlen direction O left 7 right 0 } \
   AWLOCK { physical_name M_AXI_GMEM_awlock direction O left 1 right 0 } \
   AWPROT { physical_name M_AXI_GMEM_awprot direction O left 2 right 0 } \
   AWQOS { physical_name M_AXI_GMEM_awqos direction O left 3 right 0 } \
   AWREADY { physical_name M_AXI_GMEM_awready direction I } \
   AWREGION { physical_name M_AXI_GMEM_awregion direction O left 3 right 0 } \
   AWSIZE { physical_name M_AXI_GMEM_awsize direction O left 2 right 0 } \
   AWVALID { physical_name M_AXI_GMEM_awvalid direction O } \
   BID { physical_name M_AXI_GMEM_bid direction I left 7 right 0 } \
   BREADY { physical_name M_AXI_GMEM_bready direction O } \
   BRESP { physical_name M_AXI_GMEM_bresp direction I left 1 right 0 } \
   BVALID { physical_name M_AXI_GMEM_bvalid direction I } \
   RDATA { physical_name M_AXI_GMEM_rdata direction I left 127 right 0 } \
   RID { physical_name M_AXI_GMEM_rid direction I left 7 right 0 } \
   RLAST { physical_name M_AXI_GMEM_rlast direction I } \
   RREADY { physical_name M_AXI_GMEM_rready direction O } \
   RRESP { physical_name M_AXI_GMEM_rresp direction I left 1 right 0 } \
   RVALID { physical_name M_AXI_GMEM_rvalid direction I } \
   WDATA { physical_name M_AXI_GMEM_wdata direction O left 127 right 0 } \
   WLAST { physical_name M_AXI_GMEM_wlast direction O } \
   WREADY { physical_name M_AXI_GMEM_wready direction I } \
   WSTRB { physical_name M_AXI_GMEM_wstrb direction O left 15 right 0 } \
   WVALID { physical_name M_AXI_GMEM_wvalid direction O } \
   } \
  M_AXI_GMEM ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {49} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {1} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {8} \
   CONFIG.INSERT_VIP {0} \
   CONFIG.MAX_BURST_LENGTH {256} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PHASE {0.0} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $M_AXI_GMEM
  set_property APERTURES {{0x0 2G} {0xC000_0000 512M} {0xFF00_0000 16M} {0x2_0000_0000 1G} {0x2_8000_0000 1G} {0x8_0000_0000 32G}} [get_bd_intf_ports M_AXI_GMEM]
  set_property HDL_ATTRIBUTE.LOCKED {TRUE} [get_bd_intf_ports M_AXI_GMEM]

  set S_AXI_CTRL [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 -portmaps { \
   ARADDR { physical_name S_AXI_CTRL_araddr direction I left 39 right 0 } \
   ARPROT { physical_name S_AXI_CTRL_arprot direction I left 2 right 0 } \
   ARREADY { physical_name S_AXI_CTRL_arready direction O } \
   ARVALID { physical_name S_AXI_CTRL_arvalid direction I } \
   AWADDR { physical_name S_AXI_CTRL_awaddr direction I left 39 right 0 } \
   AWPROT { physical_name S_AXI_CTRL_awprot direction I left 2 right 0 } \
   AWREADY { physical_name S_AXI_CTRL_awready direction O } \
   AWVALID { physical_name S_AXI_CTRL_awvalid direction I } \
   BREADY { physical_name S_AXI_CTRL_bready direction I } \
   BRESP { physical_name S_AXI_CTRL_bresp direction O left 1 right 0 } \
   BVALID { physical_name S_AXI_CTRL_bvalid direction O } \
   RDATA { physical_name S_AXI_CTRL_rdata direction O left 31 right 0 } \
   RREADY { physical_name S_AXI_CTRL_rready direction I } \
   RRESP { physical_name S_AXI_CTRL_rresp direction O left 1 right 0 } \
   RVALID { physical_name S_AXI_CTRL_rvalid direction O } \
   WDATA { physical_name S_AXI_CTRL_wdata direction I left 31 right 0 } \
   WREADY { physical_name S_AXI_CTRL_wready direction O } \
   WSTRB { physical_name S_AXI_CTRL_wstrb direction I left 3 right 0 } \
   WVALID { physical_name S_AXI_CTRL_wvalid direction I } \
   } \
  S_AXI_CTRL ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {40} \
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
   CONFIG.INSERT_VIP {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {8} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {8} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PHASE {0.0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $S_AXI_CTRL
  set_property APERTURES {{0x8000_0000 32M}} [get_bd_intf_ports S_AXI_CTRL]
  set_property HDL_ATTRIBUTE.LOCKED {TRUE} [get_bd_intf_ports S_AXI_CTRL]


  # Create ports
  set clk [ create_bd_port -dir I -type clk -freq_hz 249997498 clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M_AXI_GMEM:S_AXI_CTRL} \
   CONFIG.ASSOCIATED_CLKEN {s_sc_aclken} \
   CONFIG.CLK_DOMAIN {opendfx_shell_zynq_ultra_ps_e_0_0_pl_clk3} \
   CONFIG.FREQ_TOLERANCE_HZ {0} \
   CONFIG.INSERT_VIP {0} \
   CONFIG.PHASE {0.0} \
 ] $clk
  set interrupt [ create_bd_port -dir O -from 0 -to 0 -type intr interrupt ]
  set_property -dict [ list \
   CONFIG.PortWidth {1} \
   CONFIG.SENSITIVITY {LEVEL_HIGH} \
 ] $interrupt
  set resetn [ create_bd_port -dir I -type rst resetn ]
  set_property -dict [ list \
   CONFIG.INSERT_VIP {0} \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $resetn

  # Create instance: AccelConfig_0, and set properties
  set AccelConfig_0 [ create_bd_cell -type ip -vlnv user.org:user:AccelConfig:1.0 AccelConfig_0 ]
  set_property -dict [ list \
   CONFIG.HAS_TID2_AXIS_OUTPUT {false} \
   CONFIG.NUM_SCALAR_PORTS {1} \
   CONFIG.SCALAR1_WIDTH {128} \
 ] $AccelConfig_0

  # Create instance: Accel_placeholder, and set properties
  set Accel_placeholder [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_fifo_mm_s:4.2 Accel_placeholder ]
  set_property -dict [ list \
   CONFIG.C_USE_TX_CTRL {0} \
   CONFIG.C_USE_TX_DATA {1} \
 ] $Accel_placeholder

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: rm_comm_box_0, and set properties
  set rm_comm_box_0 [ create_bd_cell -type ip -vlnv user.org:user:rm_comm_box:1.0 rm_comm_box_0 ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {3} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net AccelConfig_0_tid0_axis [get_bd_intf_pins AccelConfig_0/tid0_axis] [get_bd_intf_pins Accel_placeholder/AXI_STR_RXD]
  connect_bd_intf_net -intf_net S_AXI_CTRL_1 [get_bd_intf_ports S_AXI_CTRL] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_fifo_mm_s_0_AXI_STR_TXD [get_bd_intf_pins Accel_placeholder/AXI_STR_TXD] [get_bd_intf_pins rm_comm_box_0/s2mm_axis]
  connect_bd_intf_net -intf_net rm_comm_box_0_m_axi_gmem [get_bd_intf_ports M_AXI_GMEM] [get_bd_intf_pins rm_comm_box_0/m_axi_gmem]
  connect_bd_intf_net -intf_net rm_comm_box_0_mm2s_axis [get_bd_intf_pins AccelConfig_0/axis_in] [get_bd_intf_pins rm_comm_box_0/mm2s_axis]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins AccelConfig_0/s_axi_ctrl] [get_bd_intf_pins smartconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M01_AXI [get_bd_intf_pins rm_comm_box_0/s_axi_control] [get_bd_intf_pins smartconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M02_AXI [get_bd_intf_pins Accel_placeholder/S_AXI] [get_bd_intf_pins smartconnect_0/M02_AXI]

  # Create port connections
  connect_bd_net -net AccelConfig_0_interrupt [get_bd_ports interrupt] [get_bd_pins AccelConfig_0/interrupt]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins AccelConfig_0/clk] [get_bd_pins Accel_placeholder/s_axi_aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins rm_comm_box_0/clk] [get_bd_pins smartconnect_0/aclk]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins AccelConfig_0/resetn] [get_bd_pins Accel_placeholder/s_axi_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins rm_comm_box_0/resetn]
  connect_bd_net -net resetn_1 [get_bd_ports resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net rm_comm_box_0_interrupt_mm2s [get_bd_pins AccelConfig_0/mm2sDone] [get_bd_pins rm_comm_box_0/interrupt_mm2s]
  connect_bd_net -net rm_comm_box_0_interrupt_s2mm [get_bd_pins AccelConfig_0/s2mmDone] [get_bd_pins rm_comm_box_0/interrupt_s2mm]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins AccelConfig_0/AccelIdle] [get_bd_pins AccelConfig_0/AccelReady] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces rm_comm_box_0/m_axi_gmem] [get_bd_addr_segs M_AXI_GMEM/Reg] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces rm_comm_box_0/m_axi_gmem] [get_bd_addr_segs M_AXI_GMEM/Reg_1] -force
  assign_bd_address -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces rm_comm_box_0/m_axi_gmem] [get_bd_addr_segs M_AXI_GMEM/Reg_2] -force
  assign_bd_address -offset 0x000200000000 -range 0x40000000 -target_address_space [get_bd_addr_spaces rm_comm_box_0/m_axi_gmem] [get_bd_addr_segs M_AXI_GMEM/Reg_3] -force
  assign_bd_address -offset 0x000280000000 -range 0x40000000 -target_address_space [get_bd_addr_spaces rm_comm_box_0/m_axi_gmem] [get_bd_addr_segs M_AXI_GMEM/Reg_4] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces rm_comm_box_0/m_axi_gmem] [get_bd_addr_segs M_AXI_GMEM/Reg_5] -force
  assign_bd_address -offset 0x80000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces S_AXI_CTRL] [get_bd_addr_segs AccelConfig_0/s_axi_ctrl/reg0] -force
  assign_bd_address -offset 0x81010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces S_AXI_CTRL] [get_bd_addr_segs Accel_placeholder/S_AXI/Mem0] -force
  assign_bd_address -offset 0x81000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces S_AXI_CTRL] [get_bd_addr_segs rm_comm_box_0/s_axi_control/reg0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_template()