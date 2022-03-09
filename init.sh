#!/usr/bin/env bash

cd "$(dirname "$0")" # cd para pasta do script, para não dar problema com o cron

CURRENT_PATH=$(pwd)

source ${CURRENT_PATH}/info_list.sh
source ${CURRENT_PATH}/functions.sh
echo "Initializing..."

check_root

echo "Collecting data..."
echo "Data collected!"

generate_log_file "$CURRENT_TIME" "$HOST_NAME" "$CURRENT_USED_RAM" "$CURRENT_FREE_RAM" "$PID_PROCESS_USES_MORE_RAM" "$NAME_PROCESS_USES_MORE_RAM" "$PERCENT_PROCESS_USES_MORE_RAM" "$RSS_PROCESS_USES_MORE_RAM" "$PARTITIONS" "$INTERFACES"

generate_html_file

create_cron_job