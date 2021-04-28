FROM python:3-slim@sha256:141827b4633c4b94c8dbd6d51d53f431f3fbbca8339760a80087d80d10fece1f

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
