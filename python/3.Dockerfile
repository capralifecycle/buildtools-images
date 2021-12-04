FROM python:3-slim@sha256:ad540a471260fee5e5e1a99ee2acf142efe8c279a7a54315160d8033ba88f0d8

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
