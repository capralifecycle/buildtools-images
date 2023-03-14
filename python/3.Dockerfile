FROM python:3-slim@sha256:7f0ea9ea95d32db6ee8f4973aa76d777923b0cdd83ebec6fd63a20fc7d08f4cf

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
