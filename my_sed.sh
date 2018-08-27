#!/usr/bin/env bash

#删除第一行
sed -i '1d' filename
#在第一行添加一行
sed -i '1i\账户名,提交时间,号码,状态报告,状态报告时间,内容' *.csv
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

#这个是删除第一行到第n行
sed -i '1,nd' filename

#要删除第 3 到最后一行
sed -i '3,$d' filename

#在每一行的开头添加一列
sed -i 's/^/广东\t/g' guangdong.csv

#在每一行的末尾添加一列
sed -i 's/$/\t广东/g' guangdong.csv

sed 替换命令可以
#用其它字符当分隔符的，
#不是必须要用/ 
sed 's#/a#/b#' 将'/a'替换为'/b' 

#删除以数字开头的行
sed -i '/^[0-9]/d' pexpect_test.py

