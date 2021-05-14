FROM python:3-slim@sha256:7783d80eca13fb9f8cfd8b84b27ac09ecc28f52bafdd9b943338b7e29e7741a5

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
