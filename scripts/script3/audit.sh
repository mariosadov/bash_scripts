#! /bin/bash

# write uptime into file
printf "uptime:\n" > audit_result.txt
uptime >> audit_result.txt

# write current users into file
printf "\ncurrent users:\n" >> audit_result.txt
users >> audit_result.txt

# write 10 recent logins into file
printf "\nmost recent logins:\n" >> audit_result.txt
last | head -n 10 >> audit_result.txt

# write top 10 proceses by ram  into file
printf "\ntop 10 processes by ram:\n" >> audit_result.txt
ps -aux --sort=-%mem | head -n 11 >> audit_result.txt

# write top 10 proceses by cpu  into file
printf "\ntop 10 processes by cpu:\n" >> audit_result.txt
ps -aux --sort=-%cpu | head -n 11 >> audit_result.txt

# write open ports into file
printf "\nopen ports:\n" >> audit_result.txt
netstat -tulpn | grep LISTEN >> audit_result.txt

# write virtual memory usage into file
printf "\nvirtual memory info:\n" >> audit_result.txt
free -h >> audit_result.txt

# write disk memory usage into file
printf "\ndisk memory usage info:\n" >> audit_result.txt
du -h -s /* >> audit_result.txt 2>audit_err.txt
