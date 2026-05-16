----------------- ---------------------------
---                                        --
---          Window Rules                  --
---                                        --
--- -----------------------------------------
--- More on it https://wiki.hypr.land/Configuring/Basics/Window-Rules/

local windowrule = hl.window_rule;



---@enum AnimationType
local animation  = {
    gnomed = 'gnomed'
}

windowrule {
    name = 'Rename Floats',
    match = {
        class = '^(thunar)$',
        title = '^(Rename).*',
    },
    float = true
}

windowrule {
    -- Floats are gnomed
    match = {
        float = true
    },

    animation = animation.gnomed
}


-- WLogout
windowrule {

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

-- Non shadow for Non Floating Windows
windowrule {
    match = {
        float = false,
    },

    no_shadow = true,
}

-- Apps, that need floating
windowrule {
    match = {
        class = '^(Emulator|exo-desktop-item-edit|Anki|Display|feh|com.snes.evercal|mpv|dev.musagy.hypremoji|wlogout|blueman-manager)$'
    },

    float = true,
    no_shadow = false,
}

-- Anki
windowrule {
    match = {
        class = '^Anki$',
        title = '^Add$',
    },

    float  = true,
    no_shadow = false,
    size = { 350, 550 }
}


windowrule {
    name = 'hyprland_share_picker_floats',
    match = {
        class = '^(hyprland-share-picker)$'
    },
    float = true,
}

windowrule {
    name = 'file picker',
    match = {
        class = '^(xdg-desktop-portal-gtk)$'
    },

    float = true,
    size = {600, 600},
    center = true,
}


-- Jetbrains IDE
windowrule {
    name = 'jetbrains_ide',

    match = {
        class = '^(jetbrains-.*)'
    },

    no_initial_focus = true,
}

-- Edit Launcher Screen
windowrule {
    name = 'Edit Launch Icon',

    float = true,
    center = true,
    size = {440, 500}
}

windowrule {
    name = 'Thunar file operations float',
    match = {
        title = '^(File Operation Progress)$'
    },

    float = true,
}

