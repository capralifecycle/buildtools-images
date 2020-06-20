# This Dockerfile is used by Jenkins to build the application
FROM alpine:latest@sha256:a15790640a6690aa1730c38cf0a440e2aa44aaca9b0e8931a9f2b0d7cc90fd65

# Serverless framework
ENV SERVERLESS_VERSION 1.37.1
RUN apk --no-cache add \
            ca-certificates \
            curl \
            bash \
            jq \
            openssl \
            nodejs \
            nodejs-npm \
            py-pip \
#            groff is dependency for aws cli
            groff \
    # Due to build issues on newer AWS EC2 instances this config has to be set
    # to avoid the error: "Error: could not get uid/gid".
    # See related info: https://github.com/npm/npm/issues/20861#issuecomment-400786321
    && npm i npm@latest -g \
    && npm config set unsafe-perm true \
    && npm install -g serverless@${SERVERLESS_VERSION} \
    && pip install awscli

WORKDIR /usr/src/app
CMD ["sh"]
