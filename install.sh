apt-get install software-properties-common -y && add-apt-repository ppa:ondrej/php && apt-get update && apt-get upgrade -y
apt-get install lsb-release nscd curl php5.6 php5.6-mysql php5.6-cli php5.6-curl unzip -y && apt-get install php5.6-mcrypt -y &&  phpenmod mcrypt
service apache2 restart
service mysql start
wget https://www.dropbox.com/s/hysh4j47rc8dzna/www_dir.tar.gz -O /tmp/www_dir.tar.gz
#
if [ -d /var/www/html ];
then
    echo "/var/www/html/ existiert."
	tar -zxvf /tmp/www_dir.tar.gz -C /var/www/html/
	tar -zxvf /tmp/www_dir.tar.gz -C /var/www/
else
    echo " "
	if [ -d /root/www/ ];
	then
    echo "/var/www/ existiert"
    	tar -zxvf /tmp/www_dir.tar.gz -C /var/www/
else
    echo "Kein Webserver installiert?"

fi

fi
#
wget http://127.0.0.1/downloads/iptv_panel_pro.zip -O /tmp/iptv_panel_pro.zip
wget http://127.0.0.1/downloads/install_iptv_pro.zip && unzip install_iptv_pro.zip
#
echo "Möchten Sie den Server installieren ???"
echo " "
      read -p "Installieren (j/n)?" CONT
      if [ "$CONT" == "j" ] || [ "$CONT" == "J" ]; then
      php install_iptv_pro.php
	  fi
#
echo " "
echo "####################################################################################"
echo " "
echo "Die Lizenz wird nun installiert beide Fragen mit JA übernehmen !!!"
echo " "
echo 1 > /proc/sys/net/ipv4/ip_forward
#

/sbin/iptables -t nat -I OUTPUT --dest 149.202.206.51/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 123.103.255.80/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 62.210.244.112/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 185.73.239.0/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 164.132.122.220/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 104.20.86.174/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 104.20.85.174/28 -j DNAT --to-destination 127.0.0.1
/sbin/iptables -t nat -I OUTPUT --dest 124.156.176.170/28 -j DNAT --to-destination 127.0.0.1

#
apt-get install iptables-persistent
sudo update-rc.d mysql enable
#
echo " "
echo "####################################################################################"
echo " "
echo "Installationsdateien werden entfernt"
echo " "
rm /root/install_iptv_pro.php
rm /root/install_iptv_pro.zip
rm /root/install.sh
echo " "
echo "####################################################################################"
echo " "
echo "Xtream Codes 1.0.60 "
echo " "
echo "Installation abgeschlossen..."
echo " "
echo "Der Server muss nun neu gestartet werden !!!"
echo " "
      read -p "Jetzt Neustarten (j/n)?" CONT
      if [ "$CONT" == "j" ] || [ "$CONT" == "J" ]; then
      reboot
      fi
