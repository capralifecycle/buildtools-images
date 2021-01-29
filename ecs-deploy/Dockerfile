FROM alpine:latest@sha256:08d6ca16c60fe7490c03d10dc339d9fd8ea67c6466dea8d558526b1330a85930

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
