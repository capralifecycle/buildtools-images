FROM python:3-slim@sha256:3edfa765f8f77f333c50222b14552d0d0fa9f46659c1ead5f4fd10bf96178d3e

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
