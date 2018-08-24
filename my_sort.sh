sort -u 和 uniq都能起到删除重复信息的功能，那么他们的区别究竟在哪呢？
$ cat test              
jason
jason
jason
fffff
jason

下面分别执行三个命令

1：sort -u test

sort -u test
fffff
jason

2: uniq test

$uniq test 
jason
fffff
jason 

 3: sort test|uniq

$sort test |uniq 
fffff
jason

从上面三个命令我们很容易看出他们之间的区别。uniq所谓的重复是连续出现的相同记录
