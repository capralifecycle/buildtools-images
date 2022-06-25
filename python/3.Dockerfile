FROM python:3-slim@sha256:2ae2b820fbcf4e1c5354ec39d0c7ec4b3a92cce71411dfde9ed91d640dcdafd8

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
