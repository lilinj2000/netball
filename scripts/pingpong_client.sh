#!/bin/sh

log_file=sfnettest_pingpong.log
max_times=1

echo "max_times=$max_times" | tee $log_file

cmds="
sfnettest-1.5.0/src/sfnt-pingpong --maxms=10000 --affinity 1,1 tcp 192.168.6.11
onload --profile=latency taskset -c 1 sfnettest-1.5.0/src/sfnt-pingpong --maxms=10000 --affinity 1,1 tcp 192.168.6.11
sfnettest-1.5.0/src/sfnt-pingpong --maxms=10000 --affinity 1,1 --timeout 1 udp 192.168.6.11
onload --profile=latency taskset -c 1 sfnettest-1.5.0/src/sfnt-pingpong --maxms=10000 --affinity 1,1 --timeout 1 udp 192.168.6.11
"
tmp_ifs=$IFS
IFS=$'\n'
for cmd in $cmds
do
  i=1
  while [ "$i" -le "$max_times" ]
  do
    echo $cmd 2>&1 | tee -a $log_file
    eval $cmd 2>&1 | tee -a $log_file
    i=$(($i+1))
    sleep 5
  done
done
