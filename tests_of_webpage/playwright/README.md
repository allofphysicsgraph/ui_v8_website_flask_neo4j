```
docker exec --workdir /scratch/tests_of_webpage/playwright/ -it `docker ps | grep flask-webserver | cut -d' ' -f1` pytest
```

To run a specific test,
```
pytest path/to/test_file.py::test_function_name
```