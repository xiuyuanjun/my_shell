#!/bin/bash
    appName=$1
    key=$2
    grep $appName /usr/local/etc/scripts/app_status.txt | awk -F ' ' '{print $NF}'

#    if [ $2 == "S0C" -o $2 == "S0U" -o $2 == "S1C" -o $2 == "S1U" -o $2 == "DSS" -o $2 == "EC" -o $2 == "EU" ];then
#    part=gcnew
#    elif [ $2 == "S0" -o $2 == "S1" -o $2 == "E" -o $2 == "O" -o $2 == "M" -o $2 == "CCS" -o $2 == "YGCT" -o $2 == "FGCT" -o $2 == "GCT" ];then
#    part=gcutil
#    elif [ $2 == "S0CMX" -o $2 == "S1CMX" -o $2 == "ECMX" ];then
#    part=gcnewcapacity
#    elif [ $2 == "NGCMN" -o $2 == "NGCMX" -o $2 == "NGC" -o $2 == "OGCMX" -o $2 == "OGCMN" -o $2 == "OGC" -o $2 == "MCMN" -o $2 == "MCMX" -o $2 == "MC" -o $2 == "CCSMN" -o $2 == "CCSMX" -o $2 == "CCSC" -o $2 == "YGC" -o $2 == "FGC" ];then
#    part=gccapacity
#    elif [ $2 == "MU" -o $2 == "CCSU" -o $2 == "OC" -o $2 == "OU" ];then
#    part=gc
#    elif [ $2 == "Loaded" -o $2 == "Unloaded" ];then
#    part=class
#    elif [ $2 == "CPU" ];then
#    part=cpu
#    elif [ $2 == "MEM" ];then
#            part=mem
#    else
#    echo "Error input:"
#    exit 0
#    fi
#    case $2 in
#    S0C)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $1*1024 }'
#    ;;
#    S0U)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $3*1024 }'
#    ;;
#    S0)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $1}'
#    ;;
#    S0CMX)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $4*1024 }'
#    ;;
#    S1C)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $2*1024 }'
#    ;;
#    S1U)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $4*1024 }'
#    ;;
#    S1)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $2}'
#    ;;
#    S1CMX)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $6*1024 }'
#    ;;
#    DSS)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $7*1024 }'
#    ;;
#    EC)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $8*1024 }'
#    ;;
#    EU)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $9*1024 }'
#    ;;
#    ECMX)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $8*1024 }'
#    ;;
#    E)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $3}'
#    ;;
#    NGCMN)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $1*1024 }'
#    ;;
#    NGCMX)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $2*1024 }'
#    ;;
#    NGC)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $3*1024 }'
#    ;;
#    OC)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $7*1024 }'
#    ;;
#    OU)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $8*1024 }'
#    ;;
#    OGCMX)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $8*1024 }'
#    ;;
#    OGCMN)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $7*1024 }'
#    ;;
#    O)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $4}'
#    ;;
#    OGC)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $9*1024 }'
#    ;;
#    M)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $5}'
#    ;;
#    MC)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $13*1024 }'
#    ;;
#    MU)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $10*1024 }'
#    ;;
#    MCMN)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $11*1024 }'
#    ;;
#    MCMX)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $12*1024 }'
#    ;;
#    CCS)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $6}'
#    ;;
#    CCSC)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $13*1024 }'
#    ;;
#    CCSU)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $12*1024 }'
#    ;;
#    CCSMN)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $14*1024 }'
#    ;;
#    CCSMX)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $15*1024 }'
#    ;;
#    YGC)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $17}'
#    ;;
#    YGCT)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.3f\n", $8}'
#    ;;
#    FGC)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $18}'
#    ;;
#    FGCT)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $10}'
#    ;;
#    GCT)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.3f\n", $11}'
#    ;;
#    TT)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf $5 "\n"}'
#    ;;
#    MTT)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf $6 "\n"}'
#    ;;
#    Loaded)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $1}'
#    ;;
#    Unloaded)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $3}'
#    ;;
#    CPU)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%.2f\n", $1}'
#    ;;
#    MEM)
#    grep -wA 2 ^"$part" /usr/local/etc/scripts/app/$1|tail -1|awk '{printf "%d\n", $1*1024 }'
#    ;;
#    *)
#    echo "Error input:"
#    ;;
#    esac
#    exit 0
