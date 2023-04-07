FROM python:3-slim@sha256:5a67c38a7c28ad09d08f4e153280023a2df77189b55af7804d7ceb96fee6a68f

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
