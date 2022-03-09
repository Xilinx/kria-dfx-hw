#Update the path for bit and elf files. Given tcl has example of AES128
connect
source <vitis_path>/2022.1/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000

puts "\nLoading bit files ..."
fpga -no-revision-check -file <git_repo_directory>/k26/2rp_design/project_1/project_1.runs/impl_1/opendfx_shell_wrapper.bit
fpga -no-revision-check -file <git_repo_directory>/k26/2rp_design/project_1/project_1.runs/child_1_impl_1/opendfx_shell_i_RP_0_AES128_inst_0_partial.bit
fpga -no-revision-check -file <git_repo_directory>/k26/2rp_design/project_1/project_1.runs/child_1_impl_1/opendfx_shell_i_RP_1_AES128_inst_1_partial.bit

puts "done"
targets -set -nocase -filter {name =~"APU*"}
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow <vitis_workspace_folder>/opendfx_shell_wrapper/export/opendfx_shell_wrapper/sw/opendfx_shell_wrapper/boot/fsbl.elf

set bp_20_54_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_20_54_fsbl_bp

puts "Loading data files ..."
dow -data -force ./data/<RM name>_in_data.bin  0x02000000
dow -data -force ./data/<RM name>_out_data.bin 0x04000000

targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow <vitis_workspace_folder>/AES128/Debug/AES128.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
