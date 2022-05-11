#! /bin/bash

# get info about os and kernel(os name, kernel version, kernel relase)
OS_NAME=$(uname -o)
K_VER=$(uname -v)
K_REL=$(uname -r)

#get info about network interfaces
NETW_INTERF=$(ifconfig)

# concatenate the data into a result and write it to a file
RESULT="os name: $OS_NAME\nkernel version: $K_VER\nkernel release: $K_REL\n\ninfo about network interfaces:\n$NETW_INTERF"
printf "$RESULT" > sysinfo-result.txt

# to get info about firewall root or sudo privileges are needed
printf "\n\nfireall info:\n" >> sysinfo-result.txt
# if have privileges, writes result, else writes error info
ufw status verbose >>  sysinfo-result.txt 2>>sysinfo-result.txt
