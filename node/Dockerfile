# This Dockerfile is used by Jenkins to build the application
FROM node:10-alpine

RUN apk --no-cache add \
    py2-pip \
    python \
    #            groff is dependency for aws cli
    groff \
    #     # Due to build issues on newer AWS EC2 instances this config has to be set
    #     # to avoid the error: "Error: could not get uid/gid".
    #     # See related info: https://github.com/npm/npm/issues/20861#issuecomment-400786321
    git \
    && npm config set unsafe-perm true \
    #     && npm install -g serverless@${SERVERLESS_VERSION} \
    && pip install awscli

WORKDIR /usr/src/app
CMD ["sh"]
