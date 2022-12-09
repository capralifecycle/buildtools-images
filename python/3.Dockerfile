FROM python:3-slim@sha256:555dcc94587b4101de48664b45b19f17e099a3ab236dec629791f366e2f2e83c

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
