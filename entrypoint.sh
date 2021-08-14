#!/bin/bash

if [ ! -f ".env" ]; then
  cp .env.example .env
fi

cd /home/node/app

npm install

npm run start

