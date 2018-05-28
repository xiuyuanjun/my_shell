#!/usr/bin/env bash
set -eu
set -o pipefail
correct_apps=()
case `hostname` in
    'dn186')
        correct_apps=(ApiChargeMain ApiServerMain BackendMain MessageTerminateMain ChannelMain_163 LogSaveAndUpdateMain_163)
    ;;
    *)
    echo "不认识这台计算机！！"
    exit 1
    ;;
esac

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
