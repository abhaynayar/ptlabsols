import base64
import codecs

# token_decoded = base64.b64encode(username + '--' + signature)
# len(signature) = 8

m1 = 'administ'
c1 = 'YWRtaW5pc3QtLcUGktACaz2R'
t1 = base64.b64decode(c1)[10:]

m2 = 'rator\x00\x00\x00'
c2 = 'cmF0b3IAAAAtLQOeo4RHQ0iK'
t2 = base64.b64decode(c2)[10:]

for a,b in zip(t1,m2):print(hex(a^ord(b)))
# %b7%67%e6%bf%70%6b%3d%91
# t2fmv3BrPZEtLbq+LY+NNbVT

ans = base64.b64decode('t2fmv3BrPZEtLbq+LY+NNbVT')
pwn = b'administrator--\xba\xbe-\x8f\x8d5\xb5S'
print(base64.b64encode(pwn))
# f099c19f-8fb1-455d-b8a8-4f4cc4ccab6a

