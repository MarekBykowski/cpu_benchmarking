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


multipleCopies=1
testModeList="rd wr cp"
coresList="1 2 3 4 8 12 16 24 32"
sizeList="1k 2k 4k 8k 16k 32k 64k 128k 256k 512k 1m 2m 4m 8m 16m 32m"


for testMode in $testModeList;
do
	for size in $sizeList;
	do
		for cores in $coresList;
		do
			echo -e "\nRunning LMbench bw_mem_$testMode - "$size" size - "$cores" cores\n"
			
			coreCnt=0
			while [ $coreCnt -lt $cores ]
			do				
				taskset -c "$coreCnt" bw_mem -P $multipleCopies $size $testMode 2>&1 | tee ./results/bw_mem/bw_mem_"$testMode"_"$size"Size_"$cores"Core_core"$coreCnt".txt &
				coreCnt=`expr $coreCnt + 1`
			done; # all core instances
			
			wait
			echo -e "\nCompleted LMbench bw_mem_$testMode - "$size" size - "$cores" cores\n"
			echo -e "Waiting for few seconds to start the next test ........\n\n"
			sleep 2
		done; # all cores
	done; # all data sizes
done; # all test modes

echo -e "************* All tests completed! *************\n"
exit 0
