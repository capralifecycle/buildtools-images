FROM python:3-slim@sha256:d78f8a5d9f6f68636e0ba0120027be2ad440cd2d69007dc2cf7362ef443085b7

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
