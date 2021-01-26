FROM python:3-slim@sha256:af2d64e6de9f891bd5958a498bd2394389143749b3c57ffcc8c2aec054b28ad5

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
