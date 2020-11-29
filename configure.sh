#!/bin/sh

# Download and install Frp
mkdir /tmp/frp
curl -L -H "Cache-Control: no-cache" -o /tmp/frp/frp.tar.gz https://github.com/fatedier/frp/releases/download/v0.34.3/frp_0.34.3_linux_amd64.tar.gz
tar -xzvf /tmp/frp/frp.tar.gz -C /tmp/frp
install -m 755 /tmp/frp/frp_0.34.3_linux_amd64/frpc /usr/local/bin/frpc

# Remove temporary directory
rm -rf /tmp/frp

# Frp new configuration
install -d /usr/local/etc/frp
cat << EOF > /usr/local/etc/frp/frpc.ini
[common]
protocol = tcp
server_addr = us-la-cn2.sakurafrp.com
server_port = 7000
user = 9o2ntwefismbyr83
token = SakuraFrpClientToken
sakura_mode = true
use_recover = true
tcp_mux = true
pool_count = 1
[herokuv2]
type = tcp
remote_port = 35907
plugin = http_proxy
EOF

# Run Frp
/usr/local/bin/frpc -c /usr/local/etc/frp/frpc.ini
