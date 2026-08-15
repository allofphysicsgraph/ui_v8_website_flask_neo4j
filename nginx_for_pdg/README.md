The official `nginx:1.30-alpine` image ships with a default entrypoint script `/docker-entrypoint.d/10-listen-on-ipv6-by-default.sh`. Its job is to look specifically for a file named `/etc/nginx/conf.d/default.conf` and, if found, patch it to add an IPv6 `listen [::]:80` directive (for environments where the default site config should also bind on IPv6).

Your Dockerfile does this:

```
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
```

You deliberately delete `default.conf` and replace it with a file named `nginx.conf` in the same directory (`/etc/nginx/conf.d/nginx.conf`). Since the script is hardcoded to look for the exact filename `default.conf`, it doesn't find it, logs:

```
info: /etc/nginx/conf.d/default.conf is not a file or does not exist
```

and simply skips that IPv6-patching step. It's an `info`-level message, not a `warn` or `error` — the script just moves on, and `/docker-entrypoint.d/20-envsubst-on-templates.sh` and `30-tune-worker-processes.sh` run afterward normally.

**Why it's not actually a problem here**

Your own `nginx.conf` already explicitly handles both HTTP (port 80) and HTTPS (port 443) server blocks with your own `listen` directives, so you don't need or want the entrypoint's IPv6 auto-patch logic to touch anything — it was designed for the *default* stock config, not a custom one. The rest of your log confirms this: nginx starts cleanly, workers spawn, and your `curl` tests against both the Flask container directly and through nginx on port 443 return `200 OK`. So functionally nothing is broken.

**If you want the message gone (purely cosmetic)**

You have a couple of options, neither necessary:

1. Rename your config file to `default.conf` instead of `nginx.conf` when copying it in:
   ```
   COPY nginx.conf /etc/nginx/conf.d/default.conf
   ```
   This would let the IPv6 script find and patch a file — but since you already define your own `listen` directives, this wouldn't change nginx's actual behavior, just silence the info line.

2. Leave it as-is — this is the more common convention (custom config files are usually *not* named `default.conf`, precisely so they're not accidentally overwritten/patched by that script), and the message is harmless.

I'd leave it alone — it's log noise from a script that isn't relevant to your setup, not a sign of misconfiguration.

