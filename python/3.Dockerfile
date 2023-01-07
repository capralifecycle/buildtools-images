FROM python:3-slim@sha256:39cecc9cde774f9209ad26a0ab2dc4f5d10ba92d2913a835cebea3b402af8e8b

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
