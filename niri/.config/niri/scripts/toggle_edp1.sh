#!/usr/bin/env bash

CONFIG="$HOME/.config/niri/config.kdl"

if grep -q '^//off_edp_1' "$CONFIG"; then
    sed -i 's|^[[:space:]]*//[[:space:]]*off_edp_1|off//edp_1|' "$CONFIG"
else
    sed -i 's|^off//edp_1|//off_edp_1|' "$CONFIG"
fi
