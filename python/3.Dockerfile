FROM python:3-slim@sha256:eaee5f73efa9ae962d2077756292bc4878c04fcbc13dc168bb00cc365f35647e

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
