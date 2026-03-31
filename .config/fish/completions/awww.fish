function __fish_awww_outputs
    awww query 2>/dev/null | string replace -r '\s+\d+x\d+$' ''
end

set -l __fish_awww_subcommands clear restore clear-cache img pause kill query help

complete -c awww -f -n "not __fish_seen_subcommand_from $__fish_awww_subcommands" -a clear -d "Fill outputs with a color"
complete -c awww -f -n "not __fish_seen_subcommand_from $__fish_awww_subcommands" -a restore -d "Restore the last displayed image"
complete -c awww -f -n "not __fish_seen_subcommand_from $__fish_awww_subcommands" -a clear-cache -d "Clear the awww cache"
complete -c awww -f -n "not __fish_seen_subcommand_from $__fish_awww_subcommands" -a img -d "Display an image or gif"
complete -c awww -f -n "not __fish_seen_subcommand_from $__fish_awww_subcommands" -a pause -d "Pause the daemon"
complete -c awww -f -n "not __fish_seen_subcommand_from $__fish_awww_subcommands" -a kill -d "Kill the daemon"
complete -c awww -f -n "not __fish_seen_subcommand_from $__fish_awww_subcommands" -a query -d "Print output information"
complete -c awww -f -n "not __fish_seen_subcommand_from $__fish_awww_subcommands" -a help -d "Show help for a command"

complete -c awww -s h -l help -d "Print help"
complete -c awww -s V -l version -d "Print version"

complete -c awww -f -n "__fish_seen_subcommand_from help" -a "$__fish_awww_subcommands" -d "Subcommand help"

complete -c awww -f -n "__fish_seen_subcommand_from clear" -s a -l all -d "Target all namespaces"
complete -c awww -r -n "__fish_seen_subcommand_from clear" -s n -l namespace -d "Daemon namespace"
complete -c awww -r -n "__fish_seen_subcommand_from clear" -s o -l outputs -a "(__fish_awww_outputs)" -d "Comma-separated outputs"

complete -c awww -f -n "__fish_seen_subcommand_from restore" -s a -l all -d "Target all namespaces"
complete -c awww -r -n "__fish_seen_subcommand_from restore" -s n -l namespace -d "Daemon namespace"
complete -c awww -r -n "__fish_seen_subcommand_from restore" -s o -l outputs -a "(__fish_awww_outputs)" -d "Comma-separated outputs"

complete -c awww -f -n "__fish_seen_subcommand_from img" -s a -l all -d "Target all namespaces"
complete -c awww -r -n "__fish_seen_subcommand_from img" -s o -l outputs -a "(__fish_awww_outputs)" -d "Comma-separated outputs"
complete -c awww -r -n "__fish_seen_subcommand_from img" -s n -l namespace -d "Daemon namespace"
complete -c awww -f -n "__fish_seen_subcommand_from img" -l no-resize -d "Do not resize the image"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -l resize -a "no crop fit stretch" -d "Resize mode"
complete -c awww -r -n "__fish_seen_subcommand_from img" -l fill-color -d "Padding color in rrggbbaa hex"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -s f -l filter -a "Nearest Bilinear CatmullRom Mitchell Lanczos3" -d "Scaling filter"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -s t -l transition-type -a "none simple fade left right top bottom wipe wave grow center any outer random" -d "Transition type"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -l transition-step -a "1 2 30 90 255" -d "Non-zero integer; smaller is smoother"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -l transition-duration -a "0.5 1 3 5" -d "Float seconds"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -l transition-fps -a "24 30 60 120 144" -d "Integer FPS"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -l transition-angle -a "0 45 90 180 270" -d "Float degrees for wipe/wave"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -l transition-pos -a "center top left right bottom top-left top-right bottom-left bottom-right 0.5,0.5 200,400" -d "Alias or x,y position"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -l transition-bezier -a ".54,0,.34,.99 0.0,0.0,1.0,1.0" -d "Four float bezier values"
complete -c awww -r -f -n "__fish_seen_subcommand_from img" -l transition-wave -a "20,20 40,20 20,40" -d "Wave width,height floats"
complete -c awww -f -n "__fish_seen_subcommand_from img" -l invert-y -d "Invert transition-pos y axis"

complete -c awww -f -n "__fish_seen_subcommand_from pause" -s a -l all -d "Target all namespaces"
complete -c awww -r -n "__fish_seen_subcommand_from pause" -s n -l namespace -d "Daemon namespace"

complete -c awww -f -n "__fish_seen_subcommand_from kill" -s a -l all -d "Target all namespaces"
complete -c awww -r -n "__fish_seen_subcommand_from kill" -s n -l namespace -d "Daemon namespace"

complete -c awww -f -n "__fish_seen_subcommand_from query" -s a -l all -d "Target all namespaces"
complete -c awww -f -n "__fish_seen_subcommand_from query" -s j -l json -d "Print JSON output"
complete -c awww -r -n "__fish_seen_subcommand_from query" -s n -l namespace -d "Daemon namespace"
