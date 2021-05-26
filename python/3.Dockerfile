FROM python:3-slim@sha256:e4b19f10c7292d3d6b9348982fa8748587ab6d8b9c8125757e356dc9ba678586

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
