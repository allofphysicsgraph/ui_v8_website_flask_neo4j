
# generate certs for site on Internet

See <https://physicsderivationgraph.blogspot.com/2021/10/periodic-renewal-of-https-letsencrypt.html>

# how to generate local certificates

```bash
openssl genrsa > privkey.pem
openssl req -new -x509 -key privkey.pem > fullchain.pem
```
as per <https://stackoverflow.com/a/66604834/1164295>

and, separately,
```bash
openssl dhparam -out dhparam.pem 2048
```
as per <https://stackoverflow.com/a/58221273/1164295>
