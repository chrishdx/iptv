# IPTV Ubuntu 16.04





[1] Stellt sicher das ihr root seit mit sudo su und wechselt in das Verzeichnis root mit cd ~

[2] add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe'

[3]  apt-get update

[4] apt-get install mysql-server-5.6 -y  

[5] service mysql start

[6] update-rc.d -f mysql defaults

Das vergebene Kennwort gut aufheben, wird bei der Installation wieder gebraucht.

[7] wget https://raw.githubusercontent.com/chrishdx/iptv/master/install.sh && chmod a+x install.sh && ./install.sh

[8] Lizenz: Ojc0E75yM6bW5qP
