FROM python:3-slim@sha256:28e5366ce5c423639950d3962b668730535da08cd235bdacef32171e26cd2b5c

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
