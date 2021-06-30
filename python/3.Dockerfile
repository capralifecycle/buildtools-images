FROM python:3-slim@sha256:8ffb28a4fca06fc0914dac67e801cf447df0225ea23ee1b42685de02f2555235

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
