FROM python:3-slim@sha256:e48245965f90ec0cc730be8dae485771458f0457843effadb746712de5e5ad71

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
