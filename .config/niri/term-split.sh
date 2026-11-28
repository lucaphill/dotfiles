#!/bin/sh
# Terminal a usar. Pode ser sobrescrito: TERM_CMD=foot ./term-split.sh
TERM_CMD="${TERM_CMD:-foot}"

tag="dev.termsplit.t$$"

case "$TERM_CMD" in
    foot)                    "$TERM_CMD" --app-id="$tag" & ;;
    ghostty|alacritty|kitty) "$TERM_CMD" --class="$tag" & ;;
    wezterm)                 wezterm start --class "$tag" & ;;
    *) echo "Terminal não suportado: $TERM_CMD" >&2; exit 1 ;;
esac

for i in $(seq 1 20); do
    id=$(niri msg --json windows | jq --arg t "$tag" '.[] | select(.app_id==$t) | .id')
    [ -n "$id" ] && break
    sleep 0.05
done
[ -z "$id" ] && exit 1

niri msg action consume-or-expel-window-left --id "$id"
niri msg action focus-window --id "$id"
