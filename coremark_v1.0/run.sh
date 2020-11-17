#!/bin/bash

source $(pwd)/$(dirname $0)/defines.sh

# We run it upon the ARM recoomendation for its Cortex-M series:
# http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dai0350a/index.html
# that is: 2x validations and then 10x performance runs to compute the average in the end.

for ((threads=${MIN_THREADS}; threads<=${MAX_THREADS}; threads++)); do
	start_logging $threads
	echo "Running coremark_${threads}.exe"

	# performance run
	${BINARTIES_DIR}/coremark_${threads}.exe 0 0 0x66 0 0 0 2000
	validate ${threads}

	# validation run
	${BINARTIES_DIR}/coremark_${threads}.exe 0x3415 0x3415 0x66 0 0 0 2000
	validate ${threads}

	# profile run (looks like ARM meant performance run)
	for ((i=1; i<=10; i++)); do
		echo -e "\nRun number $i"
		${BINARTIES_DIR}/coremark_${threads}.exe 0 0 0x66 0 0 0 2000
	done
	stop_logging
done
