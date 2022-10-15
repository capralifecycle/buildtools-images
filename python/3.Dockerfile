FROM python:3-slim@sha256:685b1c2ef40bd3ded77b3abd0965d5c16d19a20469be0ac06a3cf1d33f2e6d41

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
