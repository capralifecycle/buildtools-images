FROM python:3-slim@sha256:31adb75f16e54454ac10dc6408b83a976d5698ca98728517500dd637caa1b8ea

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
