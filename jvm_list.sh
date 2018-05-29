#!/usr/bin/env bash
set -eu
set -o pipefail

apps=(`/home/jdk1.8.0_161/bin/jps | grep -E "Main|DataSync|Canal" | grep -v grep`)
#shell中关联数组需要显示声明
declare -A array
for i in `seq 0 2 $[${#apps[*]}-1]`;do array[${apps[$i]}]=${apps[$[$i+1]]};done
for key in ${!array[*]}
do
    if [[ "ChannelMain" == ${array[$key]} ]] || [[ "LogSaveAndUpdateMain" == ${array[$key]} ]]
    then
        array[$key]=${array[$key]}"_"`ps -ef | grep $key | grep -v grep| awk -F ' ' '{print $NF}'`
    fi
done

appNamePath="/usr/local/etc/scripts/appname_path.txt"
cat /dev/null > $appNamePath
for key in ${!array[*]}
do
    echo "$key ${array[$key]}" >> $appNamePath
done
