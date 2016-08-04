#/bin/sh

while true;
do
  onload --profile=latency taskset -c 1 sfnettest-1.5.0/src/sfnt-stream 
done
