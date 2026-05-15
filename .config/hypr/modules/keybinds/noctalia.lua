local noctalia = 'qs -c noctalia-shell ipc call '
local launcher = ' launcher '
local clipboard = ' clipboard '
local toggle = ' toggle '
local lockScreen = ' lockScreen '
local lock = ' lock '
local volume = ' volume '
local increase = ' increase '
local decrease = ' decrease '
local brightness = ' brightness '
local plugin = 'plugin:'

SHIFT = 'SHIFT +'
local Print = 'Print'

local mainMod = 'SUPER +'

local function bind(keyCombo, command)
    hl.bind(keyCombo, hl.dsp.exec_cmd(command))
end

bind(mainMod .. 'R'             , noctalia .. launcher .. toggle)

-- Clipboard History
bind (mainMod .. SHIFT .. 'V'   , noctalia..launcher..clipboard)

-- Lock Screen
bind(mainMod .. SHIFT .. 'L'    , noctalia .. lockScreen .. lock)

-- Audio 
bind('XF86AudioRaiseVolume'     , noctalia .. volume .. increase)
bind('XF86AudioLowerVolume'     , noctalia .. volume .. decrease)
bind('XF86AudioMute'            , noctalia .. volume .. 'muteOutput')


-- Mic Mute Toggle
bind('XF86AudioMicMute'         , noctalia .. volume .. 'muteInput')


-- Backlight
bind('XF86MonBrightnessUp'      , noctalia .. brightness .. increase)
bind('XF86MonBrightnessDown'    , noctalia .. brightness .. decrease)


-- Wallpaper
bind(mainMod .. 'W'             , noctalia .. 'wallpaper' .. toggle)


-- Screen Recoder
bind(mainMod .. Print           , noctalia .. plugin .. 'screen-recorder' .. toggle)


