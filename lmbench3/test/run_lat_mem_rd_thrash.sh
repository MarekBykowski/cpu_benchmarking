#!/bin/bash

source ./path_to_bins.sh

echo -e "\nRunning LMbench lat_mem_rd - default CPU scheduling\n"
lat_mem_rd -P 1 -t 16 32 64 128 256 512 1024 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_default_sched.txt
wait
echo -e "\nCompleted lat_mem_rd - default CPU scheduling\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 1 core\n"
taskset -c 0 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_1core_core0.txt &
wait
echo -e "\nCompleted lat_mem_rd - 1 core\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 2 cores\n"
taskset -c 0 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_2cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_2cores_core1.txt &
wait
echo -e "\nCompleted lat_mem_rd - 2 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 3 cores\n"
taskset -c 0 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core2.txt &
wait
echo -e "\nCompleted lat_mem_rd - 3 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 4 cores\n"
taskset -c 0 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core3.txt &
wait
echo -e "\nCompleted lat_mem_rd - 4 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 8 cores\n"
taskset -c 0 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core7.txt &
wait
echo -e "\nCompleted lat_mem_rd - 8 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 12 cores\n"
taskset -c 0 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core7.txt &
taskset -c 8 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core8.txt &
taskset -c 9 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core9.txt &
taskset -c 10 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core10.txt &
taskset -c 11 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core11.txt &
wait
echo -e "\nCompleted lat_mem_rd - 12 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 16 cores\n"
taskset -c 0 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core7.txt &
taskset -c 8 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core8.txt &
taskset -c 9 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core9.txt &
taskset -c 10 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core10.txt &
taskset -c 11 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core11.txt &
taskset -c 12 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core12.txt &
taskset -c 13 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core13.txt &
taskset -c 14 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core14.txt &
taskset -c 15 lat_mem_rd -P 1 -t 128 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core15.txt &
wait
echo -e "************* All tests completed! *************\n"
exit 0
