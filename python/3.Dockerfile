FROM python:3-slim@sha256:1966141ab594e175852a033da2a38f0cb042b5b92896c22073f8477f96f43b06

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
