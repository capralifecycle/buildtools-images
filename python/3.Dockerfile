FROM python:3-slim@sha256:d6589bcf3ecede71b31deb020d9eb885512eb158296fc47180808c3177e021c0

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
