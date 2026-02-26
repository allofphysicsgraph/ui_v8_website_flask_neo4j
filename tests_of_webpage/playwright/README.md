docker exec -it `docker ps | grep flask-webserver | cut -d' ' -f1` /bin/bash
cd /scratch/tests_of_webpage/playwright/
pytest