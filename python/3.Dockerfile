FROM python:3-slim@sha256:1cd45c5dad845af18d71745c017325725dc979571c1bbe625b67e6051533716c

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
