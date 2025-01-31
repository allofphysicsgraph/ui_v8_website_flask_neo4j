Gunicorn is a Python HTTP server that uses the Web Server Gateway Interface (WSGI) protocol to interact with web applications

Gunicorn operates behind nginx and ahead of flask:

   user -> nginx -> gunicorn -> flask
