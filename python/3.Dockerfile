FROM python:3-slim@sha256:64c5ce9d61e2d43c3e69257e23cb0b54f495173b543fed91a434a6b52edd4ecd

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
