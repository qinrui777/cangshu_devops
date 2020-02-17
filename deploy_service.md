# 在新节点/服务器上部署服务


参考文档：https://github.com/zhaojing/openlmis-ref-distro

##### Step1 服务器的初始化工作
```bash
yum install -y git docker docker-compose postgresql

systemctl start docker

mkdir /data

cd /data && git clone https://github.com/zhaojing/openlmis-ref-distro

# 添加 镜像加速器
#https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors

#拉取镜像过程较慢
cd openlmis-ref-distro && docker-compose pull
```

##### Step2 项目配置

```bash
cd openlmis-ref-distro
cp settings-sample.env settings.env
#修改settings.env文件
sed -i 's/192.168.1.102/<YPUR_IP>/g' settings.env
```

##### Step3 启动服务
`docker-compose up -d`

**并登录网页，验证相关功能**





