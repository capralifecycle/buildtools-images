FROM python:3-slim@sha256:515e1549de832d6f349f1afe8c704069209b28204a6a70c74917fe13b2a5c812

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
