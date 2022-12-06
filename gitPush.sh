#!/usr/bin/env bash

if [ $# == 0 ];then
    echo "请带更新说明： ./gitPush.sh 更新说明"
    exit 1
fi

s=$*

git add -A
git commit -m "${s}"
git push

exit
