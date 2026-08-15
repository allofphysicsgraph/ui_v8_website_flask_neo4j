
# Use
```
docker exec --workdir /scratch/test_web_interfae/playwright/ -it `docker ps | grep flask-webserver | cut -d' ' -f1` pytest
```

To run a specific test,
```
pytest path/to/test_file.py::test_function_name
```


# TODO

<https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/138> - coverage measurement


# validating availability within container

You can check that the internal interfaces are working using
```
$ docker compose exec flask-webserver curl -I http://localhost:5000
WARN[0000] The "WEBSERVER_IMAGE_NAME" variable is not set. Defaulting to a blank string. 
WARN[0000] The "TAG_WITH_ARCH" variable is not set. Defaulting to a blank string. 
HTTP/1.1 200 OK
Server: gunicorn
Date: Sat, 15 Aug 2026 17:22:26 GMT
Connection: keep-alive
Content-Type: text/html; charset=utf-8
Content-Length: 39517
Vary: Cookie
Set-Cookie: session=eyJjc3JmX3Rva2VuIjoiZWMyMDg3NTAwNjAyN2U4YTljODlmMTZkMzg4M2I0Njc5NDk2OTAxNiJ9.aoCgUg.UWDXp-4oeGdDEa6FWnhg0ns7AHY; Secure; HttpOnly; Path=/; SameSite=Lax
```

The external version is
```
$ curl -k -v https://localhost/
* Host localhost:443 was resolved.
* IPv6: ::1
* IPv4: 127.0.0.1
*   Trying [::1]:443...
* Connected to localhost (::1) port 443
* ALPN: curl offers h2,http/1.1
* (304) (OUT), TLS handshake, Client hello (1):
* (304) (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-CHACHA20-POLY1305 / [blank] / UNDEF
* ALPN: server accepted http/1.1
* Server certificate:
*  subject: C=US; ST=MD; O=home; CN=localhost; emailAddress=benislocated
*  start date: Jan 24 14:28:37 2026 GMT
*  expire date: Feb 23 14:28:37 2026 GMT
*  issuer: C=US; ST=MD; O=home; CN=localhost; emailAddress=benislocated
*  SSL certificate verify result: self signed certificate (18), continuing anyway.
* using HTTP/1.x
> GET / HTTP/1.1
> Host: localhost
> User-Agent: curl/8.7.1
> Accept: */*
> 
* Request completely sent off
< HTTP/1.1 200 OK
< Server: nginx/1.30.4
< Date: Sat, 15 Aug 2026 17:37:59 GMT
< Content-Type: text/html; charset=utf-8
< Content-Length: 39517
< Connection: keep-alive
< Vary: Cookie
< Set-Cookie: session=eyJjc3JmX3Rva2VuIjoiMTNlMDJhYTg3NjIxYThiZDg3NWY2OGE5MDMwMzBhMDcxMzA4MDAzZSJ9.aoCj9w.3K6GlYPPqocQtaMkL4qmeiYbbcg; Secure; HttpOnly; Path=/; SameSite=Lax
< 
<!DOCTYPE html>

```


# playwright-external-to-webserver vs internal

When `playwright` is in same container as webserver then the URL is
```
URL = "http://localhost:5000"
```

When `playwright` is outside the webserver and should connect via host use
```
URL = "https://host.docker.internal"
```

EOF