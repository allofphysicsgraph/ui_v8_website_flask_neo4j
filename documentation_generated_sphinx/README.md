

```
docker exec -it --workdir /scratch/documentation_generated_sphinx $(docker ps -qf "name=flask-webserver") /bin/bash
```

Inside the container 
```
make html
```

To reset use
```
make clean
```


