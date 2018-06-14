FROM alpine:latest

RUN apk -v --no-cache add \
  jq \
  py2-pip \
  python \
  groff \
  && pip install awscli

CMD ["sh"] 
