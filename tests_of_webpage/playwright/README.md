```
docker exec -it `docker ps | grep flask-webserver | cut -d' ' -f1` /bin/bash
cd /scratch/tests_of_webpage/playwright/
pytest
```

To run a specific test,
```
pytest path/to/test_file.py::test_function_name
```