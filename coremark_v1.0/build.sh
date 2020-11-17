#!/bin/bash

export PATH=/tools/AGRreleases/yocto/morty/2018_01_26/axxia-arm64-x9/tools/sysroots/x86_64-axxiasdk-linux/usr/bin/aarch64-axxia-linux:$PATH
export CROSS_COMPILE=aarch64-axxia-linux-
export SYSROOT=/tools/AGRreleases/yocto/morty/2018_01_26/axxia-arm64-x9/tools/sysroots/aarch64-axxia-linux
export ARCH=arm64

source $(pwd)/$(dirname $0)/defines.sh

# With the target (eg.XLF) accessing a server over NFS it has no rights to create logfiles 
# so create them here and chmod so that we have access to write them from the target.
touch_logfile
remove_binaries

make clean 
for ((threads=${MIN_THREADS}; threads<=${MAX_THREADS}; threads++)); do
	#make PORT_DIR=arm_linux XCFLAGS="-DMULTITHREAD=$threads --save-temps" link
	if [[ $CPU_ISOLATION == true ]]; then
		make PORT_DIR=arm_linux XCFLAGS="-DMULTITHREAD=$threads -DMANAGE_AFFINITY_SINGLE_CPU=1" link
	else
		make PORT_DIR=arm_linux XCFLAGS="-DMULTITHREAD=$threads" link
	fi
	chmod 641 coremark.exe  
	cp coremark.exe ${BINARTIES_DIR}/coremark_$threads.exe --remove-destination
done
