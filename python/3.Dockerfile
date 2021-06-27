FROM python:3-slim@sha256:9f7411e82627e4ab371968a7b133928c9d06d5517a29d2c670a311066fdddb12

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
