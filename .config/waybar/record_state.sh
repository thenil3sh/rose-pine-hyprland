#!/bin/bash
if pgrep -x 'wf-recorder' > /dev/null; 
then
printf '{"text": "󰑊", "tooltip": "", "class": "recording", "percentage": "" }'
else
printf '{"text": "", "tooltip": "", "class": "not-recording", "percentage": ""}'
fi