

To generate local certificates, use
```bash
openssl genrsa > privkey.pem
openssl req -new -x509 -key privkey.pem > fullchain.pem
```
as per <https://stackoverflow.com/a/66604834/1164295>

and, separately,
```bash
openssl dhparam -out dhparam.pem 4096
```
as per <https://stackoverflow.com/a/58221273/1164295>
