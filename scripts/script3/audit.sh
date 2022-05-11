#! /bin/bash

# write uptime into file
printf "uptime:\n" > audit_result.log
uptime >> audit_result.log

# write current users into file
printf "\ncurrent users:\n" >> audit_result.log
users >> audit_result.log

# write 10 recent logins into file
printf "\nmost recent logins:\n" >> audit_result.log
last | head -n 10 >> audit_result.log

# write top 10 proceses by ram  into file
printf "\ntop 10 processes by ram:\n" >> audit_result.log
ps -aux --sort=-%mem | head -n 11 >> audit_result.log

# write top 10 proceses by cpu  into file
printf "\ntop 10 processes by cpu:\n" >> audit_result.log
ps -aux --sort=-%cpu | head -n 11 >> audit_result.log

# write open ports into file
printf "\nopen ports:\n" >> audit_result.log
netstat -tulpn | grep LISTEN >> audit_result.log

# write virtual memory usage into file
printf "\nvirtual memory info:\n" >> audit_result.log
free -h >> audit_result.log

# write disk memory usage into file
printf "\ndisk memory usage info:\n" >> audit_result.log
du -h -s /* >> audit_result.log 2>audit_err.log
