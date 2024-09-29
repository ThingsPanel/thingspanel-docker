#!/bin/bash

set -e

echo "开始 Docker Compose 清理过程..."

# 检查 docker-compose.yml 文件是否存在
if [ ! -f "docker-compose.yml" ]; then
    echo "错误：当前目录中未找到 docker-compose.yml 文件。"
    exit 1
fi

# 停止并删除所有容器、网络和镜像
echo "正在停止并删除所有容器、网络和镜像..."
docker-compose down --rmi all

# 删除所有卷（警告：这将删除所有持久化数据）
echo "正在删除所有卷（警告：这将删除所有持久化数据）..."
docker-compose down -v

# 清理未使用的 Docker 资源
echo "正在清理未使用的 Docker 资源..."
docker system prune -f

# 删除所有未使用的卷
echo "正在删除所有未使用的卷..."
docker volume prune -f

# 检查是否还有遗留的资源
echo "正在检查是否还有遗留的资源..."
echo "容器："
docker ps -a
echo "镜像："
docker images
echo "卷："
docker volume ls

echo "清理完成。如有必要，请手动删除任何剩余的资源。"
echo "别忘了删除 docker-compose.yml 文件和项目目录（如果需要的话）。"