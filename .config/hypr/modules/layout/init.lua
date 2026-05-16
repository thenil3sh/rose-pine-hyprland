---@enum Layout
local layout = {
    dwindle     = 'dwindle',
    scrolling   = 'scrolling',
    master      = 'master',
    monocle     = 'monocle'
--  custom      = 'custom'
}

return {
    scrolling   = require('modules.layout.scrolling'),
    dwindle     = require('modules.layout.dwindle'),
    current     = layout.scrolling,
}