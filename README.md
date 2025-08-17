# scientific_network_tool
A script to automate setup a tool to safely access internet


# Summary
This document is to specify the steps that needs to be done to setup a v2ray server

# Networking Summary (for people interested in how it work )



# VPC setup
Fisrtly of all, we need to setup a VPC and VM to provision the hardwere to run our server. I use aws's free tier ec2 here (6month free with 100 USD credit). 

Step:
1. create a VPC in the region you like, use the default CIDR range (CIDR range XXX,XXX,XXX,XXX/N just means the ip range if I keep the front N digit static and change the rest)

2. create the subnet on one of the AZ

3. create NACL (subnet level firewall rule and stateless) to allow all inbound and all outbound

4. create a internet gateway as bridge to connect vpc to public internet

5. add routing table rule for internet gateway so when we are sending reponse it will route it to internet gateway

6. create ec2 instance in the subnet

7. configure the security group, SG is on instance level (actually in the graphic card of the instance)

8. connect to instance,prepare ec2 instance as a v2ray server, ie. install v2ray software, config v2ray and start v2ray--->[Server setup]


# Server setup

0. I have setup a bash script to automate this step, the detail steps you can see from 1+. (if you just want it to work, you can skip the rest detail step explanation)

1. ssh to the server

2. grant super user right so we won' be blocked
    sudo su

3. sync system time, as v2ray will check the socket from client and server to be < 90s difference

4. update apt local repocitory, and install useful cmd-line tool
    apt update
    apt install neovim

5. run the v2ray installtion script

6. enable v2ray to run automatically

7. stop v2ray and config v2ray (download existing server and client config file ), and all the helper command that might be useful

8. start v2ray and enjoy the internet XD


# Client setup

# Reference


