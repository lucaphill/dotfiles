#!/bin/sh
tag="foot-split-$$"
foot --app-id="$tag" &
for i in $(seq 1 20); do
    id=$(niri msg --json windows | jq --arg t "$tag" '.[] | select(.app_id==$t) | .id')
    [ -n "$id" ] && break
    sleep 0.05
done
[ -z "$id" ] && exit 1
niri msg action consume-or-expel-window-left --id "$id"
niri msg action focus-window --id "$id"
