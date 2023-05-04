FROM python:3-slim@sha256:551c9529e77896518ac5693d7e98ee5e12051d625de450ac2a68da1eae15ec87

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
