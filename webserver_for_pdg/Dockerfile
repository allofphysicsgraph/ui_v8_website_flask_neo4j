# Physics Derivation Graph
# Ben Payne, 2026
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

# https://docs.docker.com/build/building/best-practices/

# https://docs.docker.com/engine/reference/builder/#from
# https://github.com/phusion/baseimage-docker
# https://hub.docker.com/r/phusion/baseimage/tags
FROM phusion/baseimage:jammy-1.0.4

# Suppress pip warnings and version checks during build/runtime
ENV PIP_ROOT_USER_ACTION=ignore \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    FLASK_APP=pdg_app.py \
    FLASK_RUN_HOST=0.0.0.0 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    ELAN_HOME=/opt/lean_installation \
    PATH="/opt/lean_installation/bin:$PATH" \
    PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# PYTHONUNBUFFERED:
# since I'm not using python:3.7, I have to install Python
# from https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/blob/master/Dockerfile
# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13


# PYTHONDONTWRITEBYTECODE: Prevents Python from writing pyc files to disk (equivalent to python -B option)


WORKDIR /code


################# end variables; start apt packages #################################

# https://docs.docker.com/engine/reference/builder/#run

# APT cache mount speeds up apt-get installs if packages change
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update && \
    apt-get install -y --no-install-recommends \
# text editing
               vim \
# `make` is required for `black_out`
               make \
# `git` is required for Lean's mathlib installation 
               git \
# `curl` to install mathlib for Lean
               curl \
# use spider to find dead links
               wget \
# send email
               msmtp \
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
    pip3 install --no-cache-dir --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi


################# end apt packages; start msmtp ##############

# to set up a Gmail AppPassword see https://myaccount.google.com/apppasswords
COPY msmtp.config /root/.msmtprc

################## start Lean 4 #################################

# For an isolated example of using Lean in Docker see
# <https://github.com/allofphysicsgraph/lean-in-docker/blob/main/lean_v4/Dockerfile>

# The following doesn't work 
#RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
# because
# elan: Unable to run interactively. Run with -y to accept defaults, --help for additional options                                                    
# therefore, as per https://stackoverflow.com/a/53605439/1164295 
RUN --mount=type=cache,target=/root/.elan \
    curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf |\
       bash -s -- --default-toolchain leanprover/lean4:stable -y
# -s = --silent;     Do not show progress meter or error messages. Makes Curl mute.
# -S = --show-error; When used with -s, --silent, it makes curl show an error message if it fails.
# -f = --fail;       (HTTP) Fail fast with no output at all on server errors. This is useful to enable scripts and users to better deal with failed attempts.


# if "nightly" is desired, replace
# --default-toolchain leanprover/lean4:stable
# with
# --default-toolchain leanprover/lean4:nightly
# as per https://leanprover-community.github.io/archive/stream/270676-lean4/topic/elan.20update.html


# References:
# - https://github.com/allofphysicsgraph/lean-in-docker/blob/main/lean_v4/Dockerfile
# - https://github.com/xubaiw/docker-lean/blob/main/Dockerfile

RUN mkdir /opt/new_project
WORKDIR /opt/new_project
RUN --mount=type=cache,target=/root/.elan lake +leanprover-community/mathlib4:lean-toolchain new project_name math
RUN --mount=type=cache,target=/root/.elan curl -L https://raw.githubusercontent.com/leanprover-community/mathlib4/master/lean-toolchain -o lean-toolchain

RUN --mount=type=cache,target=/root/.elan elan default "$(cat lean-toolchain)"


WORKDIR /opt/new_project/project_name

RUN --mount=type=cache,target=/root/.elan lake exe cache get

RUN echo "import Mathlib.Data.Real.Basic" > ProjectName/mathlib_test.v4.lean
RUN --mount=type=cache,target=/root/.elan lake lean ProjectName/mathlib_test.v4.lean 

# copy from cache to persistent folder available in image
RUN --mount=type=cache,target=/root/.elan \
    mkdir -p /opt/lean_installation && \
    cp -r /root/.elan/* /opt/lean_installation/


################# end Lean 4; start npm #################################

WORKDIR /code

# https://www.npmjs.com/package/mathjax
RUN npm install mathjax@3 && \
    mkdir -p /code/static/mathjax && \
    mv /code/node_modules/mathjax/es5 /code/static/mathjax && \
    npm install -g pyright


# type checking for Python
# https://microsoft.github.io/pyright/#/installation

# Install Playwright browsers and their system dependencies
#RUN npx playwright install --with-deps

################# end start npm; start pip #################################

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt --no-cache-dir -vvv --ignore-installed blinker


# CACHED PLAYWRIGHT BROWSERS
# This caches Playwright's browser binaries (~/.cache/ms-playwright) 
# Even if requirements.txt changes, Playwright won't re-download browsers!
#RUN --mount=type=cache,target=/root/.cache/ms-playwright \
#    playwright install && playwright install-deps
# 2026-07-25: playwright was installed to a transient build layer so not available for use

# Use the cache mount to speed up downloading, then copy files to the permanent path
RUN --mount=type=cache,target=/root/.cache/ms-playwright \
    playwright install && \
    mkdir -p /ms-playwright && \
    cp -r /root/.cache/ms-playwright/* /ms-playwright/ && \
    playwright install-deps


# TODO: don't be root!


EXPOSE 5000
COPY . .

CMD ["flask", "run"]

#EOF
