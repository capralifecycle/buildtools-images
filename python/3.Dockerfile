FROM python:3-slim@sha256:6de22c9cf887098265b7614582b00641c0c8c6735af538d0f267d6bb457634f1

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
