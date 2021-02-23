FROM python:3-slim@sha256:70b693f32768b122a6a5247b0c5d4394da69f5dc3baace93a34860bff00d8ecd

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
