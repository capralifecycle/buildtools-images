FROM python:3-slim@sha256:84f53b7141b3e6fc790eb587f56299c61ec500933eb64034eb215e4d9ef3926c

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
