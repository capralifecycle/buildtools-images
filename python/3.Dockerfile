FROM python:3-slim@sha256:073caf67fbbfad42fbadc5a7282edec4fb88cb53a177318f46991acf9a0c30c1

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      git \
      make \
    ; \
    rm -rf /var/lib/apt/lists/*
