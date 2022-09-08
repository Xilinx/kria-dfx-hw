#Vitis Path should point to the zynqmp_utils.tcl file - ${VITIS_PATH}/2022.1/scripts/vitis/util/zynqmp_utils.tcl
variable VITIS_PATH "Add vitis tools path to zynqmp_utils.tcl" 

variable ROOT      "."
variable IMPLDIR   "${ROOT}/../../k26/2rp_design/project_1/project_1.runs/"
variable WORKSPACE_AES128 "${ROOT}/workspace_AES128"
variable WORKSPACE_AES192 "${ROOT}/workspace_AES192"
variable WORKSPACE_FIR "${ROOT}/workspace_FIR"
variable WORKSPACE_FFT "${ROOT}/workspace_FFT"

variable DATA      "${ROOT}/data"
variable BOOT      "/opendfx_shell_wrapper_platform_0/export/opendfx_shell_wrapper_platform_0/sw/opendfx_shell_wrapper_platform_0/boot"
variable PMUFW     "${WORKSPACE_<RM_NAME>}/${BOOT}/pmufw.elf"
variable FSBL      "${WORKSPACE_<RM_NAME>}/${BOOT}/fsbl.elf"

variable SHELLBASE  "${IMPLDIR}/impl_1/opendfx_shell_wrapper.bit"

variable AES128_0	"${IMPLDIR}/child_1_impl_1/opendfx_shell_i_RP_0_AES128_inst_1_partial.bit"
variable AES128_1	"${IMPLDIR}/child_1_impl_1/opendfx_shell_i_RP_1_AES128_inst_0_partial.bit"
variable AES128_ELF	"${WORKSPACE_AES128}/AES128/Debug/AES128.elf"
variable AES128_IN_DATA		"${DATA}/AES128_in_data.bin"
variable AES128_OUT_DATA	"${DATA}/AES128_out_data.bin"

variable AES192_0	"${IMPLDIR}/child_2_impl_1/opendfx_shell_i_RP_0_AES192_inst_1_partial.bit"
variable AES192_1	"${IMPLDIR}/child_2_impl_1/opendfx_shell_i_RP_1_AES192_inst_0_partial.bit"
variable AES192_ELF	"${WORKSPACE_AES192}/AES192/Debug/AES192.elf"
variable AES192_IN_DATA		"${DATA}/AES192_in_data.bin"
variable AES192_OUT_DATA	"${DATA}/AES192_out_data.bin"

variable FFT_0		"${IMPLDIR}/child_4_impl_1/opendfx_shell_i_RP_0_FFT_4channel_inst_1_partial.bit"
variable FFT_1		"${IMPLDIR}/child_4_impl_1/opendfx_shell_i_RP_1_FFT_4channel_inst_0_partial.bit"
variable FFT_ELF	"${WORKSPACE_FFT}/FFT/Debug/FFT.elf"
variable FFT_IN_DATA		"${DATA}/FFT_in_data.bin"
variable FFT_OUT_DATA		"${DATA}/FFT_out_data.bin"

variable FIR_0		"${IMPLDIR}/impl_1/opendfx_shell_i_RP_0_FIR_compiler_inst_0_partial.bit"
variable FIR_1		"${IMPLDIR}/impl_1/opendfx_shell_i_RP_1_FIR_compiler_inst_1_partial.bit"
variable FIR_ELF	"${WORKSPACE_FIR}/FIR/Debug/FIR.elf"
variable FIR_IN_DATA		"${DATA}/FIR_in_data.bin"
variable FIR_OUT_DATA		"${DATA}/FIR_out_data.bin"
