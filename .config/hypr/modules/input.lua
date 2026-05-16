local input = {}

input.config = {
    kb_layout       = 'us',
    kb_variant      = '',
    kb_model        = '',
    kb_rules        = '',
    kb_options      = '',

    repeat_rate     = 50,
    repeat_delay    = 300,

    touchpad = {
        natural_scroll = false,
    },
}

local gesture = hl.gesture;

gesture {
    fingers         = 3,
    direction       = 'vertical',
    action          = 'workspace'
}

-- gesture {
--     fingers = 4
-- }



return input