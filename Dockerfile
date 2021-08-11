FROM node:14.17.4-alpine3.11

RUN apk add --no-cache npm bash

RUN npm config set cache /home/node/app/.npm-cache --global

RUN npm i -g @nestjs/cli

RUN mkdir -p /home/node/app

USER node

WORKDIR /home/node/app
