token='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6IjAwMDEifQ.eyJ1c2VyIjpudWxsfQ.spzCikhspCdf6XAUci3R4EpJOH6gvZcvkDCVrkGbx7Y'

import base64

header = b'{"typ":"JWT","alg":"HS256","kid":"0001"}'
payload = b'{"user":null}'

header = base64.b64encode(header).replace(b'=',b'').replace(b'\n',b'')
payload = base64.b64encode(payload).replace(b'=',b'').replace(b'\n',b'')
signature = b'spzCikhspCdf6XAUci3R4EpJOH6gvZcvkDCVrkGbx7Y'

data = header + b'.' + payload
token = data + b'.' + signature
print(token)
