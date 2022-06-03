FROM python:3-slim@sha256:557745c5e06c874ba811efe2e002aff21b6cc405b828952fcfa16dea52d56dbb

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
