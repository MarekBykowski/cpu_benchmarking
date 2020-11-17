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
sizeList="
512k
1m
2m
3m
4m 
5m 
6m 
7m 
8m 
9m 
10m 
11m 
12m 
13m
14m
15m
16m
"
for size in $sizeList; do
	#echo $size
	#bw_mem -P 1 $size rd 2>&1 | tee ./4_ways_lock_results
	bw_mem -P 1 $size rd
done
#bw_mem -P 1 17m rd
#bw_mem -P 1 18m rd
