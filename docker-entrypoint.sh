#!/bin/sh
# https://github.com/nodejs/docker-node/blob/main/docker-entrypoint.sh
set -e

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi

# 启动命令前先清理部分对Node.js无用的环境变量，避免部分框架（PM2等）因为环境变量过长而导致系统崩溃。
echo "remove options"
unset JAVA_TOOL_OPTIONS

exec "$@"