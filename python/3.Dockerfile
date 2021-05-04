FROM python:3-slim@sha256:d35ab472c4e3c711ce00bbc682ba243dcbefab15bcf47126ecbf1c60dc19f9b9

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
