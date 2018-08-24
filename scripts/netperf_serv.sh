#/bin/sh

onload --profile=latency taskset -c 1 ./netserver -D -L 192.168.230.143
