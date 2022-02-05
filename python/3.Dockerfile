FROM python:3-slim@sha256:42d13fdfccf5d97bd23f9c054f22bde0451a3da0a7bb518bcd95fec6be89b50d

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
