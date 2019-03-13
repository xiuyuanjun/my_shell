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



${...}在字符串中有非常多的用法：

1、${var}

限定变量。

如果一个变量名A是另一个变量名AB的前部分，那么，如果要在AB相连时，要得到A的值，就必须使用${var}限定。

如果变量名不会产生歧义时（即独立的变量名），${var}与$var没有任何区别。

var="hello"

var_01="hello01"

echo  $var $var_01 ${var}_01

>>> hello hello01 hello_01

 

2、${#var}

得到变量var的长度

var="hello"

echo ${#var}

>>> 5

 

3、${var#}

删除变量首部的字符（串），

"#"后面的可以是字面串，也可以是正则表达式（惰性匹配）。

var="hello"

echo ${var#he}

>>> llo

var="/res_pos/path/from/something"

echo ${var#/}

>>> res_pos/path/from/something    # 删除第一个"/"

echo ${var#/*/}

>>> path/from/something   # 删除首部匹配"/*/"的串，即"/res_pos/"

 

4、${var##}

删除变量首部的字符（串），

只是，当使用2个"##"时，匹配是贪婪的（贪婪匹配，也就是尽可能多的匹配）。

echo ${var##/*/}

>>> something  # 删除首部匹配"/*/"的串，即"/res_pos/path/from/"。

 

5、${var%}

删除变量尾部的字符（串），

"%"后面的可以是字面串，也可以是正则表达式（惰性匹配）。

var="hello"

echo ${var%llo}

>>> he

var="~/res_pos/path/from/something"

echo ${var%/*}

>>> ~/res_pos/path/from    # 删除尾部的"/something"

 

6、${var%%}

删除变量尾部的字符（串），

只是，当使用2个"%%"时，匹配是贪婪的（对应于第4条）

var="~/res_pos/path/from/something"

echo ${var%/*}

>>> ~    # 删除第一个的"/"后的所有所有内容（包括"/"），贪婪匹配中，"/*"就是"/"后的所有字符串

 

7、${var::}

跟python的切片概念相似，取变量var的起始索引，

指定长度的子串（${var:索引:长度}）。

var="~/res_pos/path/from/something"

echo ${var:0:5}

>>> ~/res

echo ${var:1:5}

>>> /res_      # 可见，字符串的索引是从0开始的

echo ${var::5}

>>> ~/res      # 省略"索引"，默认为从0开始

echo ${var:1:}

>>>               # 省略"长度"，默认长度为0，所以输出为空

 

8、${var//}

字符串替换。

将var中的字符串A替换成字符串B（${var/A/B}）。

var="hello world"

echo ${var/hello/hi}

>>> hi world      # 字符串"hello"替换成了"hi"

echo ${var/l/X}

>>> heXlo world  # 第一个"l"替换成了"X"

 

9、${var///}

字符串替换，

与第8点相同，只不过，现在是将所有出现的串A替换成串B（${var//A/B}）。

var="hello world"

echo ${var//l/X}

>>> heXXo worXd  # 所有的"l"都替换成了"X"


10、${var/#/}

替换字符串首部的串A为串B，

（${var/#A/B}），与第8点不同的是，这里只替换首部的串A。

var="hello world. hello baby."

echo ${var//h/H}

>>> Hello world. Hello baby.    # 将所有"h"替换成了"H"

echo ${var/#h/H}

>>> Hello world. hello baby.    # 将首部的"h"替换成了"H"

echo ${var/e/E}

>>> hEllo world. hello baby.    # 将第一个出现的"e"替换成了"E"

echo ${var/#e/E}

>>> hello world. hello baby.    # 首字符不是"e"，所以没有进行任何替换，原样输出。

 

11、${var/%/}

替换字符串尾部的串A为串B，

（${var/%A/B}），与第10点相似，只是这是处理的是字符串尾。

var="hello hello"

echo ${var/%o/END}

>>> hello hellEND    # 将尾部的字符"o"，替换成了"END"。
