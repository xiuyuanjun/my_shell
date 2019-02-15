shell脚本字符串截取的8种方法

1. # 号截取，删除左边字符，保留右边字符。

echo ${var#*//}

 其中 var 是变量名，# 号是运算符，*// 表示从左边开始删除第一个 // 号及左边的所有字符
即删除 http://
结果是 ：www.aaa.com/123.htm

2. ## 号截取，删除左边字符，保留右边字符。

echo ${var##*/}

 

##*/ 表示从左边开始删除最后（最右边）一个 / 号及左边的所有字符
即删除 http://www.aaa.com/

结果是 123.htm

3. %号截取，删除右边字符，保留左边字符

echo ${var%/*}

 

%/* 表示从右边开始，删除第一个 / 号及右边的字符

结果是：http://www.aaa.com

4. %% 号截取，删除右边字符，保留左边字符

echo ${var%%/*}

 %%/* 表示从右边开始，删除最后（最左边）一个 / 号及右边的字符
结果是：http:

5. 从左边第几个字符开始，及字符的个数

echo ${var:0:5}

 

其中的 0 表示左边第一个字符开始，5 表示字符的总个数。
结果是：http:

6. 从左边第几个字符开始，一直到结束。

echo ${var:7}

 

其中的 7 表示左边第8个字符开始，一直到结束。
结果是 ：www.aaa.com/123.htm

7. 从右边第几个字符开始，及字符的个数

echo ${var:0-7:3}

 

其中的 0-7 表示右边算起第七个字符开始，3 表示字符的个数。
结果是：123

8. 从右边第几个字符开始，一直到结束。

echo ${var:0-7}

 

表示从右边第七个字符开始，一直到结束。
结果是：123.htm

注：（左边的第一个字符是用 0 表示，右边的第一个字符用 0-1 表示）

1.Linux shell 截取字符变量的前8位
实现方法有如下几种：
    a='helloworld'
    expr substr "$a" 1 8
    echo $a|awk '{print substr($0,1,8)}'
    echo $a|cut -c1-8
    echo $
    expr $a : '\(.\\).*'
    echo $a|dd bs=1 count=8 2>/dev/null


Shell判断字符串包含关系的几种方法

方法一：利用grep查找
strA="long string"
strB="string"
result=$(echo $strA | grep "${strB}")
if [[ "$result" != "" ]]
then
    echo "包含"
else
    echo "不包含"
fi

方法二：利用字符串运算符

strA="helloworld"
strB="low"
if [[ $strA =~ $strB ]]
then
    echo "包含"
else
    echo "不包含"
fi

方法三：利用通配符
A="helloworld"
B="low"
if [[ $A == *$B* ]]
then
    echo "包含"
else
    echo "不包含"
fi

