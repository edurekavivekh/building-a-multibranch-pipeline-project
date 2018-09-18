#!/bin/bash -x

BUILD="$(($BUILD_ID-2))"
docker -H 127.0.0.1 rmi --force chatapp:$BUILD
docker -H 127.0.0.1 run -d -p 80:3000 --name chatapp chatapp:env.$BUILD_ID

