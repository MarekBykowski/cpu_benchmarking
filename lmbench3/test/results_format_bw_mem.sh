#!/bin/bash
#set -xv

source ./path_to_bins.sh

RESULTS=results2

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

resultFile=final_result_bw_mem.csv

rm -f "$resultFile"
touch "$resultFile"
chmod 777 "$resultFile"

date 2>&1 | tee -a "$resultFile"

printf "Test,Cores,megabytes_per_second\n" >> "$resultFile"
printf ",,1k,,,2k,,,4k,,,8k,,,16k,,,32k,,,64k,,,128k,,,256k,,,512k,,,1m,,,2m,,,4m,,,8m,,,16m,,,32m\n" >> "$resultFile"
printf ",,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg,min,max,avg\n" >> "$resultFile"
printf ",Cores,1k-min,1k-max,1k-avg,2k-min,2k-max,2k-avg,4k-min,4k-max,4k-avg,8k-min,8k-max,8k-avg,16k-min,16k-max,16k-avg,32k-min,32k-max,32k-avg,64k-min,64k-max,64k-avg,128k-min,128k-max,128k-avg,256k-min,256k-max,256k-avg,512k-min,512k-max,512k-avg,1m-min,1m-max,1m-avg,2m-min,2m-max,2m-avg,4m-min,4m-max,4m-avg,8m-min,8m-max,8m-avg,16m-min,16m-max,16m-avg,32m-min,32m-max,32m-avg\n" >> "$resultFile"


for testMode in $testModeList;
do
	for cores in $coresList;
	do
		printf "%s,%s," "$testMode" "$cores" >> "$resultFile"
		for size in $sizeList;
		do
			echo -e "Formatting LMbench bw_mem_$testMode - "$cores" cores - "$size" size"								
			coreCnt=0
			sum=0
			avg=0
			while [ $coreCnt -lt $cores ]
			do				
				fn=./${RESULTS}/bw_mem/bw_mem_"$testMode"_"$size"Size_"$cores"Core_core"$coreCnt".txt			
				val=`cat "$fn" | tr -s ' ' | cut -d ' ' -f 2 | xargs echo | awk '{printf( "%f", $1 )}'`
				
				if [ $coreCnt -eq 0 ]; then
					min="$val"
					max="$val"
				elif [ 1 -eq `echo "${val} < ${min}" | bc -l` ]; then
					min="$val"
				elif [ 1 -eq `echo "${val} > ${max}" | bc -l` ]; then
					max="$val"
				fi
				
				sum=`echo $sum + $val | bc -l`
				coreCnt=`expr $coreCnt + 1`
				
			done; # all core instances
			avg=`echo $sum / $cores | bc -l`
			printf "$min,$max,$avg," >> "$resultFile"
			echo -e "Completed LMbench bw_mem_$testMode - "$cores" cores - "$size" size"			
		done; # all data sizes
		printf "\n" >> "$resultFile"
	done; # all cores
done; # all test modes

echo -e "************* Completed! *************\n"
exit 0
