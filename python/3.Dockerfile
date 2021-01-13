FROM python:3-slim@sha256:b2013807b8af03d66f60a979f20d4e93e4e4a111df1287d9632c8cfd41ecfa33

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
