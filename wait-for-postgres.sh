#!/bin/sh
# wait-for-postgres.sh
shift
echo "执行脚本"
until ping -c 1 172.19.0.4 && true; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec "$@"