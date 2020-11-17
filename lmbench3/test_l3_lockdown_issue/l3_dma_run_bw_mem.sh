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

cal() {
	val=`echo $1*1024*1024|bc`
	echo ${val%.*}
}

cpu=$1
size=$2
while :; do
	taskset -c $cpu bw_mem -P 1 $size rd >/dev/null 2>&1 
	#usleep 1; taskset -p $!
done
