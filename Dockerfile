FROM registry.cn-shenzhen.aliyuncs.com/library/node:12.18.1
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "./"]

# 可选，您也可以将本地的node_modules拷贝进来，而不是制作镜像的过程中再安装依赖，会拖慢镜像的构建。
# RUN COPY node_modules .
RUN npm install --production

COPY . .

# 如果没用pm2，可以不需要docker-entrypoint.sh。
COPY docker-entrypoint.sh /usr/local/bin/

CMD [ "node", "server.js" ]