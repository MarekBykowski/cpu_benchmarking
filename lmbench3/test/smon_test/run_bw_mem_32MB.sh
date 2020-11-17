#!/bin/bash

taskset -c 1 ./bw_helper.sh &
taskset -c 4 ./bw_helper.sh &
taskset -c 8 ./bw_helper.sh &
taskset -c 12 ./bw_helper.sh &
taskset -c 16 ./bw_helper.sh &
taskset -c 20 ./bw_helper.sh &
taskset -c 24 ./bw_helper.sh &
taskset -c 28 ./bw_helper.sh &

while [ 1 ]
do
	sleep 1
done;
