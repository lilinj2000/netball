#!/bin/sh

#service cpuspeed stop

#service irqbalance stop
systemctl stop irqbalance

#service iptables stop

ethtool -C ens3f0 rx-usecs-irq 0 adaptive-rx off

#onload_tool disable_cstates
