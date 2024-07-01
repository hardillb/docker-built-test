ARG NODE_VERSION=20
ARG OS=alpine

FROM node:${NODE_VERSION}-${OS} AS base


WORKDIR /usr/src/node-red
COPY package.json .
RUN apk add --no-cache \
    bash \
    tzdata \
    curl \
    nano \
    git \
    openssl \
    openssh-client \
    ca-certificates

RUN  apk add --no-cache --virtual buildtools build-base linux-headers udev python3 && \
    npm install --unsafe-perm --no-update-notifier --no-audit --no-fund --only=production
    