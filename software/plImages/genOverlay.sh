# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT

#Update dtc path 
DTC="$PETALINUX/components/yocto/buildtools/sysroots/x86_64-petalinux-linux/usr/bin/dtc"
${DTC} -I dts -O dtb -o pl.dtbo -@ pl.dtsi
