token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6IjAwMDEifQ.eyJ1c2VyIjpudWxsfQ.spzCikhspCdf6XAUci3R4EpJOH6gvZcvkDCVrkGbx7Y"

header,payload,signature=token.split(".")

import base64

header = base64.decodestring(header+"==") # {"typ":"JWT","alg":"HS256","kid":"0001"}
payload = base64.decodestring(payload+"==") # {"user":null}

