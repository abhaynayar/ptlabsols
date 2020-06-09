#eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImhpIiwiaWF0IjoxNTkxNjQ3ODM0fQ.eeEhfwSrGy8OpnJZxQ6IxmwMik_taEiWrMW7FWES-cI
#header = '{"alg":"HS256","typ":"JWT"}'
#payload = '{"username":"hi","iat":1591647834}'

import jwt
encoded = jwt.encode({'username': 'admin'}, 'random', algorithm='HS256')
print(encoded) # 62e50e5a-32f5-430d-aeda-ac2d30bab335
