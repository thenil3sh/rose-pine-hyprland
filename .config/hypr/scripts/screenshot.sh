#! /bin/bash

# Exit if slurp is already in use
if pgrep slurp > /dev/null; then
  notify-send "Can't screenshot" "Slurp appears to be in use" --icon=path-exclusion -t 3000
  exit 1;
fi

# If regional capture is requested
if [[ $1 -eq 1 ]]; then
  icon="image-crop"
  region="$(slurp)"
else
  icon="view-fullscreen"
fi \
|| (notify-send "Selection Cancelled" "Screenshot wasn't taken" --icon=image-crop && exit 0);
# If selection cancleed ^

echo "everything cool upto this point!!"

# Finally capture, screenshot
if [[ $1 -eq 1 ]]; then
  grim -g "$region" -
else
  grim -
fi | wl-copy && \
wl-paste > ~/Pictures/Screenshots/Screenshot-"$(date +%F_%T)".png && \
notify-send 'Screenshot taken' 'Image copied to clipboard' --icon=$icon -t 2000
