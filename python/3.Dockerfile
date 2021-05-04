FROM python:3-slim@sha256:655f71f243ee31eea6774e0b923b990cd400a0689eff049facd2703e57892447

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
