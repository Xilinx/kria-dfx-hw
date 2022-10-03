# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT

BASEDIR="./"
#Update Bootgen path
Bootgen=<Vitis_path>/2022.1/bin/bootgen 

shell=opendfx_shell_wrapper

rms=(opendfx_shell_i_RP_0_greybox_partial
	opendfx_shell_i_RP_1_greybox_partial
	opendfx_shell_i_RP_0_AES128_inst_1_partial
	opendfx_shell_i_RP_1_AES128_inst_0_partial
	opendfx_shell_i_RP_0_DPU_512_inst_1_partial
	opendfx_shell_i_RP_1_DPU_512_inst_0_partial
	opendfx_shell_i_RP_0_FFT_4channel_inst_1_partial
	opendfx_shell_i_RP_1_FFT_4channel_inst_0_partial
	opendfx_shell_i_RP_0_FIR_compiler_inst_1_partial
	opendfx_shell_i_RP_1_FIR_compiler_inst_0_partial
	opendfx_shell_i_RP_0_pp_pipeline_inst_1_partial
	opendfx_shell_i_RP_1_pp_pipeline_inst_0_partial
	opendfx_shell_i_RP_0_AES192_inst_0_partial
	opendfx_shell_i_RP_1_AES192_inst_1_partial)

 
bingen(){
${Bootgen} -image ${1}.bif  -arch zynqmp -process_bitstream bin
}

bifgen(){
cat <<EOT > ${1}.bif
all:
{
        [destination_device = pl] ${1}.bit
}
EOT
}

rm -rf *.bin *.bif *.bit *.xsa
cp ../../k26/2rp_design/project_1/${shell}.xsa ./
cp ../../k26/2rp_design/project_1/project_1.runs/impl_1/${shell}.bit ./
cp ../../k26/2rp_design/project_1/project_1.runs/*impl_1/*partial.bit ./
bifgen ${shell}
bingen ${shell}

for mod in "${rms[@]}"
do
	bifgen ${mod}
	bingen ${mod}
done
