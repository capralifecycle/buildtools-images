FROM python:3-slim@sha256:62b6b191aa0ef99be88a845619f6b19ae8bbffde6e77610b23db92995187ed7d

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
