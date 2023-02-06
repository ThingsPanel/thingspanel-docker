# ThingsPanel版本升级（docker部署版本）

## 备份

根据情况备份数据（待更新）

## 第一步：数据库升级

### 增量脚本拷贝

步骤：

1. 查看ThingsPanel-Go仓库TP.sql文件末尾，找到升级版本的增量sql，单独做成文件Ver.sql传到数据库容器中。
2. 执行下面命令将文件传入数据库容器中。

```bash
docker cp /home/tp/Ver.sql timescale:latest-pg12:/var/tmp
```

命令说明：docker cp 宿主机文件/路径 容器名或容器id：容器内路径。

### 进入容器

docker exec -it ContainerID /bin/bash

### 执行sql脚本

psql -d ThingsPanel -U postgres -f /var/tmp/Ver.sql

## 第二步：应用升级（前端thingspanel-vue、后端thingspanel-go）

### 更新thingspanel-docker源码

1. 查看旧版本thingspanel-docker中的docker-compose.yml文件，与要升级的版本比对哪些镜像升级了(检查项)。
1. 在thingspanel-docker源码主目录下执行git pull命令更新最新版本或指定版本

### 停止旧的容器容器(前端和后端)

```bash
docker stop ContainerID
```

### 升级

在thingspanel-docker源码主目录下执行下面命令升级：

```bash
docker-compose -f docker-compose.yml up
```

## gmqtt镜像升级(待更新)

## 规则引擎镜像升级（待更新）

## 联系我们

如升级有疑问请加群咨询
QQ群2：371794256
