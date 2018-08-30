http://awk.readthedocs.io/en/latest/chapter-one.html

awk -F ',' '$3 > 10000 && $3 < 100000 {print $0}' huina_bak.csv

#除了数值测试，你还可以选择包含特定单词或短语的输入行。这个程序会打印所有第一个字段为 Susie 的行
awk '$1 == "Susie"  {print $1, $2 * $3}' emp.data

#操作符 == 用于测试相等性。你也可以使用称为 正则表达式 的模式查找包含任意字母组合，单词或短语的文本。这个程序打印任意位置包含 Susie 的行
awk '/Susie/  {print $1, $2 * $3}' emp.data


#模式组合
#可以使用括号和逻辑操作符与 && ， 或 || ， 以及非 ! 对模式进行组合。程序:
awk '$2 >= 4 || $3 >= 20 {print $1, $2 * $3}' emp.data

#BEGIN与END
#特殊模式 BEGIN 用于匹配第一个输入文件的第一行之前的位置， END 则用于匹配处理过的最后一个文件的最后一行之后的位置。这个程序使用 BEGIN 来输出一个
awk 'BEGIN { print "Name    RATE    HOURS";print ""} {print $0}' emp.data
#程序的动作部分你可以在一行上放多个语句，不过要使用分号进行分隔。注意 普通的 print 是打印当前输入行，与之不同的是 print “” 会打印一个空行。
#一个动作就是一个以新行或者分号分隔的语句序列。你已经见过一些其动作仅是单个 print 语句的例子。本节将提供一些执行简单的数值以及字符串计算的语句示例。在这些语句中，你不仅可以使用像 NF 这样的内置变量，还可以创建自己的变量用于计算、存储数据诸如此类的操作。awk中，用户创建的变量不需要声明。
#计数

#这个程序使用一个变量 emp 来统计工作超过15个小时的员工的数目：:
awk '$3 > 15 { emp = emp + 1 } {print $0} END { print emp, "employees worked more than 15 hours" } END { print NR, "employees" } ' emp.data

 #为计算员工的数目，我们可以使用内置变量 NR ，它保存着到目前位置读取的行数；在所有输入的结尾它的值就是所读的所有行数。
#如下是一个使用 NR 来计算薪酬均值的程序：:
awk '{ pay = pay + $2 * $3 }
END { print NR, "employees"
      print "total pay is", pay
      print "average pay is", pay/NR
    }' emp.data
#处理文本
#awk的优势之一是能像大多数语言处理数字一样方便地处理字符串。awk变量可以保存数字也可以保存字符串。这个程序会找出时薪最高的员工
awk '$3 > maxrate { maxrate = $3; maxemp = $0 }
END { print "highest hourly rate:", maxrate, "for", maxemp }' emp.data

#awk -F ',' '$3 > maxrate { maxrate = $3; maxemp = $0 }
#END { print maxemp }' huina_bak.csv
#可以合并老字符串来创建新字符串。这种操作称为 连接（concatenation） 。程序
awk '{ names = names $1 " "} END { print names }' emp.data

#打印最后一个输入行 #虽然在 END 动作中 NR 还保留着它的值，但 $0 没有。程序
awk '{ last = $0 } END { print last }' emp.data
#我们已看到awk提供了内置变量来保存某些频繁使用的数量，
# 比如：字段的数量和输入行的数量。
# 类似地，也有内置函数用来计算其他有用的数值。
# 除了平方根、对数、随机数诸如此类的算术函数，也有操作文本的函数。
# 其中之一是 length ，计算一个字符串中的字符数量。例如，这个程序会计算每个人的姓名的长度
awk '{ print $1, length($1) }' emp.data
#这个程序使用了 length 、 NF 、以及 NR 来统计输入中行、单词以及字符的数量。为了简便，我们将每个字段看作一个单词
awk '{ nc = nc + length($0) + 1
      nw = nw + NF
    }
END { print NR, "lines,", nw, "words,", nc, "characters" }' emp.data

#如下程序将计算时薪超过6美元的员工的总薪酬与平均薪酬。它使用一个 if 来防范计算平均薪酬时的零除问题。
awk -F ' ' '$2 > 3 { n = n + 1; pay = pay + $2 * $3 }
END    { if (n > 0)
            print n, "employees, total pay is", pay,
                     "average pay is", pay/n
         else
             print "no employees are paid more than $6/hour"
        }' emp.data

awk '{ for (i = 1; i <= $3; i = i + 1)
    printf("\t%.2f\n", $1 * (1 + $2) ^ i)
}' emp.data

#依据第一个域为准，删除部分相同的行。
#awk 中数组的使用不需要提前声明。
 awk -F ',' '!a[$1]++' feige.csv > xx.csv
 awk -F ',' '!a[$1]++' feige.csv > test.csv
 awk -F ',' '!($1 in a){a[$1];print $0}' feige.csv > xx.csv
 awk -F ',' '{if(!($1 in a)){a[$1];print $0}}' feige.csv > xx.csv


awk -F ',' '{array[$1]++} END {for(key in array) print key,array[key]}' feige.csv
#那我们再来说说上边例子中的array[$1]++
#（1）Awk在读取第一行的时候，会读取这个数组，此时的数组是这样的：a[192.168.3.1]++
#（2）此时a[192.168.3.1]的值是未定义的。
#但是由于后边有运算符号++。Awk会将数字0自动赋值给a[192.168.3.1]。然后在做++运算
#（3）此时a[192.168.3.1]做++ ,也就是0+1得到的值为1
#（4）那么在读第二个192.168.3.1时,此时a[192.168.3.1]的值已经经过上次运算为1.此时在做一次运算。也就是1+1 现在a[192.168.3.1]的值为2。
#（5）总结，最后的值是多少，也就意味着，192.168.3.1运算了多少次，也意味着192.168.3.1出现了多少次。

awk -F ',' '{array[$1]++}' feige.csv

#下面说awk数组的实际应用。

#1.  除去重复项, 这个不多说, 只给出代码：
awk '!a[$0]++' file
awk '!($0 in a){a[$0];print}' file
awk '{if(!($0 in a)){a[$0];print}}' file

#2. 计算总数（sum），如：
awk  '{name[$0]+=$1};END{for(i in name) print  i, name[i]}'

#再举个例子：
echo "aaa 1
aaa 1
ccc 1
aaa 1
bbb 1
ccc 1" |awk '{a[$1]+=$2}END{for(i in a) print i,a[i]}'
#3. 查看文件差异。
awk 'NR==FNR{a[$0]=1;print}   #读取file1，建立数组a，下标为$0，并赋值为1，然后打印
NR>FNR{                   #读取file2
if(!(a[$0])) {print }      #如果file2 的$0不存在于数组a中，即不存在于file1，则打印。
}' file1 file2

#<2> 提取文件1中有，但文件2中没有：
awk 'NR==FNR{a[$0]=1}           #读取file2，建立数组a，下标为$0，并赋值为1
NR>FNR{                   #读取file1
if(!(a[$0])) {print }      #如果file1 的$0不存在于数组a中，即不存在于file2，则打印。
}' file2 file1

#4.  排序：
echo "a
1
0
b
2
10
8
100" |
awk '{a[$0]=$0} #建立数组a，下标为$0，赋值也为$0
END{
len=asort(a)      #利用asort函数对数组a的值排序，同时获得数组长度len
for(i=1;i<=len;i++) print i "\t"a[i]  #打印
}'

#5.  有序输出：采用（index in array）的方式打印数组值的顺序是随机的，如果要按原序输出，则可以使用下面的方法：http://bbs2.chinaunix.net/viewthread.php?tid=1811279
awk '{a[$1]=$2
c[j++]=$1}
END{
for(m=0;m<j;m++)print c[m],a[c[m]]
}'

#6.  多个文本编辑：这里主要指的是待处理的文本之间的格式上有区别，如分隔符不同，；或是待处理文本需提取的信息的位置不同，如不同的列或行。
awk '{a[ARGIND" "$1]=$2 # ARGIND是当前命令行文件的位置（从0开始），将它和第一列的value作为下标，建立数组a。
       b[$1]   #将第一列的value作为下标，建立数组b，目的是在读完所有文件之后，能得到第一列value的uniqe-list。
        }
END{
        for(i in b) {
                printf i" "
                for(j=1;j<=ARGIND;j++) printf "%s ", a[j" "i]?a[j" "i]:"-" #此时的ARGIND值为3.
print ""
                }
        }' file1 file2 file3
#这里是利用awk的内置变量ARGIND来处理完成对文件的处理。关于ARGIND，ARGV，ARGC的使用，大家可以参考：http://bbs.chinaunix.net/viewthr ... 0335&from=favorites。
#当然，我们也可以利用另外一个内置变量FILENAME来完成相同的任务（大家可以先想想怎么写），如下：
awk '{a[FILENAME" "$1]=$2;b[$1];c[FILENAME]}END{for(i in b) {printf i" ";for(j in c) printf "%s ", a[j" "i]?a[j" "i]:"-";print""}}' file1 file2 file3
#<例2>：对上面的数据的格式稍作改动，每个文件的分隔符都一样的情况，但输出要求不变：
#实现代码如下：
awk '{a[ARGIND" "$1]=$2
b[$1]
}
END{
for(i in b) {
printf i" "
for(j=2;j<=ARGIND;j+=2) printf "%s ", a[j" "i]?a[j" "i]:"-" # 由于FS的设置也是有对应ARGIND值，所以对ARGIND稍作改动。
print ""
}
}' FS="|" file1 FS="#" file2 FS="@" file3 # 对每个文件分别设置FS的值。
#因为这个例子的数据比较简单，我们也可以在BEGIN模块中完成对FS值设置，如下：
awk 'BEGIN{FS="[|#@]"}{a[ARGIND" "$1]=$2; b[$1]}END{for(i in b) {printf i" ";for(j=1;j<=ARGIND;j++) printf "%s ", a[j" "i]?a[j" "i]:"-"; print ""}}' file1 file2 file3
#利用FILENAME 同样可以解决问题：
awk '
FILENAME=="file1"{FS="|"}    # 设置FS
FILENAME=="file2"{FS="#"}   #设置FS
FILENAME=="file3"{FS="@"}  #设置FS
# 稍显繁琐，不过一目了然
{$0=$0}                                   #使FS生效。
{a[ARGIND" "$1]=$2; b[$1]}
END{ for(i in b) {printf i" "; for(j=1;j<=ARGIND;j++) printf "%s ", a[j" "i]?a[j" "i]:"-"; print ""}
}' file1 file2 file3
#7.  文本翻转或移位：二维或多维数组的应用
awk '{
     if (max_nf < NF)
          max_nf = NF # 数组第一维的长度
     max_nr = NR      # 数组第二维的长度
     for (x = 1; x <= NF; x++)
          vector[x, NR] = $x #建立数组vector
}
END {
     for (x = 1; x <= max_nf; x++) {
          for (y = max_nr; y >= 1; --y)
               printf("%s ", vector[x, y])
          printf("\n")
     }
}'
#有两个文本a和b，要求输出c文本，合并的规则是按照第一行的headline（按字母顺序）合并文本a和b，空缺按“0”补齐。
#下面我们来参看并解读下Tim大师的代码：
awk '
FNR==1{    #FNR==1，即a和b文本的第一行，这个用的真的很巧妙。
        for(i=1;i<=NF;i++){
                b[i]=$i    #读取文本的每个元素存入数组b
                c[$i]++}  #另建立数组c，并统计每个元素的个数
                next          #可以理解为，读取FNR!=1的文本内容。
        }
{k++                                     # 统计除去第一行的文本行数
for(i=1;i<=NF;i++)a[k","b[i]]=$i  #利用一个二维数组来保持每个数字的位置， k，b[i]可以理解为每个数字的坐标。
}
END{
        l=asorti(c)          #利用asorti函数对数组的下标进行排序，并获取数组长度，即输出文件的列数(NF值)
        for(i=1;i<=l;i++)printf c[i]" " # 先打印第一行，相当于headline。
        print ""
        for(i=1;i<=k;i++){
                for(j=1;j<=l;j++)printf a[i","c[j]]?a[i","c[j]]" ":"0 " # 打印二维数组的值。
                print ""}
        }' a.txt b.txt
#8.  选择性打印：
#打印某个关键字前几行，以3行为例：
seq 20 |awk '/\<10\>/{for(i=NR-3;i<NR;i++)print a[i%3];exit}{a[NR%3]=$0}'
#利用NR取余数，建立数组，这是一种非常高效的代码。
#9. 通过split函数建立数组：数组的下标为从1开始的数字。
#split(s, a [, r]) # s：string， a：array name，[,r]：regular expression。
#echo 'abcd' |awk '{len=split($0,a,"");for(i=1;i<=len;i++) print "a["i"] = " a[i];print "length = " len}'
#a[1] = a
#a[2] = b
#a[3] = c
#a[4] = d
#length = 4
#10． awk数组使用的小技巧和需要避免的用法：

#<1> 嵌套数组：
awk 'BEGIN{a[1]=3;b[1]=1;print a[b[1]]}'
#<2> 下标设为变量或函数：
awk 'BEGIN{s=123;a[substr(s,2)]=substr(s,1,1);for(i in a)print "index : "i"\nvalue : "a[i]}'
#<3> 不可以将数组名作为变量使用，否则会报错：
awk 'BEGIN{a["1"] = 3; delete a;a=3;print a}'  #即使你已经使用了delete函数。
#awk: fatal: attempt to use array `a' in a scalar context
#<4> 数组的长度：
#length(array)

#awk之if语句的使用
awk  -F","  '{ if($4=="江苏"){print $1} else {print  $0} } '  test.txt

#打印行号
awk '{print NR}' filename;
awk 'NR > 100000 && NR <= 200000 {print $0}' 20180625_ali_188w.txt > /20180625_ali_10w_01.txt;

#通过awk删除匹配列的某一行#如下所示，删除第九列等于"普通"的行。
awk -F ',' '$9 != "普通" {print $0}' zhaoxueqing02.csv  > zhaoxueqing.csv

#awk技巧-!a[$0]++
#解释下
awk '!a[$0]++' file
#一看之下，首先是想到又用到awk的hash，又是缺省的pattern，一下子来了兴趣，做了以下的分析
#这个要从awk的执行模式开始说，最后结合++运算符，和hash特色
#有三个基本知识点是要了解的
#1：a++的作用是先附值，再累加a，与++a正好相反。
#2：hash的初始是undef,通过直接附值或声明进行定义，如a[1]=1,或直接声明a[1]。
#3：awk的基本模式是,pattern   { action statements }，action部分是可以省略的，缺省情况下是输出，即{print $0}，至于pattern可以理解成是表达式，通过pattern表达式的值的真假，来确定是否要进行action。比如1,最简单的awk用来实现cat的功能就是 awk '1',这边1就是pattern,当然,1也可以是2,3,4,5等其他数字，但如果用字母的话，就不行，因为字母会解释成变量，变量初始值未定义，初始值为假，或者可以加个!反义
#结合上边三点来分析awk '!a[$0]++' file
"!a[$0]++"
#0:整个模式，没有用到action,所以采用的是默认的{print $0}，即在patten为真条件来，输出行
#patten分析：
#1:使用了一个hash数组,a,数组的键值采用$0,即每行值
#2:当a[$0]未声明时，a[$0]为假，在未声明的情况下，进行一次a[$0]++后，a[$0]即为真
#3：!取反
#结论：当相同的行第一次读入时，pattern为真，行输出，再次读入后，patten为假，行乎略
#基本理论知道了，要用得出来还得多锻炼应用
#上周帮别人写个awk,也是这种情况
#我写的
awk '{if($2 in a);else{a[$2]=$0}}END{for(b in a)print a[b]}' urrfile
#后来别人给出更简单的答案
awk ' !($2 in i){ i[$2]; print } ' urrfile
#现在看来，还可以更简单些
awk '!a[$2]++' urrfile


#【注意】：这是前加/后加的区别，前几天还说过。
#
#  后加: 先使用变量的值，再自加。

#   !a[$0]++ 对这个表达式的求值，它的值与 !a[$0] 相同(先使用变量a[$0]的值)，但对表达式求值后 a[$0]会自加。

#awk 计算数据的和和平均值
#最右边的数值表示数据。计算一下数据的和。 
cat /tmp/hoge.data | awk '{ sum += $7 } END { print sum }'
cat /tmp/hoge.data | awk '{ sum += $7; } END { print "sum = " sum; print "average = " sum/NR }'

#awk 指定多个分隔符
awk -F"[|%]" '{}'  #这种形式指定的分隔符是或的关系，即以“|”或“%”为分隔符； 
awk -F"[|][%]" '{}' #这种形式指定的分隔符是合并的关系，即以“|%”作为一个字符为分隔符。

#awk 正则提取字符串类似于使用grep -E
awk '/smith+ern/' testfile          #将包含字符 smit，后跟一个或多个 h 字符，并以字符 ern 结束的字符串的任何记录打印至标准输出。
awk '/smith?/' testfile             #将包含字符 smit，后跟零个或一个 h 字符的实例的所有记录打印至标准输出。
awk '/allen | alan /' testfile      #将包含字符串 allen 或 alan 的所有记录打印至标准输出。
awk '/a(ll)?(nn)?e/' testfile       #将具有字符串 ae 或 alle 或 anne 或 allnne 的所有记录打印至标准输出。
awk '/l{2}/' testfile               #指定如果正好有 m 个模式的具体值位于字符串中，则字符串匹配。
awk '/t{2,}/' testfile              #指定如果至少 m 个模式的具体值在字符串中，则字符串匹配。
awk '/er{1, 2}/' testfile           #指定如果 m 和 n 之间（包含的 m 和 n）个模式的具体值在字符串中（其中m <= n），则字符串匹配。
awk '/sm[a-h]/' testfile            #将具有 sm 后跟以字母顺序从 a 到 h 排列的任何字符的所有记录打印至标准输出。
awk '/sm[^a-h]/' testfile           #在 [ ]（方括号）和在指定字符串开头的 ^ (插入记号) 指明正则表达式与方括号内的任何字符不匹配。
awk '$1 ~ /n/' testfile             #表示指定变量与正则表达式匹配（代字号）或不匹配（代字号、感叹号）的条件语句。
awk '$2 ~ /^h/' testfile            #将把字符 h 作为第二个字段的第一个字符的所有记录打印至标准输出。
awk '$2 ~ /y$/' testfile            #将把字符 y 作为第二个字段的最后一个字符的所有记录打印至标准输出。
awk '/a..e/' testfile               #将具有以两个字符隔开的字符 a 和 e 的所有记录打印至标准输出。
awk '/a.*e/' testfile               #将具有以零个或更多字符隔开的字符 a 和 e 的所有记录打印至标准输出。awk '/a.*e/' testfile               #将具有以零个或更多字符隔开的字符 a 和 e 的所有记录打印至标准输出。
