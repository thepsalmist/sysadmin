#!/bin/bash 
#######################################################################################
#Script Name    :systemchck.sh
#Description    :send alert mail when server memory is running low and CPU is running high and Storage is running low
#Args           :       
#Author         :Student name
#Email          :Student Email

#######################################################################################
## Hostname
hostname = $(hostname)
##sending mail as
##configured using postfix on Ubuntu
## sending mail to
to="admin@gmail.com"


## get the percentage of RAM usage and set RAM threshold to 50% 
ram_usage=$(free -mt | awk 'NR==2{print ($3/$2)*100}')
ram_threshold = 50

## get the percentage of free storage and set maximum threshold to 50%
storage_used =$(df / -h | awk 'NR==2{print ($3/$2)*100 }')
storage_threshold = 50

## get the cpu usage 
cpu_usage = top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'
cpu_threshold = 50
## check if the memory is equal to or less than threshold
if [ $ram_usage -gt $ram_threshold ]; then
    subject = "System Memory Running Low!"
    echo -e "The $hostname server memory is running low! \n\n The current RAM usage is : $ram_usage %" | mail -s "$subject" "$to"
fi

## check if used up stirage is greater that the threshold of 90%
if [ $storage_used -gt $storage_threshold ]; then 
    subject = "System Storage Running Low! "
    echo -e " The $hostname server storage is running low \n\n Used up storage is : $storage_used %" | mail -s "$subject" "$to"
fi

if [ $cpu_usage -gt $cpu_threshold ]; then
    subject = "CPU utilization running high"
    echo -e " The $hostname server CPU is running high \n\n The current ustilization is: $cpu_usage %" | mail -s "$subject" "$to"
fi

exit 0
