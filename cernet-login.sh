#!/usr/bin/env sh
# cernet login for sh

username="your_username"
password="your_password"

url="http://10.6.8.2:904/include/auth_action.php"
data="action=login&username=$username&password=$password&ac_id=1&user_ip=&nas_ip=&user_mac=&save_me=1&ajax=1Name"

curl -X POST -d $data $url

