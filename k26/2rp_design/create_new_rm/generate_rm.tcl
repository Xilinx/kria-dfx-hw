# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
##Creation of Abstract shell per RP
#open_checkpoint /everest/siv_bkup/vijc/git_repo/kria_dfx_hw/jul11/k26/abstract_shell/opendfx_shell_wrapper_routed.dcp
#write_abstract_shell -force -cell opendfx_shell_i/RP_0 ./abstract_shell_RP_0.dcp
#write_abstract_shell -force -cell opendfx_shell_i/RP_1 ./abstract_shell_RP_1.dcp

proc generate_rm { arg1 { arg2 RP_0 }} {
  set designName $arg1
  set targetRP $arg2
  if { $designName eq "-help" } {
    puts "Usage generate_rm <designName> <TargetRP>"
    return
  }
    if { $targetRP ne "RP_0" && $targetRP ne "RP_1" && $targetRP ne "RP_2" } {
        puts " Enter either RP_0 or RP_1 as targetRP"
    return
  }

    set abs_shell ""
    set rmName ""
    set rmDCP ""
    set rmBit ""
    append rmName $designName "_" $targetRP
    append rmDCP $designName "_" $targetRP ".dcp"
    append rmBit "opendfx_shell_i_" $targetRP "_" $designName "_partial.bit"
    append abs_shell "abstract_shell_" $targetRP ".dcp"

  set x opendfx_shell_i/${targetRP}

  #Read Abstract shell DCP
   add_files ./abstract_shells/${abs_shell}

  #Read RM DCP
  add_files ./project_1/project_1.srcs/sources_1/bd/${rmName}/${rmDCP}

  set_property SCOPED_TO_CELLS $x [get_files ./project_1/project_1.srcs/sources_1/bd/${rmName}/${rmDCP} ]

  link_design -mode default -reconfig_partitions $x -part xck26-sfvc784-2LV-c -top opendfx_shell_wrapper

  opt_design
  place_design
  route_design

  #write_checkpoint -force $routedDCP
  write_bitstream -force -cell $x ./output_files/${rmBit}
  #close_design
}
