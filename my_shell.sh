#!/usr/bin/env bash
set -eu
set -o pipefail
correct_apps=(`cat /usr/local/etc/scripts/app_first_run.txt`)
apps=(`cat /usr/local/etc/scripts/appname_path.txt | awk -F ' ' '{print $NF}'`)
app_status_path="/usr/local/etc/scripts/app_status.txt"
cat /dev/null > $app_status_path
for app in ${correct_apps[*]}
do
    if [ `grep $app /usr/local/etc/scripts/appname_path.txt | wc -l` -gt 0 ]
    then
        echo 1
    else
        echo 0
    fi
done

app_status_path="/usr/local/etc/scripts/app_status.txt"
cat /dev/null > $app_status_path
for app in ${correct_apps[*]}
do
    if [ `grep $app /usr/local/etc/scripts/appname_path.txt | wc -l` -gt 0 ]
    then
        echo "$app" 1 >> $app_status_path
    else
        echo "$app" 0 >> $app_status_path
    fi
done
