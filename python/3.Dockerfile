FROM python:3-slim@sha256:5f8d3734d4b4016391ebc0162526b8335f2c16acc423d8424c1582c73a8bb053

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
