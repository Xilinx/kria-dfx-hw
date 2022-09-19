# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
#Update the path for variable VITIS_PATH in environment.tcl
connect
source ${VITIS_PATH}/2022.1/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000

puts "\nLoading bit files ..."
fpga -no-revision-check -file ${SHELLBASE}
fpga -no-revision-check -file ${FIR_0}
fpga -no-revision-check -file ${FIR_1}

puts "done"
targets -set -nocase -filter {name =~"APU*"}
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow ${FSBL}

set bp_20_54_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_20_54_fsbl_bp

puts "Loading data files ..."
dow -data -force ${FIR_IN_DATA}  0x02000000
dow -data -force ${FIR_OUT_DATA} 0x04000000

targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow ${FIR_ELF}
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
