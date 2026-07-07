#!/usr/bin/env bash

docker exec $(docker ps -qf "name=flask-webserver") python3 -c '
import pathlib, sys
from jinja2 import Environment

env = Environment()
has_errors = False
target_dir = pathlib.Path("/scratch/webserver_for_pdg/templates/jinja2_pages")

for p in target_dir.rglob("*"):
    if p.is_file():
        try:
            # Using utf-8 explicitly to avoid platform-dependent decoding issues
            content = p.read_text(encoding="utf-8")
            env.parse(content)
        except UnicodeDecodeError:
            # Safely ignore binary files if any exist in the template folder
            continue
        except Exception as e:
            # Display the path relative to the target directory for cleaner output
            relative_path = p.relative_to(target_dir)
            print(f"[FINDING] Syntax Error in {relative_path}: {e}")
            has_errors = True

if has_errors:
    sys.exit(1)
else:
    print("All templates validated successfully.")
'

# To get the full stack trace (to identify the relevant line number) use
# docker exec --workdir /scratch/webserver_for_pdg/templates/jinja2_pages $(docker ps -qf "name=flask-webserver") python3 -c "from jinja2 import Environment; Environment().parse(open('FILENAMEHERE.html').read())"
