FROM python:3-slim@sha256:b01a8dcfa22e9dbc960e7c0855ff79bf1b334bd14efec47d91e5dfa67c697e6a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
