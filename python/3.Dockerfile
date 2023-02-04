FROM python:3-slim@sha256:27e81ff01d472069b3fb417df6779217ccf1680694f223204f52376ea7efb167

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
