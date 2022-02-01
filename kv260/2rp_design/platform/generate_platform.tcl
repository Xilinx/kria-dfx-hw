# Parsing options
set options [dict create {*}$argv]
set HW_XSA [dict get $options HW_XSA]
set platform_out [dict get $options platform_out]

platform create -name {opendfx_kv260} -desc " A 2rp dfx platform targeting KV260 exported to vitis" -hw $HW_XSA -out $platform_out -no-boot-bsp
domain create -name xrt -proc psv_cortexa72 -os linux 
platform generate
