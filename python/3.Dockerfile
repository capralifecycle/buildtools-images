FROM python:3-slim@sha256:aad3aeab1677bed58b399da3426712efbf3a46e225207d549460363aa96269f2

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
