#! /usr/bin/sh

username=""
password=""

url="http://10.6.8.2/cgi-bin/srun_portal"
data="ac_id=1"

if [ "$1" = "logout" ]
then
    data="$data&action=logout"
else
    data="$data&action=login&type=1&username=$username&password=$password" 
fi

curl "$url?$data"

