

```
scp -v -o IdentitiesOnly=yes -i ~/.ssh/<KEYNAME> USERANEM@IPADDRESS:/home/pdg/ui_v8_website_flask_neo4j/logs/gunicorn_access.log .
```
identify bots and crawlers 
```
python3 analysis_of_gunicorn_access_log_for_bot_IPs.py | grep "IP Address:" | cut -d' ' -f3 > IP_of_bot.log
```


```
grep -vFwf IP_of_bot.log gunicorn_access.log > gunicorn_access_filtered.log
```
where
- `-v`: Inverts the match (excludes lines that match).
- `-F`: Treats the patterns in the bot file as fixed strings rather than regular expressions. This is important because IP addresses contain dots (.), which grep otherwise interprets as a wildcard matching any character.
- `-w`: Forces the pattern to match only whole words, preventing partial IP matches.
- `-f IP_of_bot.log`: Tells grep to read the list of patterns from your IP file.


```
python3 clickstream_map.py gunicorn_access_filtered.log > map.dot
```

Graph can be rendered in <https://dreampuf.github.io/GraphvizOnline/>