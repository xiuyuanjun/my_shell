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

 awk -F ',' '!a[$1]++' feige.csv > xx.csv#为计算员工的数目，我们可以使用内置变量 NR ，它保存着到目前位置读取的行数；在所有输入的结尾它的值就是所读的所有行数。
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
 awk -F ',' '!a[$1]++' feige.csv > test.csv






