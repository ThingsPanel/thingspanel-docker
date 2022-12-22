# 本地快速启动项目

## windows环境准备

- **windows电脑安装 [Docker Desktop](https://www.docker.com/products/docker-desktop)**
- **git**

## linux环境准备

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

- **如没有安装git**

    ```bash
    dnf install git -y
    ```

- **使用拉取项目**

    ```bash
    # 拉取docker配置
    git clone https://github.com/ThingsPanel/thingsPanel-go-docker.git
    cd thingsPanel-go-docker
    ```

- **运行项目**

    > 在`thingsPanel-go-docker`目录下(win需要打开`cmd` 窗口)

    ```bash
    # 以日志显示前台方式启动项目(默认账户和密码 super@super.cn 123456)(默认端口8080)
    docker-compose -f docker-compose.yml up
    # 或者以隐藏日志显示的方式启动项目
    docker-compose -f docker-compose.yml up -d
    # 停止服务
    docker-compose -f docker-compose.yml down
    ```

## 挂载说明

- **系统日志、图片等存放目录**

    ```bash
    ./init_files/files
    ```


- **后端配置文件**
    > 可在此处更新和编译代码，编译后重启后端容器

    ```bash
    ./init_files/conf
    ```

## 查看容器运行日志

```bash
docker logs -f containerID
或
./init_files/files/log/
```

## 注意事项

- 端口：

    ```bash
    > 8080（前端服务端口）
    > 9998（tcp端口）
    > 9999（API端口）
    > 1883（mqtt端口）
    > 5432（postogresql端口）
    > 6379（redis端口）
    ```
- 登录

    ```
    输入网址:服务器ip:8080
    输入账户:super@super.cn
    输入密码:123456
    ```
- 设备接入
    http://thingspanel.io/docs/equipment-access/mqtt


## 联系我们

[wiki](http://wiki.thingspanel.cn/index.php?title=%E9%A6%96%E9%A1%B5)

[论坛](http://forum.thingspanel.cn/)

qq群：260150504
