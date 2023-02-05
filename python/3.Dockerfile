FROM python:3-slim@sha256:33a1008485e1a2dc565be79ece483b240cbc4d6266d6144a57a5a9965ede9bbf

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
