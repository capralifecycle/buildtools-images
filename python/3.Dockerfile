FROM python:3-slim@sha256:6faf002f0bce2ce81bec4a2253edddf0326dad23fe4e95e90d7790eaee653da5

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
