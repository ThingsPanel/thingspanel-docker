# ThingsPanel版本升级（docker部署版本）

## 注意
0.5.4->1.0.0是无法升级的
## 备份

根据情况备份数据（待更新）

## 部分容器升级（前端、后端、mqtt服务）
容器对应的卷名
```
thingspanel-vue:nginx
thingspanel-gmqtt:gmqtt
thingspanel-go:go
```
1. thingspanel-docker目录下更新thingspanel-docker源码:git pull
2. 停止目标容器:docker stop ContainerID，删除目标容器:docker rm ContainerID，删除目标镜像:docker rmi ImageID
3. 删除目标容器的卷：
   1. 清理没有使用的卷：docker volume prune
   2. 查验卷有没有被清理：docker volume ls
   3. 如果没有便删除卷：docker volume rm 卷名（thingspanel-docker_gmqtt，thingspanel-docker_go，thingspanel-docker_nginx）
4. 执行：docker-compose -f docker-compose.yml up  
   注意如果镜像和升级的目标镜像相同，需要删除服务器上的镜像重新拉取
## 全部升级

### 第一步：应用升级（前端thingspanel-vue、后端thingspanel-go）

#### 更新thingspanel-docker源码

1. 查看旧版本thingspanel-docker中的docker-compose.yml文件，与要升级的版本比对哪些镜像升级了(检查项)。
1. 在thingspanel-docker源码主目录下执行git pull命令更新最新版本或指定版本

#### 停止旧的容器容器(前端和后端)

```bash
docker stop ContainerID
```

### 升级

在thingspanel-docker源码主目录下执行下面命令升级：

```bash
docker-compose -f docker-compose.yml up
```

## 修改卷里的配置（应用程序会优先使用环境变量，如配置不生效，请qq联系我们）

1. 找到对应的卷名
```
docker volume ls
```
2. 查看卷在宿主机的路径,
```
docker volume inspect
```
3.
## 联系我们

感谢您的使用和支持，如升级有疑问请加群咨询，加qq群请备注需要咨询的问题，我们会在通过的第一时间回复您问题
QQ群2：371794256
