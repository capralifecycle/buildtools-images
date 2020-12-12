FROM python:3-slim@sha256:a7bb83d3e874acd567786874df95666c111e984ddf8845857513b55d22563e6f

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
