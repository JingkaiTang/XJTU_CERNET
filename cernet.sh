#! /usr/bin/sh
# A script for cernet login at XJTU
# shell version

# depends curl, wget or lynx

username="your_username"
password="your_password"

url="http://10.6.8.2/cgi-bin/srun_portal"
data="ac_id=1"

if [ "$1" = "logout" ]
then
    data="$data&action=logout"
else
    data="$data&action=login&type=1&username=$username&password=$password" 
fi

cmd="curl"
no_cmd_flag="NO_COMMAND_FLAG"

type curl > /dev/null 2>&1
if [ $? -ne 0 ]
then
    type wget > /dev/null 2>&1
    if [ $? -eq 0 ]
    then
        cmd="wget -q -O -"
    else
        type lynx > /dev/null 2>&1
        if [ $? -eq 0 ]
        then
            cmd="lynx -dump"
        else
            cmd=$no_cmd_flag
        fi
    fi
fi

if [ "$cmd" = "$no_cmd_flag" ]
then
    echo "This script depends on curl, wget or lynx"
else
    $cmd "$url?$data"
fi

