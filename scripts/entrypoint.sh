#!/bin/sh
# Wait for Nginx
until getent hosts nginx; do echo 'Waiting for Nginx...'; sleep 0.5; done

# Clean and set the IP
sed -i '/address=\/\.test\//d' /etc/dnsmasq.conf
echo "address=/.test/127.0.0.1" >> /etc/dnsmasq.conf

# Start dnsmasq and stay in foreground
# 'exec' makes dnsmasq the main process for Docker
exec dnsmasq -k --user=root
