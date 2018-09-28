#!/bin/bash

goinboxDir=$GOPATH/src/github.com/goinbox

if [ ! -d $goinboxDir ]
then
    mkdir -p $goinboxDir
fi

cd $goinboxDir

boxList="
crypto
ipquery
goconsumer
gohttp
mysql
page
redis
levelcache
golog
gomisc
simplecache
shardmap
encoding
pool
pidfile
inotify
exception
shell
color
"

for box in $boxList
do
    echo "process box $box"

    if [ -d $box ]
    then
        cd $box
        git pull
        cd ..
    else
        git clone git@github.com:goinbox/${box}.git
    fi
done
