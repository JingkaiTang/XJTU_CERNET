#! /usr/bin/env python

# A script for cernet login at XJTU

import urllib
import urllib.parse
import urllib.request
import sys

username = 'your_username'
password = 'your_password'

url = 'http://10.6.8.2/cgi-bin/srun_portal'

login_data = {
    'action': 'login',
    'username': username,
    'password': password,
    'ac_id': 1,
    'type': 1
}

logout_data = {
    'action': 'logout',
    'ac_id': 1
}

raw_data = logout_data if len(sys.argv) == 2 and sys.argv[1] == "logout" else login_data

data = urllib.parse.urlencode(raw_data).encode('utf-8')
request = urllib.request.Request(url, data)
response = urllib.request.urlopen(request)

print(response.read().decode('utf-8'))

