FROM alpine:latest@sha256:a75afd8b57e7f34e4dad8d65e2c7ba2e1975c795ce1ee22fa34f8cf46f96a3be

RUN set -eux; \
    apk -v --no-cache add \
      bash \
      git \
      jq \
      py-pip \
      groff \
    ; \
    pip install awscli; \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins

CMD ["sh"]
