FROM python:3-slim@sha256:8324222536bd1d09aeedfd9236998a227ae482411b271d0e10e61dbac899e403

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
