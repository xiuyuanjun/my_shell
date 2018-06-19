#!/usr/bin/env bash

#删除第一行
sed -i '1d' filename
#删除第n行
sed -i 'nd' filename
#删除最后一行
sed -i '$d' filename