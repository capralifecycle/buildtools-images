FROM python:3-slim@sha256:bb8911d79f5451a03748e65ec8944504b71ac09722c7ddbc5742daf7465a32c1

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
