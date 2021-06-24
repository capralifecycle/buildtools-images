FROM python:3-slim@sha256:b4e24afb5d0e06ff924df887ce7f9358af93226287b8a2a14b62ba6281a858e1

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
