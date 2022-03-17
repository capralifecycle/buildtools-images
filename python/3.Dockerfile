FROM python:3-slim@sha256:d2d2c5f3beee26213c72b317b39c63124534fe468532d756d58c0e820691bdef

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
