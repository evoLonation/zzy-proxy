#!/bin/bash
user=${1}
if [ $USER != "root" ]; then
	echo "this script must executed by root, now is ${USER}"
	exit
fi
if [ -z $1 ]; then 
	echo "usage: ${0} user"
	exit
fi
initfile=`. ./getinitfile.sh ${user}`
echo "your bash init file: ${initfile}"
systemctl stop clash
rm  /etc/systemd/system/clash.service
systemctl daemon-reload
rm /usr/local/bin/clash
rm -r /etc/clash/
sed -i '/alias openproxy/d'  ${initfile}
sed -i '/alias closeproxy/d'  ${initfile}
sed -i '/openproxy/d'  ${initfile}
sed -i '/http_proxy/d' /etc/sudoers