#!/bin/bash

for ((run=1; run<6; run++)); do 
	echo "running ${run}th times"
	./arm_dhrystone_O2 > ./results/02_${run}.txt
	./arm_dhrystone_O3 > ./results/03_${run}.txt
done
