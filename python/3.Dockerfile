FROM python:3-slim@sha256:5aa114b5c49311ae48a9e717a8c829581bb18a01f33c3130968a6ecc0e2c24c0

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
