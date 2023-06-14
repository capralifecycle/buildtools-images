FROM python:3-slim@sha256:7ae02e72226c12a65361f7fcf4428ab53b402abcbfc377720b61314cc3bed266

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
