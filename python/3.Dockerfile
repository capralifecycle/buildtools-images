FROM python:3-slim@sha256:3524d9553dd1ea815d9e3ff07a0ccafe878a9403fb5f9956dc6ad86075ac345f

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
