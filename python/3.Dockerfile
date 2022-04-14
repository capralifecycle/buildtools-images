FROM python:3-slim@sha256:80ebadfc9b83cf037ebe9a7db0631101b7c18c58f4197de0ef2badb268a35a45

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
