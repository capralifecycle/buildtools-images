FROM python:3-slim@sha256:8b1597de572e7952a1efa163e6d809c4833cd47ee90769b36d4b990f530b6950

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
