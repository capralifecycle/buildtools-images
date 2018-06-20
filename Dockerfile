# This Dockerfile is used by Jenkins to build the application
FROM alpine:latest

# Deploy script for ECS
ENV ECS_DEPLOY_VERSION 3.4.0
RUN apk --no-cache add \
            ca-certificates \
            curl \
            bash \
            jq \
            openssl \
            py2-pip \
    && pip install awscli \
    && wget -O /ecs-deploy https://raw.githubusercontent.com/silinternational/ecs-deploy/$ECS_DEPLOY_VERSION/ecs-deploy \
    && chmod a+x /ecs-deploy

WORKDIR /usr/src/app
CMD ["sh"]
