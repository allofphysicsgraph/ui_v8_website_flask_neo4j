To slim down the webserver, python packages have been moved into a separate container.


Since these are just Python packages installed using `pip`, a `venv` would be suitable.
However, reliance on `python3` being on the host is not consistent with the rest of the project.
So this maintenance tooling is in a Docker image.
