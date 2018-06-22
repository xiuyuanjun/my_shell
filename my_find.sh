#!/usr/bin/env bash
#linux 使用find命令查找包含某字符串的文件
find .|xargs grep -ri "要查找的字符串"