FROM python:3-slim@sha256:cacb3a7cdff9328f9487e1418ba18a2f1863902b2390267f3b98853d02e88214

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
