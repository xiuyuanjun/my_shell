
pm -qa | grep java 
pm -e +已安装版本卸载旧版本的java。

先用rpm -qa | grep java 列出已安装的版本，然后用rpm -e +已安装版本卸载旧版本的java



Linux命令之rpm安装命令
在 Linux 操作系统下，几乎所有的软件均通过RPM 进行安装、卸载及管理等操作。RPM 的全称为Redhat Package Manager ，是由Redhat 公司提出的，用于管理Linux 下软件包的软件。Linux 安装时，除了几个核心模块以外，其余几乎所有的模块均通过RPM 完成安装。RPM 有五种操作模式，分别为：安装、卸载、升级、查询和验证。

1）用RPM安装软件包，最简单的命令如下：

1 #rpm -i example.rpm 安装 example.rpm 包；
2 #rpm -iv example.rpm 安装 example.rpm 包并在安装过程中显示正在安装的文件信息；
3 #rpm -ivh example.rpm 安装 example.rpm 包并在安装过程中显示正在安装的文件信息及安装进度

2）删除已安装的软件包
要卸载软件包example，只需输入以下这行命令：

1 # rpm -e example
注意：软件包名是example，而不是rpm文件名"example.rpm"。

3）升级软件包
升级软件类似于安装软件：

1 # rpm -Uvh example.rpm
用户要注意的是：rpm会自动卸载相应软件包的老版本。如果老版本软件的配置文件通新版本的不兼容，rpm会自动将其保存为另外一个文件，用户会看到下面的信息：

saving /etc/example.conf as /etc/example.conf.rpmsave
这样用户就可以自己手工去更改相应的配置文件。
另外如果用户要安装老版本的软件，用户就会看到下面的出错信息：

# rpm -Uvh example.rpm

examle packag example-2.0-l(which is newer) is already installed

error:example.rpm cannot be installed
 

如果用户要强行安装就使用-oldpackage参数。

4）查询软件包
用户可以用rpm -q在rpm的数据库中查询相应的软件，rpm会给出软件包的名称，版本，发布版本号，例如：

1 # rpm -q example
下面是查询时可以使用的特定参数：
-a 　　：查询目前系统安装的所有软件包。
-f 文件名 　　：查询包括该文件的软件包。
-F 　　：同-f参数，只是输入是标准输入（例如 find /usr/bin | rpm -qF)
-q 软件包名 　　： 查询该软件包
-Q 　　：同-p参数，只是输入是标准输入（例如 find /mnt/cdrom/RedHat/RPMS | rpm -qQ)
下面是输出时的格式选择：
-i 显示软件包的名称，描述，发行，大小，编译日期，安装日期，开发人员等信息。
-l 显示软件包包含的文件
-s 显示软件包包含的文件目前的状态，只有两种状态：normal和missing
-d 显示软件包中的文档（如man,info,README等）
-c 显示软件包中的配置文件，这些文件一般是安装后需要用户手工修改的，例如：sendmail.cf,passwd,inittab等
如果用-v参数就可以得到类似于ls -l的输出

5）用rpm校验软件包

1 rpm -Vf 需要验证到包
 


rpm 实用技巧！ 
1）用户可以通过FTP来安装软件包。如果用户能够连上网络，想安装某个新的软件包时，可以直接用它的URL地址来安装： 
比如：现在在ftp.linuxsir.com/pub/linux/redhat/RPMS/下有这个文件包：foo-1.0-1.i386.rpm，那就可以用这样的命令：

1 # rpm -i ftp.linuxsir.com/pub/linux/redhat/RPMS/foo-1.0-1.i386.rpm 
 

来安装，也可以查询！ 

2）如果用户不小心误删了几个文件，但不确定到底是那些文件，想对整个系统进行校验，以了解哪些部分可能已经损坏，可以用：

1 # rpm -Va 
 

3）如果用户碰到一个人不出来的文件，想要知道它是属于那一个软件包的话，可以这样做：

1 # rpm -qf /usr/X11R6/bin/xjewel 
 

结果会得到以下信息：

xjewel-1.6-1 

4）如果用户得到一个新的RPM文件，却不清楚它的内容；或想了解某个文件包将会在系统里安装那些文件，可以这样做：

1 # rpm -qpi koules-1.2-2.i386.rpm 
