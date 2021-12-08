FROM python:3-slim@sha256:9ba08ac396df6210f82d3965811aea55bb94e78aeb4f830bbe0258b9678d51f5

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
