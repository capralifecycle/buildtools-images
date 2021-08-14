FROM python:3-slim@sha256:182f0eff727af9fccf88294dbfffb23ad408369c412e1267ddd5aa63ef8b5bf8

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
