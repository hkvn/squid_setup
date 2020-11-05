#!/usr/bin/env bash


# install repo
echo "=========== Install Repo ================="
apt update && apt upgrade -y

echo "==========================================="

# install depend
echo "=========== Install Depend ================="

apt install build-essential vim git wget htop curl -y

echo "==========================================="

# build squid

echo "=========== reBuild Squid ================="

cd /opt
wget -c http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.27.tar.gz
tar -zxvf squid-3.5.27.tar.gz
cd squid-3.5.27
./configure 'CXXFLAGS=-DMAXTCPLISTENPORTS=65000' --enable-ltdl-convenience
make && make install
chmod 777 /usr/local/squid/var/logs/
mkdir /var/spool/squid3
mkdir /etc/squid

PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
printf "proxy:$(openssl passwd -apr1 $PASSWORD)\n" > squid.auth
echo $PASSWORD
cp squid.conf /etc/squid/
cp squid.auth /etc/squid/

echo "==========================================="

# Increase The Maximum Number Of Open Files

echo "* - nofile 500000" >> /etc/security/limits.conf

echo "=========== Init ================="
