#!/usr/bin/env bash
#linux 使用find命令查找包含某字符串的文件
find .|xargs grep -ri "要查找的字符串"

#删除匹配的文件
find ./ -name test.txt -delete
find ./ -name test.txt | xargs rm -f
find ./ -type f -name txt.txt -delete
