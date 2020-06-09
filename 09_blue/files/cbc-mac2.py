import base64
import urllib.parse

auth = 'YmRtaW5pc3RyYXRvci0tM2H6Eejw1kQ%3D'
iv = 'KcjXE4nr9xQ%3D'

auth = bytearray(base64.b64decode(urllib.parse.unquote(auth)))
iv = bytearray(base64.b64decode(urllib.parse.unquote(iv)))

print(auth)
print(iv)

auth[0] = ord('a')
iv[0] ^= ord('a') ^ ord('b')

print(urllib.parse.quote(base64.b64encode(auth)))
print(urllib.parse.quote(base64.b64encode(iv)))

# 93fb87b6-11b4-485f-973e-91206b7234ba

