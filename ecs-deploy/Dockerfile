FROM alpine:latest@sha256:074d3636ebda6dd446d0d00304c4454f468237fdacf08fb0eeac90bdbfa1bac7

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
