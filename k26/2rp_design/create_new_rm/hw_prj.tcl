# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
set flag [file exists "./project_1/project_1.xpr"]
if { $flag } {
   open_project ./project_1/project_1.xpr
}  else {
   create_project project_1 project_1 -part xck26-sfvc784-2LV-c -force
   set repoPath {./../../ip_repo}
   set_property ip_repo_paths $repoPath  [current_project]
   update_ip_catalog
   set_param bd.enableDFX 1
   set_property board_part xilinx.com:k26c:part0:1.3 [current_project]
}

#source ./rm_templates/axis_rm_template.tcl
