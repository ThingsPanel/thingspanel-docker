# 本地快速启动项目

## windows环境准备

- **windows电脑安装 [Docker Desktop](https://www.docker.com/products/docker-desktop)**
- **git**

## linux环境准备

- 需要先安装好Docker（[安装docker社区版](https://docs.docker.com/engine/installation/)）
- DockerCompose（[安装Docker Compose](https://docs.docker.com/compose/install/)）
- Git

以官网安装文档为准，以下可供部分linux系统参考

- **安装docker**

    ```bash
    dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    dnf install docker-ce docker-ce-cli containerd.io
    systemctl start docker.service
    systemctl enable docker.service
    ```

- **安装docker-compose**

    ```bash
    curl -L "https://github.com/docker/compose/releases/download/v2.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ```

    如果下载太慢可替换

    ```bash
    curl -L https://get.daocloud.io/docker/compose/releases/download/v2.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ```

- **如没有安装git**

    ```bash
    dnf install git -y
    ```

## 安装ThingsPanel

- **使用拉取项目**
  
    Github地址：

    ```bash
    # 拉取docker配置
    git clone https://github.com/ThingsPanel/thingspanel-docker.git
    cd thingspanel-docker
    ```

    Gitee地址：

    ```bash
    git clone https://gitee.com/ThingsPanel/thingspanel-docker.git
    cd thingspanel-docker
    ```

- **运行项目**

    > 在`thingsPanel-go-docker`目录下(win需要打开`cmd` 窗口)
    以下三个命令根据情况选一个执行

    ```bash
    # 以日志显示前台方式启动项目(默认账户和密码 super@super.cn 123456)(默认端口8080)
    docker-compose -f docker-compose.yml up
    # 或者以隐藏日志显示的方式启动项目
    docker-compose -f docker-compose.yml up -d
    # 停止服务
    docker-compose -f docker-compose.yml down
    ```

## 挂载说明

- docker volume ls可查看数据卷

## 查看容器运行日志

```bash showLineNumbers
docker logs -f containerID

## 注意事项

端口：

```bash
8080（前端服务端口）
9999（后端API端口）
1883（mqtt端口）
6379（redis端口）
```

- 登录

    ```text
    输入网址:服务器ip:8080
    输入账户:super@super.cn
    输入密码:123456
    ```

- 各种协议类型设备的接入
    <http://thingspanel.io/docs/equipment-access/mqtt>

## 联系我们

安装过程碰到任何问题请联系我们
qq群1：260150504
qq群2：371794256
