FROM python:3-slim@sha256:80b238ba357d98813bcc425f505dfa238f49cf5f895492fc2667af118dccaa44

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
