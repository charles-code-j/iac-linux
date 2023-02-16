#!/bin/bash

apt update
apt upgrade -y
apt install apache2 -y

cd /tmp/
git clone https://github.com/denilsonbonatti/linux-site-dio.git
cp  -R linux-site-dio/* /var/www/html/



