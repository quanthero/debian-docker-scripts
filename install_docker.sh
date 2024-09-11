#!/bin/bash

# 安装 Docker
wget -qO- get.docker.com | bash

# 设置 Docker 开机自动启动
systemctl enable docker

# 修改 Docker 配置
cat > /etc/docker/daemon.json <<EOF
{
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "20m",
        "max-file": "3"
    },
    "ipv6": true,
    "fixed-cidr-v6": "fd00:dead:beef:c0::/80",
    "experimental":true,
    "ip6tables":true
}
EOF

# 重启 Docker 服务
systemctl restart docker
