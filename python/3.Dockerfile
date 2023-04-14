FROM python:3-slim@sha256:286f2f1d6f2f730a44108656afb04b131504b610a6cb2f3413918e98dabba67e

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
