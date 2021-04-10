FROM python:3-slim@sha256:78a69cfb3e2a973b927266bb859008d7d7a43a3cac9815a285d8132471cc90fe

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
