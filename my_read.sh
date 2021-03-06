循环中的重定向
或许你应该在其他脚本中见过下面的这种写法：
while read line
do
       …
done < file
刚开始看到这种结构时，很难理解< file是如何与循环配合在一起工作的。因为循环内有很多条命令，而我们之前接触的重定向都是为一条命令工作的。这里有一个原则，这个原则掌握好了，这个问题就很简单了：
对循环重定向的输入可适用于循环中的所有需要从标准输入读取数据的命令；
对循环重定向的输出可适用于循环中的所有需要向标准输出写入数据的命令；
当在循环内部显式地使用输入或输出重定向，内部重定向覆盖外部重定向。
上面的while结构中，read命令是需要从标准输入中读取数据的。我们来详细了解一下read命令的用法吧，这个命令是shell脚本中使用频率最高的命令之一。
read
先来看一下read的命令语法：
read arg1 arg2 arg3 arg4 …
read是一个用来赋值的命令，它需要从标准输入获得值，然后把这些值按位置依次赋值给变量arg1、arg2、arg3、arg4…，输入的时候以空格作为字段分隔符。
read的一个最大特性是可以在脚本中产生交互，因为它从标准输入读取数据。read之所以很常用，一是因为我们经常需要赋值，二是因为它可以交互，三是read能够一次给多个变量赋值。
$ read host ip name
linux 10.0.0.1 licong
$ echo $host $ip $name
linux 10.0.0.1 licong
$
可以看到，linux、10.0.0.1、licong分别被赋值给了变量host、ip和name。再看：
$ read host ip
linux 10.0.0.1 licong
$ echo $host
linux
$ echo $ip
10.0.0.1 licong
$
当我们输入的字段比变量数目多时，最后一个变量的值将不只一个字段，而是所有剩余的内容；当输入字段比变量数少时，多余的变量将是空值，你可以自己试试。现在我们再来看
while read line
do
       …
done < file
read通过输入重定向，把file的第一行所有的内容赋值给变量line，循环体内的命令一般包含对变量line的处理；然后循环处理file的第二行、第三行。。。一直到file的最后一行。还记得while根据其后的命令退出状态来判断是否执行循环体吗？是的，read命令也有退出状态，当它从文件file中读到内容时，退出状态为0，循环继续惊醒；当read从文件中读完最后一行后，下次便没有内容可读了，此时read的退出状态为非0，所以循环才会退出。
另一种也很常见的用法：
command | while read line
do
    …
done
如果你还记得管道的用法，这个结构应该不难理解吧。command命令的输出作为read循环的输入，这种结构长用于处理超过一行的输出，当然awk也很擅长做这种事。

while read line;do echo $line;done < test.txt

cat test.txt | while read line;do echo $line;done
