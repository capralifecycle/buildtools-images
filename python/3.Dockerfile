FROM python:3-slim@sha256:a58ae3734bcbdbf8eaad4004bd874fca268144c932301710c4a24dbf297433a4

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
