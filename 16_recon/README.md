## Recon Badge

```
00
visit http://hackycorp.com/robots.txt
af9c328a-02b4-439d-91c6-f46ab4a0835b 

01
visit http://hackycorp.com/asdf
aeaee57f-2a82-41da-bc4c-d081c8cddfc8

02
visit http://hackycorp.com/.well-known/security.txt
99685e30-7061-4ac0-83bf-4ccc0409faac

03
visit http://hackycorp.com/images/
93790afa-6985-47fd-b564-aa7ba59ed6a9

04
visit http://hackycorp.com/admin/
ad1d44d6-ab73-4640-8291-c5bf2343e2a5

05
$ ffuf -w common.txt -u https://hackycorp.com/FUZZ
http://hackycorp.com/startpage/
498621b0-17fe-4ebb-8324-3de7743fea51
```

