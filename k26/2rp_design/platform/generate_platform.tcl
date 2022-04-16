# Parsing options
set options [dict create {*}$argv]
set HW_XSA [dict get $options HW_XSA]
set platform_out [dict get $options platform_out]

platform create -name {opendfx_k26_platform} -desc " A 2rp dfx platform targeting K26 exported to vitis" -hw $HW_XSA -out $platform_out -no-boot-bsp
domain create -name xrt -proc psu_cortexa53 -os linux 
platform generate
