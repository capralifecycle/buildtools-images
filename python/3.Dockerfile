FROM python:3-slim@sha256:43705a7d3a22c5b954ed4bd8db073698522128cf2aaec07690a34aab59c65066

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
