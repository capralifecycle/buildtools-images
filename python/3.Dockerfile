FROM python:3-slim@sha256:cd62775c2141dc3d06c1b284ceda8ebe329d588ab398b0fc296248bca5fec64a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
