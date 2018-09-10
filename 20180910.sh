#我使用java -jar jenkins.war --httpPort=9999启动后一旦退出就自动停止了，有没有办法让她后台运行
nohup java -jar jenkins.war --httpPort=9999 &
