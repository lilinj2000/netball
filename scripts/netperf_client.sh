#!/bin/sh

log_file=netperf.log
max_times=3

echo "max_times=$max_times" | tee $log_file

cmds="
netperf-2.7.0/src/netperf -t TCP_RR -H 192.168.6.11 -l 10 -- -r 32
onload --profile=latency taskset -c 1 netperf-2.7.0/src/netperf -t TCP_RR -H 192.168.6.11 -l 10 -- -r 32
netperf-2.7.0/src/netperf -t UDP_RR -H 192.168.6.11 -l 10 -- -r 32
onload --profile=latency taskset -c 1 netperf-2.7.0/src/netperf -t UDP_RR -H 192.168.6.11 -l 10 -- -r 32
"
tmp_ifs=$IFS
IFS=$'\n'
for cmd in $cmds
do
  i=1
  while [ "$i" -le "$max_times" ]
  do
    #cmd="netperf-2.7.0/src/netperf -t TCP_RR -H 192.168.6.11 -l 10 -- -r 32"
    echo $cmd | tee -a $log_file
    eval $cmd | tee -a $log_file
    i=$(($i+1))
  done
done
