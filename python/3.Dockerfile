FROM python:3-slim@sha256:ac63ff0730358ed061589c374fa871958ba0e796b590741395ff3d5d95177fab

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
