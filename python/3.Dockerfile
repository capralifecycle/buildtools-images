FROM python:3-slim@sha256:b7e533f465f22a1d8e170a51c01449255d38b413b464bb52aebd65f4e41fa156

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
