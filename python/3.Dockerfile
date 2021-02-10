FROM python:3-slim@sha256:bf3ec573c0ae0d0c619c3f3e0e9490878432bf7a5c63a643b6c39c9878b51191

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
