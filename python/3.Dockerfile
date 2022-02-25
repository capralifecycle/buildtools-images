FROM python:3-slim@sha256:caa004dda01d364ae7403d3de1fe29c9e541698cb002e323174acc08902fd086

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
