ssh超时时间设置（设置ClientAliveInterval），附SSH超详细参数
作者: daodaoliang
版本: V 0.0.1
日期: 2016年12月29日
0x00 OpenSSH 简介
OpenSSH是采用SSH协议实现的重要的远程连接工具，它对所有的数据进行加密以防止被中途窃听，OpenSSH提供了大量的安全通道的组件，比如：

远程操作用ssh、scp、sftp;
秘钥管理用ssh-add、ssh-keysign、ssh-keyscan、ssh-keygen;
服务端包含sshd、sftp-server、ssh-agent;
0x01 方案一
上面的所有信息可以自行去对应官网链接进行进一步的学习，在下面只讨论对于sshd的超时连接的问题。

修改server端的配置文件/etc/ssh/sshd_config
# server每隔60秒给客户端发送一次保活信息包给客户端
ClientAliveInterval 60

# server端发出的请求客户端没有回应的次数达到86400次的时候就断开连接，正常情况下客户端都会相应
ClientAliveCountMax 86400
修改client端的配置文件/etc/ssh/ssh_config
# client 每隔60秒给客户端发送一次保活信息包给客户端
ServerAliveInterval 60

# client 端发出的请求服务端没有回应的次数达到86400次的时候就断开连接，正常情况下服务端都会相应
ServerAliveCountMax 86400
0x02 方案二
在命令参数里


 ssh -o ServerAliveInterval=60 
 
这样子只会在需要的连接中保持持久连接
