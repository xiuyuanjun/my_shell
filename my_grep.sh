#!/usr/bin/env bash

#匹配以数字开头的行
cat file | grep -P '^\d'

grep 精确匹配
如果是有进程名为abcd,abcde等有包含"abc"字符的，那么判断将会不准备，如果精确的匹配到abc呢，当时不知道，只能很诚实的回答，不清楚
其实答案很简单，用grep –w "abc" 或者是grep "\<abc\>"都可以实现
-w, --word-regexp         强制 PATTERN 仅完全匹配字词
-w, --word-regexp         force PATTERN to match only whole words

grep -C 5 foo file 显示file文件里匹配foo字串那行以及上下5行
grep -B 5 foo file 显示foo及前5行
grep -A 5 foo file 显示foo及后5行
