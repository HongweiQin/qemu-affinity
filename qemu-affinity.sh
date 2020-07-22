#!/bin/bash

# qemu-affinity $NumberOfCPUs $StartCPUID

if [ -e $1 ]; then
	pstree -pa $(pidof qemu-system-x86_64) | grep { | cut -d',' -f2 | sort
	exit
fi

ncpu=$1
vmCPU=$2

pids=`pstree -pa $(pidof qemu-system-x86_64) | grep { | cut -d',' -f2 | sort`
i=0;

for pid in $pids
do
	if [ $i -gt 0 ]; then
		if [ $i -le $ncpu ]; then
			echo "i="$i" vmCPU="$vmCPU" pid="$pid
			sudo taskset -pc $vmCPU $pid
		fi
		vmCPU=`echo $vmCPU"+1" | bc`
	fi
	i=`echo $i"+1" | bc`
done
