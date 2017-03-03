#!/usr/bin/env sh
# cernet login for sh

username="your_username"
password="your_password"

url="http://10.6.8.2/cgi-bin/srun_portal?ac_id=1&action=login&type=1&username=$username&password=$password" 
wget -q -O /dev/null $url

