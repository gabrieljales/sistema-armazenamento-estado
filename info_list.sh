#!/usr/bin/env bash

CURRENT_TIME=$(date +"%Y-%m-%dT%H:%M:%S")
HOST_NAME=$(hostname)
CURRENT_USED_RAM=$(free -h | grep Mem | awk '{print $3}')
CURRENT_FREE_RAM=$(free -h | grep Mem | awk '{print $7}')
PID_PROCESS_USES_MORE_RAM=$(ps -o pid,%mem,rss,comm ax | sort -b -k2 -r | head -n 2 | awk 'FNR == 2 {print $1}')
NAME_PROCESS_USES_MORE_RAM=$(ps -o pid,%mem,rss,comm ax | sort -b -k2 -r | head -n 2 | awk 'FNR == 2 {print $4, $5}')
PERCENT_PROCESS_USES_MORE_RAM=$(ps -o pid,%mem,rss,comm ax | sort -b -k2 -r | head -n 2 | awk 'FNR == 2 {print $2}')
RSS_PROCESS_USES_MORE_RAM=$(ps -o pid,%mem,rss,comm ax | sort -b -k2 -r | head -n 2 | awk 'FNR == 2 {print $3}')
PARTITIONS=$(df -h | grep -v 'loop' | awk 'NR>1 {print $2, $5, $6}')
INTERFACES=$(cat /proc/net/dev | awk 'NR>2 {print $1, $2, $3, $10, $11}')
