FROM python:3-slim@sha256:64eb3661444eb66fa45d5aaaba743f165990235dd7da61a1f5042c61e98da37a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
