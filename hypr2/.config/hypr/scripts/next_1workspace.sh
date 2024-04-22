#!/bin/bash

echo $0
echo $1

zero=0
# get active workspace
c="$(hyprctl activeworkspace -j | jq '.id')"

if [ $1 -gt $zero ]; then
	((c += +1))
else
	((c += 1))
fi

if [ $c -gt $zero ]; then
	hyprctl dispatch workspace $c
fi
