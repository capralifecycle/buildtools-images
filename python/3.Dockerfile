FROM python:3-slim@sha256:c4992301d47a4f1d3e73c034494c080132f9a4090703babfcfa3317f7ba54461

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
