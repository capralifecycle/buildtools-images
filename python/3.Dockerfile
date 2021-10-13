FROM python:3-slim@sha256:90769761ff3bc8e7dfa0089e23dddb22e787973ed9a01061a66f1a60dd33e11e

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
