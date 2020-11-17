Make sure cross compiler is in PATH
e.g., export PATH=$PATH:<location of compiler>

To build CoreMark for arm linux system type following command at prompt:
# make PORT_DIR=arm_linux

To run multiple threads update -DMULTITHREAD=x (x is number of threads e.g. 1 - 16) in arm_linux/core_portme.mak
