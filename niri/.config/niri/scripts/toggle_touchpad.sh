#!/usr/bin/env bash

CONFIG="$HOME/.config/niri/config.kdl"

if grep -q '^[[:space:]]*//[[:space:]]*disabled-on-external-mouse' "$CONFIG"; then
    sed -i 's|^[[:space:]]*//[[:space:]]*disabled-on-external-mouse|disabled-on-external-mouse|' "$CONFIG"
else
    sed -i 's|^[[:space:]]*disabled-on-external-mouse|// disabled-on-external-mouse|' "$CONFIG"
fi
