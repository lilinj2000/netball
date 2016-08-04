#!/bin/sh

service cpuspeed stop

service irqbalance stop

service iptables stop

ethtool -C eth4 rx-usecs-irq 0 adaptive-rx off

#onload_tool disable_cstates
