FROM python:3-slim@sha256:8f3997244336ad0f067ad693f85906263a21a7f571b6577a64134aba889bc95e

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
