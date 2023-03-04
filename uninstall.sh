echo "your bash init file: ${1}"
rm /usr/local/bin/clash
rm -r /etc/clash/
rm  /etc/systemd/system/clash.service
systemctl daemon-reload
sed -i -f addin `cat initfile`
