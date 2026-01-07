#!/usr/bin/env bash
# niri: show current keyboard layout (global / tracked by niri)
# Requires: niri, jq

get_layout_name() {
    # Newer niri: `niri msg --json keyboard-layouts` -> { names: [...], current_idx: N }
    if command -v niri >/dev/null 2>&1 && niri msg --help 2>/dev/null | grep -q 'keyboard-layouts'; then
        niri msg --json keyboard-layouts 2>/dev/null |
            jq -r '.names[.current_idx] // empty'
        return
    fi

    # Fallback: systemd-localed (only reflects system config, not per-window tracking)
    if command -v localectl >/dev/null 2>&1; then
        localectl status 2>/dev/null |
            awk -F': ' '/X11 Layout:/ {print $2; exit}'
    fi
}

kmap="$(get_layout_name)"

case "$kmap" in
"English (US)" | "us")
    echo " US"
    ;;
"English (US, intl., with dead keys)" | "us(intl)" | "us-intl")
    echo " US (intl)"
    ;;
"Portuguese (Brazil)" | "pt(br)" | "br" | "pt_BR")
    echo " BR"
    ;;
*)
    # show whatever niri/localectl returned (or blank if nothing was detected)
    echo "${kmap:-?}"
    ;;
esac
