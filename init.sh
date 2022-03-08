#!/usr/bin/env bash

source info_list.sh
source functions.sh
echo "Initializing..."

check_root

echo "Collecting data..."
echo "Data collected!"

echo "Creating log file..."
generate_log_file "$CURRENT_TIME" "$HOST_NAME" "$CURRENT_USED_RAM" "$CURRENT_FREE_RAM" "$PROCESS_USES_MORE_RAM" "$PARTITIONS" "$INTERFACES"
echo "Log file created!!"

echo "Creating HTML file..."
generate_html_file
echo "HTML file created!!"
