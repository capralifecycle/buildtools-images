FROM python:3-slim@sha256:a027707a9bd22a95801d10d0d329b0afa9b99fe3d5d548afee4eab0329a46427

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
