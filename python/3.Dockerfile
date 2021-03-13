FROM python:3-slim@sha256:aab965875430293ae0f7fe8a369947e598eb568dca0cac2f934d87737101df5b

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
