#/bin/sh

onload --profile=latency taskset -c 1 netperf-2.7.0/src/netserver -D -L 192.168.6.11
