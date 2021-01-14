#!/usr/bin/env sh

docker build --no-cache -t ecomgems/magento-app:7.3 .
docker push ecomgems/magento-app:7.3
