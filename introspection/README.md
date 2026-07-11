


# file list for web-based LLM chat 

The command
```
docker exec --workdir /scratch/ $(docker ps -qf "name=flask-webserver") find . -type f | grep -v "\.git" | grep -v "\.mypy" | grep -v "blog_from_blogger/202" | grep -v "neo4j_pdg/data/databases"  > files.log
```
returns a list of files

# which routes require login

Useful for determining which routes can be tested in playwright without logging in
```
python3 which_routes_require_login.py ../webserver_for_pdg/pdg_app.py --routes-that-require-login
```



Useful for providing in a prompt for an LLM:
```
python3 remove_comments.py ../webserver_for_pdg/pdg_app.py 
```
