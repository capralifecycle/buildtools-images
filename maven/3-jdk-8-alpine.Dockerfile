FROM maven:3-jdk-8-alpine

RUN set -eux; \
    apk add --no-cache \
        git \
    ; \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins
