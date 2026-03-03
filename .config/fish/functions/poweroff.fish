function poweroff
    hyprshutdown --top-label "Shutting Down" --post-cmd "systemctl poweroff"
end
