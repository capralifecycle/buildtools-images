FROM python:3-slim@sha256:2364a510309d1871c644ce778709bbfd611b581924c849345057db600f48260a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
