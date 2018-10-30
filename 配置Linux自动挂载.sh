使用mount命令来挂载硬件，在Linux重启后这些挂载信息会丢失，因此对应磁盘这类硬件，需要配置自动挂载来保证系统重启时进行自动挂载。

自动挂载信息保存在文件/etc/fstab文件中

查看该文件的数据：

root@localhost dev]# cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Wed May 25 13:45:06 2016
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/centos-root /                       xfs     defaults        1 1
UUID=323ea65e-97e7-4935-876c-c73fb83994d5 /boot                   xfs     defaults        1 2
/dev/mapper/centos-swap swap                    swap    defaults        0 0

每条记录对应一个挂载，每条记录有六个字段，分别存储信息为：

第一列可以是实际分区名，也可以是实际分区的卷标（Lable）。
如果磁盘是SATA接口，且有多个磁盘，则每个磁盘被标记为 /dev/hda 、 /dev/hdb、 /dev/hdc 等以此类推；而每个磁盘的分区被标记为 /dev/hda1、 /dev/hda2等。
如果磁盘是SCSI类型，则多个磁盘会被分别标记为 /dev/sda、/dev/sdb等等。分区同理。
如果使用标签来表示，则格式如：
1 LABLE=/ 
 
第二列是挂载点。
挂载点必须为当前已经存在的目录，为了兼容起见，最好在创建需要挂载的目标目录后，将其权限设置为777，以开放所有权限。
 
第三列为此分区的文件系统类型。
Linux可以使用ext2、ext3等类型，此字段须与分区格式化时使用的类型相同。也可以使用 auto 这一特殊的语法，使系统自动侦测目标分区的分区类型。auto通常用于可移动设备的挂载。
 
第四列是挂载的选项，用于设置挂载的参数。
常见参数如下：
auto: 系统自动挂载，fstab默认就是这个选项
defaults: rw, suid, dev, exec, auto, nouser, and async.
noauto 开机不自动挂载
nouser 只有超级用户可以挂载
ro 按只读权限挂载
rw 按可读可写权限挂载
user 任何用户都可以挂载
请注意光驱和软驱只有在装有介质时才可以进行挂载，因此它是noauto

第五列是dump备份设置。
当其值设置为1时，将允许dump备份程序备份；设置为0时，忽略备份操作；

第六列是fsck磁盘检查设置。
其值是一个顺序。当其值为0时，永远不检查；而 / 根目录分区永远都为1。其它分区从2开始，数字越小越先检查，如果两个分区的数字相同，则同时检查。

通常用户自动挂载的分区，第六列值应设置为2而不应该为1。

 

修改完成后，可以使用下面命令来加载测试：

## 重新加载/etc/fstab
mount -a

 

如果修改/ect/fstab出现错误，导致自动挂载失败，可以本地登录到该服务器上，由于挂载失败，配置文件所在的分区没有被挂载成读写模式，因此需要先对根目录进行重新挂载

## 重新挂载配置文件，以解决挂载配置文件只读的问题
mount -o remount,rw /

 

然后修改挂载配置文件，并保存和重新挂载。
