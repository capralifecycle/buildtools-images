FROM python:3-slim@sha256:2c018e29a8eada75e855d78641adda978a2c0a035fd928e281e1240144e8a337

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
