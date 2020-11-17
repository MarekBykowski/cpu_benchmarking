#!/bin/bash
#set -xv

source ./path_to_bins.sh

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
for ((size=1; size<=32; size++)); do
	#echo $size
	bw_mem -P 1 ${size}m rd
done
