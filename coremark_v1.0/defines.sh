#!/bin/bash

MIN_THREADS=1 #1 is min. a single threaded
MAX_THREADS=32 #32 is max. (number of cores in XLF)

# cpu isolation requires a number of steps to run in/around
# Uboot and kernel. Don't set it "true" until you are done with them.
# Details are in the documentation for benchmarking tests.
CPU_ISOLATION=false

BINARTIES_DIR=./axm67xx.bins
MHz=1500 #CPU clock for B0
#MHz=1049 #CPU clock for A0 


#Logging
#0-> log just stdout nad stderr
#1-> extra logging through "set -x"
DEBUG=0
if [[ ${DEBUG} -eq 1 ]]; then
	set -x
else
	set +x
fi

if [[ $CPU_ISOLATION == true ]]; then
	MIN_THREADS=1
	MAX_THREADS=1
fi

touch_logfile() {
	test -d ./results && rm ./results/*
	mkdir -p ./results/
	for ((cpus=MIN_THREADS; cpus<=${MAX_THREADS}; cpus++)); do
		touch ./results/coremark_thread_${cpus}.log && \
		chmod 777 ./results/coremark_thread_${cpus}.log
	done
}

remove_binaries() {
	rm ${BINARTIES_DIR} -rf
	mkdir -p ${BINARTIES_DIR}
}

start_logging() {
	local LOGFILE=./results/coremark_thread_${1}.log

	test -f ${LOGFILE} || { echo "No logfile ${LOGFILE}";
			echo "Have you run \"build.sh\" beforehand?"
			exit 1; }
	exec 3>&1 4>&2
	mkdir -p ~/tmp || exit 1
	mkfifo ~/tmp/pipe$$
	tee ${LOGFILE} < ~/tmp/pipe$$ & pid=$!
	exec > ~/tmp/pipe$$ 2>&1
}

stop_logging() {
	rm -f ~/tmp/pipe$$;
	exec 1>&3 2>&4
	exec 3>&- 4>&-
}


:<<EOF
for ((i=31; i<=32; i++)); do
start_logging $i
ls
echo $i
stop_logging
done
EOF

validate() {
	local LOGFILE=./results/coremark_thread_${1}.log
	error_string=("Errors detected" "Cannot validate operation")
	while IFS= read line; do
		for err in "${error_string[@]}"; do
			if [[ $line =~ $err ]]; then
				echo -e "\n\nbenchmark failed!!!!\n\n"
				exit 1
			fi
		done
	done < <(tail -n 2 ${LOGFILE})
}

compute_average() {
	local scores=()
	local LOGFILE=./$1/coremark_thread_$2.log
	while IFS= read line; do
		if [[ $line =~ "$CoreMark 1.0" ]]; then
			score=`echo $line | awk '{print $4}'`
			scores+=("$score")
		fi
	done < ${LOGFILE}

	#echo ${scores[@]}
	#echo ${scores[@]:1}
	local sum=0
	for el in ${scores[@]:1}; do
		sum=$(echo "scale=6; $sum + $el" | bc)
	done

	local count=$((${#scores[@]}-1))
	if [[ $count -ne 10 ]]; then
		echo -e "\n#######################################################"
		echo "Error: Should be 10 performance runs for the score to converge"
		echo "#######################################################"
		return 127
	fi

	cm_score=$(echo "scale=6; $sum / $count" | bc)
	return 0
}

compute_and_log_results() {
	{
	date
	for ((i=${MIN_THREADS}; i<=${MAX_THREADS}; i++)); do
		#echo -e "\nProcessing results for ./results/coremark_thread_${i}.log"
		if compute_average ${1} ${i}; then
			cm_score_cpu=$(echo "scale=6; $cm_score / $i" | bc)
			cm_score_cpu_hz=$(echo "scale=6; $cm_score_cpu / $MHz" | bc)
			echo -e "\nNumber of threads : ${i}"
			echo "CoreMark for all ${i}x cpus : $cm_score"
			echo "CoreMark [per cpu]: $cm_score_cpu"
			echo "CoreMark/MHz [per cpu]: $cm_score_cpu_hz"
		fi
	done
	} | tee ./${1}/coremark.txt
}
