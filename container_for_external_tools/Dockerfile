# Physics Derivation Graph
# Ben Payne, 2026
# https://creativecommons.org/licenses/by/4.0/
# Attribution 4.0 International (CC BY 4.0)

# https://docs.docker.com/build/building/best-practices/

# https://docs.docker.com/engine/reference/builder/#from
# https://github.com/phusion/baseimage-docker
# https://hub.docker.com/r/phusion/baseimage/tags
FROM phusion/baseimage:jammy-1.0.4

# Set environment variables
# Prevents Python from writing .pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1
# Ensures Python output is sent directly to the terminal (useful for logging)
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update && apt-get install -y --no-install-recommends \
        python3 python3-pip python3-dev


# Upgrade pip and copy requirements file FIRST to leverage Docker layer caching
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install playwright && \
    python3 -m playwright install && \
    python3 -m playwright install-deps

#EOF