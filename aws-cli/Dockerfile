FROM alpine:latest@sha256:d7342993700f8cd7aba8496c2d0e57be0666e80b4c441925fc6f9361fa81d10e

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
