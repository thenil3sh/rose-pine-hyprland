#!/bin/bash

# Kill wf-recorder if recording is already in progress
pgrep -x "wf-recorder" && \
pkill -INT -x wf-recorder && \
notify-send --icon=simplescreenrecorder-panel -h string:wf-recorder:record -t 3000 "Finished Recording" "You can find it in Videos 󰉋"&& pkill -SIGRTMIN+10 waybar && \
exit 0


# Exit, if slurp is up working for some process
if pgrep slurp > /dev/null ; then
    notify-send "Can't start Recording" "Slurp appears to be in use" --icon=path-exclusion;
    exit 1;
fi

# Grab for the region you want to capture
if [[ "$1" == "region" ]]; then
    REGION=$(slurp)
    echo "region {$REGION}"
fi

# If region slection's cancelled
if [[ "$REGION" == "" && $1 == "region" ]]; then
    notify-send --icon=replay-record-error -h string:wf-recorder:record -t 5000 "Selection cancelled" "Recording didn't start"&& pkill -SIGRTMIN+10 waybar
    exit 1
fi

# Recording start countdown
LAST=$(notify-send --icon=simplescreenrecorder-recording -h string:wf-recorder:record -t 1500 "Recording in:" "<span color='#e0def4' font='26px'><b>3</b></span>" -p)
sleep 1
LAST=$(notify-send --icon=simplescreenrecorder-recording -h string:wf-recorder:record -t 1500 "Recording in:" "<span color='#e0def4' font='26px'><b>2</b></span>" -r $LAST -p)
sleep 1
notify-send --icon=simplescreenrecorder-recording -h string:wf-recorder:record -t 950 "Recording in:" "<span color='#e0def4' font='26px'><b>1</b></span>" -r $LAST
sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)

# Signal waybar's 'recording_status' module
pkill -SIGRTMIN+10 waybar

# Finally start recording
if [[ "$1" == "region" ]]; then
    wf-recorder --bframes 40 -f "$HOME/Videos/$dateTime.mp4" --geometry "$REGION"
else 
    wf-recorder --bframes 40 -f "$HOME/Videos/$dateTime.mp4"
fi

exit 0
