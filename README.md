# cangshu_devops
记录仓鼠系统的部署相关，由于系统从简，不建议作为实践案例

### 1-原则：
- 从简、节省成本
- 开源（github，dockerhub）


### 2-分支策略、部署策略

master 主干开发，不同环境均部署master分支的代码镜像

- 更新 *reference-ui* 具体步骤如下

```bash
#step1 先登录服务器
ssh xxx 
#step2 进入目录,以dev环境为例
cd /data/openlmis-ref-distro
#step3 修改 .env 文件中的 reference-ui 版本号

#step4 重启reference-ui
docker-compose up --no-deps --force-recreate -d reference-ui
```

### 3-源代码、镜像仓库
- 源代码

存放于zhaojing的github仓库中（如有权限不够，需要找zhaojing）    
https://github.com/zhaojing?tab=repositories

- 镜像仓库

使用dockerhub (qinrui的dockerhub账号管理,新建了Organizations**cangshuorg**,如果*repo不存*在或*没有push权限*，找**qinrui**）

推送镜像具体步骤见：[Google drive](https://drive.google.com/drive/folders/1xDmQil60169Eremz9r79-CvkgOW6lhj0)

例子：
`docker push cangshuorg/stockmanagement:tagname`

### 4-服务器、域名等
> 对比aws、aliyun，考虑aliyun性价比较高，当前目标针对中国的业务，所以选择用aliyun

|  环境  |     配置     |    公网IP     | 状态|
|:------| -------------|--------------|----|
|dev(开发环境)|  8G 2c  | 116.62.192.197| 已有|
|prod(生产环境)| 16G 4c |     暂无       | 暂无|

### 5-数据库
*已在ECS 安全组规则中放开5432端口，对于连接数据库信息，请参考有关服务器信息和配置文件*


##### 1-连接
- 命令行:
`psql -h 116.62.192.197 -p 5432 -U postgres`

- 图形化界面 - 略

##### 2-数据库备份

`pg_dump -h 116.62.192.197 -p 5432 -U postgres -d open_lmis | gzip > /<YOUR_APTH>/backup/`date +%Y%m%d%H`_dev_pg.gz`

脚本见 `scripts/backup_db.sh`

##### 3-数据库恢复

- 1. 先 drop table
> 找dev同学

- 2. 利用备份文件恢复

`gunzip -c db-20191023.gz | psql -h localhost -d open_lmis -U postgres`

或

```bash
#直接解压,不保留原gz文件
gunzip xxx.gz
#解压保留源gz文件
gunzip -c xxx.gz > xxx.sql
#进去pgsql控制台
psql -U dbUser
#切换到待导入的数据库
\c dbName;
#导入sql文件
\i xxx.sql
#退出控制台
\q
```

---
### 注意点：
- 1.由于服务器可能重建，公网IP可能会变动
- 2.数据库需要备份
