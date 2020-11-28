#!/bin/sh

# Download and install Frp
mkdir /tmp/frp
curl -L -H "Cache-Control: no-cache" -o /tmp/frp/frp.tar.gz https://github.com/fatedier/frp/releases/download/v0.34.3/frp_0.34.3_linux_amd64.tar.gz
tar -xzvf /tmp/frp/frp.tar.gz -C /tmp/frp
install -m 755 /tmp/frp/frp_0.34.3_linux_amd64/frps /usr/local/bin/frps

# Remove temporary directory
rm -rf /tmp/frp

# Frp new configuration
install -d /usr/local/etc/frp
cat << EOF > /usr/local/etc/frp/frps.ini
[common]
bind_port = $PORT
vhost_http_port = 80
EOF

# Run Frp
/usr/local/bin/frps -c /usr/local/etc/frp/frps.ini
