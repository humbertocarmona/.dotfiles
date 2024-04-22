#!/bin/bash

echo $0
echo $1

zero=0
# get active workspace
c="$(hyprctl activeworkspace -j | jq '.id')"
w="$(hyprctl workspaces -j | jq .[].id)"
# go back

if [ $1 -gt $zero ]; then
	for n in $(hyprctl workspaces -j | jq .[].id | tac); do
		if [[ ($n > 0) && ($n -lt $c) ]]; then
			hyprctl dispatch workspace $n
			break
		fi
	done
else
	for n in $(hyprctl workspaces -j | jq .[].id); do
		if [[ $n -gt $c ]]; then
			hyprctl dispatch workspace $n
			break
		fi
	done
fi
