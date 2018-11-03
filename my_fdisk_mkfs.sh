fdisk -l    #查看所有分区 && $df -h
fdisk /dev/sdc    #设备为/dev/sdc，进入fdisk操作平台，根据提示进行操作
 
mkfs.ext3 /dev/sdc3    #格式化分区，mkfs.ext3指定格式化为linux数据
