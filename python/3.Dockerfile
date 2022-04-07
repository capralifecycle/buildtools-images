FROM python:3-slim@sha256:425d893546dbb7c9984aad25cd219a4f9086e48e6990c0368aa2ce3670e9bc6e

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
