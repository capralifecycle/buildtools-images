FROM python:3-slim@sha256:cb2989a9d3f5227d3a20354134e183ae3c33e5e10d9f32064294c1c9ab65a3bc

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
