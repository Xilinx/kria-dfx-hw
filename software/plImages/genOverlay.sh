DTC="../petalinux/xilinx-k26-starterkit-2022.1/images/linux/sdk/sysroots/x86_64-petalinux-linux/usr/bin/dtc"
${DTC} -I dts -O dtb -o pl.dtbo -@ pl.dtsi
${DTC} -I dtb -O dts -o pl.dtso -@ pl.dtbo
