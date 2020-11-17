#!/bin/bash

source ./path_to_bins.sh

lens=(
1 
2 
3 
4 
8 
12 
16 
24 
32)

for i in ${lens[@]}; do
	echo "Running lat_mem_rd on ${i} cores"
	echo "Logging to: ./results/lat_mem_rd/lat_mem_rd_${i}_cores.txt"
	lat_mem_rd -P ${i} 30 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_${i}_cores.txt
done
