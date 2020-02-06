# cangshu_devops
记录仓鼠系统的部署相关，由于系统从简，不建议作为实践案例

### 1-原则：
- 从简、节省成本
- 开源（github，dockerhub）


### 2-分支策略、部分策略

master 主干开发，不同环境均部署master分支的代码镜像

### 3-源代码、镜像仓库
- 源代码

存放于zhaojing的github仓库中（如有权限不够，需要找zhaojing）    
https://github.com/zhaojing?tab=repositories

- 镜像仓库

使用dockerhub (qinrui的dockerhub账号管理,新建了Organizations**cangshuorg**,如果*repo不存*在或*没有push权限*，找**qinrui**）

例子：
`docker push cangshuorg/stockmanagement:tagname`

### 4-服务器、域名等
> 对比aws、aliyun，考虑aliyun性价比较高，当前目标针对中国的业务，所以选择用aliyun

|  环境  |     配置     |    公网IP     | 状态|
|:------| -------------|--------------|----|
|dev(开发环境)|  8G 2c  | 116.62.192.197| 已有|
|prod(生产环境)| 16G 4c |     暂无       | 暂无|

### 5-数据库
已在ECS 安全组规则中放开5432端口，对于连接数据库信息，请参考有关服务器信息和配置文件

- 命令行:
`psql -h 116.62.192.197 -p 5432 -U postgres`

- 图形化界面

### 注意点：
- 1.由于服务器可能重建，公网IP可能会变动
- 2.数据库需要备份




