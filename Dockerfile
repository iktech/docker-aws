FROM docker:19.03.11-dind
LABEL maintainer="Igor Kolomiyets <igor.kolomiyets@iktech.io>"

RUN apk update && \
    apk upgrade && \
    apk add aws-cli
