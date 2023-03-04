echo "your architecture: ${1}"
echo "your bash init file: ${2}"
echo ${2} > initfile
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
cat addin >> ${2}
