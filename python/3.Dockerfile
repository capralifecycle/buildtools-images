FROM python:3-slim@sha256:0e4eb4846e1b600929541d19c3831a65b66db852d84cc870c0fdf47c9a972835

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
