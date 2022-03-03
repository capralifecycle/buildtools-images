FROM python:3-slim@sha256:3c87795ae452dd07ab6c87d1d2ba9ae9cc6f0063c49b8ae5c06e13ecfbae9d4d

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
