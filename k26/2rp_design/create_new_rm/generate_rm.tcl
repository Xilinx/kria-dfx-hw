# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
#
#This script uses abstract shells to create RM partial bit files.
#The abstract shells were created from the shell by using the following command for eacg RP.
#write_abstract_shell -force -cell opendfx_shell_i/RP_0 ./abstract_shell_RP_0.dcp
#write_abstract_shell -force -cell opendfx_shell_i/RP_1 ./abstract_shell_RP_1.dcp

proc generate_rm { arg1 { arg2 RP_0 }} {
  set designName $arg1
  set targetRP $arg2

  if { $designName eq "-help" } {
    puts "Usage:\ngenerate_rm <designName> <targetRP>.\ntargetRP can be RP_0 or RP_1"
    return
  }
  if { $targetRP ne "RP_0" && $targetRP ne "RP_1" } {
      puts "Allowed values for targetRP is RP_0, RP_1."
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

  set slot0_accel_json "{\n  \"AccelHandshakeType\": \"streamDataFromTrg\",\n  \"accel_devices\": \[\n    {\n      \"dev_name\": \"80000000.AccelConfig\",\n      \"reg_base\": \"\",\n      \"reg_size\": \"65536\"\n    },\n    {\n      \"dev_name\": \"81000000.rm_comm_box\",\n      \"reg_base\": \"\",\n      \"reg_size\": \"\"\n    }\n  \],\n  \"accel_metadata\": {},\n  \"accel_type\": \"SIHA_PL_DFX\"\n}"

  set slot0_dtsi "\/*\n * Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.\n * SPDX-License-Identifier: MIT\n */\n\n\/dts-v1\/;\n\/plugin\/;\n\/ {\n	fragment@0 {\n		target = <&fpga_PR0>;\n    	__overlay__ {\n		firmware-name = \"opendfx_shell_i_RP_0_newRM_partial.bit.bin\";\n		partial-fpga-config ;\n		};\n	};\n\n\n};"


  set slot1_accel_json "{\n  \"AccelHandshakeType\": \"streamDataFromTrg\",\n  \"accel_devices\": \[\n    {\n      \"dev_name\": \"82000000.AccelConfig\",\n      \"reg_base\": \"\",\n      \"reg_size\": \"65536\"\n    },\n    {\n      \"dev_name\": \"83000000.rm_comm_box\",\n      \"reg_base\": \"\",\n      \"reg_size\": \"\"\n    }\n  \],\n  \"accel_metadata\": {},\n  \"accel_type\": \"SIHA_PL_DFX\"\n}"

  set slot1_dtsi "\/*\n * Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.\n * SPDX-License-Identifier: MIT\n */\n\n\/dts-v1\/;\n\/plugin\/;\n\/ {\n	fragment@0 {\n		target = <&fpga_PR1>;\n    	__overlay__ {\n		firmware-name = \"opendfx_shell_i_RP_1_newRM_partial.bit.bin\";\n		partial-fpga-config ;\n		};\n	};\n\n\n};"

  set flag [file exists "./output_files"]
  if { !$flag } {
    exec mkdir ./output_files
  }

  set flag [file exists "./output_files/${designName}"]
  if { !$flag } {
    exec mkdir "./output_files/${designName}"
  }

  if { ${targetRP} eq "RP_0" } {
    set flag [file exists "./output_files/${designName}/${designName}_slot0"]
    if { !$flag } {
      exec mkdir "./output_files/${designName}/${designName}_slot0"
      exec touch ./output_files/${designName}/${designName}_slot0/accel.json
      set filename "./output_files/${designName}/${designName}_slot0/accel.json"
      set fileId [open $filename "w"]
      puts $fileId $slot0_accel_json
      close $fileId
      exec touch ./output_files/${designName}/${designName}_slot0/opendfx_shell_i_RP_0_${designName}_partial.dtsi
      set filename "./output_files/${designName}/${designName}_slot0/opendfx_shell_i_RP_0_${designName}_partial.dtsi"
      set fileId [open $filename "w"]
      puts $fileId $slot0_dtsi
      close $fileId
      set replace [format {s/newRM/%s/} ${designName}]
      exec /bin/sed -i $replace ./output_files/${designName}/${designName}_slot0/opendfx_shell_i_RP_0_${designName}_partial.dtsi
    }
  }

  if { ${targetRP} eq "RP_1" } {
    set flag [file exists "./output_files/${designName}/${designName}_slot1"]
    if { !$flag } {
      exec mkdir "./output_files/${designName}/${designName}_slot1"
      exec touch ./output_files/${designName}/${designName}_slot1/accel.json
      set filename "./output_files/${designName}/${designName}_slot1/accel.json"
      set fileId [open $filename "w"]
      puts $fileId $slot1_accel_json
      close $fileId
      exec touch ./output_files/${designName}/${designName}_slot1/opendfx_shell_i_RP_1_${designName}_partial.dtsi
      set filename "./output_files/${designName}/${designName}_slot1/opendfx_shell_i_RP_1_${designName}_partial.dtsi"
      set fileId [open $filename "w"]
      puts $fileId $slot1_dtsi
      close $fileId
      set replace [format {s/newRM/%s/} ${designName}]
      exec /bin/sed -i $replace ./output_files/${designName}/${designName}_slot1/opendfx_shell_i_RP_1_${designName}_partial.dtsi
    }
  }

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
  if { ${targetRP} eq "RP_0" } {
    write_bitstream -force -cell $x ./output_files/${designName}/${designName}_slot0/${rmBit}
  }
  if { ${targetRP} eq "RP_1" } {
    write_bitstream -force -cell $x ./output_files/${designName}/${designName}_slot1/${rmBit}
  }
  close_project
}
