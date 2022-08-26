FROM python:3-slim@sha256:dff7fd9200421a8c65e020af221a21c8aab784c5c8a8d55c64a095b645209d77

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
