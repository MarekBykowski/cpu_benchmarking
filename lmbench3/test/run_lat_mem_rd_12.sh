#!/bin/bash

source ./path_to_bins.sh

echo -e "\nRunning LMbench lat_mem_rd - 16 cores\n"
taskset -c 0 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core7.txt &
taskset -c 8 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core8.txt &
taskset -c 9 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core9.txt &
taskset -c 10 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core10.txt &
taskset -c 11 lat_mem_rd -P 1 -t 640 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core11.txt &
wait
echo -e "************* All tests completed! *************\n"
exit 0
