#!/bin/bash

curDir=`dirname $0`
goinboxDir=$curDir/../
if [ $# -eq 1 ]
then
    $goinboxDir=$1
fi

if [ ! -d $goinboxDir ]
then
    mkdir -p $goinboxDir
fi

cd $goinboxDir

boxList="
bugle
crypto
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
shell
color
mq
taskflow
pcontext
router
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
