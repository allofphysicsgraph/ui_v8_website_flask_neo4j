
Find dead links and create a site map using wget

# from within the container against local site (preferred)

```
wget --spider --append-output=spider_log_2026-03-14.log --recursive --level=0 localhost:5000
```

# from Docker file against the live site (less optimal)

```
 docker run --rm -v `pwd`:/scratch --workdir /scratch datasci wget --spider --append-output=spider_log_2026-03-07.log --wait 2 --random-wait --recursive --level=0 https://allofphysics.com/
```


To allow `wget` to access protected routes within your Docker container, 

If you can log in once using a standard browser, you can "steal" the session cookie and give it to `wget`.

1.  Open your website in a browser and log in via Google.
2.  Open **Developer Tools** (F12) -> **Application** (or Storage) -> **Cookies**.
3.  Find the session cookie for your Flask app (usually named `session`).
4.  Copy its value.
5.  Run `wget` inside the container using the `--header` flag:

```bash
wget --header="Cookie: session=YOUR_SESSION_COOKIE_VALUE_HERE" http://localhost:5000/protected-route
```

This will work until the session expires.


# Analysis

```
cat spider_log_2026-03-07.log | grep "\--  https://allofphysics.com/" | sed 's/?.*//' | cut -d' ' -f4 | sort | uniq
```
looks promising but includes URLs that are not valid like
https://allofphysics.com/documentation/from_scratch_tutorial/docker_and_make



