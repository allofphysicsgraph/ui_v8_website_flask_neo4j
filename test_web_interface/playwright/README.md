```
docker exec --workdir /scratch/test_web_interfae/playwright/ -it `docker ps | grep flask-webserver | cut -d' ' -f1` pytest
```

To run a specific test,
```
pytest path/to/test_file.py::test_function_name
```


TODO: <https://github.com/allofphysicsgraph/ui_v8_website_flask_neo4j/issues/138> - coverage measurement
