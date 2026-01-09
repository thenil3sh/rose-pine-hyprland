#!/bin/bash

IMG="$1"

read IMG_WIDTH IMG_HEIGHT <<<"$(identify -format "%w %h" "$IMG")" 
read SCALED_WIDTH SCALED_HEIGHT <<<"$(feh-clamp $IMG_WIDTH $IMG_HEIGHT)" &&
echo "$SCALED_WIDTH $SCALED_HEIGHT"

feh \
  --geometry "$SCALED_WIDTH"x"$SCALED_HEIGHT" \
  --auto-zoom \
  --scale-down \
  --image-bg black \
  "$IMG"