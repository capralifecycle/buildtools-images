FROM python:3-slim@sha256:364ee1a9e029fb7b60102ae56ff52153ccc929ceab9aa387402fe738432d24cc

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
