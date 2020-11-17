#!/bin/bash

#0 - do not run, 1 - run

tests=(
0#run_bcopy_on_core_4.sh
1#run_bw_mem.sh
0#run_lat_mem_rd_16.sh
0#run_lat_mem_rd_2gb.sh
0#run_lat_mem_rd.sh #looks like all the threads get attached to smae cpu
1#run_lat_mem_rd_as_on_A0.sh
0#run_bw_mem_4clusters_4mb.sh #repetitions changed from 4 million to default (11)
0#run_lat_mem_rd_12.sh
0#run_lat_mem_rd_2048.sh
0#run_lat_mem_rd_4_core_64_stride.sh #calls lat_mem_rd -P 1 702 -t 64???
0#run_lat_mem_rd_thrash.sh
)

for el in ${tests[@]}; do
	file=${el##*#}
	bool=${el%%#*}
	if [[ $bool -eq 1 ]]; then
		echo "tteesstt: $file"
		./$file
		#echo "$file"
	fi
done
