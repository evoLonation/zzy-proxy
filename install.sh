#!/bin/bash
arch=${1}
user=${2}
if [ $USER != "root" ]; then
	echo "this script must executed by root, now is ${USER}"
	exit
fi
if [ -z $2 ]; then 
	echo "usage: ${0} arch user"
	exit
fi
initfile=`. ./getinitfile.sh ${user}`
echo "your architecture: ${arch}"
echo "your user: ${user}"
echo "your initfile: ${initfile}"
exit
gunzip -k clash-linux-${1}-v1.13.0.gz
mkdir -p /usr/local/bin
mv -T clash-linux-${1}-v1.13.0 /usr/local/bin/clash
chmod +x /usr/local/bin/clash
mkdir -p /etc/clash
cp config.yaml /etc/clash/
cp Country.mmdb /etc/clash/
mkdir -p /etc/clash/clash-dashboard
cp -r clash-dashboard /etc/clash/
cp clash.service /etc/systemd/system/
systemctl daemon-reload
systemctl start clash.service
systemctl enable clash.service
cat addin >> ${2}
sed -i '/http_proxy/d' /etc/sudoers
echo "Defaults env_keep += \"http_proxy https_proxy no_proxy\"" >> /etc/sudoers