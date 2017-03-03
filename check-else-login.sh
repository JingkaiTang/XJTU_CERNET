#!/usr/bin/env sh
# A script for checking cernet if online, else login

username="your_username"
password="your_password"

function cernet_login {
    url="http://10.6.8.2/cgi-bin/srun_portal?ac_id=1&action=login&type=1&username=$username&password=$password" 
    wget -q -O /dev/null $url
}

SITE="http://www.baidu.com"
wget -q --tries=3 --timeout=5 --spider $SITE
if [[ $? -ne 0 ]]; then
    cernet_login
fi

