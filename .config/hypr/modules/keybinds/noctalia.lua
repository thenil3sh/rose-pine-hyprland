local noctalia = 'qs -c noctalia-shell ipc call'
local launcher = ' launcher '
local clipboard = ' clipboard '
local toggle = 'toggle'
local lockScreen = ' lockScreen '
local lock = ' lock '
local volume = ' volume '
local increase = ' increase '
local decrease = ' decrease '
local brightness = ' brightness ' 

local mainMod = "SUPER"

hl.bind(
    mainMod .. "+ R",
    hl.dsp.exec_cmd(noctalia .. launcher .. toggle)
)

hl.bind(
    mainMod .. "+ SHIFT + V",
    hl.dsp.exec_cmd(noctalia .. launcher .. clipboard)
)

hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.exec_cmd(noctalia .. lockScreen .. lock))

hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd(noctalia..volume..increase))
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd(noctalia..volume..decrease))
hl.bind('XF86AudioMute', hl.dsp.exec_cmd(noctalia..volume..'muteOutput'))



hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd(noctalia..brightness..increase))
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd(noctalia..brightness..decrease))
