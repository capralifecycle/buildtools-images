FROM python:3-slim@sha256:b78b23e8d30696548e7bff01520d423b8d6b6ef011c9df1f484099f710e17c27

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
