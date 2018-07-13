# This Dockerfile is used by Jenkins to build the application
FROM alpine:latest

# Serverless framework
ENV SERVERLESS_VERSION 1.24.1
RUN apk --no-cache add \
            ca-certificates \
            curl \
            bash \
            jq \
            openssl \
            nodejs \
            nodejs-npm \
            py2-pip \
            python \
#            groff is dependency for aws cli
            groff \
    && npm install -g serverless@${SERVERLESS_VERSION} \
    && pip install awscli

WORKDIR /usr/src/app
CMD ["sh"]