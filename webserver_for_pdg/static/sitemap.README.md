
Find dead links and create a site map using wget
See <https://github.com/allofphysicsgraph/task-tracker/issues/111>

# from within the container against local site (preferred)

```
$ docker exec -it bc2c929fdaae /bin/bash
# cd /scratch/
# mkdir crawled_`date +%F`
# cd crawled_`date +%F`/
wget --spider --append-output=spider_log_`date +%F`.log --recursive --level=0 localhost:5000
```

# from Docker file against the live site (less optimal)

```
 docker run --rm -v `pwd`:/scratch --workdir /scratch datasci wget --spider --append-output=spider_log_2026-03-07.log --wait 2 --random-wait --recursive --level=0 https://allofphysics.com/
```

`--spider` : get only links; don't download pages

`--append-output` : write output to file (rather than just stdout)

`--wait 2` : wait 2 seconds between each file download.

`--random-wait` : makes the wait time vary between 0.5 and 1.5 times the value specified in `--wait`.

`--recursive` : wget will follow links on that page and download those pages as well

`--level=0` : sets the maximum depth of the recursion. level of 0 (or inf) means infinite. wget will keep following links until it has downloaded every single page linked within that domain.


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
