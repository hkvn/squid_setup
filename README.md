# squid_setup

Start Squid
/usr/local/squid/sbin/squid -f /etc/squid/squid.conf

Test IP
curl -x http://user:password@127.0.0.1:10000 https://ident.me

Add User
printf "user:$(openssl passwd -apr1 PASSWORD)\n" >> /etc/squid/squid.auth
