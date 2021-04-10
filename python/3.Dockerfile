FROM python:3-slim@sha256:d392dc22fd04662597e6c8fe00744e8a285c47255360f3b12ec410238d31e74a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
