FROM python:3-slim@sha256:56d9bdc243bc53d4bb055305b58cc0be15b05cc09dcda9b9d5e224233889b61b

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
