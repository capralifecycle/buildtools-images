FROM python:3-slim@sha256:42c8f29231de3ac4b6bee92ed1313ad7650bc5a2a4cd56fdd890c9df8c320646

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
