#!/usr/bin/env bash

if [ $# == 0 ];then
    echo "Push错误！！！没有带更新说明。"
    echo "用法： ./gitPush.sh \"更新说明\""
    exit
fi

s=$*
echo "本次更新commit：" $s

git add -A
git commit -m "${s}"
git push