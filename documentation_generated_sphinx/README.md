

```
docker exec -it --workdir /scratch/documentation_generated_sphinx $(docker ps -qf "name=flask-webserver") /bin/bash
```

Inside the container 
```
make clean
make html
```

If you're on a Mac, on the host use
```
open documentation_generated_sphinx/_build/html/index.html 
```
to view the content.