#!/bin/fish

set workspaces (hyprctl workspaces | grep "^workspace ID.*" | awk '{ print $3 }')
set active_workspace (hyprctl activeworkspace | grep '^workspace ID.*' | awk '{print $3}')
set workspaces $workspaces $workspaces[1]

for w in $workspaces
    if test $w -eq $active_workspace
        set end 1
        echo "end set!!! $w"
    else if set -q end
        echo "switched to $w"
        hyprctl dispatch "hl.dsp.focus({ workspace = $w })"
        return
    end
end
