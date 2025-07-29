#!/bin/bash

# Get current hour and minute in 12-hour format
hour=$(date +%-I)
minute=$(date +%-M)

# Hour names (1–12)
hour_names=(zero one two three four five six seven eight nine ten eleven twelve thirteen)

# Minute words
minute_words=(zero one two three four five six seven eight nine ten \
              eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty \
              twenty-one twenty-two twenty-three twenty-four twenty-five twenty-six twenty-seven \
              twenty-eight twenty-nine)

# Default phrase
phrase=""

# Determine the phrase
if (( minute == 0 )); then
    phrase="${hour_names[hour]} o'clock"
elif (( minute == 15 )); then
    phrase="quarter past ${hour_names[hour]}"
elif (( minute == 30 )); then
    phrase="half past ${hour_names[hour]}"
elif (( minute == 45 )); then
    phrase="quarter to ${hour_names[(hour % 12 + 1)]}"
elif (( minute < 30 )); then
    phrase="${minute_words[minute]} past ${hour_names[hour]}"
else
    to=$((60 - minute))
    next_hour=$((hour % 12 + 1))
    phrase="${minute_words[to]} to ${hour_names[next_hour]}"
fi

# Output lowercase
echo "${phrase}"
