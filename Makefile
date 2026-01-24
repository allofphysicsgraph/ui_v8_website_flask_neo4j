
# Physics Derivation Graph
# https://allofphysics.com
# Ben Payne, 2026

# Get the machine architecture.
# On arm64 (Apple Silicon M1/M2/etc.), `uname -m` outputs "arm64".
# On amd64 (Intel), `uname -m` outputs "x86_64".
ARCH := $(shell uname -m)

ifeq ($(ARCH), arm64)
        this_arch=arm64
else ifeq ($(ARCH), x86_64)
        this_arch=amd64
else
        @echo "Unknown architecture: $(ARCH). Cannot determine if Mac is new (arm64) or old (amd64)."
endif


WEBSERVER_IMAGE=ui_v8_flask_webserver

CONTAINER_TAG=latest-$(this_arch)

DOCKER_OR_PODMAN=docker
#DOCKER_OR_PODMAN=podman

# .PHONY is special target used to declare that a target name does not correspond to an actual file to be built.
.PHONY: help docker up down container container_live container_build black_in black_out mypy_out delete_neo4j_file

help:
	@echo "make help"
	@echo "      this message"
	@echo "==== Targets outside container ===="
	@echo ""
	@echo "make up"
	@echo "      build and run container"
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
	#if (! $(DOCKER_OR_PODMAN) stats --no-stream ); then  open /Applications/Docker.app; while (! $(DOCKER_OR_PODMAN) stats --no-stream ); do    echo "Waiting for Docker to launch...";  sleep 1; done; fi; 
	$(DOCKER_OR_PODMAN) ps
	if [ `$(DOCKER_OR_PODMAN) ps | wc -l` -gt 1 ]; then \
	       	$(DOCKER_OR_PODMAN) kill $$($(DOCKER_OR_PODMAN) ps -q); \
		fi
	$(DOCKER_OR_PODMAN) ps
	$(DOCKER_OR_PODMAN) run -it --rm --entrypoint /bin/bash -v `pwd`:/scratch $(WEBSERVER_IMAGE):$(CONTAINER_TAG) -c 'black /scratch/webserver_for_pdg/*.py'
	$(DOCKER_OR_PODMAN) run -it --rm --entrypoint /bin/bash -v `pwd`:/scratch $(WEBSERVER_IMAGE):$(CONTAINER_TAG) -c 'black /scratch/webserver_for_pdg/library/*.py'
	# https://docs.docker.com/compose/reference/up/
	$(DOCKER_OR_PODMAN) compose up --build --force-recreate --remove-orphans


down:
	# https://docs.docker.com/compose/reference/down/
	$(DOCKER_OR_PODMAN) compose down --volumes --remove-orphans


container: container_build container_live

# https://docs.docker.com/build/building/multi-platform/
container_build:
	cd webserver_for_pdg && $(DOCKER_OR_PODMAN) build -t $(WEBSERVER_IMAGE):$(CONTAINER_TAG) .

container_live:
	$(DOCKER_OR_PODMAN) run -it --rm \
                -v `pwd`:/scratch -w /scratch/ \
                --user $(id -u):$(id -g) \
                $(WEBSERVER_IMAGE):$(CONTAINER_TAG) /bin/bash

black_out:
	$(DOCKER_OR_PODMAN) run --rm -v`pwd`:/scratch --entrypoint='' -w /scratch/ $(WEBSERVER_IMAGE):$(CONTAINER_TAG) make black_in

black_in:
	black webserver_for_pdg/*.py webserver_for_pdg/library/*.py

mypy_out:
	$(DOCKER_OR_PODMAN) run --rm -v`pwd`:/scratch --entrypoint='' -w /scratch/ $(WEBSERVER_IMAGE) mypy --check-untyped-defs webserver/pdg_app.py webserver/library


# keep the conf folder since that has the configuration
# keep plugin folder since that has apocalypse
delete_neo4j_file:
	rm -rf neo4j_pdg/data/
	rm -rf neo4j_pdg/logs/


#EOF
