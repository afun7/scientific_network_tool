#!/bin/bash

#install required dependency
apt update
apt install neovim
apt install ntpsec
apt install systemd-timesyncd
apt install ntp

#set up ntp synchronise server
systemctl restart ntp
ntpq -p
timedatectl set-timezone UTC
timedatectl
echo wait 30s please check utc time
sleep 30s

#install v2ray
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

#prepare the config file
ls /usr/local/etc/v2ray/
# (curl -L https://raw.githubusercontent.com/afun7/scientific_network_tool/refs/heads/main/config_example/vmess%2Btcp/config_server.json)>/usr/local/etc/v2ray/config.json
curl -o /usr/local/etc/v2ray/config.json https://raw.githubusercontent.com/afun7/scientific_network_tool/refs/heads/main/config_example/vmess%2Btcp/config_server.json
cat /usr/local/etc/v2ray/config.json

# Generate a random-based UUID
uuid=$(uuidgen -r)

# Print the generated UUID
echo "Generated UUID: [$uuid] , please save it to somewhere, wait 30 seconds"
sleep 30s

#Replace uuid in the file
sed -i "s/<YOUR UUID>/$uuid/g" /usr/local/etc/v2ray/config.json

#restart v2ray
systemctl stop v2ray 
systemctl enable v2ray 
systemctl start v2ray 




