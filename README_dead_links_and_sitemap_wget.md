
Find dead links and create a site map using wget

# from within the container against local site (preferred)

```
wget --spider --append-output=spider_log_2026-03-14.log --recursive --level=0 localhost:5000
```

# from Docker file against the live site (less optimal)

```
 docker run --rm -v `pwd`:/scratch --workdir /scratch datasci wget --spider --append-output=spider_log_2026-03-07.log --wait 2 --random-wait --recursive --level=0 https://allofphysics.com/
```


# Analysis

```
cat spider_log_2026-03-07.log | grep "\--  https://allofphysics.com/" | sed 's/?.*//' | cut -d' ' -f4 | sort | uniq
```
looks promising but includes URLs that are not valid like
https://allofphysics.com/documentation/from_scratch_tutorial/docker_and_make



