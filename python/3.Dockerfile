FROM python:3-slim@sha256:42e48b9b875d962e6ab7e8c62471a6586f49aff5d13f3933bbce7fcf249b8271

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
