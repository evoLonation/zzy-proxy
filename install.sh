echo "your architecture: ${1}"
echo "your bash init file: ${2}"
cat ${2} > initfile
gunzip clash-linux-${1}-v1.13.0.gz
mv -T clash-linux-${1}-v1.13.0.gz /usr/local/bin/clash
cp config.yaml /etc/clash/
cp Country.mmdb /etc/clash/
cp -r clash-dashborad /etc/clash/clash-dashboard
cp clash.service /etc/systemd/system/
systemctl daemon-reload
systemctl start clash.service
cat addin >> ${2}
