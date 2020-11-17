#!/bin/bash
#set -xv

# bw_mem (rd, wr, cp)

# SYNTAX: bw_mem -P <parallelism> size rd|wr|rdwr|cp|fwr|frd|bzero|bcopy

# Where,
# P - Always set to 1. Manually we create multiple copies on different cores using taskset command
# size - list of data sizes to be tested
# rd - Memory partial read bandwidth
# wr - Memory partial write bandwidth
# cp - unrolled partial bcopy unaligned
# frd - Memory read bandwidth
# fwr - Memory write bandwidth
# fcp - unrolled bcopy unaligned


multipleCopies=1
testModeList="wr"
coresList="32"
sizeList="360m"

# setup smons for elm memory channels
export PATH=.:/home/validation/al_common/util:$PATH

setup_smon elm0 5 7 
setup_smon elm1 5 7 
setup_smon elm2 5 7 
setup_smon elm3 5 7 

# set smon counter to divide by 128 else it wraps too fast
ncpWrite 0x167.0x00.0x00000300 0x47400001
ncpWrite 0x167.0x01.0x00000300 0x47400001
ncpWrite 0x167.0x02.0x00000300 0x47400001
ncpWrite 0x167.0x03.0x00000300 0x47400001

			disp_smon elm0
			disp_smon elm1 
			disp_smon elm2 
			disp_smon elm3 
			echo "\n post sample"
	sleep 2   # let warm up
                        disp_smon elm0 
                        disp_smon elm1 
                        disp_smon elm2 
                        disp_smon elm3 

exit 0
