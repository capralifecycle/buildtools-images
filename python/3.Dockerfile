FROM python:3-slim@sha256:2ef3cf170fcf496e28a3bf7902be2f793d8520b74caa2f45f4a5df10e68821fd

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
