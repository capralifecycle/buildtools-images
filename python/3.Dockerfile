FROM python:3-slim@sha256:74f44a84cb63dca494d911b82c8ca9215d32ab21b734ee5f76cf01febb146404

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
