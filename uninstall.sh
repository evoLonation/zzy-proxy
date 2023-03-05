echo "your bash init file: `cat initfile`"
systemctl stop clash
rm  /etc/systemd/system/clash.service
systemctl daemon-reload
rm /usr/local/bin/clash
rm -r /etc/clash/
sed -i '/alias openproxy/d' `cat initfile`
sed -i '/alias closeproxy/d' `cat initfile`
sed -i '/openproxy/d' `cat initfile`
sed -i '/http_proxy/d' /etc/sudoers