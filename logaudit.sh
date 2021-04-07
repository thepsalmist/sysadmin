
#!/bin/bash 

#######################################################################################
#Script Name    :Task 2 (logaudit.sh)
#Description    :the script logs the details
#Author         :Abubakar
#Email          :Abubakar225599@gmail.com

#######################################################################################

USER = $(w | awk 'NR==3{print $1}')
USER_GROUP = $(groups $USER)
USER_HOME_DIRECTORY=$(eval echo ~$USER)
SESSION_START = $(w | awk 'NR==3{print $4}')
PIDS = $(ps -eo pid,cmd,lstart,etimels)

echo -e "Start time of User session is: \t $SESSION_START"

echo -e "\n User details are are follows:\n\n Username: $USER \n Usergroups: $USER_GROUP \n The home directory: $USER_HOME_DIRECTORY"

echo -e "------------------------Process Details------------------------------------"
echo -e "The Process details include:\n\n $PIDS"

