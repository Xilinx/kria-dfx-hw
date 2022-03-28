CPU_ARCH=a53
all: refresh_hw linux bootimage sysroot gendtb
XSA_DIR ?= ../../k26/2rp_design/project_1/

refresh_hw:
	petalinux-config --get-hw-description=${XSA_DIR} --silentconfig

linux:
	petalinux-build

bootimage:
	@echo "BOOT image for base platforms"
	petalinux-package --wic --images-dir images/linux/ --bootfiles "ramdisk.cpio.gz.u-boot,boot.scr,Image,system.dtb,SMK*.dtb" --disk-name mmcblk1 
        #Disk Name-mmcblk1 for kv260 or sda for kr260

sysroot:
	petalinux-build --sdk
	petalinux-package --sysroot 

clean:
	petalinux-build -x distclean
	petalinux-build -f -x mrproper
	petalinux-build -x cleanall
	$(RM) -r images/linux/*

gendtb: 
	petalinux-build -b device-tree

