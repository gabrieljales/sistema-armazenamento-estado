#!/usr/bin/env bash

CURRENT_TIME=$(date +"%Y-%m-%dT%H:%M:%S")
HOST_NAME=$(hostname)
CURRENT_USED_RAM=$(free -h | grep Mem | awk '{print $3}')
CURRENT_FREE_RAM=$(free -h | grep Mem | awk '{print $4}')
PROCESS_USES_MORE_RAM=$(ps -o pid,%mem,rss,comm ax | sort -b -k2 -r | head -n 2 | awk 'FNR == 2 {print $1,$2,$3,$4}')
PARTITIONS=$(df -h | grep -v 'loop' | awk 'NR>1 {print $2, $3, $6}')
INTERFACES=$(cat /proc/net/dev | awk 'NR>2 {print $1, $2, $3, $10, $11}')
