FROM python:3-slim@sha256:05f1cd528fd6a1114d44c59d6da400f5221c9cc3180a8e1b6ac2fe2fb8d24f03

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
