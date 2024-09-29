#!/bin/bash

# 停止并删除所有容器、网络和镜像
echo "Stopping and removing all containers, networks, and images..."
docker-compose down --rmi all

# 删除所有卷（警告：这将删除所有持久化数据）
echo "Removing all volumes..."
docker-compose down -v

# 清理未使用的 Docker 资源
echo "Pruning unused Docker resources..."
docker system prune -f

# 删除所有未使用的卷
echo "Pruning unused volumes..."
docker volume prume -f

# 检查是否还有遗留的资源
echo "Checking for any remaining resources..."
docker ps -a
docker images
docker volume ls

echo "Cleanup complete. Please manually remove any remaining resources if necessary."
echo "Don't forget to delete the docker-compose.yml file and project directory if needed."