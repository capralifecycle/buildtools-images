FROM python:3-slim@sha256:ca78039cbd3772addb9179953bbf8fe71b50d4824b192e901d312720f5902b22

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
