FROM python:3-slim@sha256:44f51ba4af570481a83972fc424f8c1546a800341aebdbc6849a523eece02eb9

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
