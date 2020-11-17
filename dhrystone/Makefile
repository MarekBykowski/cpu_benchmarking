export PATH:=/tools/AGRreleases/yocto/morty/2018_01_26/axxia-arm64-x9/tools/sysroots/x86_64-axxiasdk-linux/usr/bin/aarch64-axxia-linux:$(PATH)
CROSS_COMPILE=aarch64-axxia-linux-
SYSROOT=/tools/AGRreleases/yocto/morty/2018_01_26/axxia-arm64-x9/tools/sysroots/aarch64-axxia-linux
ARCH=arm64
CC=gcc

all: build

.PHONY: build clean
build:
	$(CROSS_COMPILE)$(CC)  -O2  --sysroot=$(SYSROOT) -march=armv8-a -mcpu=cortex-a53 -funroll-all-loops -DHZ=100 dhry_1.c dhry_2.c -o arm_dhrystone_O2
	$(CROSS_COMPILE)$(CC)  -O3  --sysroot=$(SYSROOT) -march=armv8-a -mcpu=cortex-a53 -funroll-all-loops -DHZ=100 dhry_1.c dhry_2.c -o arm_dhrystone_O3

clean:
	rm -rf arm_dhrystone_O2 arm_dhrystone_O3
