#!/bin/bash

source ./path_to_bins.sh

echo -e "\nRunning LMbench lat_mem_rd - default CPU scheduling\n"
lat_mem_rd -P 1 64 16 16 64 128 256 512 1024 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_default_sched.txt
wait
echo -e "\nCompleted lat_mem_rd - default CPU scheduling\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 1 core\n"
taskset -c 0 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_1core_core0.txt &
wait
echo -e "\nCompleted lat_mem_rd - 1 core\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 2 cores\n"
taskset -c 0 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_2cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_2cores_core1.txt &
wait
echo -e "\nCompleted lat_mem_rd - 2 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 3 cores\n"
taskset -c 0 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_3cores_core2.txt &
wait
echo -e "\nCompleted lat_mem_rd - 3 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 4 cores\n"
taskset -c 0 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 128 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_4cores_core3.txt &
wait
echo -e "\nCompleted lat_mem_rd - 4 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 8 cores\n"
taskset -c 0 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_8cores_core7.txt &
wait
echo -e "\nCompleted lat_mem_rd - 8 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 12 cores\n"
taskset -c 0 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core7.txt &
taskset -c 8 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core8.txt &
taskset -c 9 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core9.txt &
taskset -c 10 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core10.txt &
taskset -c 11 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_12cores_core11.txt &
wait
echo -e "\nCompleted lat_mem_rd - 12 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 16 cores\n"
taskset -c 0 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core7.txt &
taskset -c 8 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core8.txt &
taskset -c 9 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core9.txt &
taskset -c 10 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core10.txt &
taskset -c 11 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core11.txt &
taskset -c 12 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core12.txt &
taskset -c 13 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core13.txt &
taskset -c 14 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core14.txt &
taskset -c 15 lat_mem_rd -P 1 32 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_16cores_core15.txt &
wait
echo -e "\nCompleted lat_mem_rd - 16 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10

echo -e "\nRunning LMbench lat_mem_rd - 24 cores\n"
taskset -c 0 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core7.txt &
taskset -c 8 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core8.txt &
taskset -c 9 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core9.txt &
taskset -c 10 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core10.txt &
taskset -c 11 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core11.txt &
taskset -c 12 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core12.txt &
taskset -c 13 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core13.txt &
taskset -c 14 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core14.txt &
taskset -c 15 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core15.txt &
taskset -c 16 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core16.txt &
taskset -c 17 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core17.txt &
taskset -c 18 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core18.txt &
taskset -c 19 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core19.txt &
taskset -c 20 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core20.txt &
taskset -c 21 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core21.txt &
taskset -c 22 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core22.txt &
taskset -c 23 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_24cores_core23.txt &

wait
echo -e "\nCompleted lat_mem_rd - 24 cores\n"
echo -e "Waiting for few seconds to start the next test ........\n\n"
sleep 10


echo -e "\nRunning LMbench lat_mem_rd - 32 cores\n"
taskset -c 0 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core0.txt &
taskset -c 1 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core1.txt &
taskset -c 2 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core2.txt &
taskset -c 3 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core3.txt &
taskset -c 4 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core4.txt &
taskset -c 5 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core5.txt &
taskset -c 6 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core6.txt &
taskset -c 7 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core7.txt &
taskset -c 8 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core8.txt &
taskset -c 9 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core9.txt &
taskset -c 10 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core10.txt &
taskset -c 11 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core11.txt &
taskset -c 12 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core12.txt &
taskset -c 13 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core13.txt &
taskset -c 14 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core14.txt &
taskset -c 15 lat_mem_rd -P 1 23 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core15.txt &
taskset -c 16 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core16.txt &
taskset -c 17 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core17.txt &
taskset -c 18 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core18.txt &
taskset -c 19 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core19.txt &
taskset -c 20 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core20.txt &
taskset -c 21 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core21.txt &
taskset -c 22 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core22.txt &
taskset -c 23 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core23.txt &
taskset -c 24 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core24.txt &
taskset -c 25 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core25.txt &
taskset -c 26 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core26.txt &
taskset -c 27 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core27.txt &
taskset -c 28 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core28.txt &
taskset -c 29 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core29.txt &
taskset -c 30 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core30.txt &
taskset -c 31 lat_mem_rd -P 1 16 64 2>&1 | tee ./results/lat_mem_rd/lat_mem_rd_32cores_core31.txt &

wait
echo -e "************* All tests completed! *************\n"
exit 0
