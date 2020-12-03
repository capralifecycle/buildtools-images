FROM python:3-slim@sha256:12b7deafe25f6b34a66d8fb03bfc0ff5e86464fd49100fc2a64d0a98371ec4e1

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
