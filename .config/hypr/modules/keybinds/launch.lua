local mainMod = 'SUPER + '
local terminal = "alacritty"
local fileManager = "thunar"
local browser = "brave"

local function bind(keyCombo, command)
    hl.bind(keyCombo, hl.dsp.exec_cmd(command))
end

bind(mainMod .. 'Q'         , terminal)
bind(mainMod .. 'E'         , fileManager)
bind(mainMod .. 'B'         , browser)