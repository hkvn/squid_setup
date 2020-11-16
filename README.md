# squid_setup

Clone source code

cd /opt

sudo apt update -y && apt install git -y

git clone https://github.com/hkvn/squid_setup.git

cd squid_setup

Install

bash proxy_setup.sh

Start Squid

/usr/local/squid/sbin/squid -f /etc/squid/squid.conf

Test IP

curl -x http://user:password@127.0.0.1:10000 https://ident.me

Add User

printf "user:$(openssl passwd -apr1 PASSWORD)\n" >> /etc/squid/squid.auth
