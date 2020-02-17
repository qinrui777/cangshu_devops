

### 1 安装&配置
```
#先安装jdk
yum install -y java-1.8.0-openjdk.x86_64

wget https://pkg.jenkins.io/redhat-stable/jenkins-2.204.2-1.1.noarch.rpm
rpm -ivh jenkins-2.204.2-1.1.noarch.rpm

mkdir /data/jenkins_home

vim /etc/sysconfig/jenkins
```

### 2 启动&停止 服务