FROM python:3-slim@sha256:9325a40ef54622e03c5bd122baa9de98861b583d7043ceff48f214d419e4b9f4

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
