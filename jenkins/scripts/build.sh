#!/bin/bash -x

#BUILD="$(($BUILD_ID-2))"
#docker -H 10.0.54.169 rmi --force chatapp:$BUILD
docker -H 10.0.54.169 run -d -p 80:3000 --name chatapp chatapp:env.$BUILD_ID

