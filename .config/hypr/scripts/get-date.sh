#!/bin/bash

day=$(date +%-d)
month=$(date +%B)

if [[ $day -eq 11 || $day -eq 12 || $day -eq 13 ]]; then
    suffix="th"
else
    case $((day % 10)) in
        1) suffix="st" ;;
        2) suffix="nd" ;;
        3) suffix="rd" ;;
        *) suffix="th" ;;
    esac
fi

printf "\n  ${month}, ${day}${suffix}  \n   \n   "
