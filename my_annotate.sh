1.单行注释
众所周知，#比如想要注释：echo“ni”
#echo"ni"
2.多行注释：
法一：

:<<!
语句1
语句2
语句3
语句4
!
例如：
linux101:/home/wsj#shdian
ni
ni
ni
ni
ni
ni

linux101:/home/wsj#moredian
#!/bin/ksh
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"

:<<!
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
!

法二：
:'
语句1
语句2
语句3
语句4
'

例如：
linux101:/home/wsj#shdian
ni
ni
ni
ni
ni
ni

linux101:/home/wsj#moredian
#!/bin/ksh
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"

:'
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
'

2014-02-03-06补充：
法三：

iffalse;then
语句1
语句2
语句3
语句4
fi

linux101:/home/wsj#shdian
ni
ni
ni
ni
ni
ni

linux101:/home/wsj#moredian
#!/bin/ksh
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"

iffalse;then
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
echo"ni"
fi



法四：

:<<字符#这里的字符可以是数字或者是字符都可以
语句1
语句2
语句3
语句4
字符

2014-09-10教师节快乐，由chaosink哥们和Dablelv哥们2017-09-27提供补充：
法五：

((0))&&{
语句1
语句2
语句3
}
