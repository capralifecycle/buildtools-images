FROM python:3-slim@sha256:1e046bca10e9187236f8c52830da166111a465842d6450fcd52863eebd216db7

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
