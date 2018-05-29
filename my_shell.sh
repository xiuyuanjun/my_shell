#!/usr/bin/env bash
set -eu
set -o pipefail
correct_apps=(`cat /usr/local/etc/scripts/app_first_run.txt`)
apps=(`cat /usr/local/etc/scripts/appname_path.txt | awk -F ' ' '{print $NF}'`)
app_status_path="/usr/local/etc/scripts/app_status.txt"
cat /dev/null > $app_status_path
for corr_app in ${correct_apps[*]}
do
    if [[ "${array[*]}" =~ "$corr_app" ]]
    then
        echo "$corr_app" 'y' >> $app_status_path
    else
        echo "$corr_app" 'n' >> $app_status_path
    fi
done
