#!/bin/sh

# Clean and set the IP
sed -i '/address=\/\.test\//d' /etc/dnsmasq.conf
echo "address=/.test/127.0.0.1" >> /etc/dnsmasq.conf

# Start dnsmasq and stay in foreground
exec dnsmasq -k --user=root
