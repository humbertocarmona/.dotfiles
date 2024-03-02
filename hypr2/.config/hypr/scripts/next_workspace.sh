#!/bin/bash

echo $0
echo $1

zero=0
# get active workspace
w="$(hyprctl activeworkspace -j | jq '.id')"

if [ $1 -eq $zero ]; then
	((w += 1))
else
	((w -= 1))
fi

if [ $w -gt $zero ]; then
	echo $w
	hyprctl dispatch workspace $w
fi
