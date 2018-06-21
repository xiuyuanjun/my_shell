#!/usr/bin/env bash
date "+%Y-%m-%d"
date "+%H:%M:%S"
date "+%Y-%m-%d %H:%M:%S"
date "+%Y_%m_%d %H:%M:%S"
date -d today
date -d now
date -d tomorrow
date -d yesterday


date -d next-day +%Y%m%d #明天日期
date -d tomorrow +%Y%m%d # 明天日期
date -d last-day +%Y%m%d #昨天日期
date -d yesterday +%Y%m%d #昨天日期
date -d last-month +%Y%m #上个月日期
date -d next-month +%Y%m #下个月日期
date -d next-year +%Y #明年日期

date -d 'next monday'    #(下周一的日期)
date -d next-day +%Y%m%d  #（明天的日期）或者：date -d tomorrow +%Y%m%d
date -d last-day +%Y%m%d  #(昨天的日期) 或者：date -d yesterday +%Y%m%d
date -d last-month +%Y%m  #(上个月是几月)
date -d next-month +%Y%m  #(下个月是几月)

date -d '30 days ago'   #（30天前的日期）

date -d 'dec 14 -2 weeks'   #（相对:dec 14这个日期的两周前的日期）
date -d '-100 days' # (100天以前的日期)
date -d '50 days'   # (50天后的日期)

#计算两个日期之间有多少天
#!/bin/bash
end_time="2016-03-17"
start_time="2016-03-15"
time1=$(($(date +%s -d "${end_time}") - $(date +%s -d "${start_time}")));
echo $((${time1}/(3600*24)+1))