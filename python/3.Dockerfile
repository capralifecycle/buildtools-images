FROM python:3-slim@sha256:8bea27ec43261fb841fd1ec7faeb6e3751faeeba8419715dadbf549ca9945d70

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
