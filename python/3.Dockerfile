FROM python:3-slim@sha256:bca2bcc8afda3abca3f73ff3d9ac146076aa47d09a226290eb3c99f175b1371a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
