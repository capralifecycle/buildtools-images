FROM python:3-slim@sha256:59129c9fdea259c6a9b6d9c615c065c336aca680ee030fc3852211695a21c1cf

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
