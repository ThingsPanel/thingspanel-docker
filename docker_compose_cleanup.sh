#!/bin/bash

echo "开始 Docker Compose 项目清理过程..."

# 检查 docker-compose.yml 文件是否存在
if [ ! -f "docker-compose.yml" ]; then
    echo "错误：当前目录中未找到 docker-compose.yml 文件。"
    exit 1
fi

# 函数：执行命令并继续，即使命令失败
run_command() {
    echo "执行: $1"
    $1 || echo "警告: 命令 '$1' 失败，但继续执行脚本。"
}

# 尝试停止所有项目相关的容器
run_command "docker-compose stop"

# 尝试删除项目相关的容器
run_command "docker-compose rm -f"

# 尝试删除项目相关的卷
run_command "docker-compose down -v"

# 尝试删除项目相关的网络
run_command "docker-compose down --remove-orphans"

# 尝试删除项目使用的镜像
run_command "docker-compose down --rmi all"

echo "正在检查是否还有遗留的项目资源..."
echo "项目容器："
docker-compose ps
echo "项目卷："
docker volume ls --filter name=$(basename $(pwd))
echo "项目网络："
docker network ls --filter name=$(basename $(pwd))

echo "清理完成。如有剩余资源，可能需要手动删除。"
echo "注意：如果清理过程中出现错误，可能是由于 docker-compose.yml 文件中的配置问题。"
echo "请检查并修复 docker-compose.yml 文件中的任何配置错误。"