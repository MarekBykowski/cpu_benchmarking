#!/bin/bash

source ./path_to_bins.sh

echo -e "\nRunning LMbench lat_mem_rd - default CPU scheduling\n"
lat_mem_rd -P 1  702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_default_sched.txt
wait
echo -e "\nCompleted lat_mem_rd - default CPU scheduling\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 1 core\n"
taskset -c 0 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_1core_core0.txt &
wait
echo -e "\nCompleted lat_mem_rd - 1 core\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 2 cores\n"
taskset -c 0 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_2cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_2cores_core1.txt &
wait
echo -e "\nCompleted lat_mem_rd - 2 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 3 cores\n"
taskset -c 0 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core2.txt &
wait
echo -e "\nCompleted lat_mem_rd - 3 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 4 cores\n"
taskset -c 0 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 702 -t 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core3.txt &
wait
echo -e "\nCompleted lat_mem_rd - 4 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

wait
echo -e "************* All tests completed! *************\n"
exit 0
