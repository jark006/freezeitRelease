#!/usr/bin/env bash

if [ $# == 0 ];then
    echo 1
    echo "Push错误！！！没有带更新说明。"
    echo "用法： ./gitPush.sh \"更新说明\""
    exit
fi

echo 0
s=$*

git add -A
git commit -m "${s}"
git push