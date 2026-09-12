# Physics Derivation Graph
# Ben Payne, 2026
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

# https://docs.docker.com/build/building/best-practices/

# ==========================================
# STAGE 1: Builder
# ==========================================

# https://docs.docker.com/engine/reference/builder/#from
# https://github.com/phusion/baseimage-docker
# https://hub.docker.com/r/phusion/baseimage/tags
FROM phusion/baseimage:jammy-1.0.4 AS builder

ENV ELAN_HOME=/opt/lean_installation \
    PATH="/opt/lean_installation/bin:$PATH" \
    PYTHONUNBUFFERED=1

WORKDIR /build

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update && apt-get install -y --no-install-recommends \
        curl git make python3 python3-pip python3-dev python3.10-venv npm ca-certificates

RUN --mount=type=cache,target=/root/.elan \
    curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | \
    bash -s -- --default-toolchain leanprover/lean4:stable -y

RUN mkdir -p /build/new_project
WORKDIR /build/new_project

RUN lake +leanprover-community/mathlib4:lean-toolchain new project_name math

RUN curl -L https://raw.githubusercontent.com/leanprover-community/mathlib4/master/lean-toolchain -o lean-toolchain && \
    elan default "$(cat lean-toolchain)"

WORKDIR /build/new_project/project_name
RUN lake exe cache get

RUN echo "import Mathlib.Data.Real.Basic" > ProjectName/mathlib_test.v4.lean
RUN lake lean ProjectName/mathlib_test.v4.lean

RUN rm -rf /build/new_project/project_name/.git \
           /build/new_project/project_name/.lake/packages/*/.git

RUN python3 -m venv /export/python_env
COPY requirements.txt .
RUN /export/python_env/bin/python -m pip install --upgrade pip setuptools wheel && \
    /export/python_env/bin/pip install --no-cache-dir -r requirements.txt

WORKDIR /build
RUN npm install mathjax@3 && \
    mkdir -p /export/mathjax && \
    mv node_modules/mathjax/es5 /export/mathjax/


# ==========================================
# STAGE 2: Final Runtime Image
# ==========================================

FROM phusion/baseimage:jammy-1.0.4 AS runner

ENV PIP_ROOT_USER_ACTION=ignore \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    FLASK_APP=pdg_app.py \
    FLASK_RUN_HOST=0.0.0.0 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    ELAN_HOME=/opt/lean_installation \
    PATH="/opt/lean_installation/bin:/export/python_env/bin:$PATH" \
    PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

WORKDIR /code

RUN apt-get update && apt-get install -y --no-install-recommends \
        vim \
        make \
        git \
        curl \
        wget \
        python3 \
        python3-pip \
        python3-sphinx \
        graphviz \
        dvipng \
        msmtp \
        npm \
        texlive \
        texlive-latex-extra && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc/* /usr/share/man/* && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

RUN pip install playwright && \
    python3 -m playwright install && \
    python3 -m playwright install-deps


COPY --from=builder /opt/lean_installation /opt/lean_installation
COPY --from=builder /export/python_env /export/python_env
COPY --from=builder /export/mathjax /code/static/mathjax
COPY --from=builder /build/new_project/project_name /opt/new_project/project_name


COPY msmtp.config /root/.msmtprc
COPY msmtp-gmail.gpg /root/.msmtp-gmail.gpg
COPY gpg_private.key /root/.gpg_private.key
COPY . .

EXPOSE 5000
CMD ["flask", "run"]
