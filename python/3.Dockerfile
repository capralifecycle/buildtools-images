FROM python:3-slim@sha256:b9f31c700254bc13df8923352b9b0660e8c81db9bc676747509b561eee0ca3f5

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
