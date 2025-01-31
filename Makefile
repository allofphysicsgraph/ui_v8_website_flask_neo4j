# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

webserver_image=ui_v8_website_flask_neo4j_webserver

container=docker
#container=podman

#
.PHONY: help docker

help:
	@echo "make help"
	@echo "      this message"
	@echo "==== Targets outside container ===="
	@echo ""
	@echo "make up"
	@echo "      build and run $(container)"
	@echo ""
	@echo "make mypy_out"
	@echo "      run mypy type checking for all .py files"
	@echo ""
	@echo "make black_out"
	@echo "      run black against all .py file"
	@echo ""
	@echo "make delete_neo4j_file"
	@echo ""
	@echo "==== recommended use: ===="
	@echo ""
	@echo "make black_out; docker ps | grep property | cut -d' ' -f1 | xargs docker kill; date; make up"
	@echo ""

# create and start the webserver. This will build the Docker image if that's needed
up:
	cd neo4j_pdg && chmod -R g+rwx * && chmod -R o+rwx * 
	#if (! $(container) stats --no-stream ); then  open /Applications/Docker.app; while (! $(container) stats --no-stream ); do    echo "Waiting for Docker to launch...";  sleep 1; done; fi; 
	$(container) ps
	if [ `$(container) ps | wc -l` -gt 1 ]; then \
	       	$(container) kill $$($(container) ps -q); \
		fi
	$(container) ps
	$(container) run -it --rm -v `pwd`:/scratch $(webserver_image) /bin/bash -c 'for filename in /scratch/webserver_for_pdg/*.py; do echo $$filename; done | xargs black'
	$(container) run -it --rm -v `pwd`:/scratch $(webserver_image) /bin/bash -c 'for filename in /scratch/webserver_for_pdg/library/*.py; do echo $$filename; done | xargs black'
	# https://docs.docker.com/compose/reference/up/
	$(container) compose up --build --remove-orphans


down:
	# https://docs.docker.com/compose/reference/down/
	$(container) compose down --volumes --remove-orphans


container: container_build container_live

# https://docs.docker.com/build/building/multi-platform/
container_build:
	cd webserver_for_pdg && $(container) build --platform linux/amd64,linux/arm64 -t $(webserver_image) .

container_live:
	$(container) run -it --rm \
                -v `pwd`:/scratch -w /scratch/ \
                --user $(id -u):$(id -g) \
                $(webserver_image) /bin/bash

black_out:
	$(container) run --rm -v`pwd`:/scratch --entrypoint='' -w /scratch/ $(webserver_image) make black_in

black_in:
	black webserver_for_pdg/*.py webserver_for_pdg/library/*.py

mypy_out:
	$(container) run --rm -v`pwd`:/scratch --entrypoint='' -w /scratch/ $(webserver_image) mypy --check-untyped-defs webserver/pdg_app.py webserver/library


# keep the conf folder since that has the configuration
# keep plugin folder since that has apocalypse
delete_neo4j_file:
	rm -rf neo4j_pdg/data/
	rm -rf neo4j_pdg/logs/


#EOF
