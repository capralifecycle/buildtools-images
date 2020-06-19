FROM alpine:latest@sha256:a15790640a6690aa1730c38cf0a440e2aa44aaca9b0e8931a9f2b0d7cc90fd65

RUN set -eux; \
    apk -v --no-cache add \
      bash \
      git \
      jq \
      py2-pip \
      python \
      groff \
    ; \
    pip install awscli; \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins

CMD ["sh"]
