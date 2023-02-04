FROM python:3-slim@sha256:41f73fb74e62f70b680622107a7356a113c28099c26143029ba08d7c9c878739

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
