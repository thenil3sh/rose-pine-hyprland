local exec = hl.exec_cmd;


local function exec_once()
    exec('easyeffects --hide-window')
    exec('qs -c noctalia-shell')
    exec('$HOME/.config/hypr/scripts/battery.sh')
end

local function exec()

end

hl.on('hyprland.start', exec_once)
hl.on('config.reloaded', exec)

