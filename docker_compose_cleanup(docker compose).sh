#!/bin/bash

echo "开始 Docker Compose 项目完整清理过程..."

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

# 停止并删除所有容器
run_command "docker compose down --remove-orphans"

# 删除项目相关的卷
run_command "docker compose down -v"

# 删除项目使用的镜像
run_command "docker compose down --rmi all"

# 删除主机上映射的数据目录
echo "正在删除主机上映射的数据目录..."
data_dirs=$(grep -E '^\s*-\s*\./.+:/.*' docker-compose.yml | awk '{print $2}' | cut -d':' -f1)
for dir in $data_dirs; do
    if [ -d "$dir" ]; then
        echo "删除目录: $dir"
        run_command "rm -rf $dir"
    fi
done

# 特别处理 data 目录
if [ -d "./data" ]; then
    echo "删除 ./data 目录"
    run_command "rm -rf ./data"
fi

echo "正在检查是否还有遗留的项目资源..."
echo "项目容器："
docker-compose ps
echo "项目卷："
docker volume ls --filter name=$(basename $(pwd))
echo "项目网络："
docker network ls --filter name=$(basename $(pwd))

echo "清理完成。"
echo "警告：此脚本已删除 docker-compose.yml 中定义的本地数据目录。请确保您不再需要这些数据。"
echo "如果仍有剩余资源，可能需要手动删除。"
echo "注意：如果清理过程中出现错误，可能是由于 docker-compose.yml 文件中的配置问题。"
echo "请检查并修复 docker-compose.yml 文件中的任何配置错误。"