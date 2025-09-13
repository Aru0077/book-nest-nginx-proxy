FROM nginx:alpine

# 复制nginx主配置文件
COPY nginx.conf /etc/nginx/nginx.conf

# 复制站点配置文件
COPY conf.d/ /etc/nginx/conf.d/

# 创建SSL证书目录
RUN mkdir -p /etc/nginx/ssl

# 复制SSL证书（如果有的话）
COPY ssl/ /etc/nginx/ssl/

# 设置正确的文件权限
RUN chmod -R 644 /etc/nginx/ssl/

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]