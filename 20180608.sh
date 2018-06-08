#!/usr/bin/env bash
sed -i '/2222222222/a\3333333333' test.txt #匹配行后面添加内容
sed -i '/2222222222/i\3333333333' test.txt #匹配行前面添加内容

grep -A 7 'redis-sentine' inputfile #匹配行下面7行内容
sed -i "1 i\version: \'2\'\n\services:" docker-compose.yml #文件的第一行添加内容。

for k in master slave sentinel;do egrep -A 7 ${k}[0-9]\{4,4\}: docker-compose.yml > ${k}/docker-compose.yml; done
#正则匹配数字四个。

sed -i '/home\/redis\/redis_/a\999999' docker-compose.yml;sed -i 's/999999/          -  \"\/etc\/localtime\:\/etc\/localtime\"/g' docker-compose.yml
