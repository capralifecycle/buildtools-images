# This Dockerfile is used by Jenkins to build the application
FROM alpine:latest@sha256:d0710affa17fad5f466a70159cc458227bd25d4afb39514ef662ead3e6c99515

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
