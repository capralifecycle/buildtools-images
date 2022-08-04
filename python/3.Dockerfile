FROM python:3-slim@sha256:2124d4f8ccbd537500de16660a876263949ed9a9627cfb6141f418d36f008e9e

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
