FROM python:3-slim@sha256:dd3016f846b8f88d8f6c28b43f1da899f07259121aff403091e6f89a703c3d36

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
