FROM python:3-slim@sha256:15ac591c622159a5f890247045dcb18a26a1b32802bb5d479e0c728b123add72

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
