#!/usr/bin/env bash

QUERY="$*"
URL_ENCODED=$(printf '%s\n' "$QUERY" | sed 's/ /+/g')

zen-browser --new-tab "https://duckduckgo.com/?q=$URL_ENCODED" >/dev/null 2>&1 &

sleep 0.15
hyprctl dispatch focuswindow "class:^(zen)$"
