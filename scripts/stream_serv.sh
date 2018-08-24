#/bin/sh

while true;
do
  onload --profile=latency taskset -c 1 ./sfnt-stream 
done
