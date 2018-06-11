#!/usr/bin/env bash
/usr/bin/date > /tmp/clear_log_run_stat.txt;if [ $(df | grep '/home' | awk '{print $5}' | awk -F '%' '{print $1}') -gt 95 ]; then cd /home/eums_log/gateway; find . -mtime +3 -name "*.txt.*-*-*" | xargs rm -f; fi
