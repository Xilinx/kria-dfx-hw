# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
# Parsing options
set options [dict create {*}$argv]
set HW_XSA [dict get $options HW_XSA]
set platform_out [dict get $options platform_out]

platform create -name {opendfx_shell_wrapper_platform_0} -desc " A 2rp dfx platform targeting K26 exported to vitis" -hw $HW_XSA -out $platform_out -no-boot-bsp
domain create -name xrt -proc psu_cortexa53 -os linux 
platform generate
