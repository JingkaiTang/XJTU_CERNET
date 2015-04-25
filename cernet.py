#! /usr/bin/env python

# A script for cernet login at XJTU

import urllib
import urllib.parse
import urllib.request
import re

username = 'your_username'
password = 'your_password'

raw_data = {
    'action': 'login',
    'username': username,
    'password': password,
    'ac_id': 1,
    'type': 1
}

data = urllib.parse.urlencode(raw_data).encode('utf-8')
url = 'http://10.6.8.2/cgi-bin/srun_portal'
req = urllib.request.Request(url, data)
rep = urllib.request.urlopen(req)
if rep.code == 200:
    msg = rep.read().decode('utf-8')
    pattern = re.compile(r'action=(\w+)')
    match = pattern.search(msg)
    if match:
        print(match.group(1))
    else:
        print('Oh-No!')
else:
    print('Ah-Oh!')
