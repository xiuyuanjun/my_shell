#!/usr/bin/env bash
case "$(hostname)" in
    dn186)
        app_array=(api mt mo backend report dest charge clean)
        ;;
    dn187)
        app_array=(api mt mo report)
        ;;
    dn181)
        app_array=(api mt mo backend report dest charge clean)
        ;;
    master184) app_array=(api mt mo report)
        ;;
    esac
if [ -d '/home/eums-gateway/' ];then
    cd /home/eums-gateway/
    for app in ${app_array[*]}
    do
        {
            sh stop.sh $app
        }&
    done
    wait
    cd ~
    rm -rf /home/eums-gateway
fi
cd /home
tar -zxvf *.tar.gz
cd eums-gateway
dos2unix -o *.sh
sh mk_dir.sh
sh logback_create.sh
for app in ${app_array[*]}
do
    {
        sh start.sh $app
    }&
done
wait