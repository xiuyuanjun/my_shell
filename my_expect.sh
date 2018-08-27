#!/usr/bin/expect
set timeout 100
set password "huawei"
spawn ssh root@10.175.101.154
expect "Password:"
send "$password\n"
interact



说明：
第一行#！/usr/bin/expect表示使用expect的shell交互模式
set是对变量password赋值
set timeout 100：设置超时时间为100秒，如果要执行的shell命令很长可以设置超时时间长一些。expect超过超时时间没有监测到要找的字符串，则不执行，默认timeout为10秒
spawn在expect下执行shell脚本
expect对通过spawn执行的shell脚本的返回进行判断，是否包含“”中的字段
send：如果expect监测到了包含的字符串，将输入send中的内容，\n相当于回车
interact：退出expect返回终端，可以继续输入，否则将一直在expect不能退出到终端
