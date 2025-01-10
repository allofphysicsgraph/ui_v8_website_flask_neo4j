# Physics Derivation Graph
# Ben Payne, 2025
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)


# https://docs.docker.com/engine/reference/builder/#from
# https://github.com/phusion/baseimage-docker
FROM phusion/baseimage:focal-1.1.0

WORKDIR /code
ENV FLASK_APP=pdg_app.py
ENV FLASK_RUN_HOST=0.0.0.0

# since I'm not using python:3.7, I have to install Python
# from https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/blob/master/Dockerfile
# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

# PYTHONDONTWRITEBYTECODE: Prevents Python from writing pyc files to disk (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE=1

################# end variables; start apt packages #################################

# https://docs.docker.com/engine/reference/builder/#run
RUN apt-get update && \
    apt-get install -y \
# text editing
               vim \
               curl \
               python3 \
               python3-pip \
               python3-dev \ 
# documentation generation
               python3-sphinx \
# generate pictures of graphs using dot
               graphviz \
# generate pictures of expressions using latex
               dvipng \
# npm for mathjax
               npm \
# compile .tex to .dvi
               texlive  \
# LaTeX Error: File `letltxmacro.sty' not found. https://askubuntu.com/a/1253683
               texlive-latex-extra && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi


################# end apt packages; start Lean 4 #################################

# The following doesn't work 
#RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
# because
# elan: Unable to run interactively. Run with -y to accept defaults, --help for additional options                                                    
# therefore, as per https://stackoverflow.com/a/53605439/1164295 
RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf |\
       bash -s -- --default-toolchain leanprover/lean4:stable -y
# -s = --silent;     Do not show progress meter or error messages. Makes Curl mute.
# -S = --show-error; When used with -s, --silent, it makes curl show an error message if it fails.
# -f = --fail;       (HTTP) Fail fast with no output at all on server errors. This is useful to enable scripts and users to better deal with failed attempts.



# if "nightly" is desired, replace
# --default-toolchain leanprover/lean4:stable
# with
# --default-toolchain leanprover/lean4:nightly
# as per https://leanprover-community.github.io/archive/stream/270676-lean4/topic/elan.20update.html

ENV PATH "/root/.elan/bin:$PATH"

# References:
# - https://github.com/allofphysicsgraph/lean-in-docker/blob/main/lean_v4/Dockerfile
# - https://github.com/xubaiw/docker-lean/blob/main/Dockerfile

################# end Lean 4; start npm #################################

# https://www.npmjs.com/package/mathjax
RUN npm install mathjax@3
#RUN npm install mathjax

RUN mkdir -p /code/static/mathjax
RUN mv /code/node_modules/mathjax/es5 /code/static/mathjax


# type checking for Python
# https://microsoft.github.io/pyright/#/installation
RUN npm install -g pyright

################# end start npm; start pip #################################

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# TODO: don't be root!


EXPOSE 5000
COPY . .

CMD ["flask", "run"]

#EOF