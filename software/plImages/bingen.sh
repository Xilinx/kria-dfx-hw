#Update Bootgen path
Bootgen=${VITIS_PATH}/2022.1/bin/bootgen

${Bootgen} -image opendfx_shell_wrapper.bif  -arch zynqmp -process_bitstream bin

${Bootgen} -image opendfx_shell_i_RP_0_aes128encdec.bif   -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_0_aes192encdec.bif   -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_0_FFT4.bif           -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_0_FIR_compiler.bif   -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_1_aes128encdec.bif   -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_1_aes192encdec.bif   -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_1_FFT4.bif           -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_1_FIR_compiler.bif   -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_2_aes128encdec.bif   -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_2_aes192encdec.bif   -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_2_FFT4.bif           -arch zynqmp -process_bitstream bin
${Bootgen} -image opendfx_shell_i_RP_2_FIR_compiler.bif   -arch zynqmp -process_bitstream bin

