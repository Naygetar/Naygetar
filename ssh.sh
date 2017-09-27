#/bin/bash

rm ip.ip 2> /dev/null
clear

cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/	//' > /etc/so
echo " "
echo " ทำงานบนระบบปฏิบัติการ : $(cat /etc/so)"
os=$(cat /etc/so)
echo " กรุณาระบุไอพีของคุณ" ; read ip
clear
echo " "
echo " Source by Naygetar"
echo " ทำงานบนระบบปฏิบัติการ : $(cat /etc/so)"
echo " ไอพีของคุณคือ : $ip"
echo " Proxy Port : 80, 8080, 3128"
echo " "

if cat /etc/so |grep -i ubuntu |grep 16 1> /dev/null 2> /dev/null ; then
echo " กำลังติดตั้ง...กรุณารอสักครู่"
apt-get update 1> /dev/null 2> /dev/null
apt-get install squid3 -y 1> /dev/null 2> /dev/null
apt-get install ufw -y 1> /dev/null 2> /dev/null

service apache2 stop 1> /dev/null 2> /dev/null

rm /etc/ssh/sshd_custom 1>/dev/null 2>/dev/null
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cat /etc/ssh/sshd_config |grep -v -i allowusers |grep -v -i passwordauthen |grep -v -i uselogin |grep -v -i permitrootlogin |grep -v -i permittunnel >> /etc/ssh/sshd_custom
rm /etc/ssh/sshd_config
cp /etc/ssh/sshd_custom /etc/ssh/sshd_config
sleep 1s
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "Port 443" >> /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PermitTunnel yes" >> /etc/ssh/sshd_config
echo "UseDns no" >> /etc/ssh/sshd_config

service ssh restart 1> /dev/null 2> /dev/null

cd /etc/squid
echo "http_port 80" > squid.conf
echo "http_port 8080" >> squid.conf
echo "http_port 3128" >> squid.conf
echo "visible_hostname 2dth" >> squid.conf
echo "acl ip dstdomain $ip" >> squid.conf
echo "acl accept method GET" >> squid.conf
echo "acl accept method POST" >> squid.conf
echo "acl accept method OPTIONS" >> squid.conf
echo "acl accept method CONNECT" >> squid.conf
echo "acl accept method PUT" >> squid.conf
echo "acl HEAD method HEAD" >> squid.conf
echo "http_access allow ip" >> squid.conf
echo "http_access allow accept" >> squid.conf
echo "http_access allow HEAD" >> squid.conf
echo "http_access deny all" >> squid.conf

service squid restart 1> /dev/null 2> /dev/null

ufw allow 443 1>/dev/null 2>/dev/null
ufw allow 80 1>/dev/null 2>/dev/null
ufw allow 8080 1>/dev/null 2>/dev/null
ufw allow 3128 1>/dev/null 2>/dev/null

cd
wget https://github.com/dftykmcftyhsawolb/Extra/raw/master/SSH/Extra-Script.tar.gz
cp -r /root/Extra-Script.tar.gz /usr/local/bin
cd /usr/local/bin
tar -xvf  Extra-Script.tar.gz
rm -f Extra-Script.tar.gz
chmod +x /usr/local/bin/benchmark
chmod +x /usr/local/bin/menu
chmod +x /usr/local/bin/speedtest
chmod +x /usr/local/bin/user-add
chmod +x /usr/local/bin/user-change-date
chmod +x /usr/local/bin/user-change-password
chmod +x /usr/local/bin/user-delete
chmod +x /usr/local/bin/user-list
chmod +x /usr/local/bin/user-login
chmod +x /usr/local/bin/user-login-limit
cd
clear
echo " Source by Naygetar"
echo " ทำงานบนระบบปฏิบัติการ : $(cat /etc/so)"
echo " ไอพีของคุณคือ : $ip"
echo " Proxy Port : 80, 8080, 3128"
echo " "
echo "----------  กรุณาป้อนคำสั่ง menu เพื่อไปยังขั้นตอนต่อไป  ----------"
echo " "
exit 0
fi

if cat /etc/so |grep -i ubuntu 1> /dev/null 2> /dev/null ; then
echo " กำลังติดตั้ง... กรุณารอสักครู่"
apt-get update 1> /dev/null 2> /dev/null
apt-get install squid3 -y 1> /dev/null 2> /dev/null
apt-get install ufw -y 1> /dev/null 2> /dev/null

service apache2 stop 1> /dev/null 2> /dev/null

rm /etc/ssh/sshd_custom 1>/dev/null 2>/dev/null
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cat /etc/ssh/sshd_config |grep -v -i allowusers |grep -v -i passwordauthen |grep -v -i uselogin |grep -v -i permitrootlogin |grep -v -i permittunnel >> /etc/ssh/sshd_custom
rm /etc/ssh/sshd_config
cp /etc/ssh/sshd_custom /etc/ssh/sshd_config
sleep 1s
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "Port 443" >> /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PermitTunnel yes" >> /etc/ssh/sshd_config
echo "UseDns no" >> /etc/ssh/sshd_config

service ssh restart 1> /dev/null 2> /dev/null

cd /etc/squid3
echo "http_port 80" > squid.conf
echo "http_port 8080" >> squid.conf
echo "http_port 3128" >> squid.conf
echo "visible_hostname 2dth" >> squid.conf
echo "acl ip dstdomain $ip" >> squid.conf
echo "acl accept method GET" >> squid.conf
echo "acl accept method POST" >> squid.conf
echo "acl accept method OPTIONS" >> squid.conf
echo "acl accept method CONNECT" >> squid.conf
echo "acl accept method PUT" >> squid.conf
echo "acl HEAD method HEAD" >> squid.conf
echo "http_access allow ip" >> squid.conf
echo "http_access allow accept" >> squid.conf
echo "http_access allow HEAD" >> squid.conf
echo "http_access deny all" >> squid.conf

ufw allow 443 1>/dev/null 2>/dev/null
ufw allow 80 1>/dev/null 2>/dev/null
ufw allow 8080 1>/dev/null 2>/dev/null
ufw allow 3128 1>/dev/null 2>/dev/null

service squid3 restart 1> /dev/null 2> /dev/null

cd
wget https://github.com/dftykmcftyhsawolb/Extra/raw/master/SSH/Extra-Script.tar.gz
cp -r /root/Extra-Script.tar.gz /usr/local/bin
cd /usr/local/bin
tar -xvf  Extra-Script.tar.gz
rm -f Extra-Script.tar.gz
chmod +x /usr/local/bin/benchmark
chmod +x /usr/local/bin/menu
chmod +x /usr/local/bin/speedtest
chmod +x /usr/local/bin/user-add
chmod +x /usr/local/bin/user-change-date
chmod +x /usr/local/bin/user-change-password
chmod +x /usr/local/bin/user-delete
chmod +x /usr/local/bin/user-list
chmod +x /usr/local/bin/user-login
chmod +x /usr/local/bin/user-login-limit
cd
clear
echo " Source by Naygetar"
echo " ทำงานบนระบบปฏิบัติการ : $(cat /etc/so)"
echo " ไอพีของคุณคือ : $ip"
echo " Proxy Port : 80, 8080, 3128"
echo " "
echo "----------  กรุณาป้อนคำสั่ง menu เพื่อไปยังขั้นตอนต่อไป  ----------"
echo " "
exit 0
fi

if cat /etc/so |grep -i centos 1> /dev/null 2> /dev/null ; then
echo "กำลังติดตั้ง...กรุณารอสักครู่"
yum update 1> /dev/null 2> /dev/null
yum install squid -y 1> /dev/null 2> /dev/null

service httpd stop 1> /dev/null 2> /dev/null

rm /etc/ssh/sshd_custom 1>/dev/null 2>/dev/null
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cat /etc/ssh/sshd_config |grep -v -i allowusers |grep -v -i passwordauthen |grep -v -i uselogin |grep -v -i permitrootlogin |grep -v -i permittunnel >> /etc/ssh/sshd_custom
rm /etc/ssh/sshd_config
cp /etc/ssh/sshd_custom /etc/ssh/sshd_config
sleep 1s
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "Port 443" >> /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PermitTunnel yes" >> /etc/ssh/sshd_config
echo "UseDns no" >> /etc/ssh/sshd_config

service sshd restart 1> /dev/null 2> /dev/null

cd /etc/squid
echo "http_port 80" > squid.conf
echo "http_port 8080" >> squid.conf
echo "http_port 3128" >> squid.conf
echo "visible_hostname 2dth" >> squid.conf
echo "acl ip dstdomain $ip" >> squid.conf
echo "acl accept method GET" >> squid.conf
echo "acl accept method POST" >> squid.conf
echo "acl accept method OPTIONS" >> squid.conf
echo "acl accept method CONNECT" >> squid.conf
echo "acl accept method PUT" >> squid.conf
echo "acl HEAD method HEAD" >> squid.conf
echo "http_access allow ip" >> squid.conf
echo "http_access allow accept" >> squid.conf
echo "http_access allow HEAD" >> squid.conf
echo "http_access deny all" >> squid.conf

service squid restart 1> /dev/null 2> /dev/null

ufw allow 443 1>/dev/null 2>/dev/null
ufw allow 80 1>/dev/null 2>/dev/null
ufw allow 8080 1>/dev/null 2>/dev/null
ufw allow 3128 1>/dev/null 2>/dev/null

cd
wget https://github.com/dftykmcftyhsawolb/Extra/raw/master/SSH/Extra-Script.tar.gz
cp -r /root/Extra-Script.tar.gz /usr/local/bin
cd /usr/local/bin
tar -xvf  Extra-Script.tar.gz
rm -f Extra-Script.tar.gz
chmod +x /usr/local/bin/benchmark
chmod +x /usr/local/bin/menu
chmod +x /usr/local/bin/speedtest
chmod +x /usr/local/bin/user-add
chmod +x /usr/local/bin/user-change-date
chmod +x /usr/local/bin/user-change-password
chmod +x /usr/local/bin/user-delete
chmod +x /usr/local/bin/user-list
chmod +x /usr/local/bin/user-login
chmod +x /usr/local/bin/user-login-limit
cd
clear
echo " Source by Naygetar"
echo " ทำงานบนระบบปฏิบัติการ : $(cat /etc/so)"
echo " ไอพีของคุณคือ : $ip"
echo " Proxy Port : 80, 8080, 3128"
echo " "
echo "----------  กรุณาป้อนคำสั่ง menu เพื่อไปยังขั้นตอนต่อไป  ----------"
echo " "
exit
fi

if cat /etc/so |grep -i debian 1> /dev/null 2> /dev/null ; then
echo "กำลังติดตั้ง...กรุณารอสักครู่"
apt-get update 1> /dev/null 2> /dev/null
apt-get install squid3 -y 1> /dev/null 2> /dev/null
service apache2 stop 1> /dev/null 2> /dev/null
apt-get install ufw -y 1> /dev/null 2> /dev/null

rm /etc/ssh/sshd_custom 1>/dev/null 2>/dev/null
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cat /etc/ssh/sshd_config |grep -v -i allowusers |grep -v -i passwordauthen |grep -v -i uselogin |grep -v -i permitrootlogin |grep -v -i permittunnel >> /etc/ssh/sshd_custom
rm /etc/ssh/sshd_config
cp /etc/ssh/sshd_custom /etc/ssh/sshd_config
sleep 1s
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "Port 443" >> /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PermitTunnel yes" >> /etc/ssh/sshd_config

service ssh restart 1> /dev/null 2> /dev/null

cd /etc/squid3

echo "http_port 80" > squid.conf
echo "http_port 8080" >> squid.conf
echo "http_port 3128" >> squid.conf
echo "visible_hostname 2dth" >> squid.conf
echo "acl ip dstdomain $ip" >> squid.conf
echo "acl accept method GET" >> squid.conf
echo "acl accept method POST" >> squid.conf
echo "acl accept method OPTIONS" >> squid.conf
echo "acl accept method CONNECT" >> squid.conf
echo "acl accept method PUT" >> squid.conf
echo "acl HEAD method HEAD" >> squid.conf
echo "http_access allow ip" >> squid.conf
echo "http_access allow accept" >> squid.conf
echo "http_access allow HEAD" >> squid.conf
echo "http_access deny all" >> squid.conf

service squid3 restart 1> /dev/null 2> /dev/null

ufw allow 443 1>/dev/null 2>/dev/null
ufw allow 80 1>/dev/null 2>/dev/null
ufw allow 8080 1>/dev/null 2>/dev/null
ufw allow 3128 1>/dev/null 2>/dev/null

cd
wget https://github.com/Naygetar/Naygetar/blob/master/script.tar.gz
cp -r /root/script.tar.gz /usr/local/bin
cd /usr/local/bin
tar -xvf script.tar.gz
rm -f script.tar.gz
chmod +x /usr/local/bin/benchmark
chmod +x /usr/local/bin/menu
chmod +x /usr/local/bin/speedtest
chmod +x /usr/local/bin/user-add
chmod +x /usr/local/bin/user-change-date
chmod +x /usr/local/bin/user-change-password
chmod +x /usr/local/bin/user-delete
chmod +x /usr/local/bin/user-list
chmod +x /usr/local/bin/user-login
chmod +x /usr/local/bin/user-login-limit
cd

clear
echo " Source by Naygetar"
echo " ทำงานบนระบบปฏิบัติการ : $(cat /etc/so)"
echo " ไอพีของคุณคือ : $ip"
echo " Proxy Port : 80, 8080, 3128"
echo " "
echo "----------  กรุณาป้อนคำสั่ง menu เพื่อไปยังขั้นตอนต่อไป  ----------"
echo " "
exit 0
fi
