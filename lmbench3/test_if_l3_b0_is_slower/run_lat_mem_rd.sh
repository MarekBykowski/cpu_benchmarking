#!/bin/bash

source ./path_to_bins.sh

copies=(
1 
#2 
#3 
#4 
#8 
#12 
#16 
#24 
#32
)

for i in ${copies[@]}; do
	echo "Running lat_mem_rd on ${i} cores"
	lat_mem_rd -P ${i} 30 64 
done
