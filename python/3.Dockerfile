FROM python:3-slim@sha256:8434c99df85cc274108beac4465d4abbc4459956bb2b7a84073636ac5f4b7c1a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
