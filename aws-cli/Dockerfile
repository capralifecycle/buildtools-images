FROM alpine:latest

RUN apk -v --no-cache add \
  bash \
  jq \
  py2-pip \
  python \
  groff \
  && pip install awscli

CMD ["sh"]
