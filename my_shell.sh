#!/usr/bin/env bash
set -eu
set -o pipefail
correct_apps=(`cat /usr/local/etc/scripts/app_first_run.txt`)
apps=(`cat /usr/local/etc/scripts/appname_path.txt | awk -F ' ' '{print $NF}'`)
app_status_path="/usr/local/etc/scripts/app_status.txt"
cat /dev/null > $app_status_path
for app in ${apps[*]}
do
    if [[ "${correct_apps[*]}" =~ "$app" ]]
    then
        echo "$app" 1 >> $app_status_path
    else
        echo "$app" 0 >> $app_status_path
    fi
done
