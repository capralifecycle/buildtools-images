FROM python:3-slim@sha256:d2d03e0a43739521f91346be534caac8ff5e93e4b3bd0b4f68354cf3ed8f0821

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
