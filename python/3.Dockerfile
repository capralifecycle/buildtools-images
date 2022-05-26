FROM python:3-slim@sha256:e266c9c8a5a11df3183675b60a0a61b8cf22a9eeb4b229af86dcd2daf0f4475a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
