local mainMod = "SUPER"
local terminal = "alacritty"
local fileManager = "thunar"
local browser = "brave"



hl.bind(mainMod .. '+ Q', hl.dsp.exec_cmd(terminal))
hl.bind(mainMod.."+ E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod.."+ B", hl.dsp.exec_cmd(browser))