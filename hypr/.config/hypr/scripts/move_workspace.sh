#!/bin/bash

echo $0 $1

zero=0
# get active workspace
c="$(hyprctl activeworkspace -j | jq '.id')"
w="$(hyprctl workspaces -j | jq .[].id)"
# go back

if [ $1 -gt $zero ]; then
	for n in $(hyprctl workspaces -j | jq 'sort_by(.id) | .[].id ' | tac); do
		echo $c $n
		if [[ ($n -gt $zero) && ($n -lt $c) ]]; then
			hyprctl dispatch movetoworkspace $n
			break
		fi
	done
else
	for n in $(hyprctl workspaces -j | jq 'sort_by(.id) | .[].id'); do
		echo $c $n
		if [[ ($n -gt $zero) && ($n -gt $c) ]]; then
			hyprctl dispatch movetoworkspace $n
			break
		fi
	done
fi
