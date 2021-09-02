FROM python:3-slim@sha256:8402d0ea6e4eaeba7b390dfe522496e365334daaeb05361b24636f2407e10aae

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
