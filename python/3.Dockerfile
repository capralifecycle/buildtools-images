FROM python:3-slim@sha256:ce4b8c735bd172c27b8fc7dd1eb6597db88a602d61ad13f6ff83e0d2421f89c3

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
