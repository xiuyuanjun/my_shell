#!/usr/bin/env bash
#cat <<EOF与cat <<-EOF的区别
#先来看man中的说明：
#If the redirection operator is <<-, then all leading tab characters are stripped from input lines and  the  line  containing  delimiter.
#翻译过来的意思就是：如果重定向的操作符是<<-，那么分界符（EOF）所在行的开头部分的制表符（Tab）都将被去除。
#这可以解决由于脚本中的自然缩进产生的制表符。
#通俗一点的解释：
#在我们使用cat <<EOF时，我们输入完成后，需要在一个新的一行输入EOF结束stdin的输入。EOF必须顶行写，前面不能用制表符或者空格。
#比如,下面的语句就不会出错：
cat <<EOF
Hello,world!
EOF

#如果结束分解符EOF前有制表符或者空格，则EOF不会被当做结束分界符，只会继续被当做stdin来输入。
#而<<-就是为了解决这一问题：

cat <<-EOF
Hello,world!
      EOF

#上面的写法，虽然最后的EOF前面有多个制表符和空格，但仍然会被当做结束分界符，表示stdin的结束。
#这就是<<和<<-的区别。