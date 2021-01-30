FROM python:3-slim@sha256:50328b4efe5ff8ef8bb2e62e088a4cefeace39062c483c04987f5820e7cf73b1

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
