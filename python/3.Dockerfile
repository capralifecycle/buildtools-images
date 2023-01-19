FROM python:3-slim@sha256:79095e304e31196bad049e74f666508ac81909d201ec9371f9f3cd68fa365cf6

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
