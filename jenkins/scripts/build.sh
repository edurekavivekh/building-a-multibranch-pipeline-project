#!/bin/bash -x

docker -H 10.0.54.169 stop chatapp
#BUILD="$(($BUILD_ID-2))"
#docker -H 10.0.54.169 rmi --force chatapp:$BUILD
         if [ "$?" == "0" ]
             then
                 docker -H 10.0.54.169 build . -t chatapp:$BUILD_ID
             if [ "$?" == "0" ]
                 then
                     docker -H 10.0.54.169 rm chatapp
                     docker -H 10.0.54.169 run -d -p 80:3000 --name chatapp chatapp:$BUILD_ID
                 else
                     echo "Chat app build failed"
             fi
         fi
