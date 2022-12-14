# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
set XSA "opendfx_shell_wrapper"
#Add the XSA path 
set XSA_PATH "../../k26/2rp_design/project_1"
set SRC "./AES128"
set SRCM "./src"
set WS "workspace_AES128"
set SYSCFG "app_sysconfig"
set DOMAIN "app_domain"
set APP "AES128"
setws ${WS}
if [file exists ${WS}/${XSA}_platform_0] {
	puts "Platform exists."
		puts "Activating Platform ...."
		platform active ${XSA}_platform_0
} else {
	puts "Creating Platform ....."
		platform create -name ${XSA}_platform_0 -hw ${XSA_PATH}/${XSA}.xsa
}
platform report
domain list
if {![file exists ${WS}/${XSA}_platform_0/psu_cortexa53_0/${DOMAIN}]} {
	puts "Creating Domain ....."
		domain create -name ${DOMAIN} -os standalone -proc psu_cortexa53_0
		platform generate
} else {
	puts "Domain exists."
		domain active ${DOMAIN}
}
repo -libs

if {![file exists ${WS}/${APP}]} {
	puts "Creating APP ....."
		app create -name ${APP} -domain ${DOMAIN} -template "Empty Application(C)"
		importsources -name ${APP} -linker-script -path ${SRCM}
	importsources -name ${APP} -path ${SRC}
} else {
	puts "APP exists."

}
app build ${APP} 
