#!/usr/bin/env bash

#删除第一行
sed -i '1d' filename
#删除第n行
sed -i 'nd' filename
#删除最后一行
sed -i '$d' filename
#删除匹配行 删除以a开头的行
sed -i '/^a*/d' tmp.txt
#替换匹配行
sed -i 's/^a.*/haha/g' tmp.txt

#显示文件X行命令
sed -n 'xp' filename

#显示文件X行到Y行的内容
sed -n 'x,yp' filename

