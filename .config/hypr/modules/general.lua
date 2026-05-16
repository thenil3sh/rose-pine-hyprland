local decoration    = require('modules.decoration')
local input         = require('modules.input')

local general = {
    gaps_in         = 4,
    gaps_out        = 8, 4, 4, 4,
    border_size     = 0,

    allow_tearing   = true,
}


hl.config {
    general         = general,
    decoration      = decoration,
    input           = input.config,
}