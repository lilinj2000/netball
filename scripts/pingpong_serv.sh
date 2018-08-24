#/bin/sh

while true;
do
  onload --profile=latency taskset -c 1 ./sfnt-pingpong --timeout 1
done
