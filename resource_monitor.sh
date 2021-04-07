
#!/bin/bash 

#######################################################################################
#Script Name    :Task 1 (resourcemonitor.sh)
#Description    :the script monitors the system resources at a refresh rate of every 1 second      
#Author         :Thepsalmist
#Email          :

#######################################################################################

##Declare variables
HOSTNAME=$(hostname)
KERNEL=$(uname -srm)
UPTIME=$(uptime | awk '{print $3,$4}' | sed 's/,//')
TASKS=$(ps -e aux | wc -l)
TOTAL_RAM=$(free -mt | awk 'NR==2{print $2 }')
AVAILABLE_RAM=$(free -mt | awk 'NR==2{print $4}')
CPU_USAGE=$(cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' | awk '{print $0}' | head -1
)
DISK_SIZE=$(df / -h | awk 'NR==2{print $2 }')
AVAILABLE_DISK=$(df / -h | awk 'NR==2{print $4 }')
PIDS=$(ps -aux | awk '{print $1 , $2, $3, $4, 411}')

echo -e "------------------------Computer's System Information-----------------------------"
echo -e "The Hostname:\t\t $HOSTNAME"
echo -e "The Kernel Version is:\t\t $KERNEL"
echo -e "The Number of tasks running:\t\t $TASKS "
echo -e "The System Uptime:\t\t $UPTIME "
echo -e "The Total system RAM:\t\t $TOTAL_RAM "
echo -e "The available RAM:\t\t $AVAILABLE_RAM "
echo -e "Total CPU usgae:\t\t $CPU_USAGE"
echo -e "Total disk size is :\t\t $DISK_SIZE"
echo -e "Available disk size:\t\t $AVAILABLE_DISK"



echo -e "------------------------Process Details------------------------------------"
echo -e "The Process details include:\n\n $PIDS"