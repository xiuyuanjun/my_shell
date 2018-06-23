#!/usr/bin/env bash
sed -i '/2222222222/a\3333333333' test.txt #匹配行后面添加内容
sed -i '/2222222222/i\3333333333' test.txt #匹配行前面添加内容

grep -A 7 'redis-sentine' inputfile #匹配行下面7行内容
sed -i "1 i\version: \'2\'\n\services:" docker-compose.yml #文件的第一行添加内容。

for k in master slave sentinel;do egrep -A 7 ${k}[0-9]\{4,4\}: docker-compose.yml > ${k}/docker-compose.yml; done
#正则匹配数字四个。
#-i 表示在本文件进行操作
sed -i '/home\/redis\/redis_/a\999999' docker-compose.yml;sed -i 's/999999/          -  \"\/etc\/localtime\:\/etc\/localtime\"/g' docker-compose.yml

sed 's/redis-sentinel[0-9]\{4\}/zhaoxueqing/g' docker-compose.yml #sed命令中间使用正则表达式进行匹配替换。

#查看端口号占用情况。
netstat -tlnp|grep 80
lsof -i:端口号

#如何判断文件是否有重复的行？------ sort和uniq搞起
sort a.txt | uniq -d
#其中， uniq -d是输出duplicate了的行， 也就是重复的行。 要注意， 这是建立在sort后的基础之上的。
#uniq [ -c | -d | -u ] [ -f Fields ] [ -s Characters ] [ -Fields ] [ +Characters ] [ InFile [ OutFile ] ]
 #-c 在输出行前面加上每行在输入文件中出现的次数。
#　　-d 仅显示重复行。
#　　-f  忽略由 Fields 变量指定的字段数目。如果 Fields 变量的值超过输入行中的字段数目, uniq 命令用空字符串进行比较。这个标志和 -Fields 标志是等价的。
#　　-u 仅显示不重复的行。

#例子：查询一个文件重复最多的前10条记录：
uniq -c file | sort -n -r |head -10

#查询2个文件重复的数据
 cat file1 file2 |sort|uniq -d

#用grep -c来统计匹配的行数
#grep -c 的作用类似grep | wc -l，不同的是，如果是查找多个文件，grep -c会统计每个文件匹配的行数，每行一个文件的列出来，而wc -l 则列出总的统计数字。
#另外grep -c 要比 grep | wc -l快一点。 
 
grep -c night restart.07014
#返回2
#没有
#返回0

