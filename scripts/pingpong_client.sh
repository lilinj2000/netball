#!/bin/sh

log_file=x2522plus_sfnettest_pingpong_20180824_001.log
max_times=5

echo "max_times=$max_times" | tee $log_file

cmds="
./sfnt-pingpong --maxms=10000 --affinity 1,1 tcp 192.168.230.143
onload --profile=latency taskset -c 1 ./sfnt-pingpong --maxms=10000 --affinity 1,1 tcp 192.168.230.143
./sfnt-pingpong --maxms=10000 --affinity 1,1 --timeout 1 udp 192.168.230.143
onload --profile=latency taskset -c 1 ./sfnt-pingpong --maxms=10000 --affinity 1,1 --timeout 1 udp 192.168.230.143
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
