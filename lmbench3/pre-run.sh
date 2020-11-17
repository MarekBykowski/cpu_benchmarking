#!/bin/bash

#target, eg. w024 doesn't have rights to create a dir/file
#so we have to do it for it
mkdir ./results/armv8l-linux-gnu
touch ./results/armv8l-linux-gnu/axx-w024-a53.0
chmod 777 ./results/armv8l-linux-gnu/axx-w024-a53.0

#make LMBench use config we have prepared before
cd ./bin/armv8l-linux-gnu
ln -s ../../CONFIG.axx-w024-a53 CONFIG.axx-w024-a53
