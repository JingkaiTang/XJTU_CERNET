#! /usr/bin/sh
# A script for cernet login at XJTU
# shell version

username="your_username"
password="your_password"

function cernet_login {
    url="http://10.6.8.2/cgi-bin/srun_portal?ac_id=1&action=login&type=1&username=$username&password=$password" 
    curl $url
}

function cernet_logout {
    url="http://10.6.8.2/cgi-bin/srun_portal?ac_id=1&action=logout"
    curl $url
}

function cernet_flow {
    cookiefile="/tmp/cernet_cookiefile"
    authfile="/tmp/cernet_auth.html"
    base_url="http://auth.xjtu.edu.cn"
    curl $base_url 2> /dev/null | iconv -f gbk > $authfile
    viewstate=$(cat $authfile | grep -Po "(?<=__VIEWSTATE\" value=\")[^\"]*(?=\")")
    viewstategenerator=$(cat $authfile | grep -Po "(?<=__VIEWSTATEGENERATOR\" value=\")[^\"]*(?=\")")
    button1=$(cat $authfile | grep -Po "(?<=Button1\" value=\")[^\"]*(?=\")")
    auth_url="$base_url?__VIEWSTATE=$viewstate&__VIEWSTATEGENERATOR=$viewstategenerator&TB_userName=$username&TB_password=$password&Button1=$button1"
    curl -c $cookiefile $auth_url 2> /dev/null 1> /dev/null
    current_url="$base_url/current.aspx"
    curl -b $cookiefile $current_url 2> /dev/null | iconv -f gbk | awk -F "</tr>" 'match($0, /<td.*><font.*><b>(.*)<\/b><\/font><\/td>.*<td><font.*>(.*)<\/font><\/td>/) { print substr($0, RSTART, RLENGTH)}' | sed 's/^.*<b>//' | sed 's/<\/b.*">/\t/' | sed 's/<.*//'
}

if [ "$1" = "logout" ]
then
    cernet_logout
elif [ "$1" = "flow" ]
then
    cernet_flow
else
    cernet_login
fi
