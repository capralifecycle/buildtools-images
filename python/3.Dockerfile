FROM python:3-slim@sha256:de3f55fdc4402a88db7cb53b82a053e247b00dac98c67fb2001a5998044a528a

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
