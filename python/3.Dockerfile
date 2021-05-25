FROM python:3-slim@sha256:79b9c1da50bd1e2c2dd9e32520b47822d4423bf4e76b345b7e2204ed8df72336

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
