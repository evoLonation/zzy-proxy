#!/bin/bash
# 开启docker的代理功能
if [ $USER != "root" ]; then
	echo "this script must executed by root, now is ${USER}"
	exit
fi
mkdir -p /etc/systemd/system/docker.service.d
cat > /etc/systemd/system/docker.service.d/http-proxy.conf <<EOF
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:7890"
Environment="HTTPS_PROXY=http://127.0.0.1:7890"
Environment="NO_PROXY=localhost,127.0.0.1" # 可选，绕过代理
EOF
systemctl daemon-reload
systemctl restart docker
systemctl show --property=Environment docker
