FROM python:3-slim@sha256:d14ff2e2126b22527f0fcb704660a9080e67d0f490ef98b250b8928610647c08

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
