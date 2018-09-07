useradd zhaoxueqing -d /home/zhaoxueqing -g zhaoxueqing  -G root,zhaoxueqing  #添加一个用户并设置用户属组
sudo useradd zhaoxueqing -m -s /bin/bash 
-g, --gid gid
  The group name or number of the user's main group. The group name or number must refer to an already existing group.  If not specified, the default from /etc/default/useradd is used.
-G, --groups group,...
  With this option a list of supplementary groups can be specified, which the user should become a member of. Each group is separated from the next one only by a comma, without whites-
  pace.  If not specified, the default from /etc/default/useradd is used.
-m, --create-home
  Create home directory for new user account
-s, --shell  shell
  Specify user's login shell. The default for normal user accounts is taken from /etc/default/useradd, the default for system accounts is /bin/false.


userdel -r zhaoxueqing  #彻底删除一个用户
