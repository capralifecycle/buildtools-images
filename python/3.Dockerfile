FROM python:3-slim@sha256:36b544be6e796eb5caa0bf1ab75a17d2e20211cad7f66f04f6f5c9eeda930ef5

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
