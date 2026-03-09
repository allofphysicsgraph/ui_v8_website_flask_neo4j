

```
docker run --rm -v `pwd`:/scratch --workdir /scratch datasci wget --spider --append-output=spider_log_2026-03-07.log --wait 2 --random-wait --recursive --level=0 https://allofphysics.com/
```

`--spider` : get only links; don't download pages

`--append-output` : write output to file (rather than just stdout)

`--wait 2` : wait 2 seconds between each file download.

`--random-wait` : makes the wait time vary between 0.5 and 1.5 times the value specified in `--wait`.

`--recursive` : wget will follow links on that page and download those pages as well

`--level=0` : sets the maximum depth of the recursion. level of 0 (or inf) means infinite. wget will keep following links until it has downloaded every single page linked within that domain.

