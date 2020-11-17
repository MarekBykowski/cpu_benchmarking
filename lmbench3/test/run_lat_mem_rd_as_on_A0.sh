#!/bin/bash

source ./path_to_bins.sh

max_size=128
stride=64

for cpus in 1 2 3 4 8 12 16 24 32; do
#for cpus in 32; do
	echo -e "\nRunning LMbench lat_mem_rd - ${cpus} core\n"
	for ((cpu=0; cpu<=$((cpus-2)); cpu++)); do
		taskset -c ${cpu} lat_mem_rd -P 1 $max_size $stride >/dev/null 2>&1 & usleep 1; taskset -p $!
	done
	taskset -c $((cpus-1)) lat_mem_rd -P 1 $max_size $stride >> ./results/lat_mem_rd/lat_mem_rd_${cpus}core.txt 2>&1 & usleep 1; taskset -p $!
	wait
	echo -e "\nCompleted lat_mem_rd - ${cpus} core\n"
	echo -e "Waiting for few seconds to start the next test ........\n\n"
	sleep 30
done

