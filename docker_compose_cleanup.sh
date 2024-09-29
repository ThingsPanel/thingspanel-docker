#!/bin/bash

set -e

echo "开始 Docker Compose 清理过程..."

# 检查 docker-compose.yml 文件是否存在
if [ ! -f "docker-compose.yml" ]; then
    echo "错误：当前目录中未找到 docker-compose.yml 文件。"
    exit 1
fi

# 创建一个临时的 docker-compose 文件，移除所有 healthcheck 配置
echo "正在创建临时 docker-compose 文件（忽略 healthcheck 配置）..."
sed '/healthcheck:/,/^[^ ]/d' docker-compose.yml > docker-compose-temp.yml

# 使用临时文件进行清理操作
echo "正在停止并删除所有容器、网络和镜像..."
docker-compose -f docker-compose-temp.yml down --rmi all

echo "正在删除所有卷（警告：这将删除所有持久化数据）..."
docker-compose -f docker-compose-temp.yml down -v

# 删除临时文件
rm docker-compose-temp.yml

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
echo "注意：本次清理忽略了 docker-compose.yml 中的 healthcheck 配置。"