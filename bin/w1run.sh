#!/bin/zsh

while [ 1 ]; do
    date -Ins
    $@
    sleep 1;
done
