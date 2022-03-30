FROM python:3-slim@sha256:48991dce6601b7c3b8f08f21dc211608a1c233c76945e5435df4bae626a5f648

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
