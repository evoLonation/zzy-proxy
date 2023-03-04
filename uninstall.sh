echo "your bash init file: `cat initfile`"
rm /usr/local/bin/clash
rm -r /etc/clash/
rm  /etc/systemd/system/clash.service
# systemctl daemon-reload
sed -i '/alias openproxy/d' `cat initfile`
sed -i '/alias closeproxy/d' `cat initfile`
