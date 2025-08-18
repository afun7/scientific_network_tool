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
