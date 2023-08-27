#!/bin/bash
out_file="speedtest_logs_$(date +'%Y-%m-%d').txt"
target_dir="$( dirname "${BASH_SOURCE[0]}")"

if [ ! -f "$target_dir/speedtest_logs/$out_file" ]; then
  touch "$target_dir/speedtest_logs/$out_file"
fi

echo $(date +"%Y-%m-%d %H:%M:%S") >> "$target_dir/speedtest_logs/$out_file"

for ((i=0; i<5; i++)); do
  # speedtest
  ~/.local/bin/speedtest-cli --secure >> "$target_dir/speedtest_logs/$out_file"
  # vmstat
  vmstat 1 3 >> "$target_dir/speedtest_logs/$out_file"
  sleep 100
done

echo "" >> "$target_dir/speedtest_logs/$out_file"
echo "" >> "$target_dir/speedtest_logs/$out_file"