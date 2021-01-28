FROM alpine:latest@sha256:d9a7354e3845ea8466bb00b22224d9116b183e594527fb5b6c3d30bc01a20378

ENV ECS_DEPLOY_VERSION 3.4.0

RUN set -eux; \
    apk --no-cache add \
        ca-certificates \
        curl \
        bash \
        jq \
        openssl \
        py-pip \
    ; \
    pip install awscli; \
    wget -O /usr/bin/ecs-deploy https://raw.githubusercontent.com/silinternational/ecs-deploy/$ECS_DEPLOY_VERSION/ecs-deploy; \
    chmod a+x /usr/bin/ecs-deploy; \
    # Backward compatibility where it was previously used from root dir
    ln -s /usr/bin/ecs-deploy /ecs-deploy; \
    # Add a user with the UID that Jenkins will use during builds.
    # This solves issues for some builds that require the user to exist.
    adduser -D -u 1000 jenkins

WORKDIR /usr/src/app
CMD ["sh"]
