local windowrule = hl.window_rule;

---@enum AnimationType
local animation  = {
    gnomed = 'gnomed'
}

windowrule {
    name = 'rename_floats',
    match = {
        class = '^(thunar)$',
        title = '^(Rename).*',
    },
    float = true
}

windowrule {
    name = 'floats are gnomed',
    match = {
        float = true
    },

    animation = animation.gnomed
}

windowrule {
    name = 'wlogout',

    match = {
        class = '^(wlogout)$'
    },

    float = true,
    center = true,
    size = {550, 200},
    pin = true,
    animation = 'scale 90%',
    fullscreen_state = 0,
    move = { 300, 300 },
    rounding = 20,
    dim_around = true,
}

windowrule {
    name = 'no_shadow',

    match = {
        float = false,
    },

    no_shadow = true,
}

